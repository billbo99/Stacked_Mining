data:extend(
    {
        {
            type = "shortcut",
            name = "give-stacked-mining-planner",
            order = "o[stacked-mining-planner]",
            action = "spawn-item",
            item_to_spawn = "stacked-mining-planner",
            associated_control_input = "give-stacked-mining-planner",
            style = "green",
            technology_to_unlock = "stacked-mining-tech",
            icon = {
                filename = "__Stacked_Mining__/graphics/icons/stacked-mining-planner-x32-white.png",
                priority = "extra-high-no-scale",
                size = 32,
                scale = 0.5,
                mipmap_count = 2,
                flags = {"gui-icon"}
            },
            small_icon = {
                filename = "__Stacked_Mining__/graphics/icons/stacked-mining-planner-x24.png",
                priority = "extra-high-no-scale",
                size = 24,
                scale = 0.5,
                mipmap_count = 2,
                flags = {"gui-icon"}
            },
            disabled_small_icon = {
                filename = "__Stacked_Mining__/graphics/icons/stacked-mining-planner-x24-white.png",
                priority = "extra-high-no-scale",
                size = 24,
                scale = 0.5,
                mipmap_count = 2,
                flags = {"gui-icon"}
            }
        }
    }
)
