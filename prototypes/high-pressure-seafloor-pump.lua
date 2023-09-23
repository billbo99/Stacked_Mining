-- safely get the value of a setting
local function getSettingValue(optionName)
    if settings["startup"] and settings["startup"][optionName] and settings["startup"][optionName].value then
        return settings["startup"][optionName].value
    end
    return false
end

if mods["CompressedFluids"] and mods["angelsrefining"] and getSettingValue("kyth-high-pressure-seafloor-pump") then
    local hp_seafloor_pump_entity = table.deepcopy(data.raw["offshore-pump"]["seafloor-pump"])
    hp_seafloor_pump_entity.name = "high-pressure-seafloor-pump"
    hp_seafloor_pump_entity.icon = "__Stacked_Mining__/graphics/icons/seafloor-pump.png"
    hp_seafloor_pump_entity.picture['north'].filename = "__Stacked_Mining__/graphics/entity/seafloor-pump.png"
    hp_seafloor_pump_entity.picture['south'].filename = "__Stacked_Mining__/graphics/entity/seafloor-pump.png"
    hp_seafloor_pump_entity.picture['east'].filename = "__Stacked_Mining__/graphics/entity/seafloor-pump.png"
    hp_seafloor_pump_entity.picture['west'].filename = "__Stacked_Mining__/graphics/entity/seafloor-pump.png"
    hp_seafloor_pump_entity.fluid = "high-pressure-water-viscous-mud"
    hp_seafloor_pump_entity.fluid_box.filter = "high-pressure-water-viscous-mud"
    hp_seafloor_pump_entity.minable.result = hp_seafloor_pump_entity.name

    local hp_seafloor_pump_item = table.deepcopy(data.raw.item["seafloor-pump"])
    hp_seafloor_pump_item.name = "high-pressure-seafloor-pump"
    hp_seafloor_pump_item.icon = "__Stacked_Mining__/graphics/icons/seafloor-pump.png"
    hp_seafloor_pump_item.place_result = hp_seafloor_pump_item.name
    hp_seafloor_pump_item.order = "b"

    local hp_seafloor_pump_recipe = table.deepcopy(data.raw.recipe["seafloor-pump"])
    hp_seafloor_pump_recipe.name = "high-pressure-seafloor-pump"
    hp_seafloor_pump_recipe.icon = "__Stacked_Mining__/graphics/icons/seafloor-pump.png"
    hp_seafloor_pump_recipe.icon_size = 32
    hp_seafloor_pump_recipe.result = hp_seafloor_pump_recipe.name
    hp_seafloor_pump_recipe.ingredients = { { name = "seafloor-pump", amount = 4 } }
    if hp_seafloor_pump_recipe.normal then
        hp_seafloor_pump_recipe.normal.result = hp_seafloor_pump_recipe.name
        hp_seafloor_pump_recipe.normal.ingredients = { { name = "seafloor-pump", amount = 4 },
            { name = "fluid-compressor", amount = 1 } }
    end
    if hp_seafloor_pump_recipe.expensive then
        hp_seafloor_pump_recipe.expensive.result = hp_seafloor_pump_recipe.name
        hp_seafloor_pump_recipe.expensive.ingredients = { { name = "seafloor-pump", amount = 4 },
            { name = "fluid-compressor", amount = 1 } }
    end

    data:extend(
        {
            hp_seafloor_pump_entity,
            hp_seafloor_pump_item,
            hp_seafloor_pump_recipe
        })

    -- the recipe is unlocked with the technology "FactorioExtended Fluid handling"
    table.insert(data.raw.technology["fluid-compressor"].effects,
        { recipe = hp_seafloor_pump_recipe.name, type = "unlock-recipe" })
end