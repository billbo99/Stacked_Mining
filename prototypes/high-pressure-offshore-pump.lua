-- safely get the value of a setting
local function getSettingValue(optionName)
    if settings["startup"] and settings["startup"][optionName] and settings["startup"][optionName].value then
		return settings["startup"][optionName].value
    end
    return false
end

if mods["CompressedFluids"] and getSettingValue("kyth-high-pressure-offshore-pump") and
    data.raw["offshore-pump"]["offshore-pump"] and data.raw.item["offshore-pump"] and data.raw.recipe["offshore-pump"] then

    if not mods["PressurizedBarrels"] then
        if not data.raw["offshore-pump"]["offshore-pump"].fast_replaceable_group then
            data.raw["offshore-pump"]["offshore-pump"].fast_replaceable_group = "offshore-pump"
        end

        local hp_offshore_pump_entity = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])

        hp_offshore_pump_entity.name = "kyth-high-pressure-offshore-pump"
        hp_offshore_pump_entity.icon = "__Stacked_Mining__/graphics/icons/offshore-pump.png"
        hp_offshore_pump_entity.icon_size = 64
        hp_offshore_pump_entity.icon_mipmaps = 4
        hp_offshore_pump_entity.icons = nil
        hp_offshore_pump_entity.max_health = 200

        if data.raw.fluid["high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid] then
            hp_offshore_pump_entity.fluid = "high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid
            if data.raw["offshore-pump"]["offshore-pump"].fluid_box.filter then
                hp_offshore_pump_entity.fluid_box.filter = "high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid_box.filter
            end
        end
        -- adjust the pumping speed to keep the (uncompressed output/sec the same overall)
        hp_offshore_pump_entity.pumping_speed = hp_offshore_pump_entity.pumping_speed / getSettingValue("fluid-compression-rate")
        hp_offshore_pump_entity.minable.result = hp_offshore_pump_entity.name

        hp_offshore_pump_entity.graphics_set.animation["east"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_East.png"
        hp_offshore_pump_entity.graphics_set.animation["east"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_East.png"
        hp_offshore_pump_entity.graphics_set.animation["north"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_North.png"
        hp_offshore_pump_entity.graphics_set.animation["north"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_North.png"
        hp_offshore_pump_entity.graphics_set.animation["south"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_South.png"
        hp_offshore_pump_entity.graphics_set.animation["south"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_South.png"
        hp_offshore_pump_entity.graphics_set.animation["west"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_West.png"
        hp_offshore_pump_entity.graphics_set.animation["west"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_West.png"


        local hp_offshore_pump_item = table.deepcopy(data.raw.item["offshore-pump"])

        hp_offshore_pump_item.name = "kyth-high-pressure-offshore-pump"
        hp_offshore_pump_item.icon = "__Stacked_Mining__/graphics/icons/offshore-pump.png"
        hp_offshore_pump_item.icon_size = 64
        hp_offshore_pump_item.icon_mipmaps = 4
        hp_offshore_pump_item.icons = nil
        hp_offshore_pump_item.place_result = hp_offshore_pump_entity.name
        if data.raw["offshore-pump"]["offshore-pump"].order then
            hp_offshore_pump_item.order = data.raw["offshore-pump"]["offshore-pump"].order .. " -high-pressure"
        else
            hp_offshore_pump_item.order = "b[fluids]-a[offshore-pump]-high-pressure"
        end

        local hp_offshore_pump_recipe =
        {
            type = "recipe",
            name = "kyth-high-pressure-offshore-pump",
            ingredients =
            {
                {"advanced-circuit", 10},
                {"steel-plate", 15},
                {"pump", 2},
                {"fluid-compressor", 1}
            },
            result = "kyth-high-pressure-offshore-pump"
        }


        data:extend(
        {
            hp_offshore_pump_entity,
            hp_offshore_pump_item,
            hp_offshore_pump_recipe
        })

        -- the recipe is unlocked with the technology "Fluid compressor"
        table.insert(data.raw.technology["fluid-compressor"].effects, {recipe = "kyth-high-pressure-offshore-pump", type = "unlock-recipe"})

    end

    -- if FactorioExtended-Plus is enabled, add a High pressure offshore pump Mk2
    if mods["FactorioExtended-Plus-Transport"] then

        local hp_offshore_pump_mk2_entity = table.deepcopy(data.raw["offshore-pump"]["offshore-pump-mk2"])

        hp_offshore_pump_mk2_entity.name = "kyth-high-pressure-offshore-pump-mk2"
        hp_offshore_pump_mk2_entity.icon = "__Stacked_Mining__/graphics/icons/offshore-pump-mk2.png"
        hp_offshore_pump_mk2_entity.icon_size = 64
        hp_offshore_pump_mk2_entity.icon_mipmaps = 4
        hp_offshore_pump_mk2_entity.icons = nil
        hp_offshore_pump_mk2_entity.max_health = 300

        if data.raw.fluid["high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid] then
            hp_offshore_pump_mk2_entity.fluid = "high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid
            if data.raw["offshore-pump"]["offshore-pump"].fluid_box.filter then
                hp_offshore_pump_mk2_entity.fluid_box.filter = "high-pressure-" .. data.raw["offshore-pump"]["offshore-pump"].fluid_box.filter
            end
        end
        -- adjust the pumping speed to keep the (uncompressed output/sec the same overall)
        hp_offshore_pump_mk2_entity.pumping_speed = hp_offshore_pump_mk2_entity.pumping_speed / getSettingValue("fluid-compression-rate")
        hp_offshore_pump_mk2_entity.minable.result = hp_offshore_pump_mk2_entity.name

        hp_offshore_pump_mk2_entity.graphics_set.animation["east"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_East.png"
        hp_offshore_pump_mk2_entity.graphics_set.animation["east"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_East.png"
        hp_offshore_pump_mk2_entity.graphics_set.animation["north"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_North.png"
        hp_offshore_pump_mk2_entity.graphics_set.animation["north"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_North.png"
        hp_offshore_pump_mk2_entity.graphics_set.animation["south"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_South.png"
        hp_offshore_pump_mk2_entity.graphics_set.animation["south"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_South.png"
        hp_offshore_pump_mk2_entity.graphics_set.animation["west"].layers[1].filename = "__Stacked_Mining__/graphics/entity/offshore-pump_West.png"
        hp_offshore_pump_mk2_entity.graphics_set.animation["west"].layers[1].hr_version.filename = "__Stacked_Mining__/graphics/entity/hr-offshore-pump_West.png"

        if mods["PressurizedBarrels"] and data.raw["offshore-pump"]["high-pressure-offshore-pump"] then
            data.raw["offshore-pump"]["high-pressure-offshore-pump"].next_upgrade = "kyth-high-pressure-offshore-pump-mk2"
        elseif not mods["PressurizedBarrels"] then
            data.raw["offshore-pump"]["kyth-high-pressure-offshore-pump"].next_upgrade = "kyth-high-pressure-offshore-pump-mk2"
        end

        local hp_offshore_pump_mk2_item = table.deepcopy(data.raw.item["offshore-pump-mk2"])

        hp_offshore_pump_mk2_item.name = "kyth-high-pressure-offshore-pump-mk2"
        hp_offshore_pump_mk2_item.icon = "__Stacked_Mining__/graphics/icons/offshore-pump-mk2.png"
        hp_offshore_pump_mk2_item.icon_size = 64
        hp_offshore_pump_mk2_item.icon_mipmaps = 4
        hp_offshore_pump_mk2_item.icons = nil
        hp_offshore_pump_mk2_item.order = "b[fluids]-ab[high-pressure-offshore-pump-mk2]"
        hp_offshore_pump_mk2_item.place_result = hp_offshore_pump_mk2_entity.name
        hp_offshore_pump_mk2_item.next_upgrade = nil

        local hp_offshore_pump_mk2_recipe =
        {
            type = "recipe",
            name = "kyth-high-pressure-offshore-pump-mk2",
            ingredients =
            {
                {"advanced-circuit", 10},
                {"titanium-alloy", 15},
                {"pump-mk2", 2}
            },
            result = "kyth-high-pressure-offshore-pump-mk2"
        }

        -- in case the mk1 pump was not generated corrrectly because of some unexpected issue
        if data.raw.item["kyth-high-pressure-offshore-pump"] then
            table.insert(hp_offshore_pump_mk2_recipe.ingredients, {"kyth-high-pressure-offshore-pump", 1})

        elseif mods["PressurizedBarrels"] and data.raw.item["high-pressure-offshore-pump"] then
            hp_offshore_pump_mk2_recipe.ingredients =
            {
                {"advanced-circuit", 10},
                {"titanium-alloy", 15},
                {"pump-mk2", 2},
                {"high-pressure-offshore-pump", 1}
            }
        end


        data:extend(
        {
            hp_offshore_pump_mk2_entity,
            hp_offshore_pump_mk2_item,
            hp_offshore_pump_mk2_recipe
        })

        -- the recipe is unlocked with the technology "FactorioExtended Fluid handling"
        table.insert(data.raw.technology["factorio-extended-fluid-handling"].effects, {recipe = "kyth-high-pressure-offshore-pump-mk2", type = "unlock-recipe"})

    end

end
