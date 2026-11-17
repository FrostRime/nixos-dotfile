[
  {
    host = "fnixos-laptop";
    user = "frost";
    extraSysModules = [ ../system ];
    extraHomeArgs = {
      nixosVersion = "unstable";
      homeManagerVersion = "master";
    };
  }
]
