Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 2000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 8 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 8 * minute -- Time til the player bleeds out


Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(294.51, -593.92, 42.67), heading = 86.01 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(303.64, -586.34, 43.28),
			sprite = 61,
			scale  = 0.9,
			color  = 2
		},

		AmbulanceActions = {
			vector3(301.6, -598.96, 42.28), --Innenstadt
			vector3(1834.40, 3690.90, 34.30), --Sandy
			vector3(1686.30, 2575.40, 44.90) --State
		},

		Pharmacies = {
			vector3(310.57, -565.54, 42.28), --Innenstadt
			vector3(1822.75, 3667.00, 33.20),  --Sandy Hinten
			vector3(1825.60, 3686.60, 33.20), --Sandy Eingang
			vector3(1680.50, 2581.50, 44.90) --State
		},

		Vehicles = {
			{
--				Spawner = vector3(330.53, -589.72, 27.8),
				InsideShop = vector3(419.46, -647.24, 28.5),
				Marker = { type = 34, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(317.48, -573.84, 28.8), heading = 345.44, radius = 4.0 }
				--	{ coords = vector3(276.59, -603.03, 43.0), heading = 90.14, radius = 4.0 },
				--	{ coords = vector3(290.65, -582.39, 43.16), heading = 147.55, radius = 6.0 }
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


		Helicopters = {
			{
				Spawner = vector3(337.76, -587.96, 74.17),
				InsideShop = vector3(365.17, -567.47, 39.25), heading = 73.76,
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.03, -588.79, 74.36), heading = 245.84, radius = 10.0 }
				}
			},

			{
				Spawner = vector3(1697.60, 2575.00, 50.60), --State
				InsideShop = vector3(1691.00, 2583.8, 50.78), heading = 90.76,
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(1691.00, 2583.8, 50.78), heading = 245.84, radius = 10.0 }
				}
			}
		},

	FastTravels = {
	
			-- Eingang
			
					{
						From = vector3(275.3, -1361, 55.28),
						To = { coords = vector3(300, -578.79, 90.26 ), heading = 92.92 }, --
						Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
					},
		
					{
						From = vector3(275.82, -1361.45, 24.54),
						To = { coords = vector3(296.18, -584.35, 43.14 ), heading = 92.92 }, --
						Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
					},
		

				},
		
				FastTravelsPrompt = {
					{
						From = vector3(340.56, -595.36, 66.79),
						To = { coords = vector3(338.53, -586.7, 909.17), heading = 255.34 },
						Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
						Prompt = _U('fast_travel')
					},
		
					{
						From = vector3(339.3, -584.08, 0.17),
						To = { coords = vector3(337, -593.79, 99.8), heading = 70.51 },
						Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
						Prompt = _U('fast_travel')
					}
		
				}
		
			}
		}


		Config.AuthorizedVehicles = {

			recruit = {
				{ model = 'ambulance', label = 'Krankenwagen', price = 1},
			--	{ model = 'dodgeems', label = 'Dodge', price = 1},
				{ model = 'lsmcscout', label = 'Scout', price = 1},
				{ model = 'lsmcbuffals', label = 'Bufallo', price = 1}
			},
		
			officer = {
				{ model = 'ambulance', label = 'Krankenwagen', price = 1},
				--{ model = 'dodgeems', label = 'Dodge', price = 1},
				{ model = 'lsmcscout', label = 'Scout', price = 1},
				{ model = 'lsmcbuffals', label = 'Bufallo', price = 1}
			},
		
			lieutenant = {
				{ model = 'ambulance', label = 'Krankenwagen', price = 1},
			--	{ model = 'dodgeems', label = 'Dodge', price = 1},
				{ model = 'lsmcscout', label = 'Scout', price = 1},
				{ model = 'lsmcbuffals', label = 'Bufallo', price = 1}
			},
		
			rang12 = {
				{ model = 'ambulance', label = 'Krankenwagen', price = 1},
			--	{ model = 'dodgeems', label = 'Dodge', price = 1},
				{ model = 'lsmcscout', label = 'Scout', price = 1},
				{ model = 'lsmcbuffals', label = 'Bufallo', price = 1}
		
			}
		
		}
		
		Config.AuthorizedHelicopters = {
		
			recruit = {},
		
			officer = {
				{
					model = 'polmav',
					label = 'Helicopter falls PD heli Pfeil taste nach oben!',
					price = 1
				}
			},
		
			lieutenant = {
				{
					model = 'polmav',
					label = 'Helicopter falls PD heli Pfeil taste nach oben!',
					price = 1
				},
		
				{
					model = 'polmav',
					label = 'Helicopter falls PD heli Pfeil taste nach oben!',
					price = 1
				}
			},
		
			rang0 = {
				{
					model = 'polmav',
					label = 'Helicopter falls PD heli Pfeil taste nach oben!',
					price = 1
				},
		
				{
					model = 'polmav',
					label = 'Helicopter falls PD heli Pfeil taste nach oben!',
					price = 1
				}
		
			}
		
		}
	
		