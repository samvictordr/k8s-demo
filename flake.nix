{
  description = "Minikube Kubernetes Cluster DevOps Internship Task";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [
          pkgs.minikube
          pkgs.kubectl
          pkgs.docker
        ];

        shellHook = ''
          echo "K8s Dev Shell ready: minikube, kubectl, docker installed"
        '';
      };
    };
}
