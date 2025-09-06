{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  packages = [ pkgs.python3 ];

  # inputesFrom = [ ]; # # Includes the dependencies of the listed packages (but not the packages)

  shellHook = ''
    echo "Welcome to the Python shell!"
  '';
    
}
