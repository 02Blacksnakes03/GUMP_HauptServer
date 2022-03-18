Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = false }

Config.ReviveReward               = 0  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombat              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 13.00 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 100 -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 500

--Für Revive
Config.Revive = { coords = vector3(308.86, -587.99, 43.28), heading = 48.5} 

Config.RespawnPoint = { coords = vector3(308.86, -587.99, 43.28), heading = 48.5}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(296.34, -584.08, 43.14),
			sprite = 61,
			scale  = 1.0,
			color  = 1
		},

		AmbulanceActions = {
			vector3(298.73, -598.38, 43.28)
		},

		Pharmacies = {
			vector3(305.83, -597.25, 43.28)
		},

		Vehicles = {
			{
				Spawner = vector3(297.61, -609.48, 43.4),
				InsideShop = vector3(419.46, -647.24, 28.5),
				Marker = { type = -1, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(286.86, -593.61, 43.13), heading = 155.1, radius = 4.0 },
					{ coords = vector3(276.59, -603.03, 43.0), heading = 90.14, radius = 4.0 },
					{ coords = vector3(290.65, -582.39, 43.16), heading = 147.55, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.71, -586.82, 74.17),
				InsideShop = vector3(351.55, -590.0, 74.17),
				Marker = { type = -1, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.22, -588.18, 74.17), heading = 142.7, radius = 10.0 },
					{ coords = vector3(351.22, -588.18, 74.17), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(-23733.67, -405.54, 47.92),
				To = { coords = vector3(-234.82, -391.98, -84.93), heading = 0.0 },
				Marker = { type = -1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(-23433.82, -391.98, -84.93),
				To = { coords = vector3(-237.67, -405.54, 47.92), heading = 0.0 },
				Marker = { type = -1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(24733.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(33533.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = -1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(23433.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(31733.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(23777.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(25677.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	doctor = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang4 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang5 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang6 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang7 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang8 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang9 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	rang10 = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	},

	boss = {
		{ model = 'ambulance', label = 'Krankenwagen', price = 1}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

	chief_doctor = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

	rang4 = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

	rang5 = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

	rang6 = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

	rang7 = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

	rang8 = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

    rang9 = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},

    rang10 = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	},


	boss = {
		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		},

		{
			model = 'supervolito',
			label = 'Helicopter',
			price = 1
		}
	}

}
