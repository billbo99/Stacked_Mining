data:extend(
{
    {
	    type = "technology",
	    name = "stacked-mining-tech",
		prerequisites =
		{
			"mining-productivity-1",
			"chemical-science-pack",
		},
		icon = "__Stacked_Mining__/graphics/technology/stacked-mining-tech.png",
		unit =
		{
		  count = 350,
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
		  },
		  time = 60
		},
		order = "c-k-f-a",
		icon_size = 128,
		effects = {}
	}
})