return {
    "benjiwolff/roslyn.nvim",
    branch = "bugfix-fix-buffer-highlighting-after-initialization",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        filewatching = "roslyn",
        broad_search = true,
        choose_target = "Renode_NET.sln",
        ignore_target = function(target)
            return string.match(target, "Renode.sln") ~= nil
        end
    },
}
