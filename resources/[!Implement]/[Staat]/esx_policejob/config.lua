Config                            = {}

Config.DrawDistance               = 50.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = -1
Config.Locale                     = 'de'

Config.PoliceStations = {

	LSPD = {

		Blip = {
--			Coords  = vector3(425.1, -979.5, 30.7),
--			Sprite  = 60,
--			Display = 4,
--			Scale   = 1.2,
--			Colour  = 29
		},

		Cloakrooms = {
--			vector3(461.78, -999.14, 30.68)
		},

		Armories = {
--			vector3(479.24, -996.59, 30.69)
		},

		Vehicles = {
			{
--				Spawner = vector3(461.25, -975.68, 25.69),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(458.53, -981.29, 25.69), heading = 90.0, radius = 6.0},
					{coords = vector3(451.48, -975.58, 25.69), heading = 90.0, radius = 6.0},
					{coords = vector3(459.21, -993.00, 25.69), heading = 0.0, radius = 6.0},
					{coords = vector3(436.05, -975.71, 25.69), heading = 90.0, radius = 6.0}
				}
			},

			{
--				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			},

			{
				Spawner = vector3(1933.82, 2630.11, 47.91),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(1932.74, 2636.64, 48.59), heading = 221.4, radius = 10.0}
				}
			}
		},

		BossActions = {
--			vector3(462.49, -985.03, 30.69)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 }
	},

	swat = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 }
	},

	capitan = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 }
	},

	commander = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 }
	},

	rang10 = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 }
	},

	rang11 = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_SMG', price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'police', label = 'Streifenwagen', price = 1 }
	},

	recruit = {
	},

	officer = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 }
	},

	sergeant = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 }
	},

	intendent = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 }
	},

	lieutenant = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 }
	},

	swat = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 },
		{ model = 'policeold', label = 'Streifenwagen Oldtimer', price = 1 }
	},

	capitan = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 },
		{ model = 'policeold', label = 'Streifenwagen Oldtimer', price = 1 },
		{ model = 'polriot', label = 'S.W.A.T. Panzer', price = 1 }
	},

	commander = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 },
		{ model = 'policeold', label = 'Streifenwagen Oldtimer', price = 1 },
		{ model = 'polriot', label = 'S.W.A.T. Panzer', price = 1 },
		{ model = 'policeslick', label = 'Streifenwagen (Slicktop)', price = 1 }
	},

	chef = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 },
		{ model = 'policeold', label = 'Streifenwagen Oldtimer', price = 1 },
		{ model = 'polriot', label = 'S.W.A.T. Panzer', price = 1 },
		{ model = 'policeslick', label = 'Streifenwagen (Slicktop)', price = 1 }
	},

	rang10 = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 },
		{ model = 'policeold', label = 'Streifenwagen Oldtimer', price = 1 },
		{ model = 'polriot', label = 'S.W.A.T. Panzer', price = 1 },
		{ model = 'policeslick', label = 'Streifenwagen (Slicktop)', price = 1 }
	},

	rang11 = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 },
		{ model = 'policeold', label = 'Streifenwagen Oldtimer', price = 1 },
		{ model = 'polriot', label = 'S.W.A.T. Panzer', price = 1 },
		{ model = 'policeslick', label = 'Streifenwagen (Slicktop)', price = 1 },
		{ model = 'police42', label = 'Streifenwagen (unmarked)', price = 1 },
		{ model = 'polmerit2', label = 'Streifenwagen (unmarked) Merit', price = 1 },
		{ model = '20camaro', label = 'Streifenwagen (unmarked) Chervorlet Camaro', price = 1 }
	},

	boss = {
		{ model = 'pscout', label = 'Streifenwagen Scout', price = 1 },
		{ model = 'police2', label = 'Streifenwagen Buffalo', price = 1 },
		{ model = 'polspeedo', label = 'Polizei Transporter', price = 1 },
		{ model = 'policeb1', label = 'Polizei-Motorrad', price = 1 },
		{ model = 'beachp', label = 'Streifenwagen Offroad', price = 1 },
		{ model = 'policeold', label = 'Streifenwagen Oldtimer', price = 1 },
		{ model = 'polriot', label = 'S.W.A.T. Panzer', price = 1 },
		{ model = 'policeslick', label = 'Streifenwagen (Slicktop)', price = 1 },
		{ model = 'police42', label = 'Streifenwagen (unmarked)', price = 1 },
		{ model = 'polmerit2', label = 'Streifenwagen (unmarked) Merit', price = 1 },
		{ model = '20camaro', label = 'Streifenwagen (unmarked) Chervorlet Camaro', price = 1 }
	}
}

Config.AuthorizedHelicopters = {
		recruit = {
	},

	officer = {
	},

	sergeant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	intendent = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	swat = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	capitan = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	commander = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	rang10 = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	rang11 = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	rang12 = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	swat_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	capitan_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	commander_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	rang10_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	rang11_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 44,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 12,  ['bproof_2'] = 1
		}
	},
	market_wear = {
		male = {
			['bproof_1'] = 21,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 3,  ['bproof_2'] = 4
		}
	},
	gangtask_wear = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 20,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 49,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 7,  ['tshirt_2'] = 4
		}
	}

}
