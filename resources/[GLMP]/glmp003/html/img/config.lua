PATRONHABIBI = {}


-- ESX Events DONT TOUCH THIS IF YOU DONT EXACTLY KNOW WHAT THESE DOES
PATRONHABIBI.esxgetSharedObjectevent = 'esx:getSharedObject'

-- INVENTORY SETTINGS
PATRONHABIBI.Inventoryname = "Inventar"
PATRONHABIBI.MaxWeight	 = "40000" -- 1000 = 1KG
PATRONHABIBI.MaxSlots		 = "12"	   -- 12 = 12 inventar slots

-- PACK ARMOR SETTINGS
PATRONHABIBI.packArmortime = 5000 --> TIME HOW LONG IT TAKES UNTIL ARMOR IS PACKED
PATRONHABIBI.packArmorItem = "bulletproof" --> ITEM THAT YOU GET AFTER PACKING ARMOR
PATRONHABIBI.packArmorremoveclothe = true --> REMOVE ARMORCLOTHE FROM PLAYER | true = YES and false = NO

-- PACK WEAPON SETTINGS
PATRONHABIBI.packWeapontime = 5000 --> TIME HOW LONG IT TAKES UNTIL WEAPON IS PACKED
PATRONHABIBI.packWeaponMunitionItem = "clip" --> ITEM THAT THE PLAYER GETS AS AMMO WHEN WEAPON GO PACKED


PATRONHABIBI.WeaponItems = {
	WEAPON_PISTOL = {
		item = 'pistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_COMBATPISTOL = {
		item = 'combatpistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_APPISTOL = {
		item = 'appistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_STUNGUN = {
		item = 'stungun',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_STUNGUN = {
		item = 'pistol50',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_HEAVYPISTOL = {
		item = 'heavypistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_REVOLVER = {
		item = 'revolver',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '6' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_SMG = {
		item = 'smg',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_ASSAULTSMG = {
		item = 'assaultsmg',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_COMBATPDW = {
		item = 'combatpdw',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_ASSAULTRIFLE = {
		item = 'assaultrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_CARBINRIFLE = {
		item = 'carbinerifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_ADVANCEDRIFLE = {
		item = 'advancedrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_SPECIALCARBINE = {
		item = 'specialcarbine',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_BULLPUPRIFLE = {
		item = 'bullprprifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},
	 
	WEAPON_GUSENBERG = {
		item = 'gusenberg',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_FLARE = {
		item = 'flare',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '99999999' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_MARKSMANRIFLE = {
		item = 'marksmanrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '10' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	WEAPON_SNIPERRIFLE = {
		item = 'sniperrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '30' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	}
}



-- PICTURES
PATRONHABIBI.DefaultPic = 'https://cdn.pixabay.com/photo/2016/04/01/08/49/box-1299001_960_720.png'

PATRONHABIBI.Items = {
--[[EXAMPLE
	[name from the item] = {
		img = '[image name! Dont forgett to put .png at the end]'
	},
	if you want to add a new item just put it in the itemImages folder. (html -> img -> itemImages)
	]]
	bread = {
		img = 'ChickenNuggets.png'
	},
	bulletproof = {
		img = 'bulletproof.png'
	},
	fixkit = {
		img = 'toolbox.png'
	},
	phone = {
		img = 'phone.png'
	},
	cuffs = {
		img = 'rope.png'
	},
	cuff_keys = {
		img = 'cuff_keys.png'
	},
	radio = {
		img = 'radio.png'
	},
	weedbag = {
		img = 'hanfpulver.png'
	},
	water = {
		img = 'water.png'
	},
	weed = {
		img = 'weed.png'
	},
	bandage = {
		img = 'bandage.png'
	},
	weedsamen = {
		img = 'hanfsamen.png'
	},
	lsfdstandard = {
		img = 'hoodie.png'
	},
	juice_orange = {
		img = 'juice_orage.png'
	},
	orange = {
		img = 'orage.png'
	},
	lspdstandard = {
		img = 'hoodie.png'
	},
	traubenverarbeitet = {
		img = 'Trauben.png'
	},
	trauben = {
		img = 'Traubensaft.png'
	},
	magazin = {
		img = 'Magazin.png'
	},
	iron = {
		img = 'iron.png'
	},
	stahl = {
		img = 'Stahlbarren.png'
	},
	eisenerz = {
		img = 'Eisenerz.png'
	},
	aluminium = {
		img = 'Aluminiumbarren.png'
	},
	aluminiumoxid = {
		img = 'Aluminiumerz.png'
	},
	bauxit = {
		img = 'schutt.png'
	},
	huelse = {
		img = 'Benutztes Kondom.png'
	},
	schraube = {
		img = 'schraube.png'
	},
	holz = {
		img = 'Holzplanke.png'
	},
	aramid = {
		img = 'faser.png'
	},
	aramidfasern = {
		img = 'bfaser.png'
	},
	ephi = {
		img = 'ephedrin.png'
	},
	kroeten_pooch = {
		img = 'kroeten2'
	},
	kroeten = {
		img = 'kroeten.png'
	},
	meth = {
		img = 'methlabor.png'
	},
    jewels = {
		img = 'jewels.png'
	},
	firstaidkit = {
		img = 'medikit.png'
	},
	drill = {
		img = '123avba.png'
	},
	contract = {
		img = 'contract.png'
	},
	clip = {
		img = 'clip.png'
	},
	kocher = {
		img = 'kocher.png'
	},
	tfcoupon = {
		img = '25coupon.png'
	},
	ffcoupon = {
		img = '50coupon.png'
	},
	teddy = {
		img = 'teddy.png'
	},
	rose = {
		img = 'rose.png'
	},
	casinochips = {
		img = 'wurfel.png'
	},
	baggies = {
		img = 'backpack.png'
	},
	cocacola = {
		img = 'cola.png'
	},
	steine = {
		img = 'schutt.png'
	},
	lspdweste2 = {
		img = 'LSPD-Kleidung.png'
	},
	lspdweste3 = {
		img = 'LSPD-Kleidung.png'
	},
	fib1 = {
		img = 'federalagent.png'
	},
	fib2 = {
		img = 'federalagent.png'
	},
	fib3 = {
		img = 'federalagent.png'
	},
	pistol = {
		img = 'PISTOL.png'
	},
----------------------------------------------------------WAFFEN-----------------------------------------------------------
	GADGET_PARACHUTE = {
		img = 'https://i.ibb.co/rvBCMR9/Fall-Schirm.png'
	},
	WEAPON_GUSENBERG = {
		img = 'https://i.ibb.co/nrGBkTT/Gusenberg.png'
	},
	WEAPON_ADVANCEDRIFLE = {
		img = 'https://i.ibb.co/KKP0Yt5/Advanvced-Rifle.png'
	},
	WEAPON_ASSAULTRIFLE = {
		img = 'https://i.ibb.co/Hh9rSNv/Assault-Rifle.png'
	},
	WEAPON_PUMPSHOTGUN = {
		img = 'https://i.ibb.co/T0jb5nR/Pumpshotgun.png'
	},
	WEAPON_SPECIALCARBINE = {
		img = 'https://i.ibb.co/v3KwgL3/Special-Carbine.png'
	},
	WEAPON_PISTOL = {
		img = 'https://i.ibb.co/bvFs3nJ/Pistol.png'
	},
	WEAPON_STUNGUN = {
		img = 'https://i.ibb.co/HBVTDBt/Tazer.png'
	},
	WEAPON_HEAVYPISTOL = {
		img = 'https://i.ibb.co/4d3jGpz/Heavy-Pistol.png'
	},
	WEAPON_BULLPUPRIFLE = {
		img = 'https://i.ibb.co/8d4gzwq/Bullpuprifle.png'
	},
	WEAPON_NIGHTSTICK = {
		img = 'https://i.ibb.co/C2Tj63h/Schlagstock.png'
	},
}