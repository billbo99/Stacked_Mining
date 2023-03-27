data:extend(
{
	{
        type = "string-setting",
		name = "kyth-overwrite-deadlock-stack-size",
		order = "a",
		setting_type = "startup",
		default_value = "disabled",
		allowed_values = {
            "disabled",
			"4",
			"5",
			"8",
			"10",
			"16",
			"25",
			"32",
			"50",
			"64",
			"100",
			"128"
        }
    },
    {
        type = "bool-setting",
        name = "kyth-high-pressure-offshore-pump",
        setting_type = "startup",
        default_value = true,
        order = "b"
    },
    {
        type = "bool-setting",
        name = "kyth-adjust-stage-counts",
        setting_type = "startup",
        default_value = false,
        order = "c"
    },
})
