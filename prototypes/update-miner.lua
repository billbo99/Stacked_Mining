-- the vanilla default fluid capacity of an electric mining drill
local requireFluidCapacity = 200

-- checks if fluid capacity of miner is high enough to start a mining operation twice (to have a bit of a buffer)
for _, resource in pairs(data.raw["resource"]) do
    if resource.minable.required_fluid and data.raw["fluid"][resource.minable.required_fluid] then
        if resource.minable.fluid_amount * 2 > requireFluidCapacity then
            requireFluidCapacity = resource.minable.fluid_amount * 2
        end
    end
end

-- increase the fluid capacity of all mining drills in case theirs is smaller than requireFluidCapacity
for _, miner in pairs(data.raw["mining-drill"]) do
    if miner.input_fluid_box then
        if (miner.input_fluid_box.height or 1) * (miner.input_fluid_box.base_area or 1) * 100 < requireFluidCapacity then
            miner.input_fluid_box.base_area = requireFluidCapacity / (100 * (miner.input_fluid_box.height or 1))
            log("UPDATED input_fluid_box of " .. miner.name .. ", because mining some stacked ore requires a larger fluid capacity")
        end
    end
end
