Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = -1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 0
Config.FIBNumberRequired = 0
Config.TimerBeforeNewRob = 8000 

Config.MaxDistance    = 20   
Config.GiveBlackMoney = true

Stores = {
	["fleeca"] = {
		position = { x = -2957.61, y = 481.21, z = 15.71 },
		reward = math.random(100000, 200000),
		nameOfStore = "Fleecabank (Highway)",
		secondsRemaining = 1200, -- seconds
		lastRobbed = 0
	},
	["banksandy"] = {
		position = { x = -104.03, y = 6477.69, z = 31.63 },
		reward = math.random(100000, 200000),
		nameOfStore = "Blainecountybank (Sandy Shores)",
		secondsRemaining = 1200, 
		lastRobbed = 0
	},
	["banklossantos"] = {
		position = { x = 265.2, y = 213.79, z = 101.68 },
		reward = math.random(100000, 200000),
		nameOfStore = "Staatsbank (Los Santos)",
		secondsRemaining = 600,  
		lastRobbed = 0
	},
	["bankstadtpark"] = {
		position = { x = 147.45, y = -1044.91, z = 29.37 },
		reward = math.random(100000, 200000),
		nameOfStore = "Fleecabank (Stadtpark)",
		secondsRemaining = 1200, 
		lastRobbed = 0
	}
}
