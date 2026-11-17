{
  services.openssh = {
    enable = true;
    ports = [
      22
    ];
    settings = {
      UseDns = true;
      PermitRootLogin = "no";
    };
  };

  programs.ssh = {
    extraConfig = "
      Host codeberg.org
        HostName codeberg.org
        User git
        IdentityFile ~/.ssh/id_ed25519_codeberg
      Host github.com ssh.github.com
        HostName ssh.github.com
        User git
        Port 443
        IdentityFile ~/.ssh/id_ed25519
        IdentitiesOnly yes
    ";
  };
}
