{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.honk-proxy;

  seedConfig = ''
    global {
        wan_interface: auto
        data_dir: '/var/lib/honk'
    }

    experimental {
        native_api {
            enabled: true
            listen: '127.0.0.1:9527'
            password_auth: true
            config_write: true
            ui: 'embedded'
        }
    }

    dns {
      upstream {
        default-dns: 'https://dns.alidns.com/dns-query'
        fallback-dns: 'https://1.1.1.1/dns-query'
      }
      routing {
        request {
          qname(geosite:cn) -> default-dns
          fallback: fallback-dns
        }
      }
    }
  '';

  seedPath = pkgs.writeText "honk-seed.dae" seedConfig;
in
{
  services.honk-proxy = {
    enable = true;

    package = pkgs.stdenvNoCC.mkDerivation {
      pname = "honk-core";
      version = "0.1.0-beta.6";
      src = pkgs.fetchurl {
        url = "https://github.com/daeuniverse/honk/releases/download/v0.1.0-beta.6/honk-core-v0.1.0-beta.6-x86_64-unknown-linux-musl-full.tar.gz";
        hash = "sha256-J4O48IVvwa7NHNHZEdmpBMWTzVB89h5fok+9cHUxckQ=";
      };
      dontUnpack = true;
      installPhase = ''
        runHook preInstall
        tar -xzf $src
        install -Dm755 "$(find . -name honk-core -type f | head -n1)" $out/bin/honk-core
        runHook postInstall
      '';
      meta = {
        description = "honk full build (native-api + embedded doona)";
        mainProgram = "honk-core";
        platforms = [ "x86_64-linux" ];
      };
    };

    config = seedConfig;
  };

  systemd.services.honk.serviceConfig = {
    StateDirectory = "honk";
    WorkingDirectory = "/var/lib/honk";
    ExecStart = lib.mkForce [
      ""
      "${cfg.package}/bin/honk-core --store db -c ${seedPath}"
    ];
    ExecReload = "${pkgs.util-linux}/bin/kill -HUP $MAINPID";
    Restart = "on-failure";
  };
}
