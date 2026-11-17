{ nixpkgs, pkgs, ... }: {
  imports = [
    ./nh.nix
    ./nixpkgs.nix
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operator"
      ];

      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://deepseek-harness-nix.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "deepseek-harness-nix.cachix.org-1:5NrkwLN9veNMhiINtU5ZeV4isXFhFsOwn6Ms7J1M+TA="
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      ];
    };
    nixPath = [ "nixpkgs=${nixpkgs}" ];
    package = pkgs.lix;
  };
}
