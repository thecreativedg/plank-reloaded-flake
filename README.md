# NixOS Flake for Plank Reloaded  

A Nix flake to build and run [Plank Reloaded](https://github.com/zquestz/plank-reloaded).  

## Installation  

1. **Clone the repo** and navigate to the directory:  
   ```sh
   git clone https://github.com/thecreativedg/plank-reloaded-flake.git  
   cd plank-reloaded-flake
   ```  

2. **Build the package** using Nix:  
   ```sh
   sudo nix build .#packages.x86_64-linux.plank-reloaded
   ```  

3. **Get the built package path**:  
   ```sh
   readlink -f result
   ```  

4. **Run Plank**:  
   ```sh
   /your/path/bin/plank
   ```  

Replace `/your/path/` with the output from step 3.  

## System-wide Installation  
To include Plank Reloaded in your system-wide packages, add this to your `configuration.nix`:  

```nix
environment.systemPackages = with pkgs; [
  # Other packages...
  (callPackage /your/path/package/plank-reloaded.nix {})
];
```

### Apply Changes:  
1. Edit `configuration.nix` and add the package as shown above.  
2. Rebuild your system:  
   ```sh
   sudo nixos-rebuild switch
   ```  
3. Verify installation by running:  
   ```sh
   plank
   ```  

## Notes  
- For more details, check out the [[Plank Reloaded repo](https://github.com/zquestz/plank-reloaded)](https://github.com/zquestz/plank-reloaded).
