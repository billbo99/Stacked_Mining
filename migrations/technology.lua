if game.active_mods["FactorioExtended-Plus-Transport"] then
    for index, force in pairs(game.forces) do
        if force.technologies["factorio-extended-fluid-handling"].researched and force.recipes["kyth-high-pressure-offshore-pump-mk2"] then
            force.recipes["kyth-high-pressure-offshore-pump-mk2"].enabled = true
        end
    end
end