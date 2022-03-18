Config	=	{}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale   = 'de'

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 700000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1

Config.localWeight = {

    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 100000, --SUV
    [3] = 40000, --Coupes
    [4] = 40000, --Muscle
    [5] = 25000, --Sports Classics
    [6] = 40000, --Sports
    [7] = 5000, --Super
    [8] = 10000, --Motorcycles
    [9] = 150000, --Off-road
    [10] = 800000, --Industrial
    [11] = 100000, --Utility
    [12] = 150000, --Vans
    [13] = 100, --Cycles
    [14] = 100000, --Boats
    [15] = 100, --Helicopters
    [16] = 100, --Planes
    [17] = 40000, --Service
    [18] = 700000, --Emergency
    [19] = 100, --Military
    [20] = 700000, --Commercial
    [21] = 100, --Trains
}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 100000, --SUV
    [3] = 40000, --Coupes
    [4] = 40000, --Muscle
    [5] = 25000, --Sports Classics
    [6] = 40000, --Sports
    [7] = 5000, --Super
    [8] = 10000, --Motorcycles
    [9] = 150000, --Off-road
    [10] = 800000, --Industrial
    [11] = 100000, --Utility
    [12] = 150000, --Vans
    [13] = 100, --Cycles
    [14] = 100000, --Boats
    [15] = 100, --Helicopters
    [16] = 100, --Planes
    [17] = 40000, --Service
    [18] = 700000, --Emergency
    [19] = 100, --Military
    [20] = 700000, --Commercial
    [21] = 100000, --Trains

}

Config.VehicleModel = {

    brickade    = 1500000, --Commercial
    rallytruck  = 1500000, --Commercial
    armarello  = 1000000, --Commercial
    hauler  = 1000000, --Commercial
    ramvan  = 1000000, --Commercial
    phantom  = 800000, --Commercial
    phantomhd  = 800000, --Commercial
    vnl780  = 800000, --Commercial
    guardian    = 350000, --Vans
    trailers2   = 350000, --Commercial

}

Config.VehiclePlate = {
	taxi        = "TAXI",
	cop         = "LSPD",
	ambulance   = "LSMD",
	mecano	    = "MECA",
}
