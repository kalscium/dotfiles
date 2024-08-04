# sets up rust's targets, components, version, etc

{ pkgs, system }:
  pkgs.rust-bin.selectLatestNightlyWith
    (toolchain: toolchain.default.override {
      targets = [
        "wasm32-unknown-unknown"                                     
        "x86_64-unknown-linux-gnu"                                   
        "x86_64-unknown-linux-musl"                                  
        "x86_64-pc-windows-gnu"                                      
        "armv7a-none-eabi"
      ];
      extensions = [
        "rust-src"
        "llvm-tools-preview"
      ];
    })
