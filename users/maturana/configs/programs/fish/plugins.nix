{ fetchFromGitHub, ... }:

[
  {
    name = "z";
    src = fetchFromGitHub {
      owner = "jethrokuan";
      repo = "z";
      rev = "45a9ff6d0932b0e9835cbeb60b9794ba706eef10";
      sha256 = "1kjyl4gx26q8175wcizvsm0jwhppd00rixdcr1p7gifw6s308sd5";
    };
  }
]
