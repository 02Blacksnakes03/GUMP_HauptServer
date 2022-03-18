Blacklist = {}

Blacklist.Particle = {
    Use = true,
    InstantCancel = true,
    Cancel = true,
    Limit = 5,
    Kick = true,
    Ban = true
}

Blacklist.Ped = {
    Use = true,
    Cancel = true,
    Limit = 5,
    Kick = true,
    Ban = true
}

Blacklist.Vehicle = {
    Use = false,
    Cancel = true,
    Limit = 5,
    Kick = true,
    Ban = true,
    List = {
        "RHINO",
        "JET"
    }
}

Blacklist.Prop = {
    Use = false,
    Cancel = true, 
    Limit = 0,
    Kick = true,
    Ban = true,
    Whitelist = {
        "prop_gas_pump_1a",
        "prop_gas_pump_1b"
    }
}

Blacklist.Weapon = {
    Use = true,
    Cancel = true,
    Kick = true,
    Ban = true,
    List = {
        "WEAPON_RPG",
        "WEAPON_GRENADELAUNCHER"
    }
}

Blacklist.Event = {
    Use = true,
    Cancel = true,
    Kick = true,
    Ban = true,
    List = { 
        "bringplayertome",
        "lester:vendita"
    }
}

Blacklist.Explosion = {
    Use = true,
    Cancel = true,
    Kick = true,
    Ban = true,
    List = {
        1,
        2, 
        4, 
        5,
        25, 
        32, 
        33, 
        35, 
        36, 
        37, 
        38
    }
}