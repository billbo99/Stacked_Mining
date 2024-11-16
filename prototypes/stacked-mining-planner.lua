data:extend(
    {
        {
            type = "selection-tool",
            name = "stacked-mining-planner",
            icon = "__Stacked_Mining__/graphics/icons/stacked-mining-planner.png",
            flags = { "only-in-cursor", "not-stackable", "spawnable" },
            subgroup = "tool",
            hidden = true,
            order = "c[automated-construction]-d[stacked-mining-planner]",
            stack_size = 1,
            icon_size = 64,
            select = {
                border_color = { r = 0, g = 1, b = 0 },
                mode = { "any-entity" },
                cursor_box_type = "entity",
                entity_type_filters = { "resource" }
            },
            alt_select = {
                border_color = { r = 0, g = 0, b = 1 },
                mode = { "any-entity" },
                cursor_box_type = "entity",
                entity_type_filters = { "resource" }
            },
        }
    }
)