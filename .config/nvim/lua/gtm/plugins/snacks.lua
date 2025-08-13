return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
        enabled = true,
        preset = {
            header = [[
              __.------.
           .-' .---.    \
         .'  .' O   )/"\/
       .'    )     >:'  L
   .'"/      (    _J:   |
  /  ''      \   / `\   F
 J  '         L_(   _> J
 |  ( (         `--' |/
J /  : :.      :  J
| |   :. :. :. : .:L
| \   .     .  .:'|F
| |       `:. .: ||
F ||         '  |||
| :)       : .  JJ
|) |            /F
 V A           /J
 || \_.-.   .-.FF
---'--. /<--\\ L----.
      |||L   \||     |
      JJ))   `||     |
      )|___.---\----'
.--'""<'|/ |F
    |J`-'  FF
    | L : JJ
    | J  :||
    J | | ||
    J |_/\_F
    J |  |J
     L L ||
     | | |F
     | | |F]],
        },
    },
    -- explorer = { enabled = true },
    indent = { enabled = true },
    -- input = { enabled = true },
    -- picker = { enabled = true },
    notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    },
}
