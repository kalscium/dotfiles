# environmental variables for development
pkgs: deps: {
  CC = "gcc";
  CXX = "g++";
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath deps;
}
