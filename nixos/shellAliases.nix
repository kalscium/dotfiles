# Shell shortcuts
{
    ll = "ls -l";
    clean = "nix-store --gc";
    full-clean = "sudo nix-collect-garbage -d; sudo nix-store --optimise";
    axolotl = "dotnet /Gata/Programs/Axolotl/Axolotl.dll /Gata/Ethan/Axolotl";
    update-system = "cd /Gata/GreenChild/Github/personal-configs/nixos && nix flake update --commit-lock-file && ./rebuild.sh --upgrade";
    configs = "cd /Gata/GreenChild/Github/personal-configs";
    claer = "clear";
    thoughts = "/Gata/Programs/thoughts";
    diary-cli = "/Gata/GreenChild/Github/diary-cli/target/release/diary-cli";
    gres = "/Gata/Programs/gres";
    fix-ntfs = "sudo ntfsfix -d";
    prosv5 = "/Gata/Programs/pros-cli/pros";
    xpand = "/Gata/Programs/xpand";
    github = "cd /Gata/GreenChild/Github; cd";
    school = "cd /Gata/GreenChild/School; cd";
    dev = "docker run -it --rm -v .:/home/dev/project -v /home/greenchild/.cargo/registry:/home/dev/.cargo/registry -v /home/greenchild/.cache/sccache:/home/dev/.cache/sccache gc-dev;";
    ls = "eza";
    find = "fd";
}
