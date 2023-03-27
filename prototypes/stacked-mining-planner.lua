data:extend(
    {
        {
            type = "selection-tool",
            name = "stacked-mining-planner",
            icon = "__Stacked_Mining__/graphics/icons/stacked-mining-planner.png",
            flags = {"hidden", "only-in-cursor", "not-stackable", "spawnable"},
            subgroup = "tool",
            order = "c[automated-construction]-d[stacked-mining-planner]",
            stack_size = 1,
            icon_size = 64,
            icon_mipmaps = 4,
            selection_color = {r = 0, g = 1, b = 0},
            alt_selection_color = {r = 0, g = 0, b = 1},
            selection_mode = {"any-entity"},
            selection_cursor_box_type = "entity",
            entity_type_filters = {"resource"},
            --entity_filter_mode = "whitelist",
            alt_selection_mode = {"any-entity"},
            alt_selection_cursor_box_type = "entity",
            alt_entity_type_filters = {"resource"}
            --alt_entity_filter_mode = "whitelist"
        }
    }
)
