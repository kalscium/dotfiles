conff toml helix: "/home/greenchild/.config/helix/config.toml";

helix: {
    theme = "onedark";
    editor: {
        soft-wrap.enable = true; // soft wrap looks better
        cursor-shape: { // shape of the cursor during different modes
            insert: "bar";
            normal: "block";
            select: "underline";
        }
    }
}
