-- todo: make sure that, should custom stacked icons exist, they are also used for items even in case the support mod only adds the stacking support in data-final-fixes

-- todo: when selecting resources with the Resources Compression Planner, make them show up next to the cursor like with a deconstruction planner
-- maybe change the filters in such a way that when selecting only normal resources are highlighted and when alt_selecting only compressed ones

-- Changes for Mining Drones
if mods["Mining_Drones"] then
    -- Fixed that outdated ore icons are used for the mining recipes of stacked ores in Mining Depots, even if a mod like Deadlock Stacking for Vanilla is installed (highly recommended)
    for _, name in pairs({"iron-ore", "copper-ore", "coal", "stone", "uranium-ore-with-sulfuric-acid"}) do
        if data.raw.recipe["mine-deadlock-stack-" .. name] and data.raw.item["deadlock-stack-" .. name] then
            data.raw.recipe["mine-deadlock-stack-" .. name].icon = data.raw.item["deadlock-stack-" .. name].dark_background_icon or data.raw.item["deadlock-stack-" .. name].icon
            data.raw.recipe["mine-deadlock-stack-" .. name].icons = data.raw.item["deadlock-stack-" .. name].dark_background_icons or data.raw.item["deadlock-stack-" .. name].icons
        end
    end

    if data.raw.recipe["mine-deadlock-stack-uranium-ore-with-sulfuric-acid"] and data.raw.item["deadlock-stack-uranium-ore"] then
        data.raw.recipe["mine-deadlock-stack-uranium-ore-with-sulfuric-acid"].icon = data.raw.item["deadlock-stack-uranium-ore"].dark_background_icon or data.raw.item["deadlock-stack-uranium-ore"].icon
        data.raw.recipe["mine-deadlock-stack-uranium-ore-with-sulfuric-acid"].icons = data.raw.item["deadlock-stack-uranium-ore"].dark_background_icons or data.raw.item["deadlock-stack-uranium-ore"].icons
    end

    -- Recipes for mining stacked ores in Mining Depots are now sorted into their own subgroup
    data:extend(
        {
            {
                type = "item-subgroup",
                name = "mining-depot-stacked-mining",
                group = "production",
                order = "e"
            },
            {
                type = "item-subgroup",
                name = "mining-depot-stacked-mining-with-fluid",
                group = "production",
                order = "f"
            }
        }
    )

    for _, recipe in pairs(data.raw["recipe"]) do
        if recipe.category == "mining-depot" and recipe.order and string.sub(recipe.order, 1, string.len("stacked-")) == "stacked-" and recipe.subgroup then
            if recipe.subgroup == "extraction-machine" then
                recipe.subgroup = "mining-depot-stacked-mining"
            elseif recipe.subgroup == "smelting-machine" then
                recipe.subgroup = "mining-depot-stacked-mining-with-fluid"
            end
        end
    end
end

-- just to make extra sure that the fluid of the high pressure offshore pump is set to the correct one
if mods["CompressedFluids"] and data.raw["offshore-pump"]["offshore-pump"] then
    for _, pump in pairs({"kyth-high-pressure-offshore-pump", "kyth-high-pressure-offshore-pump-mk2"}) do
        if data.raw["offshore-pump"][pump] then
            if data.raw.fluid["high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid] then
                data.raw["offshore-pump"][pump].fluid = "high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid
                if data.raw["offshore-pump"]["offshore-pump"].fluid_box.filter then
                    data.raw["offshore-pump"][pump].fluid_box.filter = "high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid_box.filter
                end
            end

            -- fix pipe connections with AAI Industry
            if mods["aai-industry"] then
                data.raw["offshore-pump"][pump].fluid_box.pipe_connections = {{position = {0, 1}, type = "output"}}
            end
        end
    end
end

-- for resource, resource_table in pairs(data.raw.resource) do
--     if resource_table.infinate == false and data.raw.resource["high-pressure-" .. resource] then

--     end
-- end
-- if data.raw.resource["crude-oil"].infinite == false then
--     log("here")
-- end
