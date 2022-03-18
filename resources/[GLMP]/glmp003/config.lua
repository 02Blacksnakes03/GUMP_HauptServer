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
	weapon_PISTOL = {
		item = 'pistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_COMBATPISTOL = {
		item = 'combatpistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_APPISTOL = {
		item = 'appistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_STUNGUN = {
		item = 'stungun',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_STUNGUN = {
		item = 'pistol50',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_HEAVYPISTOL = {
		item = 'heavypistol',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_REVOLVER = {
		item = 'revolver',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_SMG = {
		item = 'smg',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_ASSAULTSMG = {
		item = 'assaultsmg',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_COMBATPDW = {
		item = 'combatpdw',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_ASSAULTRIFLE = {
		item = 'assaultrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_CARBINRIFLE = {
		item = 'carbinerifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_ADVANCEDRIFLE = {
		item = 'advancedrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_SPECIALCARBINE = {
		item = 'specialcarbine',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_BULLPUPRIFLE = {
		item = 'bullprprifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},
	 
	weapon_GUSENBERG = {
		item = 'gusenberg',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_FLARE = {
		item = 'flare',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_MARKSMANRIFLE = {
		item = 'marksmanrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
	},

	weapon_SNIPERRIFLE = {
		item = 'sniperrifle',	--> THE ITEM THAT THE PLAYER GETS AFTER PACKING THE WEAPON
		ammo = '0' 		--> EVERY 30 AMMO THE PLAYER GETS 1 MUNITIONPACK
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
	geschenk = {
		img = 'Geschenkrot.png'
	},
	aramidfasern = {
		img = 'faser.png'
	},
	bandage = {
		img = 'bandage.png'
	},
	cuffs = {
		img = 'kabelbinder.png'
	},
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
		img = 'hanfpflanze.png'
		
	},
	bandage = {
		img = 'bandage.png'
	},
	weedkiste = {
		img = 'Packet_mit_perfektem_Cannabis.png'
	},
	kbohne = {
		img = 'hanfsamen.png'
	},
	kbohnekiste = {
		img = 'kkaffeepulver.png'
	},
	weedsamen = {
		img = 'samengut.png'
	},
	beamtenweste = {
		img = 'BSchutzweste.png'
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
		img = 'BenutztesKondom.png'
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
	aramidfaser = {
		img = 'bfaser.png'
	},
	ephi = {
		img = 'ephedrin.png'
	},
	kroeten_pooch = {
		img = 'kroeten'
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
	medikit = {
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
	srose = {
		img = 'blackrose.png'
	}, 
	cube = {
		img = 'Silverdice.png'
	},
	sichel = {
		img = 'sickle.png'
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
	aramid = {
		img = 'kevlar.png'
	},
	kevlar = {
		img = 'kevlar.png'
	},
	bauxit = {
		img = 'bauxit.png'
	},
	joint = {
		img = 'joint.png'
	},
	kaffee = {
		img = 'kaffee.png'
	},
	kohle = {
		img = 'kohle.png'
	},
	apple = {
		img = 'apple.png'
	},
	backpack = {
		img = 'backpack.png'
	},
	blowpipe = {
		img = 'blowpipe.png'
	},
	geschenknormal = {
		img = 'Geschenkrot.png'
	},
	geschenkselten = {
		img = 'geschenkblau.png'
	},
	laptop = {
		img = 'laptop.png'
	},
	combatpistol = {
		img = 'CombatPistol.png'
	},
	appistol = {
		img = 'ApPistol.png'
	},
	pistol50 = {
		img = 'Pistol50.png'
	},
	heavypistol = {
		img = 'HeavyPistol.png'
	},
	revolver = {
		img = 'Revolver.png'
	},
	smg = {
		img = 'SMG.png'
	},
	assaultsmg = {
		img = 'AssaultSMG.png'
	},
	combatpdw = {
		img = 'CombatPDW.png'
	},
	assaultrifle = {
		img = 'Assaultrifle.png'
	},
	carbinerifle = {
		img = 'CarbineRifle.png'
	},
	advancedrifle = {
		img = 'AdvanvcedRifle.png'
	},
	specialcarbine = {
		img = 'SpecialCarbine.png'
	},
	bullpuprifle = {
		img = 'BullpupRifle.png'
	},
	gusenberg = {
		img = 'Gusenberg.png'
	},
	flare = {
		img = 'Fackel.png'
	},
	marksmanrifle = {
		img = 'MarksmanRifle.png'
	},
	sniperrifle = {
		img = 'SniperRifle.png'
	},
	medikit = {
		img = 'first-aid-kit.png'
	},
	cube = {
		img = 'Silverdice.png'
	}, 
	stungun = {
		img = 'Tazer.png'
	},
	pdweste = {
		img = 'LSPD-Kleidung.png'
	},
	beamten_combatpistol = {
		img = 'CombatPistol.png'
	},
	beamten_appistol = {
		img = 'ApPistol.png'
	},
	beamten_pistol = {
		img = 'PISTOL.png'
	},
	beamten_pistol50 = {
		img = 'Pistol50.png'
	},
	beamten_heavypistol = {
		img = 'HeavyPistol.png'
	},
	beamten_revolver = {
		img = 'Revolver.png'
	},
	beamten_smg = {
		img = 'SMG.png'
	},
	beamten_assaultsmg = {
		img = 'AssaultSMG.png'
	}, 
	kaefig = {
		img = 'Kaefig.png'
	},
	chicken = { 
		img = 'Huhn.png'
	},
	chickenfilet = {
		img = 'KisteFiletstuecke.png'
	},
	beamten_combatpdw = {
		img = 'CombatPDW.png'
	},
	beamten_assaultrifle = {
		img = 'Assaultrifle.png'
	},
	beamten_carbinerifle = {
		img = 'CarbineRifle.png'
	},
	beamten_advancedrifle = {
		img = 'AdvanvcedRifle.png'
	},
	beamten_specialcarbine = {
		img = 'SpecialCarbine.png'
	},
	beamten_bullpuprifle = {
		img = 'BullpupRifle.png'
	},
	beamten_gusenberg = {
		img = 'Gusenberg.png'
	},
	beamten_flare = {
		img = 'Fackel.png'
	},
	beamten_marksmanrifle = {
		img = 'MarksmanRifle.png'
	},
	beamten_sniperrifle = {
		img = 'SniperRifle.png'
	},
	beamten_stungun = {
		img = 'Tazer.png'
	},
	parkkralle = {
		img = 'wegfahrsperre.png'
	},
	ammo_pistol = {
		img = 'AmmoPistol.png'
	},
	ammo_smg = {
		img = 'AmmoSMG.png'
	},
	ammo_rifle = {
		img = 'AmmoAdvancedRifle.png'
	},
	ammo_sniper = {
		img = 'AmmoSniperrifle.png'
	},
	ammo_pump = {
		img = 'AmmoPumpShotgun.png'
	},

	beamten_ammo_pistol = {
		img = 'AmmoPistol.png'
	},
	beamten_ammo_smg = {
		img = 'AmmoSMG.png'
	},
	beamten_ammo_rifle = {
		img = 'AmmoAdvancedRifle.png'
	},
	beamten_ammo_sniper = {
		img = 'AmmoSniperrifle.png'
	},
	beamten_ammo_pump = {
		img = 'AmmoPumpShotgun.png'
	},
	zinkkohle = {
		img = 'Kohle.png'
	},
	zinkkohlekiste = {
		img = 'Kohlekisten.png'
	},
	batterien =  {
		img = 'battery.png'
	},

----------------------------------------------------------WAFFEN-----------------------------------------------------------
	GADGET_PARACHUTE = {
		img = 'FallSchirm.png'
	},
	WEAPON_GUSENBERG = {
		img = 'Gusenberg.png'
	},
	WEAPON_ADVANCEDRIFLE = {
		img = 'AdvanvcedRifle.png'
	},
	WEAPON_ASSAULTRIFLE = {
		img = 'Assaultrifle.png'
	},
	WEAPON_PUMPSHOTGUN = {
		img = 'Pumpshotgun.png'
	},
	WEAPON_SPECIALCARBINE = {
		img = 'SpecialCarbine.png'
	},
	WEAPON_PISTOL = {
		img = 'PISTOL.png'
	},
	WEAPON_STUNGUN = {
		img = 'Tazer.png'
	},
	WEAPON_HEAVYPISTOL = {
		img = 'HeavyPistol.png'
	},
	WEAPON_BULLPUPRIFLE = {
		img = 'BullpupRifle.png'
	},
	WEAPON_NIGHTSTICK = {
		img = 'Schlagstock.png'
	},
}