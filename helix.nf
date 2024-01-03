conff toml helix: "/home/greenchild/.config/helix/config.toml";
conff toml helix: "/root/.config/helix/config.toml";

conff toml helix-languages: "/home/greenchild/.config/helix/languages.toml";
conff toml helix-languages: "/root/.config/helix/languages.toml";

include "include/ttyeah.toml" as "/home/greenchild/.config/helix/themes/ttyeah.toml";
include "include/tmux.conf" as "/home/greenchild/.tmux.conf";

helix: {
    theme = "onedark";
    editor: {
        line-number = "relative"; // it's popular :P
        scrolloff = 999; // to keep the cursor centred
        mouse = false; // mice are for nerds
        soft-wrap.enable = true; // soft wrap looks better
        cursor-shape: { // shape of the cursor during different modes
            insert: "bar";
            normal: "block";
            select: "underline";
        }
    }
}

helix-languages.language: [
    {
        name = "rust";
        auto-format = false;
    }

    {
        name = "toml";
    }

    {
        name = "onefig";
        scope = "source.nf";
        file-types: ["nf"];
        comment-token = "//";
        roots: [];
        indent: { tab-width = 4, unit= "    " };
    }
]

# helix-languages.language.config: {
#     cahcePriming.enable = true;
#     diagnostics.experimental.enable = true;
# }
