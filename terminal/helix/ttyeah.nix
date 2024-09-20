# Author: <kalscium@protonmail.com>

{
  programs.helix.themes.ttyeah = {
    "ui.menu" = { fg = "light-gray"; bg = "gray"; };
    "ui.menu.selected" = { modifiers = ["reversed"]; };
    "ui.linenr" = { fg = "light-gray"; bg = "black"; modifiers = ["dim"]; };
    "ui.popup" = { bg = "black"; };
    "ui.window" = { bg = "black"; };
    "ui.linenr.selected" = { fg = "white"; bg = "black"; modifiers = ["bold"]; };
    "ui.selection" = { bg = "white"; modifiers = ["bold" "reversed"]; };
    "ui.statusline" = { fg = "black"; bg = "cyan"; };
    "ui.statusline.inactive" = { fg = "black"; bg = "white"; };
    "ui.help" = { fg = "black"; bg = "light-gray"; };
    "ui.cursor" = { bg = "black"; modifiers = ["reversed"]; };
    "ui.cursor.primary" = { bg = "white"; modifiers = ["bold"]; };
    "ui.cursor.match" = { fg = "light-yellow"; modifiers = ["underlined"]; };

    "variable" = "light-gray";
    "variable.parameter" = { fg = "red"; modifiers = ["bold"]; };
    "variable.other.member" = { fg = "green"; modifiers = ["bold"]; };
    "variable.builtin" = { fg = "light-red"; modifiers = ["bold"]; };
    "constant.numeric" = "yellow";
    "constant" = "yellow";
    "attribute" = "yellow";
    "type" = { fg = "light-yellow"; modifiers = ["bold"]; };
    "type.enum.variant" = { fg = "light-blue"; modifiers = ["bold"]; };
    "string"  = { fg = "light-green"; modifiers = ["bold"]; };
    "constant.character.escape" = "cyan";
    "function" = { fg = "light-cyan"; modifiers = ["bold"]; };
    "function.macro" = "yellow";
    "constructor" = "light-blue";
    "keyword" = { fg = "light-red"; modifiers = ["bold"]; };
    "special" = { fg = "light-magenta"; modifiers = ["bold"]; };
    "label" = "light-magenta";
    "namespace" = { fg = "light-magenta"; };
    "operator" = { fg = "light-magenta"; modifiers = ["bold"]; };
    "keyword.operator" = { fg = "light-magenta"; modifiers = ["bold"]; };
    "comment" = { fg = "light-gray"; modifiers = ["dim"]; };

    "markup.heading" = { fg = "light-red"; modifiers = ["bold"]; };
    "markup.list" = { fg = "light-red"; modifiers = ["bold"]; };
    "markup.bold" = { fg = "light-yellow"; modifiers = ["bold"]; };
    "markup.italic" = { fg = "light-magenta"; modifiers = ["bold"]; };
    "markup.strikethrough" = { modifiers = ["crossed_out"]; };
    "markup.link.url" = { fg = "yellow"; modifiers = ["underlined"]; };
    "markup.link.text" = "light-red";
    "markup.quote" = "light-cyan";
    "markup.raw" = "light-green";

    "diff.plus" = "light-green";
    "diff.delta" = "yellow";
    "diff.minus" = "light-red";

    "diagnostic.info" = { bg = "light-blue"; fg = "white"; };
    "diagnostic.hint" = { bg = "light-green"; fg = "black"; };
    "diagnostic.warning" = { bg = "light-yellow"; fg = "white"; };
    "diagnostic.error" = { bg = "light-red"; fg = "white"; };

    "ui.gutter" = { bg = "black"; };
    "info" = "light-blue";
    "hint" = { fg = "light-green"; modifiers = ["bold"]; };
    "debug" = "gray";
    "warning" = { fg = "light-yellow"; modifiers = ["bold"]; };
    "error" = { fg = "light-red"; modifiers = ["bold"]; };
  };
}
