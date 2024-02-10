# Shell shortcuts
{
    ll = "ls -l";
    clean = "nix-store --gc";
    full-clean = "sudo nix-collect-garbage -d; sudo nix-store --optimise";
    axolotl = "dotnet /Gata/Programs/Axolotl/Axolotl.dll /Gata/Ethan/Axolotl";
    configure = "cd /Gata/Ethan/Home/Github/personal-configs/nixos && hx . && git add --all && ./rebuild.sh --upgrade && git commit -m 'onefig = modified system configs' && git push origin;";
    configs = "cd /Gata/Ethan/Home/Github/personal-configs";
    claer = "clear";
    potato-farm = "/Gata/Programs/potato-farm";
    thoughts = "/Gata/Programs/thoughts";
    diary-cli = "/Gata/Ethan/Home/Github/diary-cli/target/release/diary-cli";
    gres = "/Gata/Programs/gres";
    fix-ntfs = "sudo ntfsfix -d";
    prosv5 = "/Gata/Programs/pros-cli/pros";
    ollama = "/Gata/Programs/ollama-linux-amd64";
    xpand = "/Gata/Programs/xpand";
    github = "cd /Gata/Ethan/Home/Github; cd";
    dev = "docker run -it --rm -v .:/home/dev/project -v /home/greenchild/.cargo/registry:/home/dev/.cargo/registry gc-dev;";
}
