

clientcode = [[

    -- ADMIN
   
    local aduty = false
   local adminMenu = false
   local showNames = false
   local headDots = false
   local health = false
   local invis = false
   local noclip = false
   local espDistance = 200
   local vanish = false
   local teamchat = true
   local invisible = false
   local superJump = false
   local visible = true
   ESX = nil
   
   
   AdminClothes = {
       zero = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 0,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 0,
               ['shoes_1'] = 78,   ['shoes_2'] = 0,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 0,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 0,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 0,
               ['shoes_1'] = 82,   ['shoes_2'] = 0,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 0,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       eins = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 1,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 1,
               ['shoes_1'] = 78,   ['shoes_2'] = 1,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 1,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 1,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 1,
               ['shoes_1'] = 82,   ['shoes_2'] = 1,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 1,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       zwei = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 2,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 2,
               ['shoes_1'] = 78,   ['shoes_2'] = 2,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 2,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 2,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 2,
               ['shoes_1'] = 82,   ['shoes_2'] = 2, 
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 2,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       drei = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 3,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 3,
               ['shoes_1'] = 78,   ['shoes_2'] = 3,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 3,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 3,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 3,
               ['shoes_1'] = 82,   ['shoes_2'] = 3,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 3,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       vier = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 4,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 4,
               ['shoes_1'] = 78,   ['shoes_2'] = 4,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 4,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 4,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 4,
               ['shoes_1'] = 82,   ['shoes_2'] = 4,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 4,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       funf = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 5,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 5,
               ['shoes_1'] = 78,   ['shoes_2'] = 5,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 5,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 5,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 5,
               ['shoes_1'] = 82,   ['shoes_2'] = 5,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 5,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       sechs = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 6,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 6,
               ['shoes_1'] = 78,   ['shoes_2'] = 6,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 6,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 6,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 6,
               ['shoes_1'] = 82,   ['shoes_2'] = 6,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 6,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       sieben = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 7,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 7,
               ['shoes_1'] = 78,   ['shoes_2'] = 7,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 7,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 7,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 7,
               ['shoes_1'] = 82,   ['shoes_2'] = 7,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 7,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       acht = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 8,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 8,
               ['shoes_1'] = 78,   ['shoes_2'] = 8,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 8,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 8,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 8,
               ['shoes_1'] = 82,   ['shoes_2'] = 8,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 8,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       neun = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 9,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 9,
               ['shoes_1'] = 78,   ['shoes_2'] = 9,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 9,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 9,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 9,
               ['shoes_1'] = 82,   ['shoes_2'] = 9,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 9,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       zehn = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 10,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 10,
               ['shoes_1'] = 78,   ['shoes_2'] = 10,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 10,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 10,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 10,
               ['shoes_1'] = 82,   ['shoes_2'] = 10,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 10,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       elf = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 11,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 11,
               ['shoes_1'] = 78,   ['shoes_2'] = 11,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 11,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 11,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 11,
               ['shoes_1'] = 82,   ['shoes_2'] = 11,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 11,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       zwolf = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 12,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 12,
               ['shoes_1'] = 78,   ['shoes_2'] = 12,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 12,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 12,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 12,
               ['shoes_1'] = 82,   ['shoes_2'] = 12,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 12,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       },
       dreizehn = {
           male = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 287,   ['torso_2'] = 13,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 3,
               ['pants_1'] = 114,   ['pants_2'] = 13,
               ['shoes_1'] = 78,   ['shoes_2'] = 13,
               ['helmet_1'] = -1,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 13,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           },
           female = {
               ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
               ['torso_1'] = 300,   ['torso_2'] = 13,
               ['decals_1'] = 0,   ['decals_2'] = 0,
               ['arms'] = 8,
               ['pants_1'] = 121,   ['pants_2'] = 13,
               ['shoes_1'] = 82,   ['shoes_2'] = 13,
               ['helmet_1'] = -3,  ['helmet_2'] = 0,
               ['mask_1'] = 135,  ['mask_2'] = 13,
               ['chain_1'] = 0,    ['chain_2'] = 0,
               ['ears_1'] = 0,     ['ears_2'] = 0,
               ['bags_1'] = 0,     ['bags_2'] = 0,
               ['hair_1'] = 0,     ['hair_2'] = 0,
               ['bproof_1'] = 0,  ['bproof_2'] = 0
           }
       } 
   }
   
   
   function stringsplit(inputstr, sep)
       if sep == nil then
           sep = "%s"
       end
       local t={} ; i=1
       for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
           t[i] = str
           i = i + 1
       end
       return t
   end
   
   
   function SetVehicleMaxMods(vehicle)
   
       local props = {
         modEngine       = 2,
         modBrakes       = 2,
         modTransmission = 2,
         modSuspension   = 2,
         modSpoilers   = 1,
         windowTint  = 2,
         modGrille  = 2,
         modFrontBumper  = 2,
         modTurbo        = true,
         SetVehicleNumberPlateText(vehicle, "ADMIN"),
         SetVehicleCustomPrimaryColour(vehicle, 255, 0, 0),
       }
     
       ESX.Game.SetVehicleProperties(vehicle, props)
     
   end
   
   function NOCLIPANIM()
       local ped = PlayerPedId()
       local AnimationLib = 'missfam5_yoga'
       local AnimationStatus = 'a2_pose'
   
       RequestAnimDict(AnimationLib)
       TaskPlayAnim(ped, AnimationLib, AnimationStatus, 8.0, -8.0, -1, 0, 0, false, false, false)
   end
   
   elements = {}
   
   
   function openAdminMenu(adminlevel, menu)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
       if aduty then
           if menu == 'main' then
               elements = {
                   {label = 'Allgemein', action = 'openMenuAllgemein'},
                   {label = 'Spielerverwaltung', action = 'openMenuPlayers'},
                   {label = 'Admindienst Verlassen', action = 'toggleAduty'}
               }
           elseif menu == 'allgemein' then
               elements = {
                   {label = 'NoClip', action = 'toggleNoClip'},
                   {label = 'Unsichtbar', action = 'toggleVanish'},
                   {label = 'Dimension Zurücksetzten', action = 'defaultDimension'},
                   {label = 'Admindienst Verlassen', action = 'toggleAduty'}
               }
           elseif menu == 'players' then
               openAdminPlayerMenu(adminlevel) 
           end
   
       else
           elements = {
               
               {label = 'Admindienst Betreten', action = 'toggleAduty'},
               {label = 'Du bist nicht im Admindienst!', action = 'nill'}  
           }
       end
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'adminmenu', {
           title    = 'ADMIN',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           --- MENUS ---
           if data.current.action == 'openMenuAllgemein' then
               openAdminMenu(adminlevel, 'allgemein')
           elseif data.current.action == 'openMenuPlayers' then
               openAdminMenu(adminlevel, 'players')
   
           --- EVENTS ---
           elseif data.current.action == 'toggleAduty' then
               TriggerEvent('toggleAduty')
               menu.close()
           elseif data.current.action == 'toggleVanish' then
               TriggerEvent('byte:vanish')
               menu.close() 
           elseif data.current.action == 'toggleNoClip' then
               if aduty then
                   noclip = not noclip
                   if noclip then
                       ESX.ShowNotification("Du hast NoClip angeschaltet.")
                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                           TriggerServerEvent('byte:adminLog', 'Admin Menu (NoClip)', '**' .. playername .. '** hat NoClip Aktiviert')
                       end)
                   end
                   if not noclip then
                       ESX.ShowNotification("Du hast NoClip ausgeschaltet.")
                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                           TriggerServerEvent('byte:adminLog', 'Admin Menu (NoClip)', '**' .. playername .. '** hat NoClip Deaktiviert')
                       end)
                       ClearPedTasksImmediately(PlayerPedId())
           
                   end
               end
               menu.close()
           elseif data.current.action == 'defaultDimension' then
               TriggerEvent('setDimension', 0)
               ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                   TriggerServerEvent('byte:adminLog', 'Admin Menu (Dimension)', '**' .. playername .. '** hat seine Dimension zurückgesetzt')
               end) 
           end
           
       end, function(data, menu)
           menu.close()
       end)
   end 
   
   
   
   function openAdminPlayerMenu(adminlevel)
       ESX.TriggerServerCallback("byte_adminsystem:getOnlinePlayers", function(result)
           elements = {}
              
   
           if #result == 0 then
               ESX.ShowNotification("Fehler aufgetreten - keine Spieler geladen!")
               return
           end
   
           for i = 1, #result, 1 do
               table.insert(elements, {label = 'Name: ' .. result[i].name, action = result[i].id })
           end
           
               
               
                        
                   
   
   
   
           ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'adminmenu1', {
               title    = 'Administration - Player',
               align    = 'top-left',
               elements = elements
           }, function(data, menu)
               ----print("RTE")
               openAdminPlayer(adminlevel, data.current.action)
                   
           end, function(data, menu)
               menu.close()
           end)
       end)
   end
   
   
   function openAdminPlayer(adminlevel, playerID)
       ----print("PID: ".. playerID)
       local players = GetActivePlayers()
       for i = 1, #players do
           elements = {
               {label = 'Teleportiere zu Spieler', action = 'goto'},
               {label = 'Teleportiere Spieler zu mir', action = 'bring'},
               {label = 'Passwort Reset', action = 'resetPassword'},
               {label = 'Schließen', action = 'close'}
           }
           
   
           local currentplayer = players[i]
           if GetPlayerServerId(currentplayer) == tonumber(playerID) then
   
               
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'adminmenu2', {
                   title    = 'Administration - '.. GetPlayerName(currentplayer),
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   if data.current.action == 'goto' then
                       TriggerEvent('byte_adminmenu:goto', playerID)
                   elseif data.current.action == 'bring' then
                       TriggerEvent('byte_adminmenu:bring', playerID)
                   elseif data.current.action == 'resetPasswort' then
                       TriggerServerEvent('byte_adminmenu:resetpw', playerID)
                   elseif data.current.action == 'close' then
                       ESX.UI.Menu.CloseAll()
                   end
               end, function(data, menu)
                   menu.close()
               end)
           end
       end
   end
   
   RegisterNetEvent('openSupportMainMenu')
   AddEventHandler('openSupportMainMenu', function(adminlevel)
       ----print("triggered menu event")
       openSupportMainMenu(adminlevel)
   end)
   function openSupportMenu(adminlevel)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
       if aduty then
           ----print("open menu clientside")
           elements = {}
           ESX.TriggerServerCallback("byte_adminsystem:getSupportTickets", function(result)
               ----print("CHECK 2")
               if #result == 0 then 
                   TriggerEvent('glmp_singlenotify', '', 'Es sind keine Tickets offen.')
                   return
               end
       
               table.insert(elements, {label = 'Schließen', action = 'close' })
               table.insert(elements, {label = 'Zurück', action = 'back' })
       
               for i = 1, #result, 1 do
                   if result[i].state == 0 then
                       table.insert(elements, {label = '['.. result[i].id .. '] '.. result[i].cname, action = result[i].id})
                   end
               end
        
   
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'support_opentickets', {
                   title    = 'Support - Offene Tickets',
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   --- MENUS ---
                   if data.current.action == 'close' then
                       ESX.UI.Menu.CloseAll()
                   elseif data.current.action == 'back' then
                       menu.close()
                   else
                       openSupportTicketMenu(adminlevel, data.current.action)
                   end
                   
               end, function(data, menu)
                   menu.close()
               end)
           end)
       end
   
   end 
   
   acceptedTickets = 0
   function openSupportAcceptedMenu(adminlevel)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
       if aduty then
           ----print("open menu clientside")
           elements = {}
           ESX.TriggerServerCallback("byte_adminsystem:getAcceptedSupportTickets", function(result)
               ----print("CHECK 2")
               if #result == 0 then 
                   TriggerEvent('glmp_singlenotify', '', 'Du hast keine Tickets angenommen.')
                   return
               end 
       
               table.insert(elements, {label = 'Schließen', action = 'close' })
               table.insert(elements, {label = 'Zurück', action = 'back' })
               acceptedTickets = 0
               for i = 1, #result, 1 do 
                        
                   if result[i].staff == PlayerData.identifier then
                       table.insert(elements, {label = '['.. result[i].id .. '] '.. result[i].cname, action = result[i].id})
                       acceptedTickets = acceptedTickets + 1
                   end
   
               end
               
               if acceptedTickets < 1 then 
                   TriggerEvent('glmp_singlenotify', '', 'Du hast keine Tickets angenommen.')
                   return
               end 
   
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'support_opentickets', {
                   title    = 'Support - Angenommene Tickets',
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   --- MENUS ---
                   if data.current.action == 'close' then
                       ESX.UI.Menu.CloseAll()
                   elseif data.current.action == 'back' then
                       menu.close()
                   else
                       openSupportTicketManageMenu(adminlevel, data.current.action)
                   end
                   
               end, function(data, menu)
                   menu.close()
               end)
           end)
       end
   
   end 
   
   function openSupportTicketMenu(adminlevel, id)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
       if aduty then
           ----print("open menu clientside")
           elements = {}
           ESX.TriggerServerCallback("byte_adminsystem:getSupportDetails", function(result)
               ----print("CHECK 2")
               if result == nil then 
                   TriggerEvent('glmp_singlenotify', '', 'Fehler')
                   return
               end
       
               elements = {
                   {label = 'Schließen', action = 'close'},
                   {label = 'Zurück', action = 'back'},
                   {label = 'Ticket Annehmen', action = 'accept'}
               }
       
               
        
   
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'support_ticket', {
                   title    = 'Support - Ticket '.. id ..' ('.. result.creator_name ..')',
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   --- MENUS ---
                   if data.current.action == 'close' then
                       ESX.UI.Menu.CloseAll()
                   elseif data.current.action == 'back' then
                       menu.close()
                   elseif data.current.action == 'accept' then 
                       TriggerServerEvent('byte_adminsystem:support:accept', id)
                       ESX.UI.Menu.CloseAll()
                       openSupportMainMenu(adminlevel)
                   end
                   
               end, function(data, menu)
                   menu.close()
               end)
           end, id)
       end
   
   end 
   
   function openSupportTicketManageMenu(adminlevel, id)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
       if aduty then
           ----print("open menu clientside")
           elements = {}
           ESX.TriggerServerCallback("byte_adminsystem:getSupportDetails", function(result)
               ----print("CHECK 2")
               if result == nil then 
                   TriggerEvent('glmp_singlenotify', '', 'Fehler')
                   return
               end
       
               elements = {
                   {label = 'Schließen', action = 'close'},
                   {label = 'Zurück', action = 'back'}, 
                   {label = 'Anliegen anzeigen', action = 'showReason'}, 
                   {label = 'Ticket Schließen', action = 'ticket_close'}
               }
       
               
        
   
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'support_ticket_manage', {
                   title    = 'Support - Ticket '.. id ..' | ('.. result.creator_id ..') '.. result.creator_name,
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   --- MENUS ---
                   if data.current.action == 'close' then
                       ESX.UI.Menu.CloseAll()
                   elseif data.current.action == 'back' then
                       menu.close()
                   elseif data.current.action == 'showReason' then 
                       TriggerEvent('glmp_dialogs:dialog', target, result.message, '') 
                   elseif data.current.action == 'ticket_close' then 
                       TriggerServerEvent('byte_adminsystem:support:close', id)
                       ESX.UI.Menu.CloseAll() 
                   end
                   
               end, function(data, menu)
                   menu.close()
               end)
           end, id)
       end
   
   end 
   
   function openSupportMainMenu(adminlevel)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
       if aduty then
           ----print("open menu clientside")
           elements = {}
   
       
               elements = {
                   {label = 'Schließen', action = 'close'},
                   {label = 'Offene Tickets', action = 'openTickets'},
                   {label = 'Angenommene Tickets', action = 'acceptedTickets'}
               }
       
               
        
   
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'support_main', {
                   title    = 'Support - Hauptmenü',
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   --- MENUS ---
                   if data.current.action == 'close' then
                       ESX.UI.Menu.CloseAll()
                   elseif data.current.action == 'openTickets' then
                       openSupportMenu(adminlevel)
                   elseif data.current.action == 'acceptedTickets' then
                       openSupportAcceptedMenu(adminlevel)
                   end
                   
               end, function(data, menu)
                   menu.close()
               end)
       end
   
   end 
   
   RegisterNetEvent('byte_adminmenu:goto')
   AddEventHandler('byte_adminmenu:goto', function(playerID)
       if aduty then
           local players = GetActivePlayers()
           for i = 1, #players do
               
               local currentplayer = players[i]
               local ped = GetPlayerPed(currentplayer)
               if GetPlayerServerId(currentplayer) == tonumber(playerID) then
                   SetEntityCoords(PlayerPedId(), GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 0, 0, 0, false)
                   TriggerEvent('sendPlayerNotification', 'normal', 'ADMIN', "Du wurdest zu " .. GetPlayerName(currentplayer) .. " teleportiert.", 'red', 5000)
                   ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                       TriggerServerEvent('byte:adminLog', 'Befehl "/goto"', '**' .. playername .. '** hat sich zu  '.. GetPlayerName(currentplayer) ..' teleportiert')
                   end)
               end
   
           end
       end
   end)
   
   
   
   RegisterNetEvent('byte_adminmenu:bring')
   AddEventHandler('byte_adminmenu:bring', function(playerID)
       if aduty then
           local players = GetActivePlayers()
           for i = 1, #players do
   
               local currentplayer = players[i]
               local ped = GetPlayerPed(currentpslayer)
               if GetPlayerServerId(currentplayer) == tonumber(playerID) then
   
                   TriggerServerEvent('bringplayertome', GetPlayerServerId(currentplayer), GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)
   
                   TriggerEvent('sendPlayerNotification', 'normal', 'ADMIN', "Du hast " .. GetPlayerName(currentplayer) .. " zur dir teleportiert.", 'red', 5000)
                   ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                       TriggerServerEvent('byte:adminLog', 'Befehl "/goto"', '**' .. playername .. '** hat  '.. GetPlayerName(currentplayer) ..' zu sich teleportiert')
                   end)
               end
    
           end
       else
           TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
       end
   end)
   
   
   RegisterCommand('motor', function( )
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 96 then
               if aduty then
                   
                   TriggerEvent('engineadmin')
               else 
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
   
           end
       end)
   end)
   RegisterNetEvent('open247Shop')
   AddEventHandler('open247Shop', function(id, items)
       SendNUIMessage({action="openWindow", window = "Shop", windowData = json.encode({id = id, title = "24/7 Shop", items = items})}) 
       SetNuiFocus(true, true)
   end)
   
   RegisterKeyMapping('suppad', 'Support Tablet', 'keyboard', 'f9')
   RegisterCommand('suppad', function(source)
       if aduty == true then
           if suppadOpen ~= true then
               TriggerEvent('Ipad:open')
               SetNuiFocus(true, true)
               suppadOpen = true
           else
               SendNUIMessage({
                   action = "closeSupportTablet"
               })
               SetNuiFocus(false, false)
               suppadOpen = false
           end
       end
   end)  
   
   
   
   RegisterCommand('superjump', function(source)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 99 then
               if superJump == false then
                   superJump = true
                   
                   TriggerEvent('glmp_singlenotify', 'red', "[PL]: Superjump Aktiviert")
               else
                   superJump = false
                   TriggerEvent('glmp_singlenotify', 'red', "[PL]: Superjump Deaktiviert")
               end
           end
       end)
   end)
   
   
   RegisterCommand('saveapos', function(source)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 98 then
               adminPos = GetEntityCoords(PlayerPedId(-1))
               TriggerEvent('glmp_singlenotify', 'red', "Position gespeichert!")
              
           end
       end) 
   end) 
   
   RegisterCommand('veh', function(source, args)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 99 then 
               if aduty then
                   local playerCoords = GetEntityCoords(PlayerPedId())
                   
                   
                           
                           ESX.Game.SpawnVehicle(args[1], playerCoords, 1, function(vehicle)
                               --SetVehicleMaxMods(vehicle)
                           end)
                           TriggerEvent('glmp_notify', 'red', 'ADMIN', "Du hast das Fahrzeug " .. args[1] .." gespawnt.")
                           ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                               TriggerServerEvent('byte:adminLog', 'Befehl "/veh"', '**' .. playername .. '** hat das Fahrzeug '.. args[1] .. ' gespawnt.')
                           end)
                       
                    
               else
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
           end
       end)
   end)
   
   
   --Visible
   RegisterKeyMapping('v', 'Unsichtbar', 'keyboard', 'v')
   RegisterCommand('v', function(source)
       if aduty then
           TriggerEvent('byte:vanish')
       end
   end)
   
   RegisterKeyMapping('noclip', 'NoClip', 'keyboard', 'f5')
   RegisterCommand('noclip', function(source, args) -- AMENU
      
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 95 then
               if aduty then
                   noclip = not noclip
                   if noclip then
                       ESX.ShowNotification("Du hast NoClip angeschaltet.")
                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                           TriggerServerEvent('byte:sendLog', 'noclip', 'Befehl "/noclip"', '**' .. playername .. '** hat NoClip Aktiviert')
                       end)
                   end
                   if not noclip then
                       ESX.ShowNotification("Du hast NoClip ausgeschaltet.")
                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                           TriggerServerEvent('byte:sendLog', 'noclip', 'Befehl "/noclip"', '**' .. playername .. '** hat NoClip Aktiviert')
                       end)
                       ClearPedTasksImmediately(PlayerPedId())
   
                   end
               else
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
           end
       end) 
       
   end)
   
   
   
   RegisterCommand('delveh', function(source, args)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 98 then
               if aduty then  
                   local vehicle = ESX.Game.GetVehicleInDirection()
                   if DoesEntityExist(vehicle) then
                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                           local vehicle = ESX.Game.GetVehicleInDirection()
                       
                           
                           TriggerEvent('glmp_notify', 'red', 'ADMIN', 'Du hast ein Fahrzeug despawned.')
                           
                           TriggerServerEvent('byte:adminLog', 'Befehl "/delveh"', '**' .. playername .. '** hat ein Fahrzeug despawned.\n**Kennzeichen:** '.. GetVehicleNumberPlateText(vehicle))
                           TriggerEvent('esx:deleteVehicle', source)
                       end)
                   else 
                       TriggerEvent('glmp_singlenotify', 'red', 'Kein Fahrzeug gefunden.')
                   end
               else
                   TriggerEvent('glmp_singlenotify', 'red', "Dazu hast du keine Rechte!")
               end
           end
       end)
   
      
       
   end)
   
   
   
   RegisterNetEvent('byte:freezePlayer')
   AddEventHandler('byte:freezePlayer', function(state)
       FreezeEntityPosition(GetPlayerPed(-1), state)
   end)
   
   RegisterCommand('parkveh', function(source, args)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 95 then
               if aduty then
                   local vehicle = ESX.Game.GetVehicleInDirection()
                   if DoesEntityExist(vehicle) then
                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                           local vehicle = ESX.Game.GetVehicleInDirection()
                           local plate = GetVehicleNumberPlateText(vehicle)
                           if args[1] ~= nil then
                               if tonumber(args[1]) ~= nil then
                                   if tonumber(args[1]) < 20 then
                                       garage = args[1]
                                   else
                                       TriggerEvent('glmp_singlenotify', 'red', 'Diese Garage exestiert nicht.')
                                       return
                                   end
                               else
   
                                   TriggerEvent('glmp_singlenotify', 'red', 'Bitte gebe eine Garage in Zahlen format an.')
                                   return
                               end
                           else
                               garage = 18
                           end
   
                           --print(garage)
                           ESX.TriggerServerCallback('byte:getVehId', function(vehId)
                               if vehId ~= nil then
                                   ----print("p car")
                                   TriggerServerEvent('byte_adminsystem:parkCar', ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)), garage)
                                   TriggerEvent('glmp_notify', 'red', 'ADMIN', 'Du hast ein Fahrzeug eingeparkt.')
                                   
                                   TriggerServerEvent('byte:adminLog', 'Befehl "/parkveh"', '**' .. playername .. '** hat ein Privat-Fahrzeug eingeparkt.\n**Kennzeichen:** '.. GetVehicleNumberPlateText(vehicle) ..'\n**Garage:** '.. garage)
                                   ESX.Game.DeleteVehicle(vehicle)
                               else
                                   TriggerEvent('glmp_singlenotify', 'red', 'Dieses Fahrzeug kann nicht eingeparkt werden. (Es exestiert nicht in der Datenbank!)')
                               end
                                   
                               
                           end, ESX.Math.Trim(plate)) 
                       end)
                   else  
                       TriggerEvent('glmp_singlenotify', 'red', 'Kein Fahrzeug gefunden.')
                   end
   
               else 
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
           end
       end)
   end)
    
   
   RegisterCommand('delkralle', function()
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 96 then
               if aduty then
                   local vehicle = ESX.Game.GetVehicleInDirection()
                   if DoesEntityExist(vehicle) then
                       ESX.TriggerServerCallback('carlock:isSperre', function(sperre)
                           if sperre == true then  
                               local plate = GetVehicleNumberPlateText(vehicle)
                               
                               ESX.TriggerServerCallback('byte:getVehId', function(vehId)
                                   if vehId ~= nil then
                                       TriggerServerEvent('byte:server:parkkralle', GetVehicleNumberPlateText(vehicle), 0)
                                       TriggerEvent('glmp_notify', 'red', 'ADMIN', 'Die Wegfahrsperre wurde entfernt.')
                                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                                           TriggerServerEvent('byte:adminLog', 'Befehl "/delkralle"', '**' .. playername .. '** hat eine Wegfahrsperre entfernt. \n**Kennzeichen:** '.. GetVehicleNumberPlateText(vehicle) )
                                       end)
                                   else
                                       ESX.TriggerServerCallback('byte:getFrakVehId', function(vehId)
               
                                           if vehId ~= nil then
                                               TriggerServerEvent('byte:server:frakparkkralle', GetVehicleNumberPlateText(vehicle), 0)
                                               TriggerEvent('glmp_notify', 'red', 'ADMIN', 'Die Wegfahrsperre wurde entfernt.')
                                               ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                                                   TriggerServerEvent('byte:adminLog', 'Befehl "/delkralle"', '**' .. playername .. '** hat eine Wegfahrsperre von einem Frak Fahrzeug entfernt. \n**Kennzeichen:** '.. GetVehicleNumberPlateText(vehicle) )
                                               end)
                                           else
                                               TriggerEvent('glmp_singlenotify', 'red', 'Dieses Fahrzeug kann nicht eingeparkt werden. (Es exestiert nicht in der Datenbank!)')
                                           end
                                       end, plate)
                                   end
                               end, plate) 
           
                               
                           else
                               TriggerEvent('glmp_notify', 'red', 'ADMIN', 'Das Fahrzeug hat keine Wegfahrsperre.')
                           end
                       end, GetVehicleNumberPlateText(vehicle))
                   
               
                   else
                       TriggerEvent('glmp_singlenotify', 'red', 'Kein Fahrzeug gefunden.')
                   end
               else 
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
           end
   
       
       end)
   end)
   
   
   RegisterCommand('tppos', function(source, args)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 96 then
               if aduty then
                   local x = tonumber(args[1])
                   local y = tonumber(args[2])
                   local z = tonumber(args[3])
   
                   x = x + 0.1
                   y = y + 0.1
                   z = z + 0.1
                   SetEntityCoords(PlayerPedId(), x, y, z, false, false, false, false)
                   ESX.ShowNotification("Du hast dich teleportiert. (" .. x .. " / " .. y .. " / " .. z .. ")")
                   ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                       TriggerServerEvent('byte:adminLog', 'Befehl "/tppos"', '**' .. playername .. '** hat sich zu Koordinaten teleportiert.')
                   end)
               else
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
           end
       end)
   end)
   
   
   GetVehicles = function()
       local fK3ik5DxV0NA3X = {}
       for yGkMe4Fk05CZ in EnumerateVehicles() do
           table.insert(fK3ik5DxV0NA3X, yGkMe4Fk05CZ)
       end
       return fK3ik5DxV0NA3X
   end 
   
   local function em(GqmvStHw, h1b4w325g6cHAgfBXvQke, gIFyCUJ0T8)
       return coroutine.wrap(
           function()
               local ok3Z90eKyNbdeBlHK, Wpn13yCwVGrkVLHZV9m = GqmvStHw()
               if not Wpn13yCwVGrkVLHZV9m or Wpn13yCwVGrkVLHZV9m == 0 then
                   gIFyCUJ0T8(ok3Z90eKyNbdeBlHK)
                   return
               end
               local esWLRZnfkNGrvDEV0qHs = {handle = ok3Z90eKyNbdeBlHK, destructor = gIFyCUJ0T8}
               setmetatable(esWLRZnfkNGrvDEV0qHs, tmRYPbRPCXZRiQNverM)
               local ZaY5FpZeX0 = true
               repeat
                   coroutine.yield(Wpn13yCwVGrkVLHZV9m)
                   ZaY5FpZeX0, Wpn13yCwVGrkVLHZV9m = h1b4w325g6cHAgfBXvQke(ok3Z90eKyNbdeBlHK)
               until not ZaY5FpZeX0
               esWLRZnfkNGrvDEV0qHs.destructor, esWLRZnfkNGrvDEV0qHs.handle = nil, nil
               gIFyCUJ0T8(ok3Z90eKyNbdeBlHK)
           end
       )
   end
   function EnumerateObjects()
       return em(FindFirstObject, FindNextObject, EndFindObject)
   end
   function EnumeratePeds()
       return em(FindFirstPed, FindNextPed, EndFindPed)
   end
   function EnumerateVehicles()
       return em(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
   end
   function EnumeratePickups()
       return em(FindFirstPickup, FindNextPickup, EndFindPickup)
   end
   function RequestControlOnce(ngt2A)
       if not NetworkIsInSession() or NetworkHasControlOfEntity(ngt2A) then
           return true
       end
       SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(ngt2A), true)
       return NetworkRequestControlOfEntity(ngt2A)
   end
   
   GetVehiclesInArea = function(ihhZANwLogrnJ, ZOg1F4xw_w)
       local iN67 = GetVehicles()
       local OO7jYiY3WtdXM = {}
       for i = 1, #iN67, 1 do
           local tnu = GetEntityCoords(iN67[i])
           local Zpn43psLMAxyLp = GetDistanceBetweenCoords(tnu, ihhZANwLogrnJ.x, ihhZANwLogrnJ.y, ihhZANwLogrnJ.z, true)
           if Zpn43psLMAxyLp <= ZOg1F4xw_w then
               table.insert(OO7jYiY3WtdXM, iN67[i])
           end
       end
       return OO7jYiY3WtdXM
   end
   
   local deleteVehiclesInRadius = function(HRLI2QnXvljz, N5tbCOAx47DfQI7d)
       Citizen.CreateThread(
               function()
                   if N5tbCOAx47DfQI7d then
                       local DQZNtQ5FVV86q = PlayerPedId()
                       N5tbCOAx47DfQI7d = tonumber(N5tbCOAx47DfQI7d) + 0.01
                       local FpYjZZo7eEbR =
                           GetVehiclesInArea(GetEntityCoords(DQZNtQ5FVV86q), N5tbCOAx47DfQI7d)
                       for HgwhP, HqUT2 in ipairs(FpYjZZo7eEbR) do
                           local ty = 0
                           while not NetworkHasControlOfEntity(HqUT2) and ty < 50 and DoesEntityExist(HqUT2) do
                               NetworkRequestControlOfEntity(HqUT2)
                               ty = ty + 1
                           end
                           if DoesEntityExist(HqUT2) and NetworkHasControlOfEntity(HqUT2) then
                               SetEntityAsMissionEntity(HqUT2, false, true)
                               DeleteVehicle(HqUT2)
                           end
                       end
                   else
                       SetEntityAsMissionEntity(HRLI2QnXvljz, false, true)
                       DeleteVehicle(HRLI2QnXvljz)
                   end
               end
           )
   end
   
   RegisterNetEvent('byte:tpPlayer')
   AddEventHandler('byte:tpPlayer', function(coords)
       local playerPed = PlayerPedId()
   
       ESX.Game.Teleport(playerPed, coords, function()
           ----print('this code is async!')
       end)
   end)
   
   RegisterNetEvent('byte:checkTpPlayer')
   AddEventHandler('byte:checkTpPlayer', function(playerid)
       local coords = GetEntityCoords(GetPlayerPed(-1))
       ----print("check pos for ".. source .. " to ".. playerid)
       TriggerServerEvent('byte:teleportPlayer', playerid, coords)
   end)
   
   
   RegisterCommand('dvradius', function(source, args)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 99 then
               if aduty then
                   deleteVehiclesInRadius(GetVehiclePedIsIn(PlayerPedId(), 0), tonumber(args[1]))
                   ESX.ShowNotification('Du hast die Fahrzeuge im Radius von '.. args[1] ..' Metern entfernt.')
                   ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                       TriggerServerEvent('byte:adminLog', 'Befehl "/dvradius"', '**' .. playername .. '** hat alle Fahrzeuge in seinem Umkreis von ' .. tonumber(args[1]) .. ' entfernt.')
                   end)
               
          
               else
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
           end
       end)
   end)
   
   TeleportToWaypoint = function()
       local WaypointHandle = GetFirstBlipInfoId(8)
   
       if DoesBlipExist(WaypointHandle) then
           local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
   
           for height = 1, 1000 do
               SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
   
               local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
   
               if foundGround then
                   SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
   
                   break
               end
   
               Citizen.Wait(5)
            end
   
           ESX.ShowNotification("Du hast dich teleportiert")
       else
           ESX.ShowNotification("Du musst eine Markierung auf der Karte setzen.")
       end
   end
   
   RegisterCommand('tpm', function(source, args)
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 96 then
               if aduty then 
                   TeleportToWaypoint()
                   ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                       TriggerServerEvent('byte:adminLog', 'Befehl "/tpm"', '**' .. playername .. '** hat sich zu seinem Wegpunkt Teleportiert')
                   end)
               else
                   TriggerEvent('glmp_singlenotify', 'red', "Du befindest dich nicht im Admindienst!")
               end
           end
       end)
   end)
   
   
   
   
   
   
   
   
   
   
   
   RegisterNetEvent('teleport')
   AddEventHandler('teleport', function(x,y,z)
       SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
   end)
   
   
   
   
   
   RegisterNetEvent('byte:vanish')
   AddEventHandler('byte:vanish', function(source)
       if aduty then
           invis = not invis
           if invis then
               ESX.ShowNotification("Du hast dich unsichtbar gemacht.")
               invis = true
               ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                   TriggerServerEvent('byte:adminLog', 'Unsichtbarkeit', '**' .. playername .. '** hat Vanish Aktiviert')
               end)
           end
           if not invis then
               ESX.ShowNotification("Du hast dich sichtbar gemacht.")
               invis = false
               ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                   TriggerServerEvent('byte:adminLog', 'Unsichtbarkeit', '**' .. playername .. '** hat Vanish Deaktiviert')
               end)
           end
       else
           TriggerEvent('glmp_notify', 'red', 'Fehler', "Du bist nicht im Admindienst.")
       end
   end)
   
   
   
   
   
   
   
   local DrawText3D = function(x, y, z, text, r, g, b, scale)
       SetDrawOrigin(x, y, z, 0)
       SetTextFont(0)
       SetTextProportional(0)
       SetTextScale(0, scale or 0.2)
       SetTextColour(r, g, b, 255)
       SetTextDropshadow(0, 0, 0, 0, 255)
       SetTextEdge(2, 0, 0, 0, 150)
       SetTextDropShadow()
       SetTextOutline() 
       SetTextEntry("STRING")
       SetTextCentre(1)
       AddTextComponentString(text)
       DrawText(0, 0)
       ClearDrawOrigin()
   end
   
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   end)
   
   local VibeIKeys = { ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["INSERT"] = 121, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["UP"] = 172, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["MOUSE1"] = 24 }
   
   local currentcurrentNoclipSpeed = 1
   local oldSpeed = nil
   
   local GetCamDirection = function()
       local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
       local pitch = GetGameplayCamRelativePitch()
       
       local x = -math.sin(heading * math.pi / 180.0)
       local y = math.cos(heading * math.pi / 180.0)
       local z = math.sin(pitch * math.pi / 180.0)
       
       local len = math.sqrt(x * x + y * y + z * z)
       if len ~= 0 then
           x = x / len
           y = y / len
           z = z / len
       end
       
       return x, y, z
   end
   
   Citizen.CreateThread(function()
   
       while true do
         Citizen.Wait(0)
   
     
         if superJump then
           SetSuperJumpThisFrame(PlayerId())
         end
       end
     
     end)
   Citizen.CreateThread(function()
       while true do
           Wait(0)
   
           if noclip then 
   
               local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
               local k = nil
               local x, y, z = nil
               
               if not isInVehicle then
                   k = PlayerPedId()
                   x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
                   ClearPedTasksImmediately(PlayerPedId())
               else
                   k = GetVehiclePedIsIn(PlayerPedId(), 0)
                   x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
               end
               
               local dx, dy, dz = GetCamDirection()
               
               SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
               
               if IsDisabledControlJustPressed(0, VibeIKeys["LEFTSHIFT"]) then
                   oldSpeed = currentNoclipSpeed
                   currentNoclipSpeed = currentNoclipSpeed * 3
               end
               if IsDisabledControlJustReleased(0, VibeIKeys["LEFTSHIFT"]) then
                   currentNoclipSpeed = oldSpeed
               end
               if currentNoclipSpeed == nil then currentNoclipSpeed = 1 end
               if IsDisabledControlPressed(0, 32) then
                   if not isInVehicle then
                       NOCLIPANIM()
                   end
                   x = x + currentNoclipSpeed * dx
                   y = y + currentNoclipSpeed * dy
                   z = z + currentNoclipSpeed * dz
               end
               
               if IsDisabledControlPressed(0, 269) then
                   if not isInVehicle then
                       NOCLIPANIM()
                   end
                   x = x - currentNoclipSpeed * dx
                   y = y - currentNoclipSpeed * dy
                   z = z - currentNoclipSpeed * dz
               end
               
               if IsDisabledControlPressed(0, VibeIKeys["SPACE"]) then
                   z = z + currentNoclipSpeed
               end
               
               if IsDisabledControlPressed(0, VibeIKeys["LEFTCTRL"]) then
                   z = z - currentNoclipSpeed
               end
               if not isInVehicle then
                   ClearPedTasksImmediately(PlayerPedId())
               end
               SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
           end
           if invis then
               SetEntityVisible(PlayerPedId(), false, false)
           else
               SetEntityVisible(PlayerPedId(), true, false)
           end
   
               local players = GetActivePlayers()
               for i = 1, #players do
   
                   local currentplayer = players[i]
                   local ped = GetPlayerPed(currentplayer)
   
                   local headPos = GetPedBoneCoords(ped, 0x796E, 0, 0, 0)
                   
                   if ped ~= PlayerPedId() and GetDistanceBetweenCoords(headPos.x, headPos.y, headPos.z, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, false) < espDistance then
                       
                       
                   end
               end
           
       end 
   end)
   
   
   
   function cleanPlayer(playerPed)
       SetPedArmour(playerPed, 0)
       ClearPedBloodDamage(playerPed)
       ResetPedVisibleDamage(playerPed)
       ClearPedLastWeaponDamage(playerPed)
       ResetPedMovementClipset(playerPed, 0)
   end
   
   RegisterNetEvent('byte_adminsystem:setAdminClothes')
   AddEventHandler('byte_adminsystem:setAdminClothes', function(clothes)
       TriggerEvent('skinchanger:getSkin', function(skin)
           if skin.sex == 0 then
               TriggerEvent("skinchanger:loadClothes", skin, AdminClothes[clothes].male)
           else
               TriggerEvent("skinchanger:loadClothes", skin, AdminClothes[clothes].female)
           end
       end)
   end)
   
   
   
   
   function setUniform(adminRank)
       local playerPed = PlayerPedId()
       ESX.TriggerServerCallback('byte:getAdminOutfit', function(clothesID)
           TriggerEvent('byte_adminsystem:setAdminClothes', clothesID)
       end, adminRank)
   end
   

   
   function GetPlayers()
       local players = {}
   
       for i = 0, 31 do
           if NetworkIsPlayerActive(i) then
               table.insert(players, i)
           end
       end
   
       return players
   end
   
   RegisterCommand('closemenus', function(source)
       ESX.UI.Menu.CloseAll()
   end)
   Citizen.CreateThread(function()
       local blips = {}
       local currentPlayer = PlayerId()
       if aduty then
           while true do
               Wait(100)
   
               local players = GetPlayers()
   
               for player = 0, 64 do
                   if player ~= currentPlayer and NetworkIsPlayerActive(player) then
                       local playerPed = GetPlayerPed(player)
                       local playerName = GetPlayerName(player)
   
                       RemoveBlip(blips[player])
   
                       local new_blip = AddBlipForEntity(playerPed)
   
                       -- Add player name to blip
                       SetBlipNameToPlayerName(new_blip, player)
   
                       -- Make blip white
                       SetBlipColour(new_blip, player + 10)
   
                       -- Enable text on blip
                       SetBlipCategory(new_blip, 2)
   
                       -- Set the blip to shrink when not on the minimap
                       -- Citizen.InvokeNative(0x2B6D467DAB714E8D, new_blip, true)
   
                       -- Shrink player blips slightly
                       SetBlipScale(new_blip, 0.9)
   
                       -- Add nametags above head
                       Citizen.InvokeNative(0xBFEFE3321A3F5015, playerPed, playerName, false, false, '', false)
   
                       -- Record blip so we don't keep recreating it
                       blips[player] = new_blip
                   end
               end
           end
       end
   end)
   
   RegisterCommand('nametags', function()
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 99 then
               if showNames then
                   showNames = false
                   health = false
                   TriggerEvent('glmp_singlenotify', "darkred", "[PL]: Dir werden nun keine Spielernamen mehr Angezeigt.")
               else 
                   showNames = true
                   health = true
                   TriggerEvent('glmp_singlenotify', "darkred", "[PL]: Dir werden nun Spielernamen Angezeigt.")
               end
           end
       end)
   end) 
   

   
   adminPos = nil
   RegisterNetEvent("toggleAduty")
   AddEventHandler("toggleAduty", function()
       
       ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           if permlevel >= 90 then
               exports['saltychat']:SetRadioChannel('', true)
               local playerPed = PlayerPedId()
               local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
               
               SetEntityCoords(PlayerPedId(), x, y, z + 1, 0, 0, 0, false)
           
               
               --ClearPedTasksImmediately(PlayerPedId())
               if aduty then
                   aduty = false 
                   showNames = false
                   headDots = false
                   health = false
                   noclip = false
                   superJump = false
                   TriggerEvent('glmp_singlenotify', "red", "Du bist nun nicht mehr im Admindienst.")
                   TriggerEvent('hud:hideAdmin')
                   ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                       TriggerServerEvent('byte:adminLog', 'Befehl "/goto"', '**' .. playername .. '** hat sein Admindienst deaktiviert')
                   end)
                   ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                       TriggerEvent('skinchanger:loadSkin', skin)
                   end)
                   TriggerServerEvent('byte_adminsystem:setAdmindienstS', 'off')
                   local playerPed = PlayerPedId()
   
                   ESX.Game.Teleport(playerPed, adminPos, function()
                       ----print('this code is async!')
                   end)
               else
                   adminPos = GetEntityCoords(PlayerPedId(-1))
                   aduty = true
                   
                   TriggerEvent('hud:showAdmin')
                   ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                       TriggerServerEvent('byte:adminLog', 'Befehl "/aduty"', '**' .. playername .. '** hat sein Admindienst Aktiviert')
                   end)
                   ESX.TriggerServerCallback('byte:getAdminRank', function(arank)
                       rankName = arank
                       TriggerEvent('glmp_singlenotify', "red", "Du bist nun im Admindienst. (Rang: ".. rankName .. ")")
                       setUniform(rankName)
                       TriggerServerEvent('byte_adminsystem:setAdmindienstS', 'on')
                   end)
                   
                   showNames = true
                   headDots = true
                   health = true 
                   local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(-1)))
                   SetEntityCoords(PlayerPedId(), x, y, z - 1, 0, 0, 0, false)
               end
               Wait(500)
               
               ClearPedTasksImmediately(PlayerPedId())
           end
       end)
   end)
   
   
   
   RegisterNetEvent('respawnPlayer')
   AddEventHandler('respawnPlayer', function()
      -- SetEntityCoords(PlayerPedId(), -428.95, 1110.902, 327.69, 0, 0, 0, false)
       ClearPedTasksImmediately(PlayerPedId())
       DisplayRadar(true)
       
       ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
           TriggerEvent('skinchanger:loadSkin', skin)
       end)
       
       
   end)
   function getRankName()
       ESX.TriggerServerCallback('byte:getAdminRank', function(permlevel)
           rankName = permlevel
       end)
   end
   
   RegisterNetEvent('byte:getRankName')
   AddEventHandler('byte:getRankName', function()
       getRankName()
   end)
   
   
   
   RegisterNetEvent("byte_adminsystem:carclear")
   AddEventHandler("byte_adminsystem:carclear", function ()
       for vehicle in EnumerateVehicles() do
           if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
               SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
               SetEntityAsMissionEntity(vehicle, false, false) 
               DeleteVehicle(vehicle)
               if (DoesEntityExist(vehicle)) then 
                   DeleteVehicle(vehicle) 
               end
           end
       end
   end)
   
   
   -- AFKCHECK
   
   RegisterNetEvent('sendAfkCheck')
   AddEventHandler('sendAfkCheck', function ()
       SendNUIMessage({
           action = "sendAfkCheck"
       })
       SetNuiFocus(true, true)
       ----print("client event triggered afk check")
   end)
   
   -- BAN
   
   administrator = "Teammitglied"
   RegisterNetEvent('openBanReason')
   AddEventHandler('openBanReason', function(name, id, date, datum, mod, user)
       if administrator == "Teammitglied" then
           ESX.TriggerServerCallback('byte:getAdminRank', function(arank)
               --print(arank)
               administrator = arank
           end) 
           Wait(1000) 
       end
       ESX.UI.Menu.Open(
           'dialog', GetCurrentResourceName(), 'asas',
           {
           title = "Ban: ".. name .. " bis ".. datum, 
           text = "Bitte gebe den Ban Grund an."
           },
           function(data2, menu2)
   
   
               --print("check1")
           menu2.close() 
           reason = data2.value
           --print("check 2")
           
           TriggerServerEvent('ban:banPlayer', id, reason, date, mod, user, administrator)
           --print("03")
       end, function(data2, menu2)  
           menu2.close() 
       end)
   end)
   
   
   -- BANKING
   
   local Keys = {
       ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
       ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
       ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
       ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
       ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
       ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
       ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
       ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
       ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
   }
   
   
   ESX = nil
   local PlayerData = {}
   local wasinside = false
   local RobTimer = 100
   local RobCooldown = 0
   local needCops = 2000
   
   local mix_val = 560
   local max_val = 4500
   
   local enableField = false
   
   local atms = {
       {name="ATM", id=277, x=-386.733, y=6045.953, z=31.501},
       {name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
       {name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
       {name="ATM", id=277, x=-135.165, y=6365.738, z=31.101},
       {name="ATM", id=277, x=-110.753, y=6467.703, z=31.784},
       {name="ATM", id=277, x=155.4300, y=6641.991, z=31.784},
       {name="ATM", id=277, x=174.6720, y=6637.218, z=31.784},
       {name="ATM", id=277, x=1735.114, y=6411.035, z=35.164},
       {name="ATM", id=277, x=1702.842, y=4933.593, z=42.051},
       {name="ATM", id=277, x=1967.333, y=3744.293, z=32.272},
       {name="ATM", id=277, x=1821.917, y=3683.483, z=34.244},
       {name="ATM", id=277, x=1175.4481, y=2706.8584, z=38.0940},
       {name="ATM", id=277, x=540.0420, y=2671.007, z=42.177},
       {name="ATM", id=277, x=2564.399, y=2585.100, z=38.016},
       {name="ATM", id=277, x=2558.7773, y=350.9538, z=108.6215},
       {name="ATM", id=277, x=2558.051, y=389.4817, z=108.660},
       {name="ATM", id=277, x=1077.692, y=-775.796, z=58.218},
       {name="ATM", id=277, x=1153.884, y=-326.540, z=69.245},
       {name="ATM", id=277, x=381.2827, y=323.2518, z=103.270},
       {name="ATM", id=277, x=236.4638, y=217.4718, z=106.840},
       {name="ATM", id=277, x=265.0043, y=212.1717, z=106.780},
       {name="ATM", id=277, x=285.2029, y=143.5690, z=104.970},
       {name="ATM", id=277, x=157.7698, y=233.5450, z=106.450},
       {name="ATM", id=277, x=-164.568, y=233.5066, z=94.919},
       {name="ATM", id=277, x=-1827.04, y=785.5159, z=138.020},
       {name="ATM", id=277, x=-1409.39, y=-99.2603, z=52.473},
       {name="ATM", id=277, x=-1205.35, y=-325.579, z=37.870},
       {name="ATM", id=277, x=-1215.64, y=-332.231, z=37.881},
       {name="ATM", id=277, x=-2072.41, y=-316.959, z=13.345},
       {name="ATM", id=277, x=-2975.72, y=379.7737, z=14.992},
       {name="ATM", id=277, x=-2962.60, y=482.1914, z=15.762},
       {name="ATM", id=277, x=-3044.22, y=595.2429, z=7.595},
       {name="ATM", id=277, x=-3144.13, y=1127.415, z=20.868},
       {name="ATM", id=277, x=-3241.10, y=996.6881, z=12.500},
       {name="ATM", id=277, x=-3241.11, y=1009.152, z=12.877},
       {name="ATM", id=277, x=-1305.40, y=-706.240, z=25.352},
       {name="ATM", id=277, x=-538.225, y=-854.423, z=29.234},
       {name="ATM", id=277, x=-711.156, y=-818.958, z=23.768},
       {name="ATM", id=277, x=-717.614, y=-915.880, z=19.268},
       {name="ATM", id=277, x=-526.566, y=-1222.90, z=18.434},
       {name="ATM", id=277, x=-256.831, y=-719.646, z=33.444},
       {name="ATM", id=277, x=-203.548, y=-861.588, z=30.205},
       {name="ATM", id=277, x=112.4102, y=-776.162, z=31.427},
       {name="ATM", id=277, x=112.9290, y=-818.710, z=31.386},
       {name="ATM", id=277, x=119.9000, y=-883.826, z=31.191},
       {name="ATM", id=277, x=149.4551, y=-1038.95, z=29.366},
       {name="ATM", id=277, x=-846.304, y=-340.402, z=38.687},
       {name="ATM", id=277, x=-56.1935, y=-1752.53, z=29.452},
       {name="ATM", id=277, x=-261.692, y=-2012.64, z=30.121},
       {name="ATM", id=277, x=-273.001, y=-2025.60, z=30.197},
       {name="ATM", id=277, x=314.187, y=-278.621, z=54.170},
       {name="ATM", id=277, x=-351.534, y=-49.529, z=49.042},
       {name="ATM", id=277, x=24.589, y=-946.056, z=29.357},
       {name="ATM", id=277, x=-254.112, y=-692.483, z=33.616},
       {name="ATM", id=277, x=-1570.197, y=-546.651, z=34.955},
       {name="ATM", id=277, x=-1415.909, y=-211.825, z=46.500},
       {name="ATM", id=277, x=-1430.112, y=-211.014, z=46.500},
       {name="ATM", id=277, x=33.232, y=-1347.849, z=29.497},
       {name="ATM", id=277, x=287.645, y=-1282.646, z=29.659},
       {name="ATM", id=277, x=289.012, y=-1256.545, z=29.440},
       {name="ATM", id=277, x=1686.753, y=4815.809, z=42.008},
       {name="ATM", id=277, x=-302.408, y=-829.945, z=32.417},
       {name="ATM", id=277, x=5.134, y=-919.949, z=29.557},
       {name="ATM", id=277, x=527.26, y=-160.76, z=57.09},
       {name="ATM", id=277, x=953.359, y=53.711, z=74.1166},
       {name="ATM", id=277, x=412.28, y=-1617.08, z=29.28},
       {name="ATM", id=277, x=-867.19, y=-186.99, z=37.84},
       {name="ATM", id=277, x=-821.62, y=-1081.88, z=11.13},
       {name="ATM", id=277, x=-1315.32, y=-835.96, z=16.96},
       {name="ATM", id=277, x=-660.71, y=-854.06, z=24.48},
       {name="ATM", id=277, x=-1109.73, y=-1690.81, z=4.37},
       {name="ATM", id=277, x=-1091.5, y=2708.66, z=18.95},
       {name="ATM", id=277, x=1171.98, y=2702.55, z=38.18},
       {name="ATM", id=277, x=2683.09, y=3286.53, z=55.24},
       {name="ATM", id=277, x=89.61, y=2.37, z=68.31},
       {name="ATM", id=277, x=-30.3, y=-723.76, z=44.23},
       {name="ATM", id=277, x=-28.07, y=-724.61, z=44.23},
       {name="ATM", id=277, x=-613.24, y=-704.84, z=31.24},
       {name="ATM", id=277, x=-618.84, y=-707.9, z=30.5},
       {name="ATM", id=277, x=-1289.23, y=-226.77, z=42.45},
       {name="ATM", id=277, x=-1285.6, y=-224.28, z=42.45},
       {name="ATM", id=277, x=-1286.24, y=-213.39, z=42.45},
       {name="ATM", id=277, x=-1282.54, y=-210.45, z=42.45},
       {name="ATM", id=277, x = -1040.44,  y = -2845.96,  z = 27.72},
       {name="ATM", id=277, x = -1053.92,  y = -2842.24,  z = 27.72},
       {name="ATM", id=277, x = -1055.8,  y = -2842.84,  z = 27.72},
       {name="ATM", id=277, x = -1055.2,  y = -2844.68,  z = 27.72},
       {name="ATM", id=277, x = -1053.44,  y = -2844.12,  z = 27.72},
       {name="ATM", id=277, x = -1094.16,  y = -2826.08,  z = 27.72},
       {name="ATM", id=277, x = -1095.8,  y = -2825.28,  z = 27.72},
       {name="ATM", id=277, x = -808.16,  y = -1339.96,  z = 5.16},
       {name="ATM", id=277, x = 315.08,  y = -593.72,  z = 43.28},
       {name="ATM", id=277, x = -1061.92,  y = -2835.08,  z = 27.72},
       {name="ATM", id=277, x = -549.5657, y = -204.3985, z = 38.2230},
       {name="ATM", id=277, x = 1318.3745, y = -1651.9617, z = 52.1456},
       {name="ATM", id=277, x = -596.0751, y = -933.4168, z = 23.8866},
       {name="ATM", id=277, x = -57.6978, y = -92.6025, z = 57.7791},
       {name="ATM", id=277, x = 122.2912, y = -1293.6071, z = 29.2555},
{name="ATM", id=277, x = 296.6613, y = -893.6394, z = 29.2353},
{name="ATM", id=277, x = 295.5956, y = -896.5912, z = 29.2242},
{name="ATM", id=277, x = 148.2113, y = -1035.9299, z = 29.3424},
{name="ATM", id=277, x = 145.2141, y = -1034.8877, z = 29.3457},
{name="ATM", id=277, x = -95.0939, y = 6457.6309, z = 31.4609},
{name="ATM", id=277, x = -97.8123, y = 6454.9219, z = 31.4671},
{name="ATM", id=277, x = 1701.2068, y = 6426.5483, z = 32.7640},
{name="ATM", id=277, x = -3040.4541, y = 592.2654, z = 7.9089},
{name="ATM", id=277, x = -2956.1116, y = 487.6354, z = 15.4639},
{name="ATM", id=277, x = -2959.6882, y = 487.7886, z = 15.4639},
{name="ATM", id=277, x = -1211.5057, y = -330.0886, z = 37.7871},
{name="ATM", id=277, x = 1166.9763, y = -456.0723, z = 66.8010},
{name="ATM", id=277, x = 1138.2109, y = -468.9862, z = 66.7292},
{name="ATM", id=277, x = 472.3299, y = -1001.6020, z = 30.6920},
{name="ATM", id=277, x = 468.3433, y = -990.5979, z = 26.2736},
{name="ATM", id=277, x = -2548.0364, y = 2314.1309, z = 33.4108},
       
   }
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
   end)
   
   Citizen.CreateThread(function ()
       while true do
           Citizen.Wait(1)
   
           if nearATM() then
               if not robbing then
               
   
                   if IsControlJustPressed(1,51) then
                       ESX.TriggerServerCallback('atm:getdata', function( result )
                           for i = 1, #result, 1 do
                               ESX.TriggerServerCallback('atm:getdata1', function( h )
                                   ----print(json.encode(result[i]))
                                   ----print(json.encode(h))
                                   SendNUIMessage({action="openWindow", window = "Bank", windowData = json.encode({playername = result[i].name, money = result[i].money, balance = result[i].bank, history = h})}) 
                                   SetNuiFocus(true, true)    
                               end)
                           end
                       end)
                       TriggerEvent('static_interact', "E", "hide")
                   end
               end
           end
       end
   end)
   
   
   
   
   clostestToAtm = false
   clostestAtmId = 0
   
   function nearATM()
       local player = GetPlayerPed(-1)
       local playerloc = GetEntityCoords(player, 0)
       
       for _, search in pairs(atms) do
           local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
           if distance < 1.1 then
               if search.name == 'ATM' then
                   clostestToAtm = true
                   clostestAtmId = search.y 
               end
           elseif distance > 1.1 and distance < 5.0 then
               clostestToAtm = false
           end
           if distance < 1.1 then
               if wasinside == false then
                   TriggerEvent('static_interact', "E", "show")
                   wasinside = true
               end
   
               return true
               
           elseif distance > 1.2 and distance < 2.0 then
               if wasinside then 
                   wasinside = false
                   TriggerEvent('static_interact', "E", "hide")
               end
           end
       end
       return clostestToAtm
   end
   
   
   
   
   
   RegisterNetEvent('byte:client:drill')
   AddEventHandler('byte:client:drill', function()
       ----print("triggered drill")
       local PlayerData = ESX.GetPlayerData()
   
   
           
           local vehicle = ESX.Game.GetVehicleInDirection()
           if DoesEntityExist(vehicle) then
               ----print("exists")
               local plate = GetVehicleNumberPlateText(vehicle)
               ----print(plate) 
               ESX.TriggerServerCallback('carlock:isSperre', function(sperre)
                   if sperre == true  then
                       ----print("sperre")
                       ESX.TriggerServerCallback('byte:getVehId', function(vehId)
                           if vehId ~= nil then
                               ----print("p car")
                               local playerPed = GetPlayerPed(-1)
                               TriggerEvent('patron_inventory:progressbar', 18000)
                               TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
                               Citizen.Wait(18000)
                               ClearPedTasksImmediately(playerPed) 
                               
                               TriggerEvent('glmp_singlenotify', '', 'Du hast eine Parkkralle abgeschweißt.')
   
                               TriggerServerEvent('byte:server:parkkralle', plate, 0)
                               ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                                   TriggerServerEvent('byte:sendLog', 'parkkralle', 'Parkkralle geschweißt', playername .. ' hat eine Parkkralle an einem Frak-Fahrzeug abgeschweißt.\n**Kennzeichen:** '.. plate)
                               end)
                           else
                               ESX.TriggerServerCallback('byte:getFrakVehId', function(vehId)
                                   if vehId ~= nil then
                                       ----print("f car")
                                       local playerPed = GetPlayerPed(-1)
                                       TriggerEvent('patron_inventory:progressbar', 18000)
                                       TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
                                       Citizen.Wait(18000)
                                       ClearPedTasksImmediately(playerPed)  
                                       
                                       TriggerEvent('glmp_singlenotify', '', 'Du hast eine Parkkralle abgeschweißt.')
                                       TriggerServerEvent('byte:server:frakparkkralle', plate, 0)
                                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                                           TriggerServerEvent('byte:sendLog', 'parkkralle', 'Parkkralle geschweißt', playername .. ' hat eine Parkkralle an einem Frak-Fahrzeug abgeschweißt.\n**Kennzeichen:** '.. plate)
                                       end)
                                   end
                               end, plate)
                           end
                       end, plate)
                   end
               end, plate)
           else
               ----print("no veh")
               if clostestToAtm ~= false then
                   ----print("near atm")
                   TriggerServerEvent('byte:atmRob', clostestAtmId)
               end
           end
   end)
   
   
   RegisterNetEvent('byte:atmRob')
   AddEventHandler('byte:atmRob', function(atmId)  
       
       local playerPed = GetPlayerPed(-1)
       TriggerEvent('patron_inventory:progressbar', 18000)
       TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
       Citizen.Wait(30000)
       ClearPedTasksImmediately(playerPed)  
       TriggerServerEvent('byte:atmRob:2', atmId)
   end) 
   
   RegisterNUICallback('trigger', function(data, cb)
       ownedCars = {}
       ----print("[" .. data.event .. "]:" .. table.concat(data.args, " "))  
       if data.args[1] == "Bank" then
           if data.args[2] == "bankPayout" then
               TriggerServerEvent('banking:auszahlen', data.args[3])
           elseif data.args[2] == "bankDeposit" then
               TriggerServerEvent('banking:einzahlen', data.args[3])
           end
       end 
   end)


   --Shoprob

   

local shoprobs = {
    {id=1, name="Der Coole Shop", x=-43.34, y=-1748.34, z=29.24, min=1000, max=1200, needSeconds = 30, cops=1}
  --  {id=2, name="test", x=-2329.6, y=3246.27, z=33.05, min=0, max=0, needSeconds = 30, cops=0},
} 

clostestToShopRob = false
clostestShopRobId = 0
  
function nearShopRob() 
    print("is near shop rob")
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)
    
    for _, rob in pairs(shoprobs) do
        local distance = GetDistanceBetweenCoords(rob.x, rob.y, rob.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        if distance < 1.1 then
                clostestToShopRob = true
                clostestShopRobId = rob.id 
                clostestShopName = rob.name 
                clostestShopMinMoney = rob.min 
                clostestShopMaxMoney = rob.max 
                clostestShopNeedCops = rob.cops 
                clostestShopNeedSeconds = rob.needSeconds
        elseif distance > 1.1 and distance < 5.0 then
            clostestToShopRob = false
        end
        
    end
    return clostestToShopRob
end

RegisterNetEvent('byte_shoprob:trigger')
AddEventHandler('byte_shoprob:trigger', function()
    print("Trigger Sgop Rob")
    if nearShopRob() then 
        ESX.ShowNotification("Versuche zu Schweißen... Shoprob")
        TriggerServerEvent('byte:shopRob:server', clostestShopRobId, clostestShopNeedCops, clostestShopName)
    else
        print("not near")  
        TriggerEvent('byte_staatsbank:trigger')
        return 
        
    end
end)
 
 
RegisterNetEvent('byte:shopRob')
AddEventHandler('byte:shopRob', function()  
       
       local playerPed = GetPlayerPed(-1)
       TriggerEvent('patron_inventory:progressbar', clostestShopNeedSeconds * 1000)
       TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
       Citizen.Wait(clostestShopNeedSeconds * 1000)
       ClearPedTasksImmediately(playerPed)   
       print("Shop Rob Ready")
       TriggerServerEvent('byte:shopRobReady', clostestShopRobId, clostestShopMinMoney, clostestShopMaxMoney)
end) 






   
   
   -- BARBER
   
   
   
   
   
   barbers = {
--       {id = 1, posX = 137.65, posY = -1707.34, posZ = 29.29, h = 0.00 },
--       {id = 2, posX = -815.5, posY = -184.41, posZ = 37.57, h = 0.00 },
--       {id = 3, posX = -1281.85, posY = -1117.2, posZ = 6.99, h = 0.00 },
--       {id = 4, posX = -33.27, posY = -153.0, posZ = 57.08, h = 0.00 },
--       {id = 5, posX = 1931.15, posY = 3731.38, posZ = 32.84, h = 0.00 },
--       {id = 6, posX = -277.62, posY = 6227.66, posZ = 31.7, h = 0.00 }
   }
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(1) 
           for _,v in pairs(barbers) do 
               local player = GetPlayerPed(-1)
               local playerloc = GetEntityCoords(player, 0) 
               local distance = GetDistanceBetweenCoords(v.posX, v.posY, v.posZ, playerloc['x'], playerloc['y'], playerloc['z'], true)
               if distance < 2 then 
                   if showDistMsg ~= true then 
                       ESX.ShowNotification('Benutze E um auf den Barber zuzugreifen!')
                       showDistMsg = true 
                   end  
                   if IsControlJustPressed(1,51) then 
                       openBarber(v.h, vector3(v.posX, v.posY, v.posZ))
                   end
               elseif distance > 2 and distance < 4 then  
                   showDistMsg = false 
               end
           end   
       end  
       
   end)  
   
   
   
   
   local data = {
       hairs = {
           {Id=1, price=750,customid=0,name='Glatze'},
           {Id=2, price=750,customid=1,name='Kurzgeschoren'},
           {Id=7, price=750,customid=2,name='Iro, modisch'},
           {Id=13, price=750,customid=3,name='Rasierter Hipster'},
           {Id=19, price=750,customid=4,name='Wilder Seitenscheitel, braun'},
           {Id=25, price=750,customid=5,name='Kurzhaarschnitt'},
           {Id=31, price=750,customid=6,name='Bikerfrisur'},
           {Id=37, price=750,customid=7,name='Pferdeschwanz'},
           {Id=43, price=750,customid=8,name='Flechtreihen'},
           {Id=48, price=750,customid=9,name='Gelfrisur'},
           {Id=54, price=750,customid=10,name='Kurz gekämmt'},
           {Id=59, price=750,customid=11,name='Stachelfrisur'},
           {Id=65, price=750,customid=12,name='Cäsarenfrisur'},
           {Id=70, price=750,customid=13,name='Zerzaust'},
           {Id=76, price=750,customid=14,name='Dreadlocks'},
           {Id=81, price=750,customid=15,name='Langhaarfrisur'},
           {Id=87, price=750,customid=16,name='Zottellocken'},
           {Id=92, price=750,customid=17,name='Surferfrisur'},
           {Id=97, price=750,customid=18,name='Seitenscheitel'},
           {Id=102, price=750,customid=19,name='Hochgekämmt'},
           {Id=107, price=750,customid=20,name='Gelfrisur, lang'},
           {Id=112, price=750,customid=21,name='Junger Hipster'},
           {Id=117, price=750,customid=22,name='Vokuhila'},
           {Id=122, price=750,customid=24,name='Klassische Flechtreihen'},
           {Id=123, price=750,customid=25,name='Palmen-Flechtreihen'},
           {Id=124, price=750,customid=26,name='Blitz-Flechtreihen'},
           {Id=125, price=750,customid=27,name='Peitschen-Flechtreihen'},
           {Id=126, price=750,customid=28,name='Zickzack-Flechtreihen'},
           {Id=127, price=750,customid=29,name='Schnecken-Flechtreihen'},
           {Id=128, price=750,customid=30,name='Hightop'},
           {Id=129, price=750,customid=31,name='Locker zurückgekämmt'},
           {Id=130, price=750,customid=32,name='Zurückgekämmter Undercut'},
           {Id=131, price=750,customid=33,name='Zur Seite gekämmter Undercut'},
           {Id=132, price=750,customid=34,name='Stacheliger Iro'},
           {Id=133, price=750,customid=35,name='Mod'},
           {Id=134, price=750,customid=36,name='Stufenmod'},
           {Id=135, price=750,customid=37,name='Kurzgeschoren'},
           {Id=136, price=750,customid=38,name='Iro, modisch'},
           {Id=137, price=750,customid=39,name='Hipster'},
           {Id=138, price=750,customid=40,name='Seitenscheitel'},
           {Id=139, price=750,customid=41,name='Kurzhaarschnitt'},
           {Id=140, price=750,customid=42,name='Bikerfrisur'},
           {Id=141, price=750,customid=43,name='Pferdeschwanz'},
           {Id=142, price=750,customid=44,name='Flechtreihen'},
           {Id=143, price=750,customid=45,name='Gelfrisur'},
           {Id=144, price=750,customid=46,name='Kurz gekämmt'},
           {Id=145, price=750,customid=47,name='Stachelfrisur'},
           {Id=146, price=750,customid=48,name='Cäsarenfrisur'},
           {Id=147, price=750,customid=49,name='Zerzaust'},
           {Id=148, price=750,customid=50,name='Dreadlocks'},
           {Id=149, price=750,customid=51,name='Langhaarfrisur'},
           {Id=150, price=750,customid=52,name='Zottellocken'},
           {Id=151, price=750,customid=53,name='Surferfrisur'},
           {Id=152, price=750,customid=54,name='Seitenscheitel'},
           {Id=153, price=750,customid=55,name='Hochgekämmt'},
           {Id=154, price=750,customid=56,name='Gelfrisur, lang'},
           {Id=155, price=750,customid=57,name='Junger Hipster'},
           {Id=156, price=750,customid=58,name='Vokuhila'},
           {Id=157, price=750,customid=59,name='Klassische Flechtreihen'},
           {Id=158, price=750,customid=60,name='Palmen-Flechtreihen'},
           {Id=159, price=750,customid=61,name='Blitz-Flechtreihen'},
           {Id=160, price=750,customid=62,name='Peitschen-Flechtreihen'},
           {Id=161, price=750,customid=63,name='Zickzack-Flechtreihen'},
           {Id=162, price=750,customid=64,name='Schnecken-Flechtreihen'},
           {Id=163, price=750,customid=65,name='Hightop'},
           {Id=164, price=750,customid=66,name='Locker zurückgekämmt'},
           {Id=165, price=750,customid=67,name='Zurückgekämmter Undercut'},
           {Id=166, price=750,customid=68,name='Zur Seite gekämmter Undercut'},
           {Id=167, price=750,customid=69,name='Stacheliger Iro'},
           {Id=168, price=750,customid=70,name='Mod'},
           {Id=169, price=750,customid=71,name='Stufenmod'},
           {Id=170, price=750,customid=72,name='Flattop-Bürstenschnitt'},
           {Id=171, price=750,customid=73,name='Militär-Stoppeln'},
           {Id=172, price=750,customid=74,name='Ohnmächtiger Zorn'}
       },
       colors = {
           {Id=1, price=200,customid=0,name='Schwarz'},
           {Id=2, price=200,customid=6,name='Braun'},
           {Id=3, price=200,customid=14,name='Blond'},
           {Id=4, price=200,customid=48,name='Orange'},
           {Id=5, price=200,customid=19,name='Dunkelrot'},
           {Id=6, price=200,customid=26,name='Grau'},
           {Id=7, price=200,customid=29,name='Weiß'},
           {Id=8, price=200,customid=32,name='Lila'},
           {Id=9, price=200,customid=33,name='Pink'},
           {Id=10, price=200,customid=35,name='Rosa'},
           {Id=11, price=200,customid=38,name='Blau'},
           {Id=12, price=200,customid=39,name='Grün'},
           {Id=13, price=200,customid=46,name='Gelb'},
           {Id=14, price=200,customid=53,name='Rot'},
           {Id=15, price=200,customid=28,name='Dunkelweiß'},
           {Id=16, price=200,customid=27,name='Hellgrau'}
       },
       beards = {
           {Id=1, price=700,customid=0,name='Rasierter Bart'},
           {Id=2, price=700,customid=1,name='Mundbart'},
           {Id=3, price=700,customid=2,name='Mundbart 2'},
           {Id=4, price=700,customid=3,name='Mundbart 3'},
           {Id=5, price=700,customid=4,name='Kinnbart'},
           {Id=6, price=700,customid=7,name='Leichter Bart'},
           {Id=7, price=700,customid=8,name='Italiener Bart'},
           {Id=8, price=700,customid=9,name='Mero Bart'},
           {Id=9, price=700,customid=10,name='Vollbart'},
           {Id=10, price=700,customid=17,name='Retard'},
           {Id=11, price=700,customid=19,name='Schnäutzer'},
           {Id=12, price=700,customid=21,name='Schnäutzer 2'},
           {Id=13, price=700,customid=27,name='Affenbart'}
       },
       chests = {}
   }
   
   
   
   
   
   
   function openBarber(heading, pos)
       SendNUIMessage({action="showPlayerPanel", state = true})
       SetNuiFocus(true, true) 
       local success, overlayValue, colourType, firstColour, secondColour, overlayOpacity = GetPedHeadOverlayData(PlayerPedId(), 1)
   
       local player = {
           beard = overlayValue,
           beardColor = firstColour,
           beardOpacity = overlayOpacity,
           hair = GetPedPropTextureIndex(PlayerPedId(), 2),
           hairColor = GetPedHairColor(PlayerPedId()),
           hairColor2 = GetPedHairHighlightColor(PlayerPedId()),
           chestHair = 0,
           chestHairOpacity = 0.56,
           chestHairColor = 6
       }
       
       local success, overlayValue, colourType, firstColour, secondColour, overlayOpacity = GetPedHeadOverlayData(PlayerPedId(), 10)
       player.chestHair = overlayValue
       
       player.chestHairOpacity = overlayOpacity
       
       player.chestHairColor = firstColour
   
       ClearPedTasksImmediately(PlayerPedId())
       SendNUIMessage({
           action="showBarberShop", 
           data=json.encode({barber=data, player=player})
       })
       --Camera(heading, pos)
   end       
   
   
   function blips()
       for _,x in pairs(barbers) do
           local blip = AddBlipForCoord(x.posX, x.posY, x.posZ)
   
           SetBlipSprite (blip, 71)
           SetBlipDisplay(blip, 4)
           SetBlipScale  (blip, 0.8)
           SetBlipColour (blip, 0)
           SetBlipAsShortRange(blip, true)
           BeginTextCommandSetBlipName("STRING")
           AddTextComponentString("Barber")
           EndTextCommandSetBlipName(blip)
       end
   end
   blips()
   
   barberSkin = {}
   
   RegisterNUICallback("trigger", function(data)
   
       if data.event == "componentEvent" then
           ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin) 
               barberSkin['sex'] = skin.sex
           end)
           if data.args[1] == "Barber" then
               if data.args[2] == "setHairVariant" then
          
                   SetPedComponentVariation(PlayerPedId(), 2, data.args[3], 0, 1)
                   barberSkin['hair_1'] = data.args[3]
   
               end
               if data.args[2] == "setHairColor" then
                   local object = json.decode(data.args[3])
                   SetPedHairColor(PlayerPedId(), object.color1, object.color2)
                   barberSkin['hair_color_1'] = object.color1
                   barberSkin['hair_color_2'] = object.color2
   
               end
               if data.args[2] == "setBeard" then
                   local object = json.decode(data.args[3])
                   SetPedHeadOverlay(PlayerPedId(), 1, object.variation, object.opacity + 0.0)
                   SetPedHeadOverlayColor(PlayerPedId(), 1, 1, object.color, 0)
                   barberSkin['beard_1'] = object.variation
                   barberSkin['beard_2'] = object.opacity * 10
                   barberSkin['beard_3'] = object.color 
                   
               end
               if data.args[2] == "setChestHair" then
                   local object = json.decode(data.args[3])
                   SetPedHeadOverlay(PlayerPedId(), 10, object.variation, object.opacity + 0.0)
                   SetPedHeadOverlayColor(PlayerPedId(), 10, 1, object.color, 0)
               end
           end
       end
   
       if data.event == "componentTriggerServerEvent" then
           if data.args[1] == "Barber" then
               if data.args[2] == "barberShopBuy" then
                   SendNUIMessage({action="showPlayerPanel", state = false})
                   SetNuiFocus(false, false)
                   RenderScriptCams(0)
   
                   --TriggerEvent('esx_skin:getPlayerSkin', function(skin)
                       ESX.TriggerServerCallback("barber:barberShopBuy", function(cb) 
   
                           if cb == false then
                               TriggerEvent("glmp_notify", "red", "", "Du hast nicht genuegend geld!")
                               ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin) 
                                   TriggerEvent('skinchanger:loadSkin', skin)  
                                   --TriggerServerEvent('esx_skin:save', cb.skin)
                               end)
                           else 
                               TriggerEvent("glmp_notify", "green", "", "Du bezahlst "..data.args[3].."$ !")
                               --TriggerEvent('skinchanger:getSkin', function(skin)   
                                   TriggerServerEvent('esx_skin:save', barberSkin)
                                   Wait(1000)
                                   ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin) 
                                       TriggerEvent('skinchanger:loadSkin', skin)  
                                       --TriggerServerEvent('esx_skin:save', cb.skin)
                                   end)
                                    
                               --end)
                           end
   
                       end, data.args[3])
                   --end)
   
               end
               if data.args[2] == "barberShopExit" then
                   SendNUIMessage({action="showPlayerPanel", state = false})
                   SetNuiFocus(false, false)
                   --RenderScriptCams(0)
                   ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin) 
                       TriggerEvent('skinchanger:loadSkin', skin)  
                       --TriggerServerEvent('esx_skin:save', cb.skin)
                   end)
                  -- TriggerEvent("glmp_notify", "red", "", "Bezahl deine schulden ya sippi", 5000)
               end
           end
       end
   end)
   
   Citizen.CreateThread(function() 
       while true do
         N_0xf4f2c0d4ee209e20() 
         Wait(1000)
       end 
   end)
   
   
   function Camera(h, pos)
       SetEntityHeading(PlayerPedId(), h)
       SetEntityCoordsNoOffset(PlayerPedId(), pos)
       cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
       local player = {
           position = GetEntityCoords(PlayerPedId())
       }
       local coordsCam = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.40, 0.0)
       local coordsPly = GetEntityCoords(PlayerPedId())
       local offset = offsetPosition(player.position.x, player.position.y, GetEntityHeading(PlayerPedId()), 1.8);
       local targetPositionFly = vector3(offset.x, offset.y, player.position.z)
       local targetPositionPoint = player.position
       SetCamCoord(cam, targetPositionFly)
       PointCamAtCoord(cam, targetPositionPoint)
   
       SetCamActive(cam, true)
       RenderScriptCams(true, false, 500, true, true)
   end 
   
   -- BLIPS
   
   
   local blips = {
       
   
       --Fahrzeughändler - Roller
   --	{title="Fahrzeughändler - Roller ", colour=0, id=326, x=-984.55, y=-2641.6, z=13.97},
   
       --Kirche
       {title="Kirche", colour=0, id=305, x=-1678.86, y=-292.63, z=51.88},
   
       --Staatsbank 
   {title="Staatsbank", colour=2, id=272, x=228.83, y=213.38, z=105.51},
   
   
   }
   Citizen.CreateThread(function()
   
   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 0.8)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
       BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
   end)
   
   
   
   -- BLOCK DISPATCH
   
   Citizen.CreateThread(function()
       for i = 1, 12 do
           Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(3000)
          
           if GetPlayerWantedLevel(PlayerId()) ~= 0 then
               SetPlayerWantedLevel(PlayerId(), 0, false)
               SetPlayerWantedLevelNow(PlayerId(), false)
           end
       end
   end)
   
   ------------------------------------------------------------------------------------------------------------------------------------
   ------------------------------------------Enleve toute les voiture de pnj police----------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           local myCoords = GetEntityCoords(GetPlayerPed(-1))
           ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)
       end
   end)
   
   ------------------------------------------------------------------------------------------------------------------------------------
   ------------------------------------------Enleve les armes de toute les vehicule de police -----------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------
   ------------------------------------------------------------------------------------------------------------------------------------
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           DisablePlayerVehicleRewards(PlayerId())
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0) -- prevent crashing
   
           -- These natives have to be called every frame.
           SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
           SetPedDensityMultiplierThisFrame(0.0) -- set npc/ai peds density to 0
           SetRandomVehicleDensityMultiplierThisFrame(0.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
           SetParkedVehicleDensityMultiplierThisFrame(0.0) -- set random parked vehicles (parked car scenarios) to 0
           SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- set random npc/ai peds or scenario peds to 0
           SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
           SetRandomBoats(false) -- Stop random boats from spawning in the water.
           SetCreateRandomCops(false) -- disable random cops walking/driving around.
           SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
           SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
           
           local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
           ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
           RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
       end
   end)
   
   -- CARLOCK
   
   ESX                           = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   
   end)
   
   local PlayerData                = {}
   
   RegisterNetEvent('esx:playerLoaded')
   AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
   end)
   
   RegisterNetEvent('esx:setJob')
   AddEventHandler('esx:setJob', function(job)
     PlayerData.job = job
   end)
   
   
   RegisterNetEvent('esx_carlock:lock')
   AddEventHandler('esx_carlock:lock', function()
       local coords = GetEntityCoords(GetPlayerPed(-1))
       local hasAlreadyLocked = false
       cars = ESX.Game.GetVehiclesInArea(coords, 1)
       local carstrie = {}
       local cars_dist = {}		
       notowned = 0
       if #cars == 0 then
           --exports['glmp_notify']:SendAlert('error', 'Kein Fahrzeug in der Nähe')
       else
           for j=1, #cars, 1 do
               local coordscar = GetEntityCoords(cars[j])
               local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
               table.insert(cars_dist, {cars[j], distance})
           end
           for k=1, #cars_dist, 1 do
               local z = -1
               local distance, car = 1
               for l=1, #cars_dist, 1 do
                   if cars_dist[l][2] < distance then
                       distance = cars_dist[l][2]
                       car = cars_dist[l][1]
                       z = l
                   end
               end
               if z ~= -1 then
                   table.remove(cars_dist, z)
                   table.insert(carstrie, car)
               end
           end
           for i=1, #carstrie, 1 do
               local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
               ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
                   if owner and hasAlreadyLocked ~= true then
                       local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
                       vehicleLabel = GetLabelText(vehicleLabel)
                       local lock = GetVehicleDoorLockStatus(carstrie[i])
                       if lock == 1 or lock == 0 then
                           SetVehicleDoorShut(carstrie[i], 0, false)
                           SetVehicleDoorShut(carstrie[i], 1, false)
                           SetVehicleDoorShut(carstrie[i], 2, false)
                           SetVehicleDoorShut(carstrie[i], 3, false)
                           SetVehicleDoorsLocked(carstrie[i], 2)
                           PlayVehicleDoorCloseSound(carstrie[i], 1)
                           TriggerEvent("glmp_singlenotify", "red", "Fahrzeug abgeschlossen")
         
                           if not IsPedInAnyVehicle(PlayerPedId(), true) then
                                         
                           end
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           hasAlreadyLocked = true
                       elseif lock == 2 then
                           SetVehicleDoorsLocked(carstrie[i], 1)
                           PlayVehicleDoorOpenSound(carstrie[i], 0)
                           TriggerEvent("glmp_singlenotify", "green", "Fahrzeug aufgeschlossen")
         
         
                           if not IsPedInAnyVehicle(PlayerPedId(), true) then
                                         
                           end
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           hasAlreadyLocked = true
                       end
                   else
                       notowned = notowned + 1
                   end
                   if notowned == #carstrie then
                       --exports['glmp_notify']:SendAlert('error', 'Kein Fahrzeug in der Nähe')
                   end	
               end, plate)
           end			
       end
   end)
   
   
               
   
   
   -- CARSHOP
   
   ESX = nil
   
   
   carSpawned = {}
   car = {}
   vehs = {}
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) 
               ESX = obj
               
            end)
            
           Citizen.Wait(0)
       end
       while loadVehs == nil do 
           ----print("carshop get vehicles!!")
               ESX.TriggerServerCallback('carshop:getVehicles', function(vehss)
                   vehs = vehss 
               end) 
               loadVehs = true
       end
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
    
       PlayerData = ESX.GetPlayerData()
       
   end)
   playerVehId = 0
   isIn = {}
   cooldown = 0
   Citizen.CreateThread(function()
      
       
       while true do 
          Citizen.Wait(1000)
          if cooldown >= 1 then
            cooldown = cooldown - 1 
          end  
       end 
   end)
   Citizen.CreateThread(function()
      
       
       while true do 
          Citizen.Wait(0)  
          if IsControlJustPressed(0, 51) then 
               ----print("car shop e") 
               if playerVehId ~= 0 then
                   if cooldown == 0 then
                       TriggerServerEvent('carshop:buyVeh', playerVehId)
                       playerVehId = 0
                       cooldown = 5
                   else
                       if cooldown > 1 then
                           TriggerEvent('glmp_singlenotify', '', 'Bitte warte noch '.. cooldown ..' Sekunden!')
                       else
                           TriggerEvent('glmp_singlenotify', '', 'Bitte warte noch '.. cooldown ..' Sekunde!')
                       end
   
                   end 
               end 
           end 
       end
   end)
   Citizen.CreateThread(function()
      
       
       while true do 
          Citizen.Wait(100)  
          
               --if cooldown ~= true then
                   
               --else
                   ------print("cooldown")
                   --TriggerEvent('glmp_singlenotify', '', 'Bitte warte 5 Sekunden!') 
              -- end
          
           
               ------print("vehs")
               ------print(json.encode(vehs))
               
               for _, veh in pairs(vehs) do  
                   local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), veh.x, veh.y, veh.z, true)
                  -- ----print("VD:".. dist) 
                  -- ----print("VX:" ..veh.x)
                  if dist < 10 then 
                    DrawMarker(1, veh.x, veh.y, veh.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.7, 144, 128, 0, 100, false, true, 2, nil, nil, false)
                  end 
                   if dist < 3 then 
                     --  ----print("WOLF DU BIST ZU NAH!") 
                       if isIn[veh.id] ~= true then
                           isIn[veh.id] = true
                           TriggerEvent('glmp_notify', 'gold', 'AUTOHAUS', 'Modell: '.. veh.model:upper() .. ' - Preis: '.. veh.price .. '$')
                           TriggerEvent('glmp_singlenotify', '', 'Drücke E zum Kaufen') 
                           playerVehId = veh.id 
                       end 
                       
    
                   elseif dist > 3.1 and dist < 5 then
                       isIn[veh.id] = false 
                       playerVehId = 0  
                       ------print("WOLF DU BIST ZU NAH!")
                   elseif dist < 4.5 then
                       ------print("WOLF DU BIST ZU NAH!")
                   end
               end
           
       end
   end)
   
   spawned = {}
   RegisterNetEvent('carshop:spawnVeh')
   AddEventHandler('carshop:spawnVeh', function(model, x, y, z, h, plate, id)
           ------print("client triggered for ".. id .. ' with model '.. model) 
           if spawned[id] ~= true then 
            --   ----print("client spawn") 
               spawned[id] = true 
               ESX.Game.SpawnLocalVehicle(model, vector3(x,y,z), h,  function (vehicle)
                   local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                    
                   
                   ESX.Game.SetVehicleProperties(vehicle, {
                       plate = plate 
   
                   }) 
                   SetVehicleDoorsLocked(vehicle, 2)
                   FreezeEntityPosition(vehicle,true) 
                   SetEntityInvincible(vehicle, true)
                   SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
                   SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)
               end) 
           end
       
   end)
   
   RegisterNetEvent('carshop:spawnBuyedVeh')
   AddEventHandler('carshop:spawnBuyedVeh', function(playerID, model, plate, g) 
       local playerPed = GetPlayerPed(-1)
       local coords    = GetEntityCoords(playerPed)
       local generatedPlate = string.upper(plate)
       local carExist  = false 
   
       ----print("buy spawned veh")
       ----print(model)
               ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info	
                   if DoesEntityExist(vehicle) then
                       ----print("veh exist")
                       carExist = true
                       SetEntityVisible(vehicle, false, false)
                       SetEntityCollision(vehicle, false)	
                       
                       local newPlate     = string.upper(plate)
                       local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                       vehicleProps.plate = newPlate
                       TriggerServerEvent('carshop:setVehicle', vehicleProps, playerID, g)
                       ESX.Game.DeleteVehicle(vehicle)
                       
                   else
                       ----print("veh not exist")
                   end
               end)
                       
           
   end)
   
   
   RegisterNetEvent('admin:spawnCreateFrakVeh')
   AddEventHandler('admin:spawnCreateFrakVeh', function(frak, model, plate, g) 
       local playerPed = GetPlayerPed(-1)
       local coords    = GetEntityCoords(playerPed)
       local generatedPlate = string.upper(plate)
       local carExist  = false  
   
       ----print("buy spawned veh")
       ----print(model)
               ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info	
                   if DoesEntityExist(vehicle) then
                       ----print("veh exist")
                       carExist = true
                       SetEntityVisible(vehicle, false, false)
                       SetEntityCollision(vehicle, false)	
                       
                       local newPlate     = string.upper(plate)
                       local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                       vehicleProps.plate = newPlate
                       TriggerServerEvent('admin:setVehicle', vehicleProps, frak, g)
                       ESX.Game.DeleteVehicle(vehicle)
                       
                   else
                       ----print("veh not exist")
                   end
               end)
                       
           
   end)

   RegisterNetEvent('admin:spawnCreateOwnVeh')
   AddEventHandler('admin:spawnCreateOwnVeh', function(playerid, model, plate) 
       local playerPed = GetPlayerPed(-1)
       local coords    = GetEntityCoords(playerPed)
       local generatedPlate = string.upper(plate)
       local carExist  = false  
    
       ----print("buy spawned veh")
       ----print(model)
               ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info	
                   if DoesEntityExist(vehicle) then
                       ----print("veh exist")  
                       carExist = true
                       SetEntityVisible(vehicle, false, false)
                       SetEntityCollision(vehicle, false)	
                       
                       local newPlate     = string.upper(plate)
                       local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                       vehicleProps.plate = newPlate 
                       TriggerServerEvent('admin:setVehicleOwn', vehicleProps, playerid)
                       ESX.Game.DeleteVehicle(vehicle)
                       
                   else
                       ----print("veh not exist")
                   end
               end)
                       
           
   end)
   
   -- COMPUTER
   
   ESX                           = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
    
   end) 
   
   function startAnim()
       Citizen.Wait(100)
       Citizen.CreateThread(function()
           RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
           while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
             Citizen.Wait(0)
           end
             attachObject()
             TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
         end)  
   end
   
   function attachObject()
       tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
       AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
   end
   
   function stopAnim()
       StopAnimTask(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
       DeleteEntity(tab)
   end
   
   
   RegisterKeyMapping('laptop_f245f4fd', 'Computer', 'keyboard', 'f3')
   RegisterCommand('laptop_f245f4fd', function(source)
   
           --print("open")
           TriggerEvent('computer:open') 
           --SetNuiFocus(true, true)
           laptopOpen = true
           
       
   end)  
    -- Also Jordan dieses "trigger" ist von den GVMP Client Packages. Der "fiveMtrigger", das hat nix mit den allgemeinen NUI Callbacks ( welche du in der app.js verwendest zu tun!)
   
   
   
   
   RegisterNUICallback('closeComputer', function(data, cn) 
       SendNUIMessage({
           action = "closeComputer"
       })
       SetNuiFocus(false, false)
       laptopOpen = false
       stopAnim()
   end)
   
   
   RegisterNetEvent('computer:open')
   AddEventHandler('computer:open', function(source)
       ESX.TriggerServerCallback('byte:hasSpecificItem', function(hasItem)
           if hasItem then
               
               PlayerData = ESX.GetPlayerData()
               SendNUIMessage({ 
                   action = "openComputer"
               })
               local apps = {} 
               SendNUIMessage({action="responseIpadApps", apps=json.encode(apps)})
               SetNuiFocus(true, true)
               startAnim()
               
           end
       end, 'laptop')
   end)
   
   RegisterNetEvent('Ipad:open')
   AddEventHandler('Ipad:open', function(source)
       PlayerData = ESX.GetPlayerData()
       SendNUIMessage({
           action = "openSupportTablet"
       })
       local apps = {} 
       SendNUIMessage({action="responseComputerApps", apps=json.encode(apps)})
   end)
   apps = {}
   aktenApp = false
       dutyApps = false
       frakManageApp = false
       editPersonCooldown = {}
   RegisterNUICallback('trigger', function(data, cb)
       PlayerData = ESX.GetPlayerData()
       local src = source
       aktenApp = false
       dutyApps = false
       frakManageApp = false
       apps = {}
       if data.args[1] == "IpadDesktopApp" then 
           if data.args[2] == "requestIpadApp" then
               table.insert(apps, {id = "SupportOverviewApp",appName = "SupportOverviewApp",name = "Tickets",icon = "./img/204316.4cac8738.svg"})
               table.insert(apps, {id = "SupportVehicleApp",appName = "SupportVehicleApp",name = "Fahrzeuge",icon = "./img/vehicle_support.4a257081.svg"})
               Wait(500)   
               SendNUIMessage({action="responseSupportApps", apps=json.encode(apps)})
           end
       elseif data.args[1] == "SupportOpenTickets" then
           if data.args[2] == "requestOpenSupportTickets" then  
               ESX.TriggerServerCallback('requestOpenSupportTickets', function(tickets)
                   SendNUIMessage({action="responseOpenSupportTickets", tickets=json.encode(tickets)})
               end) 
           elseif data.args[2] == "acceptOpenSupportTicket" then
               TriggerServerEvent('byte_adminsystem:support:accept', data.args[3])
           end
       elseif data.args[1] == "SupportAcceptedTickets" then
           if data.args[2] == "requestAcceptedTickets" then 
               ESX.TriggerServerCallback('requestAcceptedSupportTickets', function(tickets)
                   SendNUIMessage({action="responseAcceptedSupportTickets", tickets=json.encode(tickets)})
               end, PlayerData.identifier) 
           end
       elseif data.args[1] == "SupportTicketOverview" then 
           if data.args[2] == "supportTeleportToPlayer" then 
               TriggerServerEvent('support:tp', data.args[3])
           elseif data.args[2] == "supportTeleportPlayerToMe" then
               TriggerServerEvent('support:tphere', data.args[3])
           elseif data.args[2] == "supportRevivePlayer" then
               TriggerServerEvent('support:revive', data.args[3])
           elseif data.args[2] == "closeTicket" then
               TriggerServerEvent('byte_adminsystem:support:close', data.args[3])
           end
       elseif data.args[1] == "SupportVehicleProfile" then  
           vehicleProps = nil 
           if data.args[2] == "requestVehicleData" then
               ESX.TriggerServerCallback('requestVehicleData', function(vdata)
                   SendNUIMessage{action = "updateSupVehicleProfile", data = json.encode(vdata)}
               end, data.args[3]) 
           elseif data.args[2] == "SupportSetGarage" then
               ----print("setgargae")
               local vehicle = ESX.Game.GetVehicles()
   
              
                   if data.args[4] ~= nil then
                       plate = data.args[3] .. ' ' .. data.args[4]
                   else
                       plate = data.args[3]
                   end 
                   Wait(50)
                   parkCar(plate, 'park')
           elseif data.args[2] == "SupportGoToVehicle" then
                   ----print("goto veh")
                   local vehicle = ESX.Game.GetVehicles()
   
              
                   if data.args[4] ~= nil then
                       plate = data.args[3] .. ' ' .. data.args[4]
                   else
                       plate = data.args[3]
                   end 
                   Wait(50)
                   parkCar(plate, 'tp')
               
           end 
       elseif data.args[1] == "SupportVehicleList" then
           if data.args[2] == "requestSupportVehicleList" then
               ESX.TriggerServerCallback('requestVehiclesForSupport', function(vehs)
                   SendNUIMessage{action = "updateSupVehicleList", data = json.encode(vehs)} 
               end, data.args[3])
           end
       elseif data.args[1] == "DesktopApp" then
           
           if data.args[2] == "requestComputerApps" then
                  print (PlayerData.job.name)
                  table.insert(apps, {id = "BusinessDetailApp",appName = "BusinessDetailApp",name = "Business",icon = "./img/1055644.473a3c99.svg"})
                   ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(isDuty)
                       ----print("DUTY - " .. isDuty)
                       if isDuty == 1 then
                           if PlayerData.job.name == 'police' then
   
                               aktenApp = true
                               ----print("akten true") 
                               table.insert(apps, {id = "PoliceAktenSearchApp",appName = "PoliceAktenSearchApp",name = "Akten",icon = "./img/858320.svg"})
                           end
                           if PlayerData.job.name == 'fib' then
                                
                               aktenApp = true
                               ----print("akten true") 
                               table.insert(apps, {id = "PoliceAktenSearchApp",appName = "PoliceAktenSearchApp",name = "Akten",icon = "./img/858320.svg"})
                               
                           end
               
                       end
                   end)
               ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(isDuty)
                   if isDuty == 1 then 
                      dutyApps = true  
                      ----print("duty true") 
                      table.insert(apps, {id = "ServiceOverviewApp",appName = "ServiceOverviewApp",name = "Notrufe",icon = "./img/204316.4cac8738.svg"})
                       table.insert(apps, {id = "KennzeichenUebersichtApp",appName = "KennzeichenUebersichtApp",name = "Kennzeichen",icon = "./img/vehicle_support.4a257081.svg"})
                      -- table.insert(apps, {id = "VehicleClawUebersichtApp",appName = "VehicleClawUebersichtApp",name = "Wegfahrsperren",icon = "./img/vehicle_support.4a257081.svg"})
                   end
               end)   
   
               if PlayerData.job.grade ~= 'uneymploed' then
                   ESX.TriggerServerCallback('hasFrakManagePerms', function( hasManagePerms )
                       ----print(hasManagePerms)
                       if hasManagePerms == true then
                           frakManageApp = true
                           ----print("frak true")
                           table.insert(apps, {id = "FraktionListApp",appName = "FraktionListApp",name = "Fraktion",icon = "./img/1055644.473a3c99.svg"})
                       end    
                   end)  
                        
               end 
               table.insert(apps, {id = "MarketplaceApp",appName = "MarketplaceApp",name = "GeBay",icon = "https://cdn.discordapp.com/attachments/841440545763229766/906177831892054026/gebay.png"})
               table.insert(apps, {id = "FahrzeugUebersichtApp",appName = "FahrzeugUebersichtApp",name = "Fahrzeuge",icon = "./img/189088.c55dd235.svg"})
              
               table.insert(apps, {id = "VehicleTaxApp",appName = "VehicleTaxApp",name = "Fahrzeug Steuern",icon = "./img/vehicle_support.4a257081.svg"})
               -- (DPOS APP) table.insert(apps, {id = "VehicleImpoundApp",appName = "VehicleImpoundApp",name = "Impound",icon = "./img/vehicle_support.4a257081.svg"})
               
               table.insert(apps, {id = "KFZRentApp",appName = "KFZRentApp",name = "Fahrzeugvermietung",icon = "./img/1055644.473a3c99.svg"})
               ESX.TriggerServerCallback('hasPlayerHouse', function(hasHouse)
                   if hasHouse == true then
                       table.insert(apps, {id = "HouseApp",appName = "HouseApp",name = "Haus",icon = "https://cdn.discordapp.com/attachments/841440545763229766/906178473779937350/HouseApp.svg"})
                   end
               end)
               table.insert(apps, {id = "EmailApp",appName = "EmailApp",name = "Email",icon = "https://cdn.discordapp.com/attachments/841440545763229766/906178081516040222/email.848343d4.png"}) 
               Wait(500)   
               SendNUIMessage({action="responseComputerApps", apps=json.encode(apps)})
           end  
       elseif data.args[1] == "HouseEdit" then
           if data.args[2] == "requestHouseData" then
                
               ESX.TriggerServerCallback('byte_house:getCash', function(houseCash)
                   ----print("hcash " .. houseCash)
                   SendNUIMessage({action="setHouseCash", cash=tonumber(houseCash)})
               end)
           elseif data.args[2] == "withDrawHouseCash" then
   
               TriggerServerEvent('byte_house:cashOut', data.args[3])
           end
       elseif data.args[1] == "ServiceListApp" then
           if data.args[2] == "requestOpenServices" then
    
               ESX.TriggerServerCallback('getOpenServices', function( openServices )
                   SendNUIMessage({action="responseOpenServiceList", services = json.encode(openServices)})
               end, PlayerData.job.name)
           elseif data.args[2] == "acceptOpenService" then 
               TriggerServerEvent('acceptService', data.args[3])
           elseif data.args[2] == "setGpsCoordinatesAccepted" then
               local data = json.decode(data.args[3])
               SetNewWaypoint(data.x + .0, data.y +.0)
           elseif data.args[2] == "callUserPhone" then
               TriggerServerEvent('startCall', data.args[3])
           end
       elseif data.args[1] == "ServiceOwnApp" then
           if data.args[2] == "requestOwnServices" then
    
               ESX.TriggerServerCallback('getOwnServices', function( openServices )
                   SendNUIMessage({action="responseOwnServiceList", services = json.encode(openServices)})
               end) 
           elseif data.args[2] == "finishOwnAcceptedService" then 
               TriggerServerEvent('finishService', data.args[3])
           elseif data.args[2] == "setGpsCoordinates" then
               local data = json.decode(data.args[3])
               SetNewWaypoint(data.x + .0, data.y +.0)
           elseif data.args[2] == "callUserPhone" then
               TriggerServerEvent('startCall', data.args[3])
           end
       elseif data.args[1] == "ServiceAcceptedApp" then
           if data.args[2] == "RequestTeamServiceList" then
     
               ESX.TriggerServerCallback('getFrakServices', function( openServices )
                   SendNUIMessage({action="responseFrakServiceList", services = json.encode(openServices)})
               end, PlayerData.job.name)  
           elseif data.args[2] == "setGpsCoordinatesAccepted" then
               local data = json.decode(data.args[3])
               SetNewWaypoint(data.x + .0, data.y +.0)
           elseif data.args[2] == "callUserPhone" then
               TriggerServerEvent('startCall', data.args[3])
           end
       elseif data.args[1] == "FraktionListApp" then
           if data.args[2] == "requestFraktionMembers" then
               ESX.TriggerServerCallback('getFrakMembers', function( members )
                   SendNUIMessage({action="responseComputerFrakMembers", a = json.encode({list = members, manage = true, hasDuty = true})})
               end, PlayerData.job.name)  
           end   
       elseif data.args[1] == "FraktionEditApp" then
           if data.args[2] == "editFraktionMember" then
               TriggerServerEvent('editFraktionMember', data.args[3], data.args[4], data.args[5], data.args[6])
   
           elseif data.args[2] == "kickFraktionMember" then
               TriggerServerEvent('kickFraktionMember', data.args[3], data.args[4], data.args[5])
           end
       elseif data.args[1] == "FahrzeugUebersichtApp" then
           if data.args[2] == "requestVehicleOverviewByCategory" then
               
               if blocked ~= true then
                   blocked = true
                   if data.args[3] == 0 then
   
                       ESX.TriggerServerCallback('getVehiclesForOverview', function( vehs )
                           SendNUIMessage({action="responseVehicleOverview", vehs = json.encode(vehs)})
                       end, 'owned')  
                   elseif data.args[3] == 1 then
   
                       ESX.TriggerServerCallback('getVehiclesForOverview', function( vehs )
                           SendNUIMessage({action="responseVehicleOverview", vehs = json.encode(vehs)})
                       end, 'keys')  
                   elseif data.args[3] == 2 then
       
                       ESX.TriggerServerCallback('getVehiclesForOverview', function( vehs )
                           SendNUIMessage({action="responseVehicleOverview", vehs = json.encode(vehs)})
                       end, 'fraktion')   
                   elseif data.args[3] == 3 then
   
                       
                       SendNUIMessage({action="responseVehicleOverview", vehs = json.encode({})})
                   
                   end
                   Wait(5000)
                   blocked = false
               else
                   TriggerEvent('glmp_singlenotify', '', 'Bitte warte 5 Sekunden!')
                   SendNUIMessage({action="responseVehicleOverview", vehs = json.encode({})})
               end
           end
       elseif data.args[1] == "KennzeichenUebersichtApp" then
           if data.args[2] == "requestVehicleOverviewByVehicleId" then
               ESX.TriggerServerCallback('getVehiclesForPlateOverview', function( vehs )
                   SendNUIMessage({action="responsePlateOverview", vehs = json.encode(vehs)})
               end, 'id', data.args[3])    
           elseif data.args[2] == "requestVehicleOverviewByPlate" then
               ESX.TriggerServerCallback('getVehiclesForPlateOverview', function( vehs )
                   SendNUIMessage({action="responsePlateOverview", vehs = json.encode(vehs)})
               end, 'plate', {data.args[3], data.args[4]})  
           end
       elseif data.args[1] == "EmailApp" then
           if data.args[2] == "requestEmails" then
               ESX.TriggerServerCallback('requestEmails', function(emails)
                   SendNUIMessage({action="responseEmails", mails = json.encode(emails)})
               end)
           elseif data.args[2] == "markEmailAsRead" then
               TriggerServerEvent('markEmailAsRead', data.args[3])
           elseif data.args[2] == "deleteMail" then
               TriggerServerEvent('deleteEmail', data.args[3])
           end 
       elseif data.args[1] == "PoliceAktenSearchApp" then
           if data.args[2] == "requestPlayerResults" then
               ESX.TriggerServerCallback('akten:requestPlayerResults', function(players)
                   SendNUIMessage({action='responsePlayerAktenResults', players = json.encode(players)})
               end, data.args[3])
           end
       elseif data.args[1] == "PoliceEditPersonApp" then
           ag2 = data.args[2]
           if editPersonCooldown[ag2] ~= true then
               if data.args[2] == "savePersonData" then
                   TriggerServerEvent('akten:savePersonData', data.args[3], data.args[4], data.args[5], data.args[6], data.args[7])
               elseif data.args[2] == "requestPersonData" then
                   ESX.TriggerServerCallback('akten:requestPlayerData', function(data)
                       ----print("DATA")
                       ----print(json.encode(data))
                       local d2 = json.encode(data)
                       ----print(d2['number']) 
                       SendNUIMessage({action='responsePlayerAktenData', address = data.address, number = data.number, membership = data.membership, info = data.info})
                   end, data.args[3])  
               elseif data.args[2] == "requestOpenCrimes" then
                   ESX.TriggerServerCallback('akten:requestPlayerOpenCrimes', function(crimes)
                       
                       SendNUIMessage({action='responsePlayerOpenCrimes', crimes = json.encode(crimes)})
                   end, data.args[3])  
                  -- editPersonCooldown[ag2] = true
                   --cooldown = 2000
               elseif data.args[2] == "requestJailTime" then
                   ESX.TriggerServerCallback('akten:requestPlayerJailData', function(data)
                       
                       SendNUIMessage({action='responseJailData', time = data.time, money = data.money})
                   end, data.args[3])  
               elseif data.args[2] == "removePlayerCrime" then 
                   TriggerServerEvent('akten:removePlayerCrime', data.args[4])
                   Wait(100)
                   ESX.TriggerServerCallback('akten:requestPlayerJailData', function(data)
                       SendNUIMessage({action='responseJailData', time = data.time, money = data.money})
                   end, data.args[3])  
                   ESX.TriggerServerCallback('akten:requestPlayerOpenCrimes', function(crimes)
                       
                       SendNUIMessage({action='responsePlayerOpenCrimes', crimes = json.encode(crimes)})
                   end, data.args[3])  
               elseif data.args[2] == "requestLicenses" then
                   ESX.TriggerServerCallback('akten:requestPlayerLicenses', function(lics)
                       
                       SendNUIMessage({action='responsePlayerLicenses', lics = json.encode(lics)})
                   end, data.args[3])  
               elseif data.args[2] == "removeAllCrimes" then 
                   TriggerServerEvent('akten:removeAllPlayerCrimes', data.args[3], PlayerData.identifier)
               end
               
               Wait(cooldown)
               editPersonCooldown[ag2] = false  
           else
               TriggerEvent('glmp_singlenotify', '', 'Bitte warte 5 Sekunden!')
               return
           end
       elseif data.args[1] == "PoliceEditWantedsApp" then 
           if data.args[2] == "requestWantedCategories" then
               SendNUIMessage({action='responseWantedCategories', categories = json.encode({{id = 1, name ="StVO", order = 1}, {id = 2, name ="BtMG", order = 2}, {id = 3, name ="StGB", order = 3}})})
           elseif data.args[2] == "requestCategoryReasons" then
               ESX.TriggerServerCallback('akten:requestCrimeReasons', function( reasons )
                   SendNUIMessage({action='responseCategoryReasons', reasons = json.encode(reasons)})    
               end, data.args[3])
               
           elseif data.args[2] == "addPlayerWanteds" then
               ----print(PlayerData.identifier)
               TriggerServerEvent('akten:addPlayerWanteds', data.args[3], data.args[4], PlayerData.identifier)
           elseif data.args[2] == "closeComputer" then
               SendNUIMessage({
                   action = "closeComputer"
               })
               SetNuiFocus(false, false)
               laptopOpen = false
               stopAnim()
           end
       elseif data.args[1] == "VehicleTaxApp" then
           if data.args[2] == "requestVehicleTaxByModel" then
               ESX.TriggerServerCallback('getVehDatabaseInfo', function(vehs)
                   ----print(json.encode(vehs))
                   SendNUIMessage({action='responseVehTax', tax = json.encode(vehs)})
               end, data.args[3])
           end
       elseif data.args[1] == "BusinessDetailApp" then
           if data.args[2] == "requestBusinessDetail" then
               SendNUIMessage({action='responseBusinessDetail', detail = {json.encode({"Mitglieder", "Tankstelle"})}})
           end
       elseif data.args[1] == "MarketplaceApp" then
           if data.args[2] == "requestMarketplaceCategories" then
               SendNUIMessage({action='responseMarketplaceApp', data = json.encode(category)})
           end
       end
   end)  
   

   
   RegisterNetEvent('requestVehicleName')
   AddEventHandler('requestVehicleName', function(plate, hash) 
       ----print("SEZ CLIENT NAME FOR ".. plate)
       TriggerServerEvent('setVehicleName', plate, GetDisplayNameFromVehicleModel(hash))
    end)
    
   
   function parkCar(plate, act)
       local vehicle = ESX.Game.GetVehicles()
       veh = false
       for i=1, #vehicle, 1 do 
            
           local vehicleProps = ESX.Game.GetVehicleProperties(vehicle[i])
           if vehicleProps == nil then
               TriggerEvent('glmp_singlenotify', '', 'Es sind keine Fahrzeuge auf der Map.')
               return
           end
           if vehicleProps.plate == plate then 
               if act == 'park' then
                   TriggerEvent('glmp_singlenotify', '', 'Fahrzeug wurde in die Würfelpark Garage eingeparkt und despawned!')
                   TriggerServerEvent('byte_adminsystem:parkCar', plate, 18)
                   ESX.Game.DeleteVehicle(vehicle[i])
               elseif act == 'tp' then
                   ESX.Game.Teleport(PlayerPedId(), GetEntityCoords(vehicle[i]), function()
                   end)  
                   TriggerEvent('glmp_singlenotify', '', 'Du wurdest zum Fahrzeug Teleportiert!')
                   
               end
               veh = true 
           end
       end
       if act == 'park' then
           if veh ~= true then 
               TriggerEvent('glmp_singlenotify', '', 'Fahrzeug wurde in die Würfelpark Garage eingeparkt!')
               TriggerServerEvent('byte_adminsystem:parkCar', plate, 18)
           end
       elseif act == 'tp' then
           if veh ~= true then 
               TriggerEvent('glmp_singlenotify', '', 'Fahrzeug befindet sicht nicht auf der Map!')
               
           end
       end
       
   end
   
   -- CUBE
   
   ESX                           = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
   
   end)
   
   function startAnimS(lib, anim)
       ESX.Streaming.RequestAnimDict(lib, function()
           TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
       end)
   end
   
   RegisterNetEvent('byte:würfeln')
   AddEventHandler('byte:würfeln', function() 
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
       local num = math.random(1, 20)  
       ClearPedTasksImmediately(PlayerPedId())  
       startAnimS("anim@mp_player_intincarwankstd@rps@", "idle_a") 
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       Wait(3000)  
       ClearPedTasksImmediately(PlayerPedId()) 
       if closestPlayer ~= -1 and closestDistance <= 3.0 then 
           TriggerServerEvent('WÜRFEL', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), num)
       else
           TriggerServerEvent('WÜRFEL1', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), num)
       end
   end)
    
   
   
     --CUFF
   
     ESX = nil
   local IsHandcuffed2 = false
   
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   end)
   cuffed2 = false
   RegisterNetEvent("bens_cuff_item:checkCuff")
   AddEventHandler("bens_cuff_item:checkCuff", function()
       local player, distance = ESX.Game.GetClosestPlayer()
       if distance~=-1 and distance<=3.0 then
           ESX.TriggerServerCallback("bens_cuff_item:isCuffed",function(cuffed)
               if cuffed2 == false then
                   TriggerServerEvent("bens_cuff_item:handcuff",GetPlayerServerId(player),true)
                   TriggerServerEvent('cuffnotify', GetPlayerServerId(player), 'Ein Beamter hat ihnen die Hanschellen vorne Angelegt/Abgenommen!')
                   TriggerEvent('glmp_singlenotify',  '', 'Sie haben jemanden die Hanschellen vorne Angelegt/Abgenommen!')
                   cuffed2 = true
               else
                   TriggerEvent("bens_cuff_item:uncufffürbeamte")
                   TriggerServerEvent('cuffnotify', GetPlayerServerId(player), 'Ein Beamter hat ihnen die Hanschellen vorne Angelegt/Abgenommen!')
                   TriggerEvent('glmp_singlenotify',  '', 'Sie haben jemanden die Hanschellen vorne Angelegt/Abgenommen!')
                   cuffed2 = false
               end
               TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.0, 'busted', 1.0)
           end,GetPlayerServerId(player)) 
       else
           exports['glmp_notify']:SendAlert('error', 'Keine Spieler in der Nähe')
       end
   end)
         
   
   RegisterNetEvent("bens_cuff_item:uncuff")
   AddEventHandler("bens_cuff_item:uncuff",function()
       local player, distance = ESX.Game.GetClosestPlayer()
       if distance~=-1 and distance<=3.0 then
           TriggerServerEvent("bens_cuff_item:uncuff",GetPlayerServerId(player))
       else
           exports['glmp_notify']:SendAlert('error', 'Keine Spieler in der Nähe')
       end
   end)
   
   RegisterNetEvent("bens_cuff_item:uncufffürbeamte")
   AddEventHandler("bens_cuff_item:uncufffürbeamte",function()
       local player, distance = ESX.Game.GetClosestPlayer()
       if distance~=-1 and distance<=3.0 then
           TriggerServerEvent("bens_cuff_item:uncufffürbeamte",GetPlayerServerId(player))
       else
           exports['glmp_notify']:SendAlert('error', 'Keine Spieler in der Nähe')
       end
   end)
   
   
   RegisterNetEvent('bens_cuff_item:forceUncuff')
   AddEventHandler('bens_cuff_item:forceUncuff',function()
       IsHandcuffed2 = false
       local playerPed = GetPlayerPed(-1)
       ClearPedSecondaryTask(playerPed)
       SetEnableHandcuffs(playerPed, false)
       DisablePlayerFiring(playerPed, false)
       SetPedCanPlayGestureAnims(playerPed, true)
       FreezeEntityPosition(playerPed, false)
       DisplayRadar(true)
   end)
   
   RegisterNetEvent("bens_cuff_item:handcuff")
   AddEventHandler("bens_cuff_item:handcuff",function()
       local playerPed = GetPlayerPed(-1)
       IsHandcuffed2 = not IsHandcuffed2
       Citizen.CreateThread(function()
           if IsHandcuffed2 then
               ClearPedTasks(playerPed)
               SetPedCanPlayAmbientBaseAnims(playerPed, true)
   
               Citizen.Wait(10)
               RequestAnimDict('anim@move_m@prisoner_cuffed')
               while not HasAnimDictLoaded('anim@move_m@prisoner_cuffed') do
                   Citizen.Wait(0)
               end
               Citizen.Wait(0)
               TaskPlayAnim(playerPed, 'anim@move_m@prisoner_cuffed', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
   
               SetEnableHandcuffs(playerPed, true)
               DisablePlayerFiring(playerPed, true)
               SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
               SetPedCanPlayGestureAnims(playerPed, false)
               DisplayRadar(false)
           end
       end)
   end)
   
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           local playerPed = GetPlayerPed(-1)
           if IsHandcuffed2 then
               SetEnableHandcuffs(playerPed, true)
               DisablePlayerFiring(playerPed, true)
               SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
               SetPedCanPlayGestureAnims(playerPed, false)
               DisplayRadar(false)
               DisableControlAction(0, 140, true)
               DisableControlAction(0, 74, true)
               DisableControlAction(0, 2, true) -- Disable pan
               DisableControlAction(0, 263, true) -- Melee Attack 1
               DisableControlAction(0, 45, true) -- Reload
               DisableControlAction(0, 22, true) -- Jump
               DisableControlAction(0, 44, true) -- Cover
               DisableControlAction(0, 37, true) -- Select Weapon
               DisableControlAction(0, 288,  true) -- Disable phone
               DisableControlAction(0, 289, true) -- Inventory
               DisableControlAction(0, 170, true) -- Animations
               DisableControlAction(0, 167, true) -- Job
               DisableControlAction(1, 254, true)
               DisableControlAction(0, 47, true)  -- Disable weapon
           end
           if not IsHandcuffed2 and not IsControlEnabled(0, 140) then EnableControlAction(0, 140, true)  end
           if not IsHandcuffed2 and not IsControlEnabled(0, 74) then EnableControlAction(0, 74, true)  end
       end
   end)
   
   -- DEADCAM
   
   
   
   Cfg = {}
   
   -- maximum radius the camera will orbit at (in meters)
   Cfg.radius = 1.5
   
   
   -- main variables
   local cam = nil
   
   local isDead = false
   
   local angleY = 0.0
   local angleZ = 0.0
   
   
   --------------------------------------------------
   ---------------------- LOOP ----------------------
   --------------------------------------------------
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(1)
           
           -- process cam controls if cam exists and player is dead
           if (cam and isDead) then
               ProcessCamControls()
           end
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(500)
           
           if (not isDead and NetworkIsPlayerActive(PlayerId()) and IsPedFatallyInjured(PlayerPedId())) then
               isDead = true
               
               StartDeathCam()
           elseif (isDead and NetworkIsPlayerActive(PlayerId()) and not IsPedFatallyInjured(PlayerPedId())) then
               isDead = false
               
               EndDeathCam()
           end
       end
   end)
   
   
   
   --------------------------------------------------
   ------------------- FUNCTIONS --------------------
   --------------------------------------------------
   
   -- initialize camera
   function StartDeathCam()
       ClearFocus()
   
       local playerPed = PlayerPedId()
       
       cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), 0, 0, 0, GetGameplayCamFov())
   
       SetCamActive(cam, true)
       RenderScriptCams(true, true, 1000, true, false)
   end
   
   -- destroy camera
   function EndDeathCam()
       ClearFocus()
   
       RenderScriptCams(false, false, 0, true, false)
       DestroyCam(cam, false)
       
       cam = nil
   end
   
   -- process camera controls
   function ProcessCamControls()
       local playerPed = PlayerPedId()
       local playerCoords = GetEntityCoords(playerPed)
   
       -- disable 1st person as the 1st person camera can cause some glitches
       DisableFirstPersonCamThisFrame()
       
       -- calculate new position
       local newPos = ProcessNewPosition()
   
       -- focus cam area
       SetFocusArea(newPos.x, newPos.y, newPos.z, 0.0, 0.0, 0.0)
       
       -- set coords of cam
       SetCamCoord(cam, newPos.x, newPos.y, newPos.z)
       
       -- set rotation
       PointCamAtCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)
   end
   
   function ProcessNewPosition()
       local mouseX = 0.0
       local mouseY = 0.0
       
       -- keyboard
       if (IsInputDisabled(0)) then
           -- rotation
           mouseX = GetDisabledControlNormal(1, 1) * 8.0
           mouseY = GetDisabledControlNormal(1, 2) * 8.0
           
       -- controller
       else
           -- rotation
           mouseX = GetDisabledControlNormal(1, 1) * 1.5
           mouseY = GetDisabledControlNormal(1, 2) * 1.5
       end
   
       angleZ = angleZ - mouseX -- around Z axis (left / right)
       angleY = angleY + mouseY -- up / down
       -- limit up / down angle to 90°
       if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end
       
       local pCoords = GetEntityCoords(PlayerPedId())
       
       local behindCam = {
           x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (Cfg.radius + 0.5),
           y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (Cfg.radius + 0.5),
           z = pCoords.z + ((Sin(angleY))) * (Cfg.radius + 0.5)
       }
       local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, PlayerPedId(), 0)
       local a, hitBool, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
       
       local maxRadius = Cfg.radius
       if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords) < Cfg.radius + 0.5) then
           maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords)
       end
       
       local offset = {
           x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
           y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
           z = ((Sin(angleY))) * maxRadius
       }
       
       local pos = {
           x = pCoords.x + offset.x,
           y = pCoords.y + offset.y,
           z = pCoords.z + offset.z
       }
       
       
       -- Debug x,y,z axis
       --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.03, 0.03, 5.0, 0, 0, 255, 255, false, false, 2, false, 0, false)
       --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, 0.03, 0.03, 5.0, 255, 0, 0, 255, false, false, 2, false, 0, false)
       --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.03, 0.03, 5.0, 0, 255, 0, 255, false, false, 2, false, 0, false)
       
       return pos
   end
   
   --XAchse Westen Osten
   --Yachse Norden Süden
   --ZAchse oben unten
   
   --gegenkathete = x
   --ankathete = y
   --hypotenuse = 1
   --alpha = GetCamRot(cam).z
   
   --- DEALER
   
   function openLegalDealer()
   
       elements = {
           {label = 'Schließen', action = 'close'},
           {label = 'V | Kaffeebohnen Kiste (1.250$)', action = 'kbohnekiste'},
           {label = 'V | Batterien (900$)', action = 'batterien'},
           {label = 'V | Chicken Filet Kiste (1.000$)', action = 'chickenfilet'}
       }
   
   
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dealerl', {
           title    = 'Supermarkt Export',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           
           if data.current.action == 'close' then
               ESX.UI.Menu.CloseAll()
           else 
               TriggerServerEvent('dealer:sell', data.current.action)
           end   
       end, function(data, menu)
           menu.close()
       end)
   end
   
    
   function openIllegalDealer()
   
       elements = {
           {label = 'Schließen', action = 'close'},
           {label = 'V | Hanfkiste (5.000$)', action = 'weedkiste'}
       }
   
   
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dealeri', {
           title    = 'Dealer',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           
           if data.current.action == 'close' then
               ESX.UI.Menu.CloseAll()
           else  
               TriggerServerEvent('dealer:sell', data.current.action)
           end   
       end, function(data, menu)
           menu.close()
       end)
   end
   
   function openWestenDealer()
   
       elements = {
           {label = 'Schließen', action = 'close'},
           {label = 'H | Weste (1.000$)', action = 'bulletproof'}
       }
   
   
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dealeri', {
           title    = 'Westen Herstellung',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           
           if data.current.action == 'close' then
               ESX.UI.Menu.CloseAll()
           else  
               TriggerServerEvent('dealer:sell', data.current.action)
           end   
       end, function(data, menu)
           menu.close()
       end)
   end 
   
   
   dealer = {
       {id = 1, type = 'legal', posX = 1960.92,  posY = 3753.68,  posZ = 32.24, h = 298.03 } ,
       {id = 2, type = 'illegal', posX = 1300.44,  posY = 4320.04,  posZ = 38.2, h = 305.43 },
       {id = 3, type = 'weste', posX = -237.08,  posY = -2442.36,  posZ = 6.0, h = 238.1 }   
   
   } 
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(1)
           for _,v in pairs(dealer) do 
               local player = GetPlayerPed(-1)
               local playerloc = GetEntityCoords(player, 0) 
               local distance = GetDistanceBetweenCoords(v.posX, v.posY, v.posZ, playerloc['x'], playerloc['y'], playerloc['z'], true)
               if distance < 2 then 
                   if showDistMsg ~= true then 
                       if v.type ~= 'weste' then
                           ESX.ShowNotification('Benutze E um auf den Dealer zuzugreifen!')
                       else
                           ESX.ShowNotification('Benutze E um auf die Westen Herstellung zuzugreifen!')
                       end 
                       showDistMsg = true 
                   end 
                   if IsControlJustPressed(1,51) then 
                       if v.type == 'legal' then 
                           openLegalDealer()
                       elseif v.type == 'illegal' then 
                           openIllegalDealer()
                       elseif v.type == 'weste' then 
                           openWestenDealer()  
                       end
                   end
               elseif distance > 2 and distance < 4 then 
                   showDistMsg = false 
               end
           end  
       end  
       
   end) 
   
   Citizen.CreateThread(function()
       for _,v in pairs(dealer) do
           RequestModel(GetHashKey("a_m_o_acult_02"))
           while not HasModelLoaded(GetHashKey("a_m_o_acult_02")) do
             Wait(1)
           end
       
           RequestAnimDict("mini@strip_club@idles@bouncer@base")
           while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
             Wait(1)
           end
           ped =  CreatePed(4, 0x4BA14CCA,v.posX, v.posY,v.posZ-1, 3374176, false, true)
           SetEntityHeading(ped, v.h) 
           FreezeEntityPosition(ped, true)
           SetEntityInvincible(ped, true) 
           SetBlockingOfNonTemporaryEvents(ped, true)
       end
   end)
   
   -- EINREISEAMT
   
   ESX = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(500)
       end
   end)
   
   
   local einreiseamt_drin = {x = -1140.56,  y = -2806.16,  z = 27.72}
   local einreiseamt_drausen = {x = -1042.96,  y = -2746.64,  z = 21.36}
   local veinreiseamt_drin = vector3(einreiseamt_drin.x, einreiseamt_drin.y, einreiseamt_drin.z)
   local veinreiseamt_drausen = vector3(einreiseamt_drausen.x, einreiseamt_drausen.y, einreiseamt_drausen.z)
   
   einreiseamt = false
   
   RegisterNetEvent('byte_einreise:join')
   AddEventHandler('byte_einreise:join', function(source)
       ESX.TriggerServerCallback('byte_einreise:getEinreise', function(einreise)
           if einreiseamt == true then
               if einreise ~= 1 then
                   if einreise == 0 or 2 then
                       local ped = PlayerPedId()
                       SetEntityCoords(ped, veinreiseamt_drin, false, false, false, true)
                       --TriggerEvent('glmp_notify', 'darkgreen', 'Einreiseamt', 'Du hast noch kein Visum. Du musst zuerst das Einreisegespräch Absolvieren.')
                   end
               end
           else
               if einreise == 0 then
                   local ped = PlayerPedId()
                   SetEntityCoords(ped, veinreiseamt_drausen, false, false, false, true)
                   TriggerServerEvent('byte_einreise:setTempEinreise', source)
                   TriggerEvent('glmp_notify', '', '', 'Wir haben dir ein Temporäres Visum genehmigt. Viel Spaß auf GUMP!')
               end
           end
       end)
       
   end)
   
   
   
   
   
   RegisterNetEvent('byte_einreise:bestanden')
   AddEventHandler('byte_einreise:bestanden', function(source)
       local ped = PlayerPedId()
       
      -- TriggerEvent('updateDimensions', 0)
       TriggerEvent('glmp_notify', '', '', 'Ihnen wurde die Einreise genehmigt. Viel Spaß auf GUMP!')
   end)
   
   
   einreisebeamter = {
       male = {
           ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
           ['torso_1'] = 322,   ['torso_2'] = 0,
           ['decals_1'] = 0,   ['decals_2'] = 0,
           ['arms'] = 4,
           ['pants_1'] = 28,   ['pants_2'] = 0,
           ['shoes_1'] = 10,   ['shoes_2'] = 0,
           ['helmet_1'] = -1,  ['helmet_2'] = 0,
           ['mask_1'] = 0,  ['mask_2'] = 0,
           ['chain_1'] = 115,    ['chain_2'] = 0,
           ['ears_1'] = 0,     ['ears_2'] = 0,
           ['bags_1'] = 0,     ['bags_2'] = 0,
           ['bproof_1'] = 0,  ['bproof_2'] = 0
       },
       female = {
           ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
           ['torso_1'] = 300,   ['torso_2'] = 1,
           ['decals_1'] = 0,   ['decals_2'] = 0,
           ['arms'] = 8,
           ['pants_1'] = 121,   ['pants_2'] = 1,
           ['shoes_1'] = 82,   ['shoes_2'] = 1,
           ['helmet_1'] = 23,  ['helmet_2'] = 0,
           ['mask_1'] = 153,  ['mask_2'] = 9,
           ['chain_1'] = 0,    ['chain_2'] = 0,
           ['ears_1'] = 0,     ['ears_2'] = 0,
           ['bags_1'] = 0,     ['bags_2'] = 0,
           ['bproof_1'] = 0,  ['bproof_2'] = 0			
       } 
   }
   
   einreiseDienst = false 
   
   RegisterNetEvent('byte:einreiseDuty')
   AddEventHandler('byte:einreiseDuty', function()
       --ESX.TriggerServerCallback('byte:getAdminLevel', function(permlevel)
           --if permlevel > 89 then
               local ped = PlayerPedId()
               if einreiseDienst then 
                   local vplayerCoords = vector3(playerCoords.x, playerCoords.y, playerCoords.z)
                   SetEntityCoords(ped, vplayerCoords, false, false, false, true) 
                   einreiseDienst = false
                   TriggerEvent('glmp_notify', '', 'Einreiseamt', 'Du bist nun nicht mehr im Dienst.')
                  -- TriggerEvent('updateDimensions', 0)
                   ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                       TriggerEvent('skinchanger:loadSkin', skin)
                   end)
               else
                   playerCoords = GetEntityCoords(ped)
                   SetEntityCoords(ped, veinreiseamt_drin, false, false, false, true)
                   TriggerEvent('glmp_notify', '', 'Einreiseamt', 'Du bist nun im Dienst.')
                   einreiseDienst = true
                  -- TriggerEvent('updateDimensions', 88)
                   TriggerEvent('skinchanger:getSkin', function(skin)
                       if skin.sex == 0 then
                           TriggerEvent("skinchanger:loadClothes", skin, einreisebeamter.male)											
                       else
                           TriggerEvent("skinchanger:loadClothes", skin, einreisebeamter.female)											
                       end
                   end)
               end
           ---end
       --end) 
   end)
   
   
   
   
   showEK = false
   Citizen.CreateThread(function( )
       while true do
           Citizen.Wait(1)
           if einreiseDienst == false then
               local player = GetPlayerPed(-1)
               local playerloc = GetEntityCoords(player, 0)
               local distance = GetDistanceBetweenCoords(-1065.68, -2797.76, 27.72, playerloc['x'], playerloc['y'], playerloc['z'], true)
               ----print(distance)
               if distance < 3 then 
                   if showEK ~= true then 
                       ESX.ShowNotification("Nutze E um das Einreiseamt zu verlassen!")
                       showEK = true 
                   end
   
                   if IsControlJustPressed(1,51) then 
                       ESX.TriggerServerCallback('byte_einreise:getEinreise', function(einreise)
                           if einreise ~= 0 then
                               SetEntityCoords(player, veinreiseamt_drausen, false, false, false, true)
                           else
                               ESX.ShowNotification("Du musst zuerst dein Einreisegespräch Absolvieren!")
                           end
                       end)
                   end
               elseif distance > 3 and distance < 3.5 then 
                   showEK = false 
               end
           end
       end
   end)
   
   -- FARMING
   
   ESX = nil
   playerWorkstation = nil
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
       ESX.TriggerServerCallback('workstation:get', function( station )
           playerWorkstation = station
           ----print(station)
       end)
   end)
   
   farming = { 
       {id = 1, needItem = 'sichel', item = 'weed', tickAnim = 2000, tick = 2000, posX = -2285.02, posY = 2749.68, posZ = 2.88, distance = 10, maxed = 3, minimum = 1},
       {id = 2, needItem = 'sichel', item = 'aramid', tickAnim = 2500, tick = 2500, posX = 1917.48,  posY = 4758.84,  posZ = 42.68, distance = 20, maxed = 3, minimum = 2},
       {id = 3, needItem = 'kaefig', item = 'chicken', tickAnim = 2000, tick = 2000, posX = 2184.4,  posY = 5568.08,  posZ = 55.0, distance = 20, minimum = 1, maxed = 2},
       {id = 4, needItem = 'sichel', item = 'kbohne', tickAnim = 2000, tick = 2000, posX = 270.32,  posY = 6612.48,  posZ = 29.96, distance = 20, minimum = 1, maxed = 3},
       {id = 5, needItem = 'presslufthammer', item = 'zinkkohle', tickAnim = 2000, tick = 2000, posX = 2945.92,  posY = 2791.55,  posZ = 40.46, distance = 20, minimum = 1, maxed = 3}  
   
   }  
        
   verarbeiter = {
       {id = 1, item = 'weed', vitem = 'weedsamen', itemFrom = 4, itemTo = 1, tick = 1200, posX = 1218.72, posY = 1848.93, posZ = 78.97, h = 228.12, distance = 5},
       {id = 2, item = 'aramid', vitem = 'kevlar', itemFrom = 3, itemTo = 1, tick = 2000, posX = 2553.56, posY = 4669.76, posZ = 33.96, h = 14.12, distance = 5},
       {id = 3, item = 'zinkkohle', vitem = 'batterien', itemFrom = 10, itemTo = 3, tick = 5000, posX = 287.47, posY = 2843.81, posZ = 44.7, h = 117.2, distance = 5},
       {id = 4, item = 'chicken', vitem = 'chickenfilet', itemFrom = 3, itemTo = 1, tick = 6000, posX = -73.48,  posY = 6260.4,  posZ = 31.08, h = 293.69, distance = 2},
       {id = 5, item = 'kbohne', vitem = 'kbohnekiste', itemFrom = 5, itemTo = 1, tick = 8000, posX = -691.28,  posY = 5784.76,  posZ = 17.32, h = 238.38, distance = 2}
    }   
   
   playerFarmingTick = nil
                                   playerFarmingTickAnim = nil
                                   playerFarmingItem = nil 
                                   playerFarmingPos = {}
                                   playerFarmingDistance = nil
                                   playerFarmingItemMax = nil
                                   playerFarmingItemMin = nil 
    
   -- FARMING
   Citizen.CreateThread(function( )
       while true do
           Citizen.Wait(1)
           local player = GetPlayerPed(-1)
           local playerloc = GetEntityCoords(player, 0)
           for _, farming in pairs(farming) do
               local distance = GetDistanceBetweenCoords(farming.posX, farming.posY, farming.posZ, playerloc['x'], playerloc['y'], playerloc['z'], true)
               if distance < farming.distance then 
                   if showFarmMsg ~= true then 
                       ESX.ShowNotification("Benutze E um ".. farming.item .. " zu Farmen!")
                       showFarmMsg = true 
                   end
                   if IsControlJustPressed(1,51) then 
                       if playerFarming ~= true then
                           ESX.TriggerServerCallback('farming:hasNeededItem', function(hasItem)
                               if hasItem == true then
                                   ESX.ShowNotification("Farming wurde gestartet...")  
                                   playerFarming = true
                                   playerFarmingTick = farming.tick
                                   playerFarmingTickAnim = farming.tickAnim
                                   playerFarmingItem = farming.item  
                                   playerFarmingPos = {x = farming.posX, y = farming.posY, z = farming.posZ}
                                   playerFarmingDistance = farming.distance
                                   playerFarmingItemMax = farming.maxed
                                   playerFarmingItemMin = farming.minimum 
                                   FreezeEntityPosition(player, true)
                               else 
                                   ESX.ShowNotification("Du benötigst ein/e ".. farming.needItem:upper())
                               end
                           end, farming.needItem)
                       else
                           playerFarming = false 
                           playerFarmingTick = nil
                                   playerFarmingTickAnim = nil
                                   playerFarmingItem = nil 
                                   playerFarmingPos = {}
                                   playerFarmingDistance = nil
                                   playerFarmingItemMax = nil
                                   playerFarmingItemMin = nil
                           ESX.ShowNotification("Farming wurde gestoppt..")
                           FreezeEntityPosition(player, false)
                       end
                   end
               elseif distance > farming.distance and distance < farming.distance + 5 then 
                   showFarmMsg = false 
               end
           end 
       end
   end) 
   
   Citizen.CreateThread(function( )
       while true do
           Citizen.Wait(1)
           if playerFarming == true then
               ----print("farming true")
               Citizen.Wait(playerFarmingTickAnim)
               if playerFarming == true then
                   
               
                   playerFarminAnim()
                   
                   Citizen.Wait(playerFarmingTick)
                   if playerFarming == true then
                       
                       local player = GetPlayerPed(-1)
                       local playerloc = GetEntityCoords(player, 0)
                       local distance = GetDistanceBetweenCoords(playerFarmingPos.x, playerFarmingPos.y, playerFarmingPos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
                       if distance < playerFarmingDistance then 
                           citemc = math.random(playerFarmingItemMin, playerFarmingItemMax)
                           ESX.TriggerServerCallback('canInInventory', function(can)
                               if can == true then
                                   TriggerServerEvent('farming:item', playerFarmingItem, citemc)
                                   playerFarminAnim() 
                               else 
                                   playerFarming = false
                                   ESX.ShowNotification("Dein Inventar ist voll!")
                                   ESX.ShowNotification("Farming wurde gestoppt..")
                                   FreezeEntityPosition(player, false)
                               end
   
                           end, playerFarmingItem, citemc)
                       else 
                           playerFarming = false
                           ESX.ShowNotification("Farming wurde gestoppt..")
                           FreezeEntityPosition(player, false)
                       end
                   end
               end
           end
       end
   end)
   
   function playerFarminAnim()
       local ped = PlayerPedId()
       local AnimationLib = 'anim@mp_snowball'
       local AnimationStatus = 'pickup_snowball'
   
       RequestAnimDict(AnimationLib)
       TaskPlayAnim(ped, AnimationLib, AnimationStatus, 8.0, -1, -1, 0, 1, 0, 0, 0)
   end
   
   -- VERARBEITER
   
   Citizen.CreateThread(function( ) 
       while true do
           Citizen.Wait(1)
           local player = GetPlayerPed(-1)
           local playerloc = GetEntityCoords(player, 0)
           for i = 1, #verarbeiter, 1 do 
               local distance = GetDistanceBetweenCoords(verarbeiter[i].posX, verarbeiter[i].posY, verarbeiter[i].posZ, playerloc['x'], playerloc['y'], playerloc['z'], true)
               if distance < verarbeiter[i].distance then 
   
                   if IsControlJustPressed(1,51) then 
                       --print(verarbeiter[i].id)
                       if playerVerarbeitung ~= true then 
                           ESX.TriggerServerCallback('farming:items', function(items)
                               if items >= verarbeiter[i].itemFrom then
                                   ESX.ShowNotification("Verarbeitung gestartet...")
                                   FreezeEntityPosition(player, true)  
                                   playerVerarbeitung = true 
                                   ----print(items)
                                   local get = math.floor(items / verarbeiter[i].itemFrom)
                                   local remove = math.floor(items / verarbeiter[i].itemFrom) * verarbeiter[i].itemFrom  
                                   TriggerEvent("patron_inventory:progressbar", items / verarbeiter[i].itemFrom * verarbeiter[i].itemTo * verarbeiter[i].tick)
                                   Citizen.Wait(items / verarbeiter[i].itemFrom * verarbeiter[i].itemTo * verarbeiter[i].tick)   
                                   --TriggerServerEvent('farming:veritem', verarbeiter[i].vitem, 1, verarbeiter[i].item, 1)
    
                                   ESX.ShowNotification("Verarbeitung beendet...") 
                                   FreezeEntityPosition(player, false)   
                                   playerVerarbeitung = false   
                                   TriggerServerEvent('farming:veritem', verarbeiter[i].item, remove, verarbeiter[i].vitem, get)
                                   
                                   
                               else
                                   ESX.ShowNotification("Du hast zu wenig ".. verarbeiter[i].item .. "!")
                               end 
                           end, verarbeiter[i].item)
                    
                       end
                   end
               end
           end 
       end 
   end) 
   
   
   -- WORKSTATIONS    
   
   workstations = { 
       {id = 1, label = "Hanf", name = 'weed', price = 100000, item = 'weedsamen', vitem = 'weedkiste', itemFrom = 3, itemTo = 1, tick = 200000, posX = 1466.2, posY = 6547.65, posZ = 14.14, h = 85.99, distance = 2},
       {id = 2, label = "Kevlar", name = 'bulletproof', price = 12000, item = 'aramidfaser', vitem = 'bulletproof', itemFrom = 3, itemTo = 1, tick = 100000, posX = -268.69, posY = -2492.33, posZ = 6.0, h = 224.94, distance = 2}
--       {id = 3, label = "Huhn", name = 'chicken', price = 2000, item = 'chicken', vitem = 'chickenfilet', itemFrom = 3, itemTo = 1, tick = 140000, posX = -73.48,  posY = 6260.4,  posZ = 31.08, h = 293.69, distance = 2},
--       {id = 4, label = "Kaffee", name = 'coffee', price = 2000, item = 'kbohne', vitem = 'kbohnekiste', itemFrom = 5, itemTo = 1, tick = 100000, posX = -691.28,  posY = 5784.76,  posZ = 16.32, h = 238.38, distance = 2}   
   }   
       
                
   
   Citizen.CreateThread(function() 
       Wait(2000)
       while true do 
           Citizen.Wait(1)
           
           local player = GetPlayerPed(-1)
           local playerloc = GetEntityCoords(player, 0)
           for _, workstation in pairs(workstations) do
              
               if playerWorkstation == workstation.name then    
                   Citizen.Wait(workstation.tick)
                   TriggerServerEvent('workstation:verarbeiten', workstation.name, workstation.item, workstation.itemFrom, workstation.vitem, workstation.itemTo)
               end
           end
           
       end  
   end)   
   
   
   RegisterNetEvent('workstation:update')
   AddEventHandler('workstation:update', function()
       ESX.TriggerServerCallback('workstation:get', function( station )
           playerWorkstation = station
           TriggerEvent('workstation:openBuyMenu', label, name, price)
       end)
   end)
   function buyWorkStation(label, name, price)
       ESX.TriggerServerCallback('workstation:get', function( station )
           playerWorkstation = station
           TriggerEvent('workstation:openBuyMenu', label, name, price)
       end)
   end
   
   Citizen.CreateThread(function( )
       while true do 
           Citizen.Wait(1)
           local player = GetPlayerPed(-1)
           local playerloc = GetEntityCoords(player, 0)
           for _, verarbeiter in pairs(workstations) do
               local distance = GetDistanceBetweenCoords(verarbeiter.posX, verarbeiter.posY, verarbeiter.posZ, playerloc['x'], playerloc['y'], playerloc['z'], true)
               if distance < verarbeiter.distance then 
    
                   if IsControlJustPressed(1,51) then  
                       if playerWorkstation ~= verarbeiter.name then
                           buyWorkStation(verarbeiter.label, verarbeiter.name, verarbeiter.price)
                       else
                           TriggerEvent('glmp_notify', '', 'WORKSTATION', 'Du bist hier bereits eingemietet!')
                       end
                   end
               end
           end 
       end 
   end) 
   
   wasinside = false
   Citizen.CreateThread(function()
      
       
       while true do 
           Wait(100) 
           for _, w in pairs(workstations) do 
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), w.posX, w.posY, w.posZ, true)
              
               if dist < w.distance then
                   if wasinside == false then
                       TriggerEvent('static_interact', "E", "show")
                       wasinside = true
                   end
               elseif dist > w.distance and dist < w.distance + 2 then
                   if wasinside then
                       wasinside = false 
                       TriggerEvent('static_interact', "E", "hide")
                   end
               end
           end
   
           for _, w in pairs(verarbeiter) do 
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), w.posX, w.posY, w.posZ, true)
               
               if dist < w.distance then
                   if wasinside == false then
                       TriggerEvent('static_interact', "E", "show")
                       wasinside = true
                   end
               elseif dist > w.distance and dist < w.distance + 2 then
                   if wasinside then
                       wasinside = false 
                       TriggerEvent('static_interact', "E", "hide")
                   end
               end
           end
       end
   end)
   
   farmingpeds = {
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2184.12, 5568.6, 51.0), h = 331.65 },
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2175.76, 5569.84, 53.92), h = 218.32 },
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2181.16, 5574.72, 52.92), h = 166.7 },
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2187.36, 5573.24, 52.88), h = 252.43},
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2186.04, 5563.24, 52.64), h = 80.64},
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2180.52, 5560.24, 53.52), h = 11.64},
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2179.48, 5564.64, 53.76), h = 126.97},
       {id = 1, name = "a_c_hen", hash = 0x6AF51FAF, pos = vector3(2189.36, 5581.92, 56.04), h = 145.97}
   }
   
   Citizen.CreateThread(function()
   
       for _,v in pairs(workstations) do
         RequestModel(GetHashKey("s_m_m_autoshop_02"))
         while not HasModelLoaded(GetHashKey("s_m_m_autoshop_02")) do
           Wait(1)
         end
     
         RequestAnimDict("mini@strip_club@idles@bouncer@base")
         while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
           Wait(1)
         end
         ped =  CreatePed(4, 0xF06B849D,v.posX, v.posY,v.posZ-1, 3374176, false, true)
         SetEntityHeading(ped, v.h)
         FreezeEntityPosition(ped, true)
         SetEntityInvincible(ped, true) 
         SetBlockingOfNonTemporaryEvents(ped, true)
       end
   
       for _,v in pairs(farmingpeds) do
           RequestModel(GetHashKey(v.name))
           while not HasModelLoaded(GetHashKey(v.name)) do
             Wait(1)
           end
       
           RequestAnimDict("mini@strip_club@idles@bouncer@base")
           while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
             Wait(1)
           end  
           ped =  CreatePed(4, v.hash,v.pos, 3374176, false, true)
           SetEntityHeading(ped, v.h)
           FreezeEntityPosition(ped, true)
           SetEntityInvincible(ped, true) 
           SetBlockingOfNonTemporaryEvents(ped, true)
         end
   
   
       for _,v in pairs(verarbeiter) do
           RequestModel(GetHashKey("a_m_o_acult_02"))
           while not HasModelLoaded(GetHashKey("a_m_o_acult_02")) do
             Wait(1)
           end
       
           RequestAnimDict("mini@strip_club@idles@bouncer@base")
           while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
             Wait(1)
           end
           ped =  CreatePed(4, 0x4BA14CCA,v.posX, v.posY,v.posZ-1, 3374176, false, true)
           SetEntityHeading(ped, v.h)
           FreezeEntityPosition(ped, true)
           SetEntityInvincible(ped, true) 
           SetBlockingOfNonTemporaryEvents(ped, true)
         end
   end)
   
   
   -- FINGERPOINTER
   
   local mp_pointing = false
   local keyPressed = false
   
   local function startPointing()
       local ped = GetPlayerPed(-1)
       RequestAnimDict("anim@mp_point")
       while not HasAnimDictLoaded("anim@mp_point") do
           Wait(0)
       end
       SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
       SetPedConfigFlag(ped, 36, 1)
       Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
       RemoveAnimDict("anim@mp_point")
   end
   
   local function stopPointing()
       local ped = GetPlayerPed(-1)
       Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
       if not IsPedInjured(ped) then
           ClearPedSecondaryTask(ped)
       end
       if not IsPedInAnyVehicle(ped, 1) then
           SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
       end
       SetPedConfigFlag(ped, 36, 0)
       ClearPedSecondaryTask(PlayerPedId())
   end
   
   local once = true
   local oldval = false
   local oldvalped = false
   
   Citizen.CreateThread(function()
       while true do
           Wait(0)
   
           if once then
               once = false
           end
   
           if not keyPressed then
               if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                   Wait(200)
                   if not IsControlPressed(0, 29) then
                       keyPressed = true
                       startPointing()
                       mp_pointing = true
                   else
                       keyPressed = true
                       while IsControlPressed(0, 29) do
                           Wait(50)
                       end
                   end
               elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                   keyPressed = true
                   mp_pointing = false
                   stopPointing()
               end
           end
   
           if keyPressed then
               if not IsControlPressed(0, 29) then
                   keyPressed = false
               end
           end
           if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
               stopPointing()
           end
           if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
               if not IsPedOnFoot(PlayerPedId()) then
                   stopPointing()
               else
                   local ped = GetPlayerPed(-1)
                   local camPitch = GetGameplayCamRelativePitch()
                   if camPitch < -70.0 then
                       camPitch = -70.0
                   elseif camPitch > 42.0 then
                       camPitch = 42.0
                   end
                   camPitch = (camPitch + 70.0) / 112.0
   
                   local camHeading = GetGameplayCamRelativeHeading()
                   local cosCamHeading = Cos(camHeading)
                   local sinCamHeading = Sin(camHeading)
                   if camHeading < -180.0 then
                       camHeading = -180.0
                   elseif camHeading > 180.0 then
                       camHeading = 180.0
                   end
                   camHeading = (camHeading + 180.0) / 360.0
   
                   local blocked = 0
                   local nn = 0
   
                   local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                   local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                   nn,blocked,coords,coords = GetRaycastResult(ray)
   
                   Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                   Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                   Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                   Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
   
               end
           end
       end
   end)
   
   -- FRAKLAGER
   
   
   
   
   Citizen.CreateThread(function()
       while true do
           Wait(10)
   
           
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(1705.9, 4769.42, 14.21))
   
               if dist <= 2.0 then
                   if IsControlJustReleased(0, 38) then
                       
                       local PlayerData = ESX.GetPlayerData()
                       if PlayerData.job.name == 'unemployed' then
                           if PlayerData.job.name == 'police' then
                               if PlayerData.job.name == 'ambulance' then
                                   if PlayerData.job.name == 'fib' then
                                       return
                                   end
                               end
                           end 
                       end
                       openFrakMenu()
                   end
               end
           
       end 
   end)
   
   function openFrakMenu( )
       elements = {
           {label = 'Schließen', action = 'close'},
           {label = 'PKW Lizenz', action = 'drive'}, 
           {label = 'LKW Lizenz', action = 'drive_truck'},
           {label = 'Motorrad Lizenz', action = 'drive_bike'},
           {label = 'PBS', action = 'pbs'}, 
           {label = 'Flugschein A', action = 'aircraft_a'},
           {label = 'LKW B Lizenz', action = 'lkwb'},
           {label = 'Flugschein B', action = 'aircraft_b'},
           {label = 'Bootsschein', action = 'boat'}
   
       }
       menu_title = "Lizenz Abnehmen | ".. name
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dmv_givelic', {
           title    = menu_title,
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           --- MENUS ---
           local selection = data.current.action
           if selection == 'close' then
               ESX.UI.Menu.CloseAll()
           else
               TriggerServerEvent('byte_dmv:removeLicense', playerid, selection)
           end
           
       end, function(data, menu)
           menu.close()
       end)
   end
   
   -- FRAKTION
   
   local code = "";
   local frak = "";
   
   RegisterNetEvent('byte_frakinvite:open')
   AddEventHandler('byte_frakinvite:open', function(title, message, b)
       Wait(200)
       TriggerEvent('frak:sendPlayerInvite', title, message, b)
       frak = b
       
   end)
   
   
   ESX = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(500)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       ESX.PlayerData = ESX.GetPlayerData()
       
   end)
   
   menu_title = "??? - Lizenz Vergabe"
   RegisterNetEvent('openGiveLicMenu')
   AddEventHandler('openGiveLicMenu', function(playerid, name)
       ESX.PlayerData = ESX.GetPlayerData()
       
       if ESX.PlayerData.job.name ~= 'dmv' then
           if ESX.PlayerData.job.name ~= 'ambulance' then
               return;
           end 
       end 
       ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(isDuty)
           ----print(isDuty)
           if isDuty == false then
               TriggerEvent('glmp_singlenotify', '', 'Du bist nicht im Dienst!') 
               ----print("no duty")
               return;
           end 
       
           if playerid ~= nil then
               ----print("DEBUG: " .. playerid)
               if ESX.PlayerData.job.name == 'dmv' then
                   elements = {
                       {label = 'Schließen', action = 'close'},
                       {label = 'PKW Lizenz', action = 'drive'},
                       {label = 'LKW Lizenz', action = 'drive_truck'},
                       {label = 'Motorrad Lizenz', action = 'drive_bike'},
                       {label = 'PBS', action = 'pbs'}, 
                       {label = 'Flugschein A', action = 'aircraft_a'},
                       {label = 'Flugschein B', action = 'aircraft_b'},
                       {label = 'LKW B Lizenz', action = 'lkwb'},
                       {label = 'Bootsschein', action = 'boat'}
   
                   } 
                   menu_title = "DMV - Lizenz Vergabe | ".. name
               elseif ESX.PlayerData.job.name == 'ambulance' then
                   if ESX.PlayerData.job.grade > 8 then
                       elements = {
                           {label = 'Schließen', action = 'close'},
                           {label = 'Erstehilfe Lizenz', action = 'erstehilfe'}
   
                       }
                   else
                       elements = {
                           {label = 'Schließen', action = 'close'}
   
                       }
                   end
                   menu_title = "LSMD - Lizenz Vergabe | " .. name 
               end
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dmv_givelic', {
                   title    = menu_title,
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   --- MENUS ---
                   local selection = data.current.action
                   if selection == 'close' then
                       ESX.UI.Menu.CloseAll()
                   else
                       TriggerServerEvent('byte_dmv:addLicense', playerid, selection)
                   end
                   
               end, function(data, menu)
                   menu.close()
               end)
           else
               TriggerEvent('glmp_singlenotify', '', 'Bitte gebe eine Spieler-ID an.')
           end
       end)
   end)
    
   RegisterNetEvent('openTakeLicMenu')
   AddEventHandler('openTakeLicMenu', function(playerid, name)
       ESX.PlayerData = ESX.GetPlayerData()
       
       if ESX.PlayerData.job.name ~= 'police' then
           ----print("no pd")
           if ESX.PlayerData.job.name ~= 'fib' then
               ----print("no fib")
               if ESX.PlayerData.job.name ~= 'dmv' then
                   ----print("no dmv")
                   return;
               end 
           end 
       end 
       ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(isDuty)
           ----print(isDuty)
           if isDuty == false then
               TriggerEvent('glmp_singlenotify', '', 'Du bist nicht im Dienst!') 
               ----print("no duty")
               return;
           end
       
           if playerid ~= nil then
               ----print("DEBUG: " .. playerid) 
                   elements = {
                       {label = 'Schließen', action = 'close'},
                       {label = 'PKW Lizenz', action = 'drive'}, 
                       {label = 'LKW Lizenz', action = 'drive_truck'},
                       {label = 'Motorrad Lizenz', action = 'drive_bike'},
                       {label = 'PBS', action = 'pbs'}, 
                       {label = 'Flugschein A', action = 'aircraft_a'},
                       {label = 'Flugschein B', action = 'aircraft_b'},
                       {label = 'LKW B Lizenz', action = 'lkwb'},
                       {label = 'Bootsschein', action = 'boat'},
                       {label = 'Waffenlizenz', action = 'weapon'}
   
                   }
                   menu_title = "Lizenz Abnehmen | ".. name
               
               ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dmv_givelic', {
                   title    = menu_title,
                   align    = 'top-left',
                   elements = elements
               }, function(data, menu)
                   --- MENUS ---
                   local selection = data.current.action
                   if selection == 'close' then
                       ESX.UI.Menu.CloseAll()
                   else
                       TriggerServerEvent('byte_dmv:removeLicense', playerid, selection)
                   end
                   
               end, function(data, menu)
                   menu.close()
               end)
           else
               TriggerEvent('glmp_singlenotify', '', 'Bitte gebe eine Spieler-ID an.')
           end
       end)
   end)
   
   RegisterNetEvent('openFrakBankMenu')
   AddEventHandler('openFrakBankMenu', function(frak, label, balance)
       openFrakBankMenu(frak, label, balance)
   end)
   
   
   
   function openFrakBankMenu(frak, label, balance)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
            elements = {
               {label = 'Schließen', action = 'close'},
               {label = 'Kontostand: '.. balance .. '$', action = 'null'},
               {label = 'Einzahlen', action = 'cashIn'},
               {label = 'Auszahlen', action = 'cashOut'}
           }
   
       
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'frakbank', {
           title    = label .. ' - Fraktionsbank',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           --- MENUS ---
           if data.current.action == 'close' then
               ESX.UI.Menu.CloseAll()
           elseif data.current.action == 'cashIn' then
               ESX.UI.Menu.CloseAll()
               ESX.UI.Menu.Open(
                   'dialog', GetCurrentResourceName(), 'asas',
                   {
                   title = label .. " - Fraktionsbank", 
                   text = "Hier kannst du Geld in die Fraktionsbank einzahlen."
                   },
                   function(data2, menu2)
   
   
   
                   menu2.close()
                   ESX.TriggerServerCallback('frakbank:cashIn', function(cb)
                   end, frak, data2.value)
                   
                   
               end, function(data2, menu2)  
                   menu2.close() 
               end)
           elseif data.current.action == 'cashOut' then
               ESX.UI.Menu.CloseAll()
               ESX.UI.Menu.Open(
                   'dialog', GetCurrentResourceName(), 'asas',
                   {
                   title = label .. " - Fraktionsbank", 
                   text = "Hier kannst du Geld von der Fraktionsbank abheben."
                   },
                   function(data2, menu2)
   
   
   
                   menu2.close()
                   ESX.TriggerServerCallback('frakbank:cashOut', function(cb)
                   end, frak, data2.value)
                   
                   
               end, function(data2, menu2)  
                   menu2.close() 
               end)
               
           end
           
       end, function(data, menu)
           menu.close()
       end)
   end 
   
   
   
   -- DUTY
   
   
   
   
   
   RegisterNetEvent('byte:openDutyMenu')
   AddEventHandler('byte:openDutyMenu', function()
       openDutyMenu()
   end)
   function openDutyMenu()
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
            elements = {
               {label = 'Schließen', action = 'close'},
               {label = 'Dienst - Anmelden', action = 'login'},
               {label = 'Dienst - Abmelden', action = 'logout'}
           }
   
       
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'frakbank', {
           title    = PlayerData.job.label .. ' - Dienst',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           --- MENUS ---
           if data.current.action == 'close' then
               ESX.UI.Menu.CloseAll()
           elseif data.current.action == 'login' then
               menu.close()
               TriggerServerEvent('byte_fraksystem:setDuty', 'onDuty')
           elseif data.current.action == 'logout' then
               menu.close()
               TriggerServerEvent('byte_fraksystem:setDuty', 'offDuty')
               
           end
           
       end, function(data, menu)
           menu.close()
       end)
   end 
   
   
   -- PArkkralle
   
   RegisterNetEvent('byte:client:parkkralle')
   AddEventHandler('byte:client:parkkralle', function()
       ----print("triggered parkk")
       local PlayerData = ESX.GetPlayerData()
       if PlayerData.job.name ~= 'police' then
           if PlayerData.job.name ~= 'fib' then
               TriggerEvent('glmp_singlenotify', '', 'Parkkrallen können nur von Beamten im Dienst verwendet werden.')
               return
           end
       end
   
       ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(isDuty)
           if isDuty == false then 
               ----print("no duty")
               TriggerEvent('glmp_singlenotify', '', 'Du bist nicht im Dienst!')
               return
           end
           
           local vehicle = ESX.Game.GetVehicleInDirection()
           if DoesEntityExist(vehicle) then
               ----print("exists")
               local plate = GetVehicleNumberPlateText(vehicle)
               ----print(plate) 
               ESX.TriggerServerCallback('carlock:isSperre', function(sperre)
                   if sperre == false then
                       ----print("no sperre")
                       ESX.TriggerServerCallback('byte:getVehId', function(vehId)
                           if vehId ~= nil then
                               ----print("p car")
                               local playerPed = GetPlayerPed(-1)
                               TriggerEvent('patron_inventory:progressbar', 10000)
                               TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                               Citizen.Wait(10000)
                               ClearPedTasksImmediately(playerPed) 
                               
                               TriggerEvent('glmp_singlenotify', '', 'Du hast eine Wegfahrsperre angebracht.')
                               TriggerServerEvent('byte:removeItem', 'parkkralle')
                               TriggerServerEvent('byte:server:parkkralle', plate, 1)
                               ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                                   TriggerServerEvent('byte:sendLog', 'parkkralle', 'Parkkralle befestigt', playername .. ' hat eine Parkkralle an einem Frak-Fahrzeug angebracht.\n**Kennzeichen:** '.. plate)
                               end)
                           else
                               ESX.TriggerServerCallback('byte:getFrakVehId', function(vehId)
                                   if vehId ~= nil then
                                       ----print("f car")
                                       local playerPed = GetPlayerPed(-1)
                                       TriggerEvent('patron_inventory:progressbar', 10000)
                                       TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                       Citizen.Wait(10000)
                                       ClearPedTasksImmediately(playerPed) 
                                       
                                       TriggerEvent('glmp_singlenotify', '', 'Du hast eine Wegfahrsperre angebracht.')
                                       TriggerServerEvent('byte:removeItem', 'parkkralle')
                                       TriggerServerEvent('byte:server:frakparkkralle', plate, 1)
                                       ESX.TriggerServerCallback('byte:getPlayerName', function(playername)
                                           TriggerServerEvent('byte:sendLog', 'parkkralle', 'Parkkralle befestigt', playername .. ' hat eine Parkkralle an einem Frak-Fahrzeug angebracht.\n**Kennzeichen:** '.. plate)
                                       end)
                                   else
                                       ----print(" no car")
                                       TriggerEvent('glmp_singlenotify', '', 'Es ist ein Fehler aufgetreten!')
                                   end
                               end, plate)
                           end
                       end, plate)
                   else 
                       TriggerEvent('glmp_singlenotify', '', 'Das Fahrzeug hat bereits eine Wegfahrsperre!')
                   end
               end, plate)
           else
               TriggerEvent('glmp_singlenotify', '', 'Kein Fahrzeug gefunden!')
           end
       end)
   end)
   
   
   
   -- WDEV
   
   
    
   -- CLOTHING
   RegisterKeyMapping('clothing_54gf345fre', 'Kleidungsmenu', 'keyboard', 'O')
   RegisterCommand('clothing_54gf345fre', function(source)  
       openClotehesMenu()
   end)
   
   
   function openClotehesMenu()
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
            elements = {
               {label = 'Schließen', action = 'close'},
               {label = 'Maske', action = 'Mask'},
               {label = 'Brille', action = 'Glasses'}, 
               {label = 'Kette', action = 'Neck'},
               {label = 'Oberbekleidung', action = 'Shirt'},
               {label = 'Unterbekleidung', action = 'UShirt'},
               {label = 'Schutzweste', action = 'Vest'},
               {label = 'Hose', action = 'Pants'},
               {label = 'Schuhe', action = 'Shoes'} 
           }
   
       
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'frakbank', {
           title    = 'Kleidungsmenu',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           --- MENUS ---
           if data.current.action == 'close' then
               ESX.UI.Menu.CloseAll()
           else
               if data.current.action ~= "Glasses" then
                   TriggerEvent('toggleClothing',data.current.action)    
               else
                   TriggerEvent('toggleProps',data.current.action)    
               end
           end
           
       end, function(data, menu)
           menu.close()
       end)
   end 
   
   
   --
   RegisterNetEvent('byte:checkPos')
   AddEventHandler('byte:checkPos', function(playerid)
       local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
       ----print("check pos for ".. source .. " to ".. playerid)
       TriggerServerEvent('byte:setWayPoint', playerid, x, y)
   end)
   
   RegisterNetEvent('byte:setWayPoint')
   AddEventHandler('byte:setWayPoint', function(x, y)
       SetNewWaypoint(x, y)
   end)
   
   
   RegisterCommand('wanteds', function(source)
       local PlayerData = ESX.GetPlayerData()
       if PlayerData.job.name == 'fib' then
           ESX.TriggerServerCallback("byte:getWantedPlayer", function(playerArray)
               elements = {}
               if #playerArray == 0 then
                   ESX.ShowNotification("Niemand ist gesucht")
                   return
               end
               table.insert(elements, {label = 'Schließen', value = 'close'})
               for i = 1, #playerArray, 1 do
                   table.insert(elements, {label = playerArray[i].name .. " | HE: " .. playerArray[i].jailTime, value = ''})
               end
   
               ESX.UI.Menu.Open(
                   'default', GetCurrentResourceName(), 'jail_unjail_menu',
                   {
                       title = "Gesuchte Personen",
                       align = "center",
                       elements = elements
                   }, 
               function(data2, menu2)
   
                   if data2.current.value == 'close' then
                       ESX.UI.Menu.CloseAll()
                   end
   
               end, function(data2, menu2)
                   menu2.close()
               end)
           end)
       end
   end)
   
   config = {
       cordinates = {
           --Der Erste Vector ist die Koordinate wo sich der NPC befindet
           --Um eine Position hizuzufügen verwende vector3([cordinaten]),[Richtung] | Dies ist für ein Parkplatz!
           --{['x'] = , ['y'] = , ['z'] = , ['h'] = }
            
           {vector3(-313.64, -1034.99, 27.35), vector3(-311.58, -1013.76, 29.6),249.44,vector3(-305.59, -1016.08, 29.6),70.99,vector3(-310.87, -1010.91, 30.9),249.44,1},
           
           {vector3(-619.18, -80.9, 39.2), vector3(-625.25, -77.79, 40.40),358.22, vector3(-629.46, -77.45, 40.40),358.22,  vector3(-633.3, -77.17, 40.40),358.22, vector3(-637.4, -76.91, 40.40),358.22, vector3(-641.37, -76.39, 40.40),358.22, vector3(-641.37, -76.39, 40.40),358.22, vector3(-641.37, -76.39, 40.40),358.22, vector3(-641.37, -76.39, 40.40),358.22, 2},
           {vector3(275.182, -345.534, 40.173), vector3(277.33, -339.94, 44.92),249.4, vector3(283.15, -342.16, 44.92),69.3, vector3(278.67, -337.02, 44.92),249.4,3},
           {vector3(-833.255, -2351.34, 12.57), vector3(-830.32, -2356.64, 14.4),330.34,  vector3(-827.27, -2358.42, 14.4),330.34, vector3(-824.31, -2360.2, 14.4),330.34, vector3(-821.53, -2361.92, 14.4),330.34, vector3(-818.08, -2363.74, 14.4),330.34, vector3(-815.43, -2365.36, 14.4),330.34, vector3(-812.52, -2367.07, 14.4),330.34, vector3(-809.51, -2368.77, 14.4),330.34,4},
           {vector3(721.95, -2016.379, 27.43), vector3(722.08, -2032.29, 30), 354.0,vector3(725.44, -2032.21, 30), 354.0,vector3(728.63, -2032.64, 29.8), 354.0, vector3(731.6, -2033.28, 30), 354.0,vector3(734.81, -2033.53, 30), 354.0, vector3(718.04, -2021.53, 30),266.39, vector3(717.52, -2024.82, 30),266.39 ,5},
           {vector3(-2162.82, -377.15, 11.81), vector3(-2166.42, -373.31, 12.81),169.42, vector3(-2169.60, -372.80, 12.81),169.42, vector3(-2172.65, -372.31, 12.81),169.42, vector3(-2164.64, -380.25, 12.81),261.47, vector3(-2157.35, -381.34, 12.81),81.62,vector3(-2165.35, -383.12, 12.81),261.47, vector3(-2157.62, -384.4, 12.81),81.62, vector3(-2165.88, -386.21, 12.81),261.47, 6},
           {vector3(-400.74, 1209.87, 323.92), vector3(-394.84, 1215.83, 325.5),163.78,  vector3(-403.88, 1218.27, 325.5),163.78,  vector3(-396.54, 1209.65, 325.5),163.78, vector3(-405.63, 1212.15, 325.5),163.78,   vector3(-398.05, 1203.68, 325.5),163.78,    vector3(-407.3, 1206.18, 325.5),163.78,  vector3(-399.46, 1197.59, 325.5), 163.78,   vector3(-409.11, 1200.04, 325.5), 163.78, 7},
           {vector3(112.23, 6619.66, 29.82), vector3(117.0,6599.58, 32.01),  269.83, vector3(122.19,6595.06, 32.01), 269.83,  vector3(126.94,6590.38, 32.01), 269.83, vector3(145.89,6603.97,32.01), 181.7, vector3(145.82,6611.34,32.01),358.62, vector3(150.66,6599.15,32.01), 181.7, vector3(150.91,6606.09,32.01),358.62, vector3(155.79,6594.2,32.01),181.7,8},
           {vector3(2768.34, 3462.92, 53.63), vector3(2767.7, 3456.46, 55.46),244.84, vector3(2774.1, 3471.68, 55.46),244.84, vector3(2766.0, 3452.67, 55.46), 244.84, vector3(2775.5, 3475.49, 55.46), 244.84,  vector3(2764.65, 3449.06, 55.46),244.84, vector3(2777.12, 3479.13, 55.46),244.84, vector3(2763.04, 3444.85, 55.46), 244.84, vector3(2778.83, 3482.95, 55.46),244.84,9},   
           {vector3(1951.79, 3750.95, 30.16), vector3(1949.91, 3758.36, 31.7),31.06, vector3(1953.38, 3760.48, 31.7),31.06, vector3(1956.48, 3762.17, 31.7), 31.06, vector3(1959.77, 3764.31, 31.7),31.06, vector3(1963.28, 3766.19, 31.7),31.06, vector3(1956.48, 3762.17, 31.7),31.06, vector3(1967.46, 3774.62, 31.7), 121.77, vector3(1965.64, 3779.55, 31.7),121.77,10},
           {vector3(1899.46, 2605.26, 44.1), vector3(1876.58, 2595.24, 46.1),272.31, vector3(1876.6, 2615.25, 46.1),272.31, vector3(1876.66, 2591.81, 46.17),272.31,  vector3(1876.5, 2618.54, 46.1),272.31,  vector3(1876.22, 2588.24, 46.1),272.31, vector3(1876.55, 2622.14, 46.1),272.31, vector3(1876.48, 2625.68, 46.1),272.31, vector3(1876.14, 2584.79, 46.1), 272.31,11},
           {vector3(615.15, 2785.41, 41.48),vector3(609.15,2788.55,42.5),6.63, vector3(612.03,2788.94,42.5), 6.63,vector3(614.42,2789.13,42.5),6.63,vector3(617.27,2789.26,42.5),6.63, vector3(619.77,2789.6,42.5),6.63,vector3(619.77,2789.6,42.5),6.63,vector3(619.77,2789.6,42.5),6.63,vector3(619.77,2789.6,42.5), 6.63,12},
           {vector3(-1681.48, 56.48, 61.96), vector3(-1685.14, 49.62, 64.5), 163.34,vector3(-1682.58, 46.91, 64.5),163.34,vector3(-1679.94, 44.48, 64.5),163.34, vector3(-1677.29, 42.11, 64.5),163.34, vector3(-1691.43, 55.39, 64.5),163.34, vector3(-1694.17, 57.72, 64.5),163.34,vector3(-1696.78, 60.02, 64.5),163.34, vector3(-1699.56, 62.13, 64.5),163.34, 13},
           {vector3(-73.35, -2004.33, 16.28), vector3(-77.66, -2005.13, 19.1),352.9, vector3(-81.22, -2004.18, 19.1),173.79, vector3(-85.18, -2004.44, 19.1),352.9, vector3(-88.88, -2003.93, 19.1),173.79, vector3(-78.37, -2011.07, 19.1),352.9, vector3(-82.08, -2010.48, 19.1),173.79, vector3(-85.74, -2009.93, 19.1),352.9, vector3(-89.57, -2009.5, 19.1), 173.79,14},
           {vector3(638.2, 206.58, 79.6), vector3(627.89, 196.59, 97.1), 250.75,vector3(626.24, 192.81, 97.1),250.75,  vector3(624.81, 188.7, 97.1), 250.75,vector3(623.7, 185.29, 97.1),250.75,  vector3(634.37, 183.68, 97.1),  73.88, vector3(633.13, 179.81, 97.1),73.88, vector3(631.72, 176.08, 97.1),73.88, vector3(630.32, 172.34, 97.1),73.88,15},
           {vector3(-1184.28, -1509.79, 2.65),vector3(-1191.03, -1504.24, 3.58),305.83, vector3(-1183.34, -1495.87, 3.59),305.83, vector3(-1184.75, -1493.11, 3.59), 305.83,vector3(-1186.43, -1490.49, 3.59), 305.83, vector3(-1188.53, -1488.09, 3.59), 305.83,vector3(-1176.69, -1491.37, 3.59),124.72,vector3(-1178.81, -1489.11, 3.59),124.72,vector3(-1180.56, -1486.48, 3.59),124.72,16}, 
           {vector3(889.24, -53.87, 76.91), vector3(890.06, -56.85, 78.34),238.34, vector3(891.92, -54.08, 78.76), 238.34,vector3(888.05, -59.85, 78.76),238.34, vector3(893.76, -51.02, 78.76), 238.34,vector3(887.07, -63.26, 79.0),238.34, vector3(895.58, -48.07, 78.76),238.34, vector3(884.36, -65.72, 78.76),238.34, vector3(897.61, -45.09, 78.76), 238.34,17},
           {vector3(100.27, -1073.92, 27.37), vector3(104.28, -1078.53, 31.37),341.59, vector3(107.83, -1079.53, 31.19),341.59,vector3(111.23, -1080.9, 31.19),341.59,vector3(105.56, -1063.1, 31.19),247.08,vector3(107.23, -1059.29, 31.19),247.08,vector3(119.09, -1070.16, 31.19),247.08,vector3(122.33, -1070.19, 31.19),0.81,vector3(125.69, -1070.03, 31.19),0.81,18},--Garage 18
           {vector3(394.09,-1631.83,27.29), vector3(393.29, -1628.62, 30.5),50.91, vector3(395.27, -1626.21, 30.5),50.91, vector3(397.16, -1623.97, 30.5),50.91,vector3(399.25, -1621.62, 30.5),50.91,vector3(401.23, -1619.21, 30.5),50.91,vector3(388.79, -1612.81, 30.5),229.34,vector3(390.75, -1610.37, 30.5),229.34,vector3(392.76, -1608.16, 30.5),229.34,19}, -- Garage 19   
           {vector3(-964.08, -2693.8, 11.0), vector3(-967.08, -2695.52, 13.84),153.06,vector3(-970.16, -2693.84, 13.84),153.06,vector3(-964.52, -2697.32, 13.84),153.06,20},
           {vector3(459.55, -986.63, 22.7), vector3(445.6, -986.07, 25.28),270.5,vector3(445.45, -988.91, 25.28),269.37,vector3(445.65, -991.29, 25.28),269.37,vector3(445.65, -997.02, 25.28),269.37,vector3(445.65, -994.29, 25.28),269.37,21},
           {vector3(409.54, -1622.96, 27.29), vector3(417.34,-1627.45,30), 141.59,  vector3(419.82,-1629.45,30),141.59, vector3(421.21,-1635.85,30),89.6, vector3(421.06,-1639.03,30),89.6, vector3(421.07,-1641.94,30), 89.6,vector3(418.47,-1646.51,30),49.59, vector3(409.43,-1639.45,30),49.59, vector3(411.22,-1636.98,30),49.59,22},
           {vector3(1737.88, 3709.17, 32.14), vector3(1730.5, 3711.15, 34.14), 20.17,vector3(1725.24, 3710.17, 34.14), 19.65, 23},
           {vector3(-80.27, 6502.18, 29.49), vector3(-81.52, 6497.04, 32.06), 222.78,vector3(-83.59, 6495.0, 32.06), 225.18, vector3(-68.0, 6503.21, 32.06), 178.9, vector3(-63.33, 6591.9, 32.06), 134.79, 24},
           {vector3(-1665.69, -979.16, 6.16), vector3(-1667.87, -952.95, 8.2), 345.44, vector3(-1670.84, -952.12, 8.2), 344.54,  vector3(-1673.78, -951.21, 8.2), 341.76,  vector3(-1676.7, -950.15, 8.2), 344.15,25},
           {vector3(-1129.48, -1604.8, 4.3), vector3(-1125.96, -1609.48, 4.4), 345.44,26},
           {vector3(15.4,544.08, 176.0), vector3(14.28, 548.88, 176.2), 345.44,27}, 
           {vector3(84.56, -1967.04, 19.76), vector3(89.24, -1967.48, 20.76), 315.44,28},


           {vector3(-797.0, -1341.5, 3.15), vector3(-795.37, -1334.13, 4.58), 256.39, vector3(-802.82,-1332.42,4.58), 256.39,29},
           {vector3(336.44, -589.72, 26.8), vector3(317.48, -573.84, 28.8), 345.44,30},
           {vector3(113.32, -729.84, 33.12), vector3(104.04, -731.04, 33.12), 345.44,31},
 
           {vector3(-1101.64, 4940.68, 218.36), vector3(-1092.88, 4944.24, 218.32), 345.44,32},
           {vector3(-1520.88, 886.04, 180.76), vector3(-1524.84, 881.68, 181.76), 345.44,33},

           {vector3(1271.28, -1603.24, 53.0), vector3( 1268.04, -1603.16, 53.4), 32.23,34},
           {vector3(-1532.2, 78.8, 54.76), vector3(-1523.84, 81.72, 56.6), 353.61,35}, 

           {vector3(-1923.54, 2098.82, 140.83), vector3(1906.25, 2021.11, 140.79), 273.19,36},
           {vector3(-563.12, -886.59, 23.21), vector3(-549.09, -890.68, 24.46), 181.42,37}, --RedlinePerformance
   
       },
       garageNames = { 
           {'Pillbox Hill Garage',1},
           {'Rockford Hills Garage',2},
           {'Alta Garage',3},
           {'Flughafen Garage',4},
           {'Cypress Flats Garage',5},
           {'Pacific Bluffs Garage',6},
           {'Vinewood Hills Garage',7},
           {'Paleto Bay Garage',8},
           {'San Chianski Garage',9},
           {'Sandy Shores Garage',10},
           {'Gefängnis Garage',11},
           {'Harmony Garage',12},
           {'Richman Garage',13},
           {'Davis Garage',14},  
           {'Vinewood Mitte Garage',15},
            {'Vespucci Garage',16},
            {'Casino Garage',17},
            {'Würfelpark Garage',18},
            {'Abschlepphof Garage',19},
            {'LSAP Garage',20},  
            {'LSPD Privat Garage',21,false,false,true},
            {'Los Santos KFZ Verwahrstelle',22,true,true},
            {'Sandy Shores KFZ Verwahrstelle',23,true,true},
            {'Paleto Bay KFZ Verwahrstelle',24,true,true},   
            {'Pier KFZ Verwahrstelle',25,true,true},
            {'LSV Privat Garage',26,false,false,true},    
            {'PB Privat Garage',27,false,false,true},
            {'Ballas Privat Garage',28,false,false,true},
  
            {'DMV Privat Garage',29,false,false,true},
            {'LSMD Privat Garage',30,false,false,true},
            {'FIB Privat Garage',31,false,false,true},

            {'Orga Privat Garage',32,false,false,true},
            {'YakuZa Privat Garage',33,false,false,true},

            {'MG13 Privat Garage',34,false,false,true},
            {'LCN Privat Garage',35,false,false,true},

            {'Cali Privat Garage',36,false,false,true},
            {'Redline Performance',37,false,false,true},

       },
       
       
       npc = {
           --[x],[y],[z],[h],[hashofModel],[ModelName]
           {100.48,-1073.37,28.37,155.08,0xF06B849D,"s_m_m_autoshop_02"},
           {459.55, -986.63, 24.7,89.06,1581098148,"s_m_y_cop_01"},
           {-313.77,-1034.4,29.53,340.71,0xF06B849D,"s_m_m_autoshop_02"},
           {-832.99,-2351.1,13.57,271.01,0xF06B849D,"s_m_m_autoshop_02"},
           {721.96,-2016.37,28.43,278.5,0xF06B849D,"s_m_m_autoshop_02"},
           {-73.41,-2004.12,17.28,80.05,0xF06B849D,"s_m_m_autoshop_02"},
           {275.43,-344.63,44.17,71.28,0xF06B849D,"s_m_m_autoshop_02"},
           {889.49,-54.53,77.76,236.6,0xF06B849D,"s_m_m_autoshop_02"},
           {-619.41,-82.63,40.2,355.82,0xF06B849D,"s_m_m_autoshop_02"},
           {-1681.57,56.31,62.83,145.32,0xF06B849D,"s_m_m_autoshop_02"},
           {-2162.81,-377.07,12.28,176.34,0xF06B849D,"s_m_m_autoshop_02"},
           {-400.66,1210.35,324.92,82.85,0xF06B849D,"s_m_m_autoshop_02"},
           {1899.07,2605.04,44.97,183.5,0xF06B849D,"s_m_m_autoshop_02"},
           {614.7,2784.46,42.48,357.92,0xF06B849D,"s_m_m_autoshop_02"},
           {1951.78,3750.66,31.16,119.62,0xF06B849D,"s_m_m_autoshop_02"},
           {112.46,6619.75,30.82,222.92,0xF06B849D,"s_m_m_autoshop_02"},
           {2768.31,3462.88,54.63,242.45,0xF06B849D,"s_m_m_autoshop_02"},
           {638.67,206.46,96.6,68.51,0xF06B849D,"s_m_m_autoshop_02"},
           {409.54, -1622.96, 28.29,237.17,0xF06B849D,"s_m_m_autoshop_02"},
           {1201.88,-1771.24,38.92,333.17,0xD172497E,"a_m_m_afriamer_01"},
           {-1184.25,-1509.59,3.65,38.77,0xF06B849D,"s_m_m_autoshop_02"},
           {-563.12, -886.59, 24.21,183.29,0xF06B849D,"s_m_m_autoshop_02"}, --RedlinePerformance
           {-797.0, -1341.5, 4.15,355.09,0xD172497E,"a_m_m_afriamer_01"}, --DMV
           {-1532.2, 78.8, 55.76,339.93,0xD172497E,"a_m_m_afriamer_01"}, --LCN
           {-964.23, -2694.05, 12.98,153.03,0xD172497E,"a_m_m_afriamer_01"}, --Flughafen Garage
           {336.51, -589.73, 27.8,341.85,0xD172497E,"a_m_m_afriamer_01"}, --Ambulance
           {394.09,-1631.83,28.29,33.29,0xF06B849D,"s_m_m_autoshop_02"},
           {1737.9178, 3709.1685, 33.1358,16.3093,0xF06B849D,"s_m_m_autoshop_02"},
           {-80.1964, 6502.2681, 30.4909,220.2203,0xF06B849D,"s_m_m_autoshop_02"},
           {-1665.5492, -979.2150, 7.1651,47.1798,0xF06B849D,"s_m_m_autoshop_02"}
       },
   
       range = 50.0,
       cooldown = 3,
       npcs = true,  --If they spawn
       blip =  473, --Blip id 473 is good 357 :) 
       blipcolour = 0,
       tpincar = false, --If you want that the player automaticly gets teleported into the car
       allcarsingarage = false,  --If you want to have all cars saved in the garage after the server restarts, just enable it 
       carautomaticclosed = true, --If you want to have the car closed after it gets parked out
   
       notifysystem = "glmp_notify",
       notifycolour = "orange",
       notifytitle = "Garage",  --Text Title
       notifyTextParkOut = "Du hast das Fahrzeug erfolgreich ausgeparkt.", --Text for Parkout
       notifyTextParkIn = "Du hast das Fahrzeug erfolgreich eingeparkt.", --Text for Parkin
       notifynocar = "Es befindet sich kein Fahrzeug in dieser Garage."   --Text if no car is in it
   }
   
   canVehP = true
   local garages = config.cordinates
   
   Citizen.CreateThread(function()
       while true do
           Wait(10)
           for key, value in pairs(garages) do
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), value[1])
               if dist < 20 then 
                DrawMarker(1, value[1], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.7, 144, 128, 0, 100, false, true, 2, nil, nil, false)
               end
               if dist < 1.5 then
                   if IsControlJustReleased(0, 38) then
                       usedGarage = key
                       openGarage(usedGarage)
                       --toggleField(true)
                       TriggerEvent('static_interact', "E", "hide", "um die Garage zu öffnen!")
                       wasinside = true
                   end
               end
           end
       end
   end)
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
   end)
   
   
   RegisterCommand("closenui", function()
       closeNui()
   end)
   
   ownedCars = {}
   RegisterNUICallback('trigger', function(data, cb)
           ownedCars = {}
           --print("[" .. data.event .. "]:" .. table.concat(data.args, " "))  
       
           if data.event ~= "componentTriggerServerEvent" then
               if data.event == "onWindowClosed" then
                   closeNui() 
               end
           else
               
           if data.args[1] == "Garage" then
               TriggerEvent('responseVehicles', {})
           end
           if data.args[1] == "AntiAFK" then
               if data.args[2] == "disableAntiAfk" then
                   closeNui()
               elseif data.args[2] == "kick" then
                   TriggerServerEvent("antiAfkKick")
                   ----print("antiafk kick")
               end
           end
           if data.args[2] == "requestVehicle" and data.args[3] == "takein" then
   
               ----print("vehicle takein")
               local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(-1)), config.range)
               for key, value in pairs(vehicles) do
                   if GetVehicleNumberPlateText(value) == data.args[5] then
                       SetVehicleEngineHealth(value, 1000.0) 
                       TriggerServerEvent('garage:saveProps', ESX.Math.Trim(data.args[5]), ESX.Game.GetVehicleProperties(value))
                       TriggerServerEvent('garage:changeState', ESX.Math.Trim(data.args[5]), 1, usedGarage) 
                       --TriggerEvent(config.notifysystem, config.notifycolour, config.notifytitle, config.notifyTextParkIn)
                       ESX.Game.DeleteVehicle(value) 
                       ESX.ShowNotification("Fahrzeug eingeparkt!")
                      -- TriggerServerEvent('byte:sendLog', 'garage', 'Fahrzeug Eingeparkt', 'Der Spieler '.. GetPlayerName(src) .. ' ('.. src ..') hat das Fahrzeug mit dem Kennzeichen '.. data.args[5] .. ' in die Garage '.. usedGarage .. ' Eingeparkt.')
                   end
               end 
               
                wasinside = false
   
           end
           if data.args[2] == "requestVehicle" and data.args[3] == "takeout" then
               ----print("PARKE CAR AUZS")
               exist = false
               local vehicle = ESX.Game.GetVehicles()
               ----print(json.encode(vehicle))
               ----print(#vehicle)
               if #vehicle > 1 then
                   for i=1, #vehicle, 1 do 
                       
                       local vehicleProps = ESX.Game.GetVehicleProperties(vehicle[i])
                       if vehicleProps == nil then
                           
                           return
                       end
                       if vehicleProps.plate == data.args[5] then 
                           exist = true
                       end
                   end
               end
              
                  ----print("CHEKD")
                  ----print(exist)
               if exist ~= true then
                   canVehP = true
                   if impound == true then
   
                       ESX.TriggerServerCallback('impound:parkOutVehicle', function(can)
                           if can == true then
                               ESX.TriggerServerCallback('garage:loadVehicle', function(vehicle)
                                   local x,y,z
                                   local h
                                   local props = json.decode(vehicle[1].vehicle)      
                                   local checkforvehicle
                                   ename = #garages[usedGarage] 
                                   local garage = garages[usedGarage][ename] --GaragenNummer
                                   local parkplatz
                                   local parkplatzplaetze = (#garages[usedGarage] - 2) / 2
                               
                                   local zahl
                           
                                   local fuel = vehicle[1].fuel
                                   
                                   for zahl=2,(#garages[usedGarage]-1),2 do 
                                       x,y,z = table.unpack(garages[usedGarage][zahl])
                                       h = garages[usedGarage][zahl+1]
                                       checkforvehicle = IsPositionOccupied(x,y,z,0.1,false,true,false)
                                       if checkforvehicle == false then
                                       parkplatz = zahl / 2 
                                       break;
                                       else
                                       end
                                   end
                                   local vehicle = ESX.Game.GetVehicles()
                                   
                                   ESX.Game.SpawnVehicle(props.model, { x = x, y = y,z = z} , h, function(callback_vehicle)
                           
                                       ESX.Game.SetVehicleProperties(callback_vehicle, props)
                                       SetVehRadioStation(callback_vehicle, "OFF")
                                       SetVehicleFixed(callback_platefromcarvehicle)
                                       SetVehicleDeformationFixed(callback_vehicle)
                           
                                       SetVehicleFuelLevel(callback_vehicle, 65.0)
                                       if config.carautomaticclosed then
                                           SetVehicleDoorsLocked(callback_vehicle, 2)
                                       end
                                       local platefromcar = GetVehicleNumberPlateText(callback_vehicle)
                                       
                                       cooldown = config.cooldown    
                                       if config.tpincar then
                                           TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
                                       end
                                       --TriggerEvent(config.notifysystem, config.notifycolour, config.notifytitle, config.notifyTextParkOut)
                                       ESX.ShowNotification("Fahrzeug ausgeparkt!")
                                   end)
                                   --TriggerServerEvent('garage:setParkedOut', data.args[5])
                                   TriggerServerEvent('garage:changeState', data.args[5], 0)
                                   --TriggerServerEvent('byte:sendLog', 'garage', 'Fahrzeug Ausgeparkt', 'Der Spieler '.. GetPlayerName(source) .. '('.. source ..') hat das Fahrzeug mit dem Kennzeichen '.. data.args[5] .. ' aus der Garage 0 Ausgeparkt.')
                               end, data.args[5])
                           else
                               ESX.ShowNotification("Du hast nicht genug Geld dabei!")
                           end
                       end)
                       
                   else
                       ESX.TriggerServerCallback('garage:loadVehicle', function(vehicle)
                           local x,y,z
                           local h
                           local props = json.decode(vehicle[1].vehicle)      
                           local checkforvehicle
   
                           local garage = garages[usedGarage][ea] --GaragenNummer
                           local parkplatz
                           local parkplatzplaetze = (#garages[usedGarage] - 2) / 2
                       
                           local zahl 
                   
                           local fuel = vehicle[1].fuel
                           
                           for zahl=2,(#garages[usedGarage]-1),2 do 
                               x,y,z = table.unpack(garages[usedGarage][zahl])
                               h = garages[usedGarage][zahl+1]
                               checkforvehicle = IsPositionOccupied(x,y,z,0.1,false,true,false)
                               if checkforvehicle == false then
                               parkplatz = zahl / 2 
                               break;
                               else
                               end
                           end
                           local vehicle = ESX.Game.GetVehicles()
                           
                           ESX.Game.SpawnVehicle(props.model, { x = x, y = y,z = z} , h, function(callback_vehicle)
                   
                               ESX.Game.SetVehicleProperties(callback_vehicle, props)
                               SetVehRadioStation(callback_vehicle, "OFF")
                               SetVehicleFixed(callback_platefromcarvehicle)
                               SetVehicleDeformationFixed(callback_vehicle)
                   
                               SetVehicleFuelLevel(callback_vehicle, 65.0)
                               if config.carautomaticclosed then
                                   SetVehicleDoorsLocked(callback_vehicle, 2)
                               end
                               local platefromcar = GetVehicleNumberPlateText(callback_vehicle)
                               
                               cooldown = config.cooldown    
                               if config.tpincar then
                                   TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
                               end
                               --TriggerEvent(config.notifysystem, config.notifycolour, config.notifytitle, config.notifyTextParkOut)
                               ESX.ShowNotification("Fahrzeug ausgeparkt!")
                           end)
                           --TriggerServerEvent('garage:setParkedOut', data.args[5])
                           TriggerServerEvent('garage:changeState', data.args[5], 0)
                           --TriggerServerEvent('byte:sendLog', 'garage', 'Fahrzeug Ausgeparkt', 'Der Spieler '.. GetPlayerName(source) .. '('.. source ..') hat das Fahrzeug mit dem Kennzeichen '.. data.args[5] .. ' aus der Garage 0 Ausgeparkt.')
                       end, data.args[5])
                   
                   end
               else 
                   ESX.ShowNotification("Das Fahrzeug ist bereits Ausgeparkt!")
               end
           end
   
           if data.args[2] == "requestVehicleList" and data.args[4] == "takeout" then
               TriggerServerEvent('currentgarage', usedGarage) 
               for zahl=1, #config.garageNames,1 do 
   
                   if config.garageNames[zahl][2] == usedGarage then
                       impound = config.garageNames[zahl][4]
                       break
                   end 
               end
               if impound ~= true then
   
                   TriggerServerEvent('garage:loadVehicles')
               else
                   TriggerServerEvent('impound:loadVehicles')
               end
               ----print("requestVehicleList!")
            cb('ok')
   
           end
           if data.args[2] == "requestVehicleList" and data.args[4] == "takein" then
               for zahl=1, #config.garageNames,1 do 
   
                   if config.garageNames[zahl][2] == usedGarage then
                       impound = config.garageNames[zahl][4]
                       break
                   end
               end
               if impound ~= true then
                   for zahl=1, #config.garageNames,1 do 
   
                       if config.garageNames[zahl][2] == usedGarage then
                           fgarage = config.garageNames[zahl][5]
                           break
                       end
                   end 
                   local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(-1)), 25.0)
   
   
                   TriggerServerEvent('currentgarage', usedGarage)
                   loadedCars = 0
                   for key, value in pairs(vehicles) do
                       if fgarage ~= true then
                           ESX.TriggerServerCallback('garage:isOwned', function(owned)
                               ----print("look veh " .. GetVehicleNumberPlateText(value))
                               if owned[1] then
                                   local health = GetVehicleEngineHealth(value)
                                   if health > -2000 then
                                       local carname = GetDisplayNameFromVehicleModel(GetEntityModel(value))
                                       carname = string.upper(carname) 
                                       
                                           table.insert(ownedCars, {Id = GetVehicleNumberPlateText(value), Name = carname, Plate = owned[2]})
                                           ----print("insert veh ".. GetVehicleNumberPlateText(value))
                                       
                                       loadedCars = loadedCars + 1
                                       ----print(loadedCars)
                                   end
                               end
                           end, ESX.Math.Trim(GetVehicleNumberPlateText(value)))
                       else
                           ESX.TriggerServerCallback('garage:isOwnedFrak', function(owned)
                               ----print("look veh " .. GetVehicleNumberPlateText(value))
                               if owned[1] then
                                   local health = GetVehicleEngineHealth(value)
                                   if health > -2000 then
                                       local carname = GetDisplayNameFromVehicleModel(GetEntityModel(value))
                                       carname = string.upper(carname) 
                                       
                                           table.insert(ownedCars, {Id = GetVehicleNumberPlateText(value), Name = carname, Plate = owned[2]})
                                           ----print("insert veh ".. GetVehicleNumberPlateText(value))
                                       
                                       loadedCars = loadedCars + 1
                                       ----print(loadedCars)
                                   end
                               end
                           end, ESX.Math.Trim(GetVehicleNumberPlateText(value)))
                       end
                   end
                   Wait(500) 
                   if loadedCars == 0 then
                       TriggerEvent('responseVehicles', {})
                   else
                       TriggerEvent('responseVehicles', ownedCars)
                   end
   
               end
           end
       end
       cb('ok')
   end)
   
   
   RegisterNetEvent('responseVehicles')
   AddEventHandler('responseVehicles', function(data)
       ----print("responeVehicleList!")
   
       SendNUIMessage({
           action = "responseVehicleList",
           data = json.encode(data)
       })
   end) 
   
   exist = false
   RegisterNetEvent('isVehicleOnMap')
   AddEventHandler('isVehicleOnMap', function(plate)
   
       local vehicle = ESX.Game.GetVehicles()
       for i=1, #vehicle, 1 do 
           exist = false
           local vehicleProps = ESX.Game.GetVehicleProperties(vehicle[i])
           if vehicleProps == nil then
               exist = false
               return
           end
           if vehicleProps.plate == plate then
               exist = true
           end
       end
       TriggerServerEvent('vehicleOnMap', plate, exist)
   
   end)
   function closeNui()
       SetNuiFocus(false, false)
   end
   
   
   local Keys = {
       ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
       ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
       ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
       ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
       ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
       ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
       ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
       ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
       ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
   }
   
   ESX = nil
   local PlayerData = {}
   local cooldown = 0
   local cooldownedcar = {}
   local garages = config.cordinates
   local enableField = false
   local wasinside = false
   
   --ESX
   
   
   
   
   --NPC PED
   Citizen.CreateThread(function()
       if config.npcs then
   
           for _,v in pairs(config.npc) do
               RequestModel(GetHashKey(v[6]))
              while not HasModelLoaded(GetHashKey(v[6])) do
                 Wait(1)
              end
   end
   
           for _,v in pairs(config.npc) do
           ped =  CreatePed(4, v[5],v[1],v[2],v[3], v[4], false, true)
           SetEntityHeading(ped, v[4])
          FreezeEntityPosition(ped, true)
           SetEntityInvincible(ped, true)
           SetBlockingOfNonTemporaryEvents(ped, true)
           SetPedCanRagdoll(ped, false)
          end
      end
   end)
   
   
   
   
   
   
   
   Citizen.CreateThread(function()
      
       
       while true do 
           Wait(500)
           for key, value in pairs(garages) do
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), value[1])
               if dist < 1.5 then
                   if wasinside == false then
                       TriggerEvent('static_interact', "E", "show")
                       wasinside = true
                   end
               elseif dist > 1.5 and dist < 5.0 then
                   if wasinside then
                       wasinside = false
                       TriggerEvent('static_interact', "E", "hide")
                   end
               end
           end
       end
   end)
   
   
   
   gname = nil
   Citizen.CreateThread(function()
   for key, coords in pairs(garages) do
       local showblip
      gname = nil
       for zahl=1, #config.garageNames,1 do 
   
           if config.garageNames[zahl][2] == key then
               showblip = config.garageNames[zahl][3]
               break
           end
           
       end
       for zahl=1, #config.garageNames,1 do 
   
           if config.garageNames[zahl][2] == key then
               impound = config.garageNames[zahl][4]
               break
           end
       end
       for zahl=1, #config.garageNames,1 do 
   
           if config.garageNames[zahl][2] == key then
               gname = config.garageNames[zahl][3]
               break
           end
           TriggerEvent('garage:getNameById', key)
       end
       Wait(500) 
       ----print(localGarageName[key])  
       if impound ~= true then
           if showblip ~= false then
               local blip = AddBlipForCoord(coords[1])
               SetBlipSprite(blip, config.blip) 
               SetBlipScale(blip, 0.8)
               SetBlipColour(blip, config.blipcolour)
               SetBlipDisplay(blip, 4)
               SetBlipAsShortRange(blip, true)
               BeginTextCommandSetBlipName("STRING")
               AddTextComponentString(localGarageName[key])
               EndTextCommandSetBlipName(blip)
           end
       else
           if showblip ~= false then
               local blip = AddBlipForCoord(coords[1])
               SetBlipSprite(blip,477) 
               SetBlipScale(blip, 0.8)
               SetBlipColour(blip, 47)
               SetBlipDisplay(blip, 4)
               SetBlipAsShortRange(blip, true)
               BeginTextCommandSetBlipName("STRING")
               AddTextComponentString(localGarageName[key])
               EndTextCommandSetBlipName(blip)
           end
       end
   end
   end)
   
   function firstToUpper(str)
   return (str:gsub("^%l", string.upper))
   end
   
   function openGarage(id)
       ----print("GID:" .. id)
       local string 
       for zahl=1, #config.garageNames,1 do 
   
           if config.garageNames[zahl][2] == id then
               string = config.garageNames[zahl][1]
               break
           end
       end
       SendNUIMessage({
           action = "openGarage",
           garagename = string
       }) 
       ----print(string)
       ----print("open the garage")
       SetNuiFocus(true, true)
   end
    localGarageName = {}
    RegisterNetEvent('garage:getNameById')
    AddEventHandler('garage:getNameById', function(id)
       string = nil
       for zahl=1, #config.garageNames,1 do 
   
           if config.garageNames[zahl][2] == id then
               string = config.garageNames[zahl][1]
               localGarageName[id] = config.garageNames[zahl][1]
               break
           end
       end
       TriggerServerEvent('computer:setGarageName', id, string)
    end)
   
   
    -- HANDSUP
   
    Citizen.CreateThread(function()
       local dict = "missfbi5ig_21"
       local playerPed = GetPlayerPed(-1)
   
       RequestAnimDict(dict)
       while not HasAnimDictLoaded(dict) do
           Citizen.Wait(100)
       end
       local handsup = false
       while true do
           Citizen.Wait(0)
           if IsControlJustPressed(1, 74) then 
   
           if not IsPedInVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false) , false) then
               if not handsup then
                   TaskPlayAnim(GetPlayerPed(-1), dict, "hand_up_scientist", 8.0, 8.0, -1, 50, 0, false, false, false)
                   handsup = true
               else
                   handsup = false
                   ClearPedTasksImmediately(PlayerPedId()) 
               end
           else
               if handsup then 
                   handsup = false  
                   --ClearPedTasksImmediately(PlayerPedId()) 
               end   
           end
   
   
       end end
   end)
   
   local salute = false
   
   RegisterKeyMapping("salutieren", "Salutieren", "keyboard", "J")
   RegisterCommand('salutieren', function()
       if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
           if not salute then
   
               RequestAnimDict('anim@mp_player_intincarsalutestd@ds@')
    
               TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intincarsalutestd@ds@" ,"idle_a", 8.0, -8.0, -1, 50, 0, false, false, false)
           
               SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
                 
               salute = true
           else
               salute = false
               Citizen.Wait(100)
               --ClearPedTasksImmediately(playerPed)
               ClearPedTasksImmediately(PlayerPedId()) 
           end
       end
   end)
   
       
   -- HUD
   
   
   
   -- Grüße von Coder ;)
   local thirst, hunger, voice, money, black_money, speed, fuel, isTalking, muted, funk, admin = 0,0,8,0,0,0,0,false,false,false,false
   
   ESX = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(500)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       ESX.PlayerData = ESX.GetPlayerData()
        
   end)
   
   
   RegisterNetEvent('startShowHud')
   AddEventHandler('startShowHud', function()
       Wait(1000)
       StartShowHudThread()
   end)
   
   local inVehicle = false
   
   function StartShowHudThread()
       Citizen.CreateThread(function()
           while(true) do
               admin = admin
               inVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
                   for k,v in ipairs(ESX.GetPlayerData().accounts) do
                       if v.name == "black_money" then
                           black_money = v.money
                       end
                   end 
               funk = exports.saltychat:GetRadioChannel(true)
               if funk ~= nil then
                   radioFunk = true
                   --funkType = 1  
               else
                   radioFunk = false
                   funkType = 1
               end
                
               for k,v in ipairs(ESX.GetPlayerData().accounts) do
                   if v.name == "money" then
                       money = v.money
                   end
               end
   
               Citizen.Wait(2000)
           end
       end)
   end
   
   RegisterNetEvent('setDefaultRadioType')
   AddEventHandler('setDefaultRadioType', function()
       funkType = 1
   end)
   
   
   Citizen.CreateThread(function ()
       while true do
           Citizen.Wait(200)
           ----print(radioFunk)
           ----print(funkType)
           SendNUIMessage({
               action = "updatePlayerPanel", 
               money = money,
               blackmoney = black_money,
               aduty = admin,
               voiceRange = voice,
               radioType= funkType,
               radio = radioFunk
           })
       end 
   end)
   
   AddEventHandler('SaltyChat_TalkStateChanged', function(talking)
       isTalking = talking
   end)
   
   RegisterNetEvent('SaltyChat_VoiceRangeChanged')
   AddEventHandler('SaltyChat_VoiceRangeChanged', function(p, a)
   
       voice = p  
       
   end)  
    
   function getPlayerId()
       local src = source
       return src
   end
   RegisterNetEvent('SaltyChat_IsSending')
   AddEventHandler('SaltyChat_IsSending', function(a, b, c, d, e, f)
       ESX.TriggerServerCallback('byte:getPlayerId', function(pid) 
           
       
          
           if tonumber(a) == tonumber(pid) then
              
               if d == true and e == false then
                   
                   return 
   
               end
               if d == true and e == true then
                   funkType = 2 
                   
               else
                   funkType = 1
                  
               end
           end
       end)
           
           
   end)
    
   AddEventHandler('SaltyChat_MicStateChanged', function(isMicrophoneMuted)
       muted = isMicrophoneMuted
   end)
   
   AddEventHandler("hud:range", function(range)
       voice = range
       if range == 3 then
           TriggerEvent('glmp_notify', '#ff8400', "Sprachweite", "Sprachbereich: Gering")
       elseif range == 8 then
           TriggerEvent('glmp_notify', '#ff8400', "Sprachweite", "Sprachbereich: Normal")
       elseif range == 15 then
           TriggerEvent('glmp_notify', '#ff8400', "Sprachweite", "Sprachbereich: Schreien")
       end
   end)
   
   RegisterNetEvent('hud:changeVoice')
   AddEventHandler('hud:changeVoice', function(voice1)
       voice = voice1
   end)
   
   RegisterNetEvent('hud:showAdmin')
   AddEventHandler('hud:showAdmin', function()
       admin = true
   end)
   
   RegisterNetEvent('hud:hideAdmin')
   AddEventHandler('hud:hideAdmin', function()
       admin = false
   end)
   
   
   -- JAIL
   
   ESX = nil
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(0)
       end
   
       PlayerData = ESX.GetPlayerData() 
       Wait(20000)
           local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1692.65, 2580.5, 78.27)
           ----print(dest)
           if dest < 250 then
               ESX.TriggerServerCallback('jail:isJailed', function(jailtime)
                   ----print(jailtime)
                   if jailtime > 0 then
                       TriggerEvent('skinchanger:getSkin', function(skin)
                           if skin.sex == 0 then
                               TriggerEvent("skinchanger:loadClothes", skin, clothes.male)
                           else
                               TriggerEvent("skinchanger:loadClothes", skin, clothes.female)
                           end
                       end) 
                       Wait(10000)
                       TriggerEvent('skinchanger:getSkin', function(skin)
                           if skin.sex == 0 then
                               TriggerEvent("skinchanger:loadClothes", skin, clothes.male)
                           else
                               TriggerEvent("skinchanger:loadClothes", skin, clothes.female)
                           end
                       end) 
                   end
               end)
           end
   
   end)
   jailInCooldown = false
   Citizen.CreateThread(function()
       Citizen.Wait(2000)
       while true do 
           Citizen.Wait(0)
           
               local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1690.84, 2577.54, 45.91)
               if dest < 0.5 then 
                   if jailInCooldown == false then
                       TriggerServerEvent('jail:in')
                       ----print("client ready")
                       jailInCooldown = true
                       Wait(10000)  
                       jailInCooldown = false
                   end
               end
   
               
            
       end
   end) 
   
   clothes = {
       male = {
           ['mask_1'] = 0, ['mask_2'] = 0,
           ['tshirt_1'] = 15, ['tshirt_2'] = 0,
           ['torso_1'] = 5, ['torso_2'] = 0, 
           ['arms'] = 5,
           ['pants_1'] = 5, ['pants_2'] = 7,
           ['shoes_1'] = 1, ['shoes_2'] = 0,
           
       },
       female = {
           ['tshirt_1'] = 15, ['tshirt_2'] = 0,
               ['torso_1'] = 5, ['torso_2'] = 0,
               ['arms'] = 5,
               ['pants_1'] = 5, ['pants_2'] = 7,
               ['shoes_1'] = 8, ['shoes_2'] = 0,
       }
   }
    
   RegisterNetEvent('jail:ready')
   AddEventHandler('jail:ready', function(a)
       TriggerEvent('skinchanger:getSkin', function(skin)
           if skin.sex == 0 then
               TriggerEvent("skinchanger:loadClothes", skin, clothes.male)
           else
               TriggerEvent("skinchanger:loadClothes", skin, clothes.female)
           end
       end)
       TriggerEvent('sendPlayerNotification', "single", "", "Du wurdest Inhaftiert!", "", 15000)
       TriggerEvent('sendPlayerNotification', "single", "", a, "", 5000) 
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
   end) 
   
   RegisterNetEvent('jail:unjail')
   AddEventHandler('jail:unjail', function()
       ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
           TriggerEvent('skinchanger:loadSkin', skin)
       end)
       TriggerEvent('glmp_singlenotify', '', 'Du wurdest entlassen!')
       local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1692.65, 2580.5, 78.27)
       ----print(dest)
       if dest < 250 then
           SetEntityCoords(PlayerPedId(), 1838.18, 2589.1, 45.89, 0, 0, 0, true)
       end
   end)
   
   RegisterCommand('jaillist', function(source)
       local PlayerData = ESX.GetPlayerData()
       if PlayerData.job.name ~= 'fib' then
           if PlayerData.job.name ~= 'police' then
               return
           end 
       end
           ESX.TriggerServerCallback("jail:getPlayers", function(playerArray) 
               elements = {}
               if #playerArray == 0 then
                   ESX.ShowNotification("Niemand ist inhaftiert.")
                   return
               end
               table.insert(elements, {label = 'Schließen', value = 'close'})
               for i = 1, #playerArray, 1 do
                   table.insert(elements, {label = playerArray[i].name .. " | HE: " .. playerArray[i].he, value = ''})
               end 
   
               ESX.UI.Menu.Open(
                   'default', GetCurrentResourceName(), 'jail_unjail_menu',
                   {
                       title = "Inhaftierte Personen",
                       align = "center",
                       elements = elements
                   }, 
               function(data2, menu2)
   
                   if data2.current.value == 'close' then
                       ESX.UI.Menu.CloseAll()
                   end
   
               end, function(data2, menu2)
                   menu2.close()
               end)
           end)
       
   end)
   
   -- RASEN
   
   ESX = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   end)
   
   local warnbool = false
   local warncounter = 0
   
   
   
   Rasen                 = {}
   
   Rasen.Zones = {
   
       rasen = {
           Pos   = {x = -980.0,  y = 314.88,  z = 70.8},
           Size  = {x = 0.5, y = 0.5, z = 1.0},
           Color = {r = 0, g = 255, b = 0},
           Type  = 2
       },
   
   }
   -- Enter / Exit marker events
   Citizen.CreateThread(function()
       while true do
   
           Citizen.Wait(100)
   
           local coords      = GetEntityCoords(PlayerPedId())
           local isInMarker  = false
           local currentZone = nil
   
           for k,v in pairs(Rasen.Zones) do
               if(GetDistanceBetweenCoords(coords, -949.2, 332.04, 71.32, true) < 2.0) then
                   isInMarker  = true
                   currentZone = k
               end
           end
   
   
           if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
               HasAlreadyEnteredMarker = true
               LastZone                = currentZone
               TriggerEvent('rasen:hasEnteredMarker', currentZone)
           end
   
           if not isInMarker and HasAlreadyEnteredMarker then
               HasAlreadyEnteredMarker = false
               TriggerEvent('rasen:hasExitedMarker', LastZone)
           end
       end
   end)
   
   -- Key Controls
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
   
           if CurrentAction then
   
               if IsControlJustReleased(0, 38) then
                   if CurrentAction == 'menu' then
                       openmenu()
                   end
   
                   
               end
           else
               Citizen.Wait(500)
           end
       end
   end)
   
   AddEventHandler('rasen:hasEnteredMarker', function(zone)
       if zone == 'rasen' then
           CurrentAction     = 'menu'
           CurrentActionData = {}
       end
   end)
   
   AddEventHandler('rasen:hasExitedMarker', function(zone)
       CurrentAction = nil
       ESX.UI.Menu.CloseAll()
   end)
   
   local DSgfd2423sdaG = false
   local GFSDGIODSFJSG234 = false
   local Ddsa234fdsghff = 0
   local veh = nil
   
   function openmenu()
       local elements = {}
   
       table.insert(elements, {
           label = "Starten",
           value = "starten"
       })
   
       table.insert(elements, {
           label = "Verkaufen",
           value = "verkaufen"
       })  
   
       ESX.UI.Menu.CloseAll()
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu', {
           title    = "Rasenmähen",
           elements = elements,
           align    = 'top-left'
       }, function(data, menu)
           if data.current.value == 'starten' then
               Ddsa234fdsghff = 0
               menu.close()
               if DSgfd2423sdaG == true then
                   TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Du hast bereits einen Mower bekommen.")
               else 
                   start(source)
                   TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Dein Mower wurde für die Arbeit ausgeparkt.")
               end
           elseif data.current.value == 'verkaufen' then
               menu.close()
               if Ddsa234fdsghff > 0 and DSgfd2423sdaG == true then
                   TriggerServerEvent("lucky_rasenjob:45345340fsdf132", Ddsa234fdsghff)
                   ESX.Game.DeleteVehicle(veh)
                   DSgfd2423sdaG = false
                   TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Du hast dir " .. Ddsa234fdsghff * 7 .. "$ verdient.")
               else if DSgfd2423sdaG == true then
                   TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Du hast leider nix verdient.")
                   ESX.Game.DeleteVehicle(veh)
                   DSgfd2423sdaG = false
               else
                   TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Du hast noch kein Job angenommen.")
               end
           end
           end 
       end, function(data, menu)
           menu.close()
           CurrentAction     = 'menu'
           CurrentActionData = {}
       end)
   end
   
   function start()
       newPlate = 'Job'
       local playerId = PlayerPedId()
       ESX.Game.SpawnVehicle('mower', vector3( -936.96, 330.24, 71.48), 178.62, function(vehicle)
           veh = vehicle
       --	SetPedIntoVehicle(playerId, vehicle, -1)
           ESX.Game.SetVehicleProperties(vehicle, {
               plate = newPlate
           })
       end)
   
       DSgfd2423sdaG = true
   end
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(15000)
           if DSgfd2423sdaG and GFSDGIODSFJSG234 and warnbool == false then
               local rasen = math.random(1,3)
               Ddsa234fdsghff = Ddsa234fdsghff + rasen
               --ESX.ShowNotification("~g~Rasen gemäht. (" .. Ddsa234fdsghff .. ")")
               TriggerEvent('glmp_singlenotify', '', 'Du hast Rasen gemäht. +'.. rasen..' ('.. Ddsa234fdsghff * 7  ..'$)')
           end
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           
   
           if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), false), GetHashKey("mower")) then
               local speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6
               if speed > 5 then 
                   GFSDGIODSFJSG234 = true
               else
                   GFSDGIODSFJSG234 = false
               end
           end 
       end
   end)
   
   Citizen.CreateThread(function() 
       while true do
           Citizen.Wait(1000)
           local player = GetEntityCoords(GetPlayerPed(-1))
           local dest = GetDistanceBetweenCoords(player.x, player.y, player.z, -980.0, 314.88, 70.8, false)
   
       
           if dest > 50 and not warnbool and DSgfd2423sdaG then
               TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Bitte bleib in einem Radius von 50 Metern.")
                warnbool = true
                warncounter = 10
                return;
           end
   
           if dest < 50 and warnbool and DSgfd2423sdaG then	
               TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Du befindest dich wieder im 50 Meter Radius.")
               warnbool = false
               warncounter = 0
           end
   
           if warnbool then
               warncounter = warncounter - 1
           end
   
           if warnbool and warcounter == 0 then
               --TriggerEvent('glmp_notify', "DodgerBlue", "Job", "Du wirst nicht bezahlt um herumtrödeln")
           end
   
   
       end
   end)
   Citizen.CreateThread(function() 
       --for _,v in pairs(dealer) do
           RequestModel(GetHashKey("a_m_o_acult_02"))
           while not HasModelLoaded(GetHashKey("a_m_o_acult_02")) do
             Wait(1)
           end
       
           RequestAnimDict("mini@strip_club@idles@bouncer@base")
           while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
             Wait(1)
           end
           ped =  CreatePed(4, 0x4BA14CCA,-949.2, 332.04, 71.32-1, 3374176, false, true)
           SetEntityHeading(ped, 355.42) 
           FreezeEntityPosition(ped, true)
           SetEntityInvincible(ped, true) 
           SetBlockingOfNonTemporaryEvents(ped, true)
       --end
   end)
   
   
   
   local blips = {
        {title="Rasenmähen", colour=2, id=238, x = -949.6,  y = 332.44,  z = 71.32},
        {title="Los Santos Police Department", colour=38, id=526, x = 447.0,  y = -983.88,  z = 30.68} -- Snapzz soll fresse halten
     }
         
   Citizen.CreateThread(function()
   
       for _, info in pairs(blips) do
         info.blip = AddBlipForCoord(info.x, info.y, info.z)
         SetBlipSprite(info.blip, info.id)
         SetBlipDisplay(info.blip, 4)
         SetBlipScale(info.blip, 0.8)
         SetBlipColour(info.blip, info.colour)
         SetBlipAsShortRange(info.blip, true)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentString(info.title)
         EndTextCommandSetBlipName(info.blip)
       end
   end)
   
   
   -- LIFEINVADER
   
   local coords = vector3(-1051.5064697266, -238.974609375, 44.021026611328)
   
   Citizen.CreateThread(function()
       local blip = AddBlipForCoord(coords)
       SetBlipSprite(blip, 77)
       SetBlipScale(blip, 0.8)
       SetBlipColour(blip, 49) 
       SetBlipAsShortRange(blip, true)
       BeginTextCommandSetBlipName('STRING')
       AddTextComponentSubstringPlayerName("Lifeinvader")
       EndTextCommandSetBlipName(blip)
       while true do
           Citizen.Wait(1)
           local playerPed = PlayerPedId()
           local playerCoords = GetEntityCoords(playerPed)
           local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), coords)
           if distance < 100 then
               DrawMarker(29, coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 0, 100, true, true, 2, true, false, false, false)
           end
           if distance < 2.0 then 
               if IsControlJustPressed(0, 38) then 
                   ESX.TriggerServerCallback('matthias:getNumber', function(number)
                       ESX.TriggerServerCallback('getPlayerBalance', function(bal)  
                           SendNUIMessage({action="openWindow", window = "LifeInvader", windowData =  json.encode(  {textBoxObject = {Title =  tostring(bal),Callback = "sendLifeinvader",Message= tostring(number)}}) })
                           SetNuiFocus(true,true)     
                       end)
                       
                   end)
               end
           end 
   
       end
    
   
   end)   
   
   
   RegisterNUICallback('trigger', function(data, cb) 
       local src = source 
       if data.args[1] == "LifeInvader" then
           if data.args[2] == "send" then
               ESX.TriggerServerCallback('matthias:getNumber', function(number)
                   TriggerServerEvent('AddWerbung', number, data.args[3]) 
                   
   
               end)
           elseif data.args[2] == "pay" then  
               TriggerServerEvent('lifeinvader:pay', data.args[3])
           end
       end
   end)
   
   
   -- LOGS
   
   AddEventHandler('esx:onPlayerDeath', function(data)
       -- TriggerServerEvent('esx:onPlayerDeath', data)
    end) 
    
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(playerData)
        --print("DATA: ".. json.encode(playerData)) 
        TriggerServerEvent('byte:sendLog', 'loaded', json.encode(playerData))
    end)
   
    -- LSPD
   
    
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(500)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       ESX.PlayerData = ESX.GetPlayerData()
   end)
   
   equipPoints = {
       {vector3(483.86, -998.67, 30.69), 'Mission Row PD'},
       {vector3(118.59, -728.81, 242.81), 'FIB'},     
       {vector3(1851.95, 3691.49, 34.27), 'Sandy Shores LSPD'},
       {vector3(306.68, -601.8, 43.28), 'LSMD'},
       {vector3(-790.8, -1347.28, 8.56), 'DMV'},
       {vector3(-600.78, -913.87, 23.89), 'Redline'},
   } 
   Citizen.CreateThread(function()
       while true do
           Wait(10)
           for key, value in pairs(equipPoints) do
               ------print(value[2]) 
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), value[1])
               if dist < 1.5 then
                   if showZugreifenMsg ~= true then 
                       ESX.ShowNotification("Drücke E um auf die ".. value[2] .. ' Waffenkammer zuzugreifen!')
                       showZugreifenMsg = true
                   end
                   if IsControlJustReleased(0, 38) then
                       local PlayerData = ESX.GetPlayerData()
                       if PlayerData.job.name ~= "police" then
                           if PlayerData.job.name ~= "redlinep" then
                               if PlayerData.job.name ~= "dmv" then
                                   if PlayerData.job.name ~= "ambulance" then
--                                    if PlayerData.job.name ~= "redlinep" then 
                                       ESX.ShowNotification("Keine Berechtigung!")
                                       return
                                   end
   
                               end
   
                           end 
                       end
                       OpenArmoryMenu() 
                   end
               elseif dist > 1.6 and dist < 5 then 
                   showZugreifenMsg = nil
               end
           end
       end
   end)
   
   function OpenWaffenKaufenMenuFib()
       PlayerData = ESX.GetPlayerData()
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
           title    = 'Staat - Waffenkammer | Waffe Kaufen',
           align    = 'top-left',
           elements = { 
               {label = 'Schließen', value = 'close'},
               {label = 'Zurück', value = 'back'}, 
               {label = 'Rang 0 | Schwere Pistole', value = 'beamten_heavypistol'},
               {label = 'Rang 0 | SMG', value = 'beamten_smg'},
               {label = 'Rang 0 | Tazer', value = 'beamten_stungun'},
               {label = 'Rang 0 | Flare', value = 'beamten_flare'},		
               {label = 'Rang 1 | Assault SMG', value = 'beamten_assaultsmg'},
               {label = 'Rang 1 | Carbinerifle', value = 'beamten_carbinerifle'},		
               {label = 'Rang 3 | Advancedrifle', value = 'beamten_advancedrifle'},
               {label = 'Rang 5 | Bullpuprifle', value = 'beamten_bullpuprifle'}, 		
           } 
       }, function(data, menu)
           if data.current.value == 'close' then
               ESX.Menu.UI.CloseAll()
           elseif data.current.value == 'back' then
               menu.close()
           
           else
               local weapon = data.current.value
               needRank = 13
               if weapon == 'beamten_heavypistol' then
                   needRank = 0
               elseif weapon == 'beamten_smg' then
                   needRank = 0
               elseif weapon == 'beamten_stungun' then
                   needRank = 0
               elseif weapon == 'beamten_flare' then
                   needRank = 0
               elseif weapon == 'beamten_assaultsmg' then
                   needRank = 1
               elseif weapon == 'beamten_carbinerifle' then
                   needRank = 1
               elseif weapon == 'beamten_advancedrifle' then
                   needRank = 3
               elseif weapon == 'beamten_bullpuprifle' then
                   needRank = 5
                   
               end
               if PlayerData.job.grade >= needRank then
                   TriggerServerEvent('esx_policejob:giveItem', data.current.value)
               else
                   if needRank <= 12 then
                       TriggerEvent('glmp_singlenotify', '', 'Du benötigst mindestens Rang '.. needRank .. ' um diese Waffe zu entnehmen!')
                   else
                       TriggerEvent('glmp_singlenotify', '', 'Diese Waffe ist nicht verfügbar!')
                   end
               end
           end
       end, function(data, menu)
           menu.close()
       end)
   end
   
   function OpenArmoryMenu()
       local elements = {
           {label = 'Schließen', value = 'closeMenus'},
           {label = 'Gegenstände', value = 'props'},
           {label = 'Waffen', value = 'buy_weapons'},
           {label = 'Items', value = 'item_kaufen'},
           {label = 'Munition', value = 'buy_ammo'},
           {label = 'Westenauswahl', value = 'weste'},
           {label = 'Dienst', value = 'dutymenu'}
       }
   
       
   
       ESX.UI.Menu.CloseAll()
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
           title    = 'Staat - Waffenkammer',
           align    = 'top-left',
           elements = elements
       }, function(data, menu) 
           ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(isDuty) 
               if data.current.value == 'closeMenus' then
                   ESX.UI.Menu.CloseAll()
               elseif data.current.value == 'buy_weapons' then
                   if isDuty == 1 then
                       if ESX.GetPlayerData().job.name == "police" then
                           OpenWaffenKaufenMenu()
                       elseif ESX.GetPlayerData().job.name == "fib" then
                           OpenWaffenKaufenMenuFib()
                       elseif ESX.GetPlayerData().job.name == "ambulance" then
                           OpenAmmoKaufenMenuM()    
                       else
                           OpenWaffenKaufenMenuStaat()
                       end
                   else
                       TriggerEvent('glmp_singlenotify', '', 'Du bist nicht im Dienst!')
                   end
               elseif data.current.value == 'weste' then 
                   if isDuty == 1 then
                       if ESX.GetPlayerData().job.name == "police" then
                           openWestenMenuL()
                       elseif ESX.GetPlayerData().job.name == "fib" then
                           openWestenMenuF()
                       elseif ESX.GetPlayerData().job.name == "ambulance" then
                           openWestenMenuM()   
                       else 
                           openWestenMenu()
                       end
                   else
                       TriggerEvent('glmp_singlenotify', '', 'Du bist nicht im Dienst!')
                   end 
               elseif data.current.value == 'buy_ammo' then
                   if isDuty == 1 then
                       OpenAmmoKaufenMenu() 
                   else
                       TriggerEvent('glmp_singlenotify', '', 'Du bist nicht im Dienst!')
                   end
               elseif data.current.value == 'item_kaufen' then
   
                   if isDuty == 1 then
                       OpenItemKaufenMenu()
                   else
                       TriggerEvent('glmp_singlenotify', '', 'Du bist nicht im Dienst!')
                   end
               elseif data.current.value == 'dutymenu' then
   
                   TriggerEvent('byte:openDutyMenu')
               end
           end)
       end, function(data, menu)
           menu.close()
   
           
       end)
   end
   
   function OpenItemKaufenMenu()
   
       local elements = {
           {label = 'Schließen', value = 'close'}, 
           {label = 'Zurück', value = 'back'},
           {label = 'Handy', value = 'phone'},
           {label = 'Wegfahrsperre', value = 'parkkralle'},
           {label = 'Nagelbänder', value = 'spikestrips'},
           {label = 'Beamtenschutzweste', value = 'beamtenweste'}
       }
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
           title    = 'Staat - Waffenkammer | Item Kaufen',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           if data.current.value == 'close' then
               ESX.Menu.UI.CloseAll()
           elseif data.current.value == 'back' then
               menu.close()
           else
               TriggerServerEvent('esx_policejob:giveItem', data.current.value)
           end
       end, function(data, menu)
           menu.close()
       end)
   end
   
   
   function OpenAmmoKaufenMenu()
   
       local elements = {
           {label = 'Schließen', value = 'close'}, 
           {label = 'Zurück', value = 'back'},
           {label = 'Magazin (Pistole)', value = 'beamten_ammo_pistol'},
           {label = 'Magazin (SMG)', value = 'beamten_ammo_smg'},
           {label = 'Magazin (Sturmgewehr)', value = 'beamten_ammo_rifle'},
           {label = 'Magazin (Schrotflinte)', value = 'beamten_ammo_pump'},
           {label = 'Magazin (Sniper)', value = 'beamten_ammo_sniper'}
       }
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
           title    = 'Staat - Waffenkammer | Munition Kaufen',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           if data.current.value == 'close' then
               ESX.Menu.UI.CloseAll()
           elseif data.current.value == 'back' then
               menu.close()
           else
               TriggerServerEvent('esx_policejob:giveItem', data.current.value)
           end
       end, function(data, menu)
           menu.close()
       end)
   end

   function OpenAmmoKaufenMenuM()
   
    local elements = {
        {label = 'Schließen', value = 'close'}, 
        {label = 'Zurück', value = 'back'}
    }
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
        title    = 'Staat - Waffenkammer | Munition Kaufen',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'close' then
            ESX.Menu.UI.CloseAll()
        elseif data.current.value == 'back' then
            menu.close()
        else
            TriggerServerEvent('esx_policejob:giveItem', data.current.value)
        end
    end, function(data, menu)
        menu.close()
    end)
end
   
   
   
   function OpenWaffenKaufenMenu()
       PlayerData = ESX.GetPlayerData()
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
           title    = 'Staat - Waffenkammer | Waffe Kaufen',
           align    = 'top-left',
           elements = {
               {label = 'Schließen', value = 'close'},
               {label = 'Zurück', value = 'back'}, 
               {label = 'Rang 0 | Schwere Pistole', value = 'beamten_heavypistol'},
               {label = 'Rang 0 | SMG', value = 'beamten_smg'},
               {label = 'Rang 0 | Tazer', value = 'beamten_stungun'},
               {label = 'Rang 0 | Flare', value = 'beamten_flare'},		
               {label = 'Rang 0 | Schlagstock', value = 'beamten_nightstick'},		
               {label = 'Rang 1 | Assault SMG', value = 'beamten_assaultsmg'},
               {label = 'Rang 3 | Carbinerifle', value = 'beamten_carbinerifle'},		
               {label = 'Rang 5 | Advancedrifle', value = 'beamten_advancedrifle'},
               {label = 'Rang 7 | Bullpuprifle', value = 'beamten_bullpuprifle'}, 		
           }  
       }, function(data, menu)
           if data.current.value == 'close' then
               ESX.Menu.UI.CloseAll()
           elseif data.current.value == 'back' then
               menu.close()
           
           else
               local weapon = data.current.value
               needRank = 13
               if weapon == 'beamten_heavypistol' then
                   needRank = 0
               elseif weapon == 'beamten_smg' then
                   needRank = 0
               elseif weapon == 'beamten_stungun' then
                   needRank = 0
               elseif weapon == 'beamten_nightstick' then
                   needRank = 0
               elseif weapon == 'beamten_flare' then
                   needRank = 0
               elseif weapon == 'beamten_assaultsmg' then
                   needRank = 1
               elseif weapon == 'beamten_carbinerifle' then
                   needRank = 3
               elseif weapon == 'beamten_advancedrifle' then
                   needRank = 5
               elseif weapon == 'beamten_bullpuprifle' then
                   needRank = 7
               end
               if PlayerData.job.grade >= needRank then
                   TriggerServerEvent('esx_policejob:giveItem', data.current.value)
               else
                   if needRank <= 12 then
                       TriggerEvent('glmp_singlenotify', '', 'Du benötigst mindestens Rang '.. needRank .. ' um diese Waffe zu entnehmen!')
                   else
                       TriggerEvent('glmp_singlenotify', '', 'Diese Waffe ist nicht verfügbar!')
                   end
               end
               ----print("NEED: " .. needRank)
               ----print("W: ".. weapon)
               ----print("JG: ".. PlayerData.job.grade)
           end
       end, function(data, menu)
           menu.close()
       end)
   end
   
   
   function OpenWaffenKaufenMenuStaat()
       PlayerData = ESX.GetPlayerData()
   
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
           title    = 'Staat - Waffenkammer | Waffe Kaufen',
           align    = 'top-left',
           elements = {
               {label = 'Schließen', value = 'close'},
               {label = 'Zurück', value = 'back'}, 
               {label = 'Rang 0 | Tazer', value = 'stungun'},
        
           }  
       }, function(data, menu)
           if data.current.value == 'close' then
               ESX.Menu.UI.CloseAll()
           elseif data.current.value == 'back' then
               menu.close()
           
           else
               
                   TriggerServerEvent('esx_policejob:giveItem', data.current.value)
               
           end
       end, function(data, menu)
           menu.close()
       end)
   end
   
   
   
   --Entfesseln
   RegisterNetEvent('esx_policejob:entfesseln')
   AddEventHandler('esx_policejob:entfesseln',function()
       if isHandcuffed then
           local playerPed = GetPlayerPed(-1)
           IsHandcuffed = false
           ClearPedSecondaryTask(playerPed)
           SetEnableHandcuffs(playerPed, false)
           DisablePlayerFiring(playerPed, false)
           SetPedCanPlayGestureAnims(playerPed, true)
           FreezeEntityPosition(playerPed, false)
           DisplayRadar(true)
       end
   end)
   
    
   
   RegisterNetEvent('esx_policejob:handcuff')
   AddEventHandler('esx_policejob:handcuff', function()
       
       local playerPed = PlayerPedId()
   
       Citizen.CreateThread(function()
           if isHandcuffed ~= true then
   
               RequestAnimDict('mp_arresting')
               while not HasAnimDictLoaded('mp_arresting') do
                   Citizen.Wait(100)
               end 
   
               TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
   
               SetEnableHandcuffs(playerPed, true)
               DisablePlayerFiring(playerPed, true)
               SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
               SetPedCanPlayGestureAnims(playerPed, false)
               FreezeEntityPosition(playerPed, true)
               ----print("cuufed")
   
               isHandcuffed = true
           else
   
               ClearPedSecondaryTask(playerPed)
               SetEnableHandcuffs(playerPed, false)
               DisablePlayerFiring(playerPed, false)
               SetPedCanPlayGestureAnims(playerPed, true)
               FreezeEntityPosition(playerPed, false)
               ----print("uncuffed")  
               isHandcuffed = false
           end
       end)
   end)
   
   
   
   
   function OpenBodySearchMenu(player) 
       ----print("body searhc")
       ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
           local elements = {}
   
           for i=1, #data.accounts, 1 do
               if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
                   table.insert(elements, {
                       label    = ESX.Math.Round(data.accounts[i].money) .. '$ Schwarzgeld',
                       value    = 'black_money',
                       itemType = 'item_account',
                       amount   = data.accounts[i].money
                   })
   
                   break
               end
           end  
     
           table.insert(elements, {label = '-- Waffen --'})
   
           for i=1, #data.weapons, 1 do
               table.insert(elements, {
                   label    = ESX.GetWeaponLabel(data.weapons[i].name),
                   value    = data.weapons[i].name,
                   itemType = 'item_weapon',
                   amount   = data.weapons[i].ammo
               })
           end
   
           table.insert(elements, {label = '-- Inventar --'})
   
           for i=1, #data.inventory, 1 do
               if data.inventory[i].count > 0 then
                   table.insert(elements, {
                       label    = data.inventory[i].count .. 'x '.. data.inventory[i].label,
                       value    = data.inventory[i].name,
                       itemType = 'item_standard',
                       amount   = data.inventory[i].count
                   }) 
               end
           end
   
           ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
               title    = 'Item / Waffe Abnehmen',
               align    = 'top-left', 
               elements = elements
           }, function(data, menu)
               if data.current.value then
                   TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
                   OpenBodySearchMenu(player)
               end
           end, function(data, menu)
               menu.close()
           end)
       end, GetPlayerServerId(player))
   end
   
   
   
   RegisterNetEvent('lspd:openBodySearch') 
   AddEventHandler('lspd:openBodySearch', function()
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                   
       if closestPlayer ~= -1 and closestDistance <= 3.0 then
           TriggerEvent('esx_policejob:durchsuchenanimation')
           Citizen.Wait(6000)
           OpenBodySearchMenu(closestPlayer)
       end
   end)
   
   --Durchsuchen Animation
   RegisterNetEvent('esx_policejob:durchsuchenanimation')
   AddEventHandler('esx_policejob:durchsuchenanimation', function()
       durchsucht = not durchsucht
       local playerPed = GetPlayerPed(-1)
       TriggerEvent('patron_inventory:progressbar', 6000)
       TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_PARKING_METER', 0, true)
       Citizen.Wait(6000)
       ClearPedTasksImmediately(playerPed)
       durchsucht = false
   end)
   
   
   
   -- Handcuff
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           local playerPed = PlayerPedId()
   
           if isHandcuffed then
               --DisableControlAction(0, 1, true) -- Disable pan
               DisableControlAction(0, 2, true) -- Disable tilt
               DisableControlAction(0, 24, true) -- Attack
               DisableControlAction(0, 257, true) -- Attack 2
               DisableControlAction(0, 25, true) -- Aim
               DisableControlAction(0, 263, true) -- Melee Attack 1
               DisableControlAction(0, 32, true) -- W
               DisableControlAction(0, 34, true) -- A
               DisableControlAction(0, 31, true) -- S
               DisableControlAction(0, 30, true) -- D
   
               DisableControlAction(0, 45, true) -- Reload
               DisableControlAction(0, 22, true) -- Jump
               DisableControlAction(0, 44, true) -- Cover
               DisableControlAction(0, 37, true) -- Select Weapon
               DisableControlAction(0, 23, true) -- Also 'enter'?
   
               DisableControlAction(0, 288,  true) -- Disable phone
               DisableControlAction(0, 289, true) -- Inventory
               DisableControlAction(0, 170, true) -- Animations
               DisableControlAction(0, 167, true) -- Job
   
               --DisableControlAction(0, 0, true) -- Disable changing view
               DisableControlAction(0, 26, true) -- Disable looking behind
               DisableControlAction(0, 73, true) -- Disable clearing animation
               DisableControlAction(2, 199, true) -- Disable pause screen
   
               DisableControlAction(0, 59, true) -- Disable steering in vehicle
               DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
               DisableControlAction(0, 72, true) -- Disable reversing in vehicle
   
               DisableControlAction(2, 36, true) -- Disable going stealth
   
               DisableControlAction(0, 47, true)  -- Disable weapon
               DisableControlAction(0, 264, true) -- Disable melee
               DisableControlAction(0, 257, true) -- Disable melee
               DisableControlAction(0, 140, true) -- Disable melee
               DisableControlAction(0, 141, true) -- Disable melee
               DisableControlAction(0, 142, true) -- Disable melee
               DisableControlAction(0, 143, true) -- Disable melee
               DisableControlAction(0, 75, true)  -- Disable exit vehicle
               DisableControlAction(27, 75, true) -- Disable exit vehicle
   
               if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
                   ESX.Streaming.RequestAnimDict('mp_arresting', function()
                       TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                   end)
               end
           else
               Citizen.Wait(500)
           end
       end
   end)
   
   
   --Keys blockieren beim Durhsuchen
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           local playerPed = GetPlayerPed(-1)
           if durchsucht then
               DisableControlAction(0, 140, true)
               DisableControlAction(0, 74, true)
               DisableControlAction(0, 2, true) 
               DisableControlAction(0, 263, true) 
               DisableControlAction(0, 45, true) 
               DisableControlAction(0, 22, true) 
               DisableControlAction(0, 44, true) 
               DisableControlAction(0, 37, true) 
               DisableControlAction(0, 288,  true) 
               DisableControlAction(0, 289, true)  
               DisableControlAction(0, 170, true) 
               DisableControlAction(0, 167, true) 
               DisableControlAction(1, 254, true)
               DisableControlAction(0, 47, true)  
           end
       end
   end)
   
   useAmmo = false
   
   RegisterNetEvent('byte:use:ammo_pistol')
   AddEventHandler('byte:use:ammo_pistol', function(b)
       if useAmmo ~= true then
           local weaponHash = GetSelectedPedWeapon(PlayerPedId())
           local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
           ----print(ammoType) 
           TriggerServerEvent('byte:sendLog', 'admin', 'AMMO HASH', ammoType)
           if ammoType == 1950175060 then 
               useAmmo = true
               TriggerEvent("patron_inventory:progressbar",5000)
               startAnimS2("anim@weapons@pistol@machine_str", "reload_aim")
               Citizen.Wait(4000)
               useAmmo = false
               ClearPedTasksImmediately(PlayerPedId())
               AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
               if b == true then
                   TriggerServerEvent('byte:removeItem', 'beamten_ammo_pistol')
               else
                   TriggerServerEvent('byte:removeItem', 'ammo_pistol')
               end
               TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
           else
               TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
           end
       end
   end)
    
   RegisterNetEvent('byte:use:ammo_smg')
   AddEventHandler('byte:use:ammo_smg', function(b)
       if useAmmo ~= true then
           local weaponHash = GetSelectedPedWeapon(PlayerPedId())
           local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
           if ammoType == 1820140472 then  
               useAmmo = true
               TriggerEvent("patron_inventory:progressbar",5000)
               startAnimS2("anim@weapons@pistol@machine_str", "reload_aim")
               Citizen.Wait(4000)
               useAmmo = false
               ClearPedTasksImmediately(PlayerPedId())
               AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
               if b == true then
                   TriggerServerEvent('byte:removeItem', 'beamten_ammo_smg')
               else
                   TriggerServerEvent('byte:removeItem', 'ammo_smg')
               end
               TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
           else
               TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
           end
       end
   end)
   
   
   RegisterNetEvent('byte:use:ammo_rifle')
   AddEventHandler('byte:use:ammo_rifle', function(b)
       if useAmmo ~= true then
           local weaponHash = GetSelectedPedWeapon(PlayerPedId())
           local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
           if ammoType == 218444191 then  
               TriggerEvent("patron_inventory:progressbar",5000)
               startAnimS2("anim@weapons@pistol@machine_str", "reload_aim")
               useAmmo = true
               Citizen.Wait(4000)
               useAmmo = false
               ClearPedTasksImmediately(PlayerPedId())
               AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30)  
               ClearPedTasksImmediately(PlayerPedId()) 
               if b == true then
                   TriggerServerEvent('byte:removeItem', 'beamten_ammo_rifle')
               else
                   TriggerServerEvent('byte:removeItem', 'ammo_rifle')
               end
               TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
           else
               TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
           end
       end
   end)
   
    
   RegisterNetEvent('byte:use:ammo_sniper') 
   AddEventHandler('byte:use:ammo_sniper', function(b)
       if useAmmo ~= true then
           local weaponHash = GetSelectedPedWeapon(PlayerPedId())
           local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
           if ammoType == 1285032059 then  
               TriggerEvent("patron_inventory:progressbar",5000)   
               startAnimS2("anim@weapons@pistol@machine_str", "reload_aim")
               useAmmo = true
               Citizen.Wait(4000)
               useAmmo = false
               ClearPedTasksImmediately(PlayerPedId())
               AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
               if b == true then
                   TriggerServerEvent('byte:removeItem', 'beamten_ammo_sniper')
               else
                   TriggerServerEvent('byte:removeItem', 'ammo_sniper')
               end
               TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
           else
               TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
           end
       end
   end)
   function startAnimS2(lib, anim)
       ESX.Streaming.RequestAnimDict(lib, function()
           TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
       end)
   end
   
   
   RegisterNetEvent('byte:use:ammo_pump')
   AddEventHandler('byte:use:ammo_pump', function(b)
       if useAmmo ~= true then
           local weaponHash = GetSelectedPedWeapon(PlayerPedId())
           local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
           if ammoType == -1878508229 then  
               TriggerEvent("patron_inventory:progressbar",5000)   
               startAnimS2("anim@weapons@pistol@machine_str", "reload_aim")
               useAmmo = true
               Citizen.Wait(4000)
               useAmmo = false
               ClearPedTasksImmediately(PlayerPedId()) 
               AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
               if b == true then
                   TriggerServerEvent('byte:removeItem', 'beamten_ammo_pump')
               else
                   TriggerServerEvent('byte:removeItem', 'ammo_pump')
               end
               TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
           else
               TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
           end
       end
   end)
   
   
   
   pweste1 = 15
   pweste2 = 2
   
   RegisterNetEvent('use:beamtenschutzweste')
   AddEventHandler('use:beamtenschutzweste', function()
       ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(isDuty) 
           --print(isDuty)
           if isDuty == 1 then
               
   
               TriggerEvent('patron_inventory:progressbar', 4000)
   
               startAnimS2( "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01")
               Citizen.Wait(4300)   
               ClearPedTasksImmediately(GetPlayerPed(-1))
   
           
               SetPedComponentVariation(GetPlayerPed(-1), 9, pweste1, pweste2, 3)
               AddArmourToPed(GetPlayerPed(-1), 100)
               SetPedArmour(GetPlayerPed(-1), 100)
               TriggerServerEvent('byte:removeItem', 'beamtenweste')
           else  
               ESX.ShowNotification("Diese Weste kann nur im Staatsdienst verwendet werden.")
           end
       end)
   
       
   end) 
   
   RegisterKeyMapping('beamtenschutzweste', 'Beamtenschutzweste', 'keyboard', '')
   RegisterCommand("beamtenschutzweste", function()
       TriggerServerEvent('use:s:beamtenschutzweste')
   end)
   
   
   function openWestenMenu()
   
       
     
       ESX.UI.Menu.Open(
         'default', GetCurrentResourceName(), 'pd_actions',
         {
           title    = 'Staat - Westenauswahl',
           align    = 'top-left',
           
           elements = {
   
             {label = 'Schließen', value = 'close'},
             {label = 'Zurück', value = 'close1'},
             {label = 'Standart Beamtenweste', value = 'def'}
           },
         },
         function(data, menu)
           if data.current.value == "close1" then 
               menu.close()
               return
           elseif data.current.value == "close" then 
                   ESX.UI.Menu.CloseAll()
                   return
           elseif data.current.value == "1" then    
               pweste1 = 12
               pweste2 = 3  
           elseif data.current.value == "def" then    
               pweste1 = 15
               pweste2 = 2 
           elseif data.current.value == "2" then 
               pweste1 = 7
               pweste2 = 0
           elseif data.current.value == "cor" then 
               pweste1 = 11
               pweste2 = 2
           elseif data.current.value == "3" then 
               pweste1 = 10
               pweste2 = 3
           elseif data.current.value == "4" then 
               pweste1 = 10
               pweste2 = 1
   
           end
           ESX.ShowNotification("Du hast die ".. data.current.label .. " ausgewählt!")
         
         end,
         function(data, menu)
     
           menu.close()
     
         end
       )
     
   end
   
   function openWestenMenuL()
   
       
     
       ESX.UI.Menu.Open(
         'default', GetCurrentResourceName(), 'pd_actions',
         {
           title    = 'Staat - Westenauswahl',
           align    = 'top-left',
           
           elements = {
   
             {label = 'Schließen', value = 'close'},
             {label = 'Zurück', value = 'close1'},
             {label = 'Standart Beamtenweste', value = 'def'},
             {label = 'LSPD Beamtenweste', value = '1'},
             {label = 'GTF Beamtenweste', value = '2'},
             {label = 'SWAT Beamtenweste', value = 'swat'},
             {label = 'Corrections Beamtenweste', value = 'cor'}
           },
         },
         function(data, menu)
           if data.current.value == "close1" then 
               menu.close()
               return
           elseif data.current.value == "close" then 
                   ESX.UI.Menu.CloseAll()
                   return
           elseif data.current.value == "1" then    
               pweste1 = 12
               pweste2 = 3  
           elseif data.current.value == "swat" then    
               pweste1 = 7
               pweste2 = 3   
           elseif data.current.value == "def" then    
               pweste1 = 15
               pweste2 = 2 
           elseif data.current.value == "2" then 
               pweste1 = 7
               pweste2 = 0
           elseif data.current.value == "cor" then 
               pweste1 = 11
               pweste2 = 2
           elseif data.current.value == "3" then 
               pweste1 = 10
               pweste2 = 3
           elseif data.current.value == "4" then 
               pweste1 = 10
               pweste2 = 1
   
           end
           ESX.ShowNotification("Du hast die ".. data.current.label .. " ausgewählt!")
         
         end,
         function(data, menu)
     
           menu.close()
     
         end
       )
     
   end
   
   function openWestenMenuF()
   
       
     
       ESX.UI.Menu.Open(
         'default', GetCurrentResourceName(), 'pd_actions',
         {
           title    = 'Staat - Westenauswahl',
           align    = 'top-left',
           
           elements = {
   
             {label = 'Schließen', value = 'close'},
             {label = 'Zurück', value = 'close1'},
             {label = 'Standart Beamtenweste', value = 'def'},
             {label = 'FIB Beamtenweste', value = '3'},
             {label = 'FIB Agent Beamtenweste', value = '4'},
             {label = 'FIB Agent (2) Beamtenweste', value = '42'},
             {label = 'FIB Special Beamtenweste', value = 'special'}
           }
         },
         function(data, menu)
           if data.current.value == "close1" then 
               menu.close()
               return
           elseif data.current.value == "close" then 
                   ESX.UI.Menu.CloseAll()
                   return
           elseif data.current.value == "1" then    
               pweste1 = 12
               pweste2 = 3  
           elseif data.current.value == "def" then    
               pweste1 = 15
               pweste2 = 2 
           elseif data.current.value == "2" then 
               pweste1 = 7
               pweste2 = 0
           elseif data.current.value == "cor" then 
               pweste1 = 11
               pweste2 = 2 
           elseif data.current.value == "3" then 
               pweste1 = 10 
               pweste2 = 3
           elseif data.current.value == "4" then 
               pweste1 = 10
               pweste2 = 1
           elseif data.current.value == "42" then 
               pweste1 = 3
               pweste2 = 0
           elseif data.current.value == "special" then 
               pweste1 = 3
               pweste2 = 2
   
           end
           ESX.ShowNotification("Du hast die ".. data.current.label .. " ausgewählt!")
         
         end,
         function(data, menu)
     
           menu.close()
     
         end
       )
     
   end
   
   -- LSPD AUTOMAT
   
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(500)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       ESX.PlayerData = ESX.GetPlayerData()
   end)
   automaten = {
       {vector3(435.78, -976.36, 30.72), 'LSPD Mission Row'},
       {vector3(1853.93, 3682.38, 34.27), 'LSPD Sandy'} 
   }
   showAutomatMsg = false
   Citizen.CreateThread(function()
       while true do
           Wait(10)
           for key, value in pairs(automaten) do
               ------print(value[2]) 
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), value[1])
               if dist < 1.5 then
                   if showAutomatMsg ~= true then 
                       ESX.ShowNotification("Benutze E um auf den Ticket Automat zuzugreifen!")
                       showAutomatMsg = true 
                   end
                   if IsControlJustReleased(0, 38) then
                       ESX.TriggerServerCallback('lspd:automat:getPayTicketSumme', function(openCash)
                           elements = {
                               {label = 'Schließen', action = 'close'},
                               {label = 'Offene Tickets Bezahlen ('.. openCash .. '$)', action = 'payTickets'},
                               {label = 'Waffenlizenz erwerben (50000$)', action = 'buyGunlicense'}
            
                           }
                       
   
                           ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'adminmenu', {
                               title    = value[2] .. ' - Automat',
                               align    = 'top-left',
                               elements = elements
                           }, function(data, menu)
                               if data.current.action == "close" then
                                   ESX.UI.Menu.CloseAll()
                               elseif data.current.action == "payTickets" then
                                   if openCash > 0 then
                                       TriggerServerEvent('payTickets', openCash)
                                       ESX.UI.Menu.CloseAll()
                                   else
                                       ESX.ShowNotification('Du hast keine offenen Tickets!')
                                   end
                               elseif data.current.action == "buyGunlicense" then
                                   ESX.TriggerServerCallback('byte_taxi:hasPBS', function(has)
                                       if has ~= true then  
                                           TriggerServerEvent('buyGunLic')
                                       else
                                           ESX.ShowNotification("Du besitzt bereits eine Waffenlizenz!")
                                       end
                                   end, 'weapon')
                               end
                           end, function(data, menu)
                               menu.close()
                           end)
                       end)
                   end
               elseif dist < 2.5 and dist < 4 then 
                   showAutomatMsg = false 
               end
           end
       end
   end)
   
   
   -- PLAYERNOTIFY
   
   
   
   RegisterNetEvent('glmp_notify')
   AddEventHandler('glmp_notify', function(color, title, message)
       TriggerEvent('sendPlayerNotification', "normal", title, message, color, 5000)
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
   
   end)
   
   
   RegisterNetEvent('glmp_tcnotify')
   AddEventHandler('glmp_tcnotify', function(color, title, message)
       TriggerEvent('sendPlayerNotification', "normal", title, message, color, 10000)
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
   
   end)
   
   RegisterNetEvent('glmp_singlenotify')
   AddEventHandler('glmp_singlenotify', function(color, message)
       TriggerEvent('sendPlayerNotification', "single", "", message, color, 5000)
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
   
   end)
   
   RegisterNetEvent("sendPlayerNotification")
   AddEventHandler("sendPlayerNotification", function(type, title, text, color, duration)
       ----print("EVENT: sendPlayerNotification - ".. type) 
       if type == "normal" then
           SendNUIMessage({
               action = "playernotify",
               title = title,
               text = text,
               color = color,
               duaration = tonumber(duration)
           })
       elseif type == "single" then
           SendNUIMessage({
               action = "singlenotify",
               text = text,
               color = color,
               duaration = tonumber(duration)
           })
       end
   end) 
   
   -- PRESENT
   
   ESX                           = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
   
   end)
      
   RegisterNetEvent('byte:normalesgeschenk') 
   AddEventHandler('byte:normalesgeschenk', function()
    print("einlösen")
       local rndm = math.random(1, 10)
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       TriggerServerEvent('byte:sendLog', 'geschenk', 'Normales Geschenk', 'Der Spieler '.. GetPlayerName(source) .. ' hat ' .. rndm .. ' gezogen!') 
       if rndm == 1 then 
           TriggerEvent('glmp_notify', '', '', 'Du hast 5x Schutzwesten erhalten.')
           
           TriggerServerEvent('byte:giveItem', 'bulletproof', 5)
       elseif rndm == 2 then 
           TriggerEvent('glmp_notify', '', '', 'Du hast 100.000$ erhalten.')
           
           TriggerServerEvent('byte:addMoney', 100000)
       elseif rndm == 3 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 250.000$ erhalten.')
           
           TriggerServerEvent('byte:addMoney', 250000) 
       elseif rndm == 4 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 1x Advancedrifle erhalten.')
           
           TriggerServerEvent('byte:giveItem', 'advancedrifle', 1)
       elseif rndm == 5 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 5x Magazin (Sturmgewehr) erhalten.')
           
           TriggerServerEvent('byte:giveItem', 'ammo_rifle', 5)
       elseif rndm == 6 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 1x Assaultrifle erhalten.')
           
           TriggerServerEvent('byte:giveItem', 'assaultrifle', 1)
       elseif rndm == 7 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 50.000$ erhalten.')
           
           TriggerServerEvent('byte:addMoney', 50000)
       elseif rndm == 8 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 50.000$ erhalten.')
           
           TriggerServerEvent('byte:addMoney', 50000)
       elseif rndm == 9 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 50.000$ erhalten.')
           
           TriggerServerEvent('byte:addMoney', 50000)
       elseif rndm == 10 then
           TriggerEvent('glmp_notify', '', '', 'Du hast 50.000$ erhalten.')
           
           TriggerServerEvent('byte:addMoney', 50000)
       end
   end)
   
   
   RegisterNetEvent('byte:seltenesgeschenk')
   AddEventHandler('byte:seltenesgeschenk', function()
       TriggerEvent('glmp_notify', '', '', 'Dieses Geschenk ist noch nicht verfügbar.')
   end)
   
   -- REPORT
   
   ESX                           = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
   
   end)
   
   
   RegisterCommand("report", function(source, args, rawCommand)
       local playerPed = GetPlayerPed(-1)
       if args[1] ~= nil then
            string = table.concat(args, " ")
           local players = ESX.Game.GetPlayers(true)
           playerReportList = {}
           for k,v in ipairs(players) do
               local targetPed = GetPlayerPed(v) 
               if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(targetPed)) < 30 then
                   table.insert( playerReportList, {id = GetPlayerServerId(v), name = GetPlayerName(v)}) 
               end
               ----print(('A player with server id %s found at %s!'):format(GetPlayerServerId(v), GetEntityCoords(targetPed)))
           end 
           --if closestPlayer ~= -1 and closestDistance <= 3.0 then 
               --ESX.ShowNotification("Spieler ID in deiner Nähe: " ..GetPlayerServerId(closestPlayer).. " ")
               TriggerServerEvent('byte:sendLog', 'report', 'REPORT ('.. GetPlayerName(source) .. ')', "Message: ".. string .. "\n" .. json.encode(playerReportList))
               TriggerEvent('glmp_singlenotify', 'red', 'Dein Report wurde an die Administration übermittelt! Bitte vergiss nicht dementsprechend noch ein Ticket in unserem Discord zu eröffnen.')
          -- else
          --     ESX.ShowNotification("Keine Spieler in deiner Nähe") 
          -- end 
       else
           TriggerEvent('glmp_singlenotify', 'red', 'Bitte verwende /report [Grund]!')
       end
   end)
    
   
   -- SAVEARMOUR
   
   local citizen = false
   
   RegisterNetEvent('LRP-Armour:Client:SetPlayerArmour')
   AddEventHandler('LRP-Armour:Client:SetPlayerArmour', function(armour)
       Citizen.Wait(10000)  
       SetPedArmour(PlayerPedId(), tonumber(armour))
       citizen = true
   end)
   
   local TimeFreshCurrentArmour = 10000
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           if citizen == true then
               TriggerServerEvent('LRP-Armour:Server:RefreshCurrentArmour', GetPedArmour(PlayerPedId()))
               Citizen.Wait(TimeFreshCurrentArmour)
           end
       end
   end)
   
   --SAVEPOS
   
   
   CreateThread(function()
       while true do 
           Wait(60000 * 3) 
           Save()
       end
   end)
   
   function Save()
       
           
               
               x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
               heading = GetEntityHeading(GetPlayerPed(-1))
               TriggerServerEvent("savePosition", x, y, z, heading)
           
   
       
   end 
   
   RegisterNetEvent('savePlayerPosition')
   AddEventHandler('savePlayerPosition', function()
       Save()
   end)
   RegisterNetEvent("setPosition")
   AddEventHandler("setPosition", function(x, y, z)
       --print("set pos")
       SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
   end) 
   
   -- SPEEDO
   
   local Keys = {
       ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
       ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
       ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
       ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
       ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
       ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
       ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
       ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
       ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
   }
   
   ESX = nil
   
   -- CONFIG
   
   local vSyncPogoda = false 		-- ustaw na true jeśli korzystasz z vSync i wykonałeś/aś instrukcje w ReadMe.txt;
   
   -- ZMIENNE
   
   local prox = 10.0
   local isTalking = false
   local ZablokujPozycje = false
   local wszedlDoGry = false
   local DuzaMapaPojazd = false
   local pokazalHud = false
   local przesunalHud = false
   local oczekiwanie = 500
   
   local inVeh = false
   local distance = 0
   local vehPlate
   
   local x = 0.01135
   local y = 0.002
   hasKM = 0
   showKM = 0
   
   -- START
   
   
   function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
       SetTextFont(font)
       SetTextProportional(0)
       SetTextScale(sc, sc)
       N_0x4e096588b13ffeca(jus)
       SetTextColour(r, g, b, a)
       SetTextDropShadow(0, 0, 0, 0,255)
       SetTextEdge(1, 0, 0, 0, 255)
       SetTextDropShadow()
       SetTextOutline()
       SetTextEntry("STRING")
       AddTextComponentString(text)
       DrawText(x - 0.1+w, y - 0.02+h)
   end
   
   Citizen.CreateThread(function()
       while true do 
           Citizen.Wait(500)
           if not wszedlDoGry then
               NetworkSetVoiceActive(false)
               NetworkSetTalkerProximity(1.0)
               wszedlDoGry = true
           end
       end
   end)
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   
       NetworkSetTalkerProximity(1.0)
   end)
   
   -- HUD
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(oczekiwanie)
           local playerPed = GetPlayerPed(-1)
           if IsPedInAnyVehicle(playerPed, true) then
               oczekiwanie = 150
               local playerVeh = GetVehiclePedIsIn(playerPed, false)
               if DuzaMapaPojazd == false then
                   if pokazalHud == false then
                       pokazalHud = true
                       --SendNUIMessage({action = "toggleCar", show = true})
                       TriggerEvent('showCarHud')
                   end
                   SendNUIMessage({action = "przesunHud", show = true})
               else
                   SendNUIMessage({action = "przesunHudMapa", show = true})		
               end
               fuel = math.floor(GetVehicleFuelLevel(playerVeh)+0.0)		
               SendNUIMessage({action = "updateGas", key = "gas", value = fuel})
               TriggerEvent('carHudsetFuel', fuel)
               PrzelaczRadar(true)
               if not DuzaMapaPojazd then
   
               end
               lokalizacja = false
           else
               oczekiwanie = 500
               if pokazalHud == true then
                   pokazalHud = false
                   SendNUIMessage({action = "toggleCar", show = false})
                   
                   TriggerEvent('hideCarHud')
               end
               if not ZablokujPozycje then
                   if przesunalHud == false then
                       przesunalHud = true
                       SendNUIMessage({action = "przesunHud", show = true})
                   end
               end
               PrzelaczRadar(false)
               if IsControlPressed(1, 243) then
                   PrzelaczRadar(true)
                   SendNUIMessage({action = "toggleAllHud", show = true})
                   SendNUIMessage({action = "przesunHudMapa", show = true})
                   lokalizacja = true
               else
                   SendNUIMessage({action = "toggleAllHud", show = false})
                   if not ZablokujPozycje then
                       SendNUIMessage({action = "przesunHudMapa", show = false})
                   end
                   lokalizacja = false
                   if not DuzaMapaPojazd then
                   end
               end
           end
       end
   end)
   
   function PrzelaczRadar(on)
   DisplayRadar(true)
       if on and not ZablokujPozycje then
           if przesunalHud == false then
               przesunalHud = true
               SendNUIMessage({action = "przesunHud", show = true})
           end
           
       elseif not ZablokujPozycje then
           if przesunalHud == true then
               przesunalHud = false
               SendNUIMessage({action = "przesunHud", show = false})
           end
       end
   end
   
   
   -- VEHICLE HUD
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(500)
           local playerPed = PlayerPedId()
           if IsPedInAnyVehicle(playerPed, false) then
               local vehicle = GetVehiclePedIsIn(playerPed, false)
               local lockStatus = GetVehicleDoorLockStatus(vehicle)
   
               if GetIsVehicleEngineRunning(vehicle) == false then
                   SendNUIMessage({action = "engineSwitch", status = false})
                   TriggerEvent('carHudsetEngine', false)
               else
                   SendNUIMessage({action = "engineSwitch", status = true})
                   TriggerEvent('carHudsetEngine', true)
               end
               if (lockStatus == 0 or lockStatus == 1) then
                   SendNUIMessage({action = "lockSwitch", status = true})
                   TriggerEvent('carHudsetLock', false)
               elseif lockstatus ~= 0 and lockstatus ~= 1 then
                   SendNUIMessage({action = "lockSwitch", status = false})
                   TriggerEvent('carHudsetLock', true)
               end
           end
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           if IsControlPressed(1, 243) then
               SendNUIMessage({action = "toggleCar", show = false})
               if not ZablokujPozycje then
                   SendNUIMessage({action = "przesunHudMapa", show = true})
               end
               DuzaMapaPojazd = true
           elseif IsControlJustReleased(1, 243) and DuzaMapaPojazd == true then
               DuzaMapaPojazd = false
               if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                   SendNUIMessage({action = "toggleCar", show = true})
                   SendNUIMessage({action = "przesunHud", show = true})
               end
   
           end
       end
   end)
   
   -- PANEL DOLNY
   
   local zones = { ['AIRP'] = "Airport LS", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "Klub Golfowy", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port LS", ['ZQ_UAR'] = "Davis Quartz" }
   local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', }
   local tekstLokalizacji = ''
   local tekstDzien = ''
   local pogodaHash = ''
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(100)
           local Ped = GetPlayerPed(-1)
           if(IsPedInAnyVehicle(Ped, false)) then
               local PedCar = GetVehiclePedIsIn(Ped, false)
               carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
               SendNUIMessage({
                   showhud = true,
                   speed = carSpeed
               })
               TriggerEvent('carHudsetSpeed', carSpeed)
           end
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(500)
           local pos = GetEntityCoords(GetPlayerPed(-1))
           local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
           local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]
   
           for k,v in pairs(directions)do
               direction = GetEntityHeading(GetPlayerPed(-1))
               if(math.abs(direction - k) < 22.5)then
                   direction = v
                   break;
               end
           end
   
           if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z)) then
               if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1))) then
                   tekstLokalizacji = direction..' | '..tostring(GetStreetNameFromHashKey(var1))
                   SendNUIMessage({
                       showLokalizacja = true,
                       lokalizacja = tekstLokalizacji
                   })
               end
           end
   
       end
   end)
   
   RegisterNetEvent('welldone_carhud:UstawPogode')
   AddEventHandler('welldone_carhud:UstawPogode', function(pogoda)
       pogodaHash = pogoda
   end)
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(1500)
   
           local dzienInt = GetClockDayOfWeek()
           local dzien = ''
           if dzienInt == 0 then
               dzien = 'Sunday'
           elseif dzienInt == 1 then
               dzien = 'Monday'
           elseif dzienInt == 2 then
               dzien = 'Tuesday'
           elseif dzienInt == 3 then
               dzien = 'Wednesday'
           elseif dzienInt == 4 then
               dzien = 'Thursday'
           elseif dzienInt == 5 then
               dzien = 'Friday'
           elseif dzienInt == 6 then
               dzien = 'Saturday'
           end
   
           local godzinaInt = GetClockHours()
           local godzina = ''
           if string.len(tostring(godzinaInt)) == 1 then
               godzina = '0'..godzinaInt
           else
               godzina = godzinaInt
           end
   
           local minutaInt = GetClockMinutes()
           local minuta = ''
           if string.len(tostring(minutaInt)) == 1 then
               minuta = '0'..minutaInt
           else
               minuta = minutaInt
           end
   
           local pogoda = ''
   
           if vSyncPogoda == true then
               if pogodaHash == 'EXTRASUNNY' then
                   pogoda = 'Sunny'
               elseif pogodaHash == 'CLEAR' then
                   pogoda = 'Clear'
               elseif pogodaHash == 'NEUTRAL' then
                   pogoda = 'Neutral'
               elseif pogodaHash == 'SMOG' then
                   pogoda = 'Smog'
               elseif pogodaHash == 'FOGGY' then
                   pogoda = 'Fog'
               elseif pogodaHash == 'OVERCAST' then
                   pogoda = 'Overcast'
               elseif pogodaHash == 'CLOUDS' then
                   pogoda = 'Clouds'
               elseif pogodaHash == 'CLEARING' then
                   pogoda = 'Clearing'
               elseif pogodaHash == 'RAIN' then
                   pogoda = 'Rain'
               elseif pogodaHash == 'THUNDER' then
                   pogoda = 'Thunder'
               elseif pogodaHash == 'BLIZZARD' then
                   pogoda = 'Blizzard'
               elseif pogodaHash == 'SNOWLIGHT' then
                   pogoda = 'Winter'
               elseif pogodaHash == 'XMAS' then
                   pogoda = 'Christmas'
               elseif pogodaHash == 'HALLOWEEN' then
                   pogoda = 'Halloween'
               end
   
               tekstDzien = godzina..':'..minuta..' | '..dzien..' | '..pogoda
           else
               tekstDzien = godzina..':'..minuta..' | '..dzien
           end
   
           SendNUIMessage({
               showDni = true,
               dni = tekstDzien
           })
       end
   end)
   
   
   
   Citizen.CreateThread(function()
       while true do
         Citizen.Wait(250)
                 if IsPedInAnyVehicle(PlayerPedId(), false) and not inVeh then
                 -- ----print('player is now in a vehicle')
                 Citizen.Wait(50)
                 local veh = GetVehiclePedIsIn(PlayerPedId(),false)
                 local driver = GetPedInVehicleSeat(veh, -1)
                 if driver == PlayerPedId() and GetVehicleClass(veh) ~= 13 and GetVehicleClass(veh) ~= 14 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 and GetVehicleClass(veh) ~= 17 and GetVehicleClass(veh) ~= 21 then
                 inVeh = true
                 Citizen.Wait(50)
                 vehPlate = GetVehicleNumberPlateText(veh)
                 Citizen.Wait(1)
                 -- ----print(vehPlate)
                 ESX.TriggerServerCallback('esx_carmileage:getMileage', function(hasKM)
                 -- ----print("pidiendo KMS a base de datos, si los tiene devolver valor, si no crearlo y devolver")
                 -- ----print(hasKM)
                 showKM = math.floor(hasKM*1.33)/1000
                 -- showKM = math.floor(hasKM*1)/1
                 -- ----print("the player is in the vehcile with plate:")
                 -- ----print(vehPlate)
                 local oldPos = GetEntityCoords(PlayerPedId())
                 -- ----print("old pos is:")
                 -- ----print(oldPos)
                 Citizen.Wait(1000)
                 local curPos = GetEntityCoords(PlayerPedId())
                 -- ----print("cur pos is:")
                 -- ----print(curPos)
                 if IsVehicleOnAllWheels(veh) then
                 dist = GetDistanceBetweenCoords(oldPos.x, oldPos.y, oldPos.z, curPos.x, curPos.y, curPos.z, true)
                 else
                 dist = 0
                 end
                 -- ----print("distance is:")
                 -- ----print(dist)
                 hasKM = hasKM + dist
                 -- ----print("car km are:")
                 -- ----print(hasKM)
                 TriggerServerEvent('esx_carmileage:addMileage', vehPlate, hasKM)
                 inVeh = false
                 end, GetVehicleNumberPlateText(veh))
                 else
                 -- ----print("salimos del bucle xq somos pasajero")
                 end
             end
         end
     end)
     
     displayHud = true
     
         Citizen.CreateThread(function()
             while true do
                 if IsPedInAnyVehicle(PlayerPedId(), false) then
                             local veh = GetVehiclePedIsIn(PlayerPedId(),false)
                         local driver = GetPedInVehicleSeat(veh, -1)
                         if driver == PlayerPedId() and GetVehicleClass(veh) ~= 13 and GetVehicleClass(veh) ~= 14 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 and GetVehicleClass(veh) ~= 17 and GetVehicleClass(veh) ~= 21 then
                     SendNUIMessage({action = "updateKM", key = "km", value = round(showKM, 2)})
                     TriggerEvent('carHudsetMileage', round(showKM, 2))
                     end
                 else
                     Citizen.Wait(750)
                 end
     
                 Citizen.Wait(0)
             end
         end)
     
     -- this will be used in the future to add damage to cars with more kms and make them slower
     
     -- Citizen.CreateThread(function()
         -- while true do
         -- Citizen.Wait(250)
             -- if IsPedInAnyVehicle(PlayerPedId(), false) then
                 -- local veh = GetVehiclePedIsIn(PlayerPedId(),false)
                     -- local driver = GetPedInVehicleSeat(veh, -1)
                         -- if driver == PlayerPedId() then
                             -- if showKM >= 5000 then
                             -- -- ----print("tiene mas de 5000 km")
                             -- -- SetVehicleDirtLevel(veh, 15.0)
                             -- SetVehicleEngineHealth(veh, 650)
                             -- end
                     -- end
                 -- else
                     -- Citizen.Wait(15000)
                 -- end
             -- Citizen.Wait(1)
         -- end
     -- end)
         
     function round(num, numDecimalPlaces)
       local mult = 10^(numDecimalPlaces or 0)
       return math.floor(num * mult + 0.5) / mult
     end
   
     -- TIMESYNC
   
     SetMillisecondsPerGameMinute(60000)
   RegisterNetEvent("realtime:event")
   AddEventHandler("realtime:event", function(h, m, s)
       NetworkOverrideClockTime(h, m, s)
   end)
   TriggerServerEvent("realtime:event") 
   
    
   blackout = false 
   
   
   RegisterNetEvent('vSync:updateWeather')
   AddEventHandler('vSync:updateWeather', function(NewWeather)
   
       CurrentWeather = NewWeather
       
   end)
    
   
   
   
   CurrentWeather = 'SUNNY'
   local lastWeather = CurrentWeather
   
   
   RegisterNetEvent('blackout')
   AddEventHandler('blackout', function()
       SetBlackout(true)
   end)
   Citizen.CreateThread(function()
       while true do
           if lastWeather ~= CurrentWeather then
               lastWeather = CurrentWeather
               SetWeatherTypeOverTime(CurrentWeather, 15.0)
               Citizen.Wait(15000)
           end
           Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
           
           ClearOverrideWeather() 
           ClearWeatherTypePersist()
           SetWeatherTypePersist(lastWeather)
           SetWeatherTypeNow(lastWeather)
           SetWeatherTypeNowPersist(lastWeather)
           if lastWeather == 'XMAS' then
               SetForceVehicleTrails(true)
               SetForcePedFootstepsTracks(true)
           else
               SetForceVehicleTrails(false)
               SetForcePedFootstepsTracks(false)
           end
       end
   end)
   
   -- TOWNHALL
   
   Keys = {
       ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
       ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
       ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
       ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
       ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
       ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
       ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
   }
   
   ESX = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   end)
   
   location = {x = -552.08,  y = -192.12,  z = 37.24}
   Citizen.CreateThread(function()
       while true do
         Citizen.Wait(0)
      
         local pedCoords = GetEntityCoords(PlayerPedId())
         local distance = GetDistanceBetweenCoords(pedCoords.x,pedCoords.y,pedCoords.z,location.x,location.y,location.z)
      
      
         if(distance < 20)then
           DrawMarker(1, location.x, location.y, location.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.7, 144, 128, 0, 100, false, true, 2, nil, nil, false)
         end
      
       end
     end) 
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)  
               local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -551.56, -190.0, 37.24) 
               if dest < 2 then
                  
                   
                   if IsControlJustPressed(0, 51) then
                       TriggerEvent('openRathausMenu')
                   end
               end
       end
   end)
   
   RegisterNetEvent('openRathasMenu')
   AddEventHandler('openRathausMenu', function(source)
       elements = {
           {label = 'Schließen', action = 'close'},
           {label = 'Fahrzeugmeldeamt', action = 'caramt'},
--           {label = 'Nummer ändern (750.000$)', action = 'changeNumber'},
--           {label = 'Name ändern (1.000.000$)', action = 'changeName'}
       } 
       ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'rathaus', {
           title    = 'Rathaus',
           align    = 'top-left',
           elements = elements
       }, function(data, menu)
           --- MENUS ---
           if data.current.action == 'close' then
               ESX.UI.Menu.CloseAll()
           elseif data.current.action == 'caramt' then
               openCarAmt()
               menu.close()
           elseif data.current.action == 'changeNumber' then
               TriggerServerEvent('byte:changePlayerNumber')
           elseif data.current.action == 'changeName' then
               TriggerServerEvent('byte:requestChangeName')
               
           end
           
       end, function(data, menu)
           menu.close()
       end)
   end)
   
   RegisterNetEvent('byte:openChangeName')
   AddEventHandler('byte:openChangeName', function()
       ESX.UI.Menu.Open(
           'dialog', GetCurrentResourceName(), 'asas',
           {
           title = "Rathaus", 
           text = "Hier kannst du deinen Namen ändern. Bitte beachte, dass dir bei Erfolgreicher Namensänderung 750.000$ abgezogen werden. (Beispiel: Max_Mustermann)"
           },
           function(data2, menu2)
   
   
   
           menu2.close()
   
           
           TriggerServerEvent('byte:changePlayerName', data2.value)
           
       end, function(data2, menu2) 
           menu2.close() 
       end) 
   end)
   function openCarAmt()
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
      elements = {}
       
   
      ESX.TriggerServerCallback("getOwnedPlayerVehicles", function(result)
   
           if #result == 0 then 
               TriggerEvent('glmp_singlenotify', '', 'Du besitzt keine Fahrzeuge.')
               return
           end
   
           table.insert(elements, {label = 'Schließen', value = 'close' })
   
           for i = 1, #result, 1 do
               table.insert(elements, {label = '('.. result[i].id .. ') '.. result[i].plate, value = result[i].id })
           end
   
           ESX.UI.Menu.Open(
               'default', GetCurrentResourceName(), 'carAmtMenu',
               {
                   title = "Fahrzeugmeldeamt",
                   align = "center",
                   elements = elements
               },
           function(data2, menu2) 
               if data2.current.value ~= 'close' then
                   
                   openCarManage(data2.current.value)
               end
               
   
               ESX.UI.Menu.CloseAll()
               
               
           end, function(data2, menu2)
               ESX.UI.Menu.CloseAll()
           end)
       end)
   end
   
   function openCarManage(id)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
       ESX.TriggerServerCallback('getVehPlate', function(plate)
           elements = {
               {label = 'Schließen', action = 'close'},
               {label = 'Schlösser wechseln (3.000$)', action = 'changeKeys'},
               {label = 'GPS einbauen (5.000$)', action = 'buildGps'}
           }
   
               ESX.UI.Menu.Open(
                   'default', GetCurrentResourceName(), 'carAmtMenu_manage',
                   {
                       title = "Fahrzeugmeldeamt - ".. plate .. " (".. id .. ")" ,
                       align = "center",
                       elements = elements
                   },
               function(data2, menu2) 
                   if data2.current.action == 'close' then
                       ESX.UI.Menu.CloseAll() 
                   elseif data2.current.action == 'changeKeys' then
                       TriggerServerEvent('byte:resetKeyOwner', id)
                       
                       ESX.UI.Menu.CloseAll()
                   elseif data2.current.action == 'buildGps' then
                       TriggerServerEvent('byte:activateGps', id)
                       
                       ESX.UI.Menu.CloseAll()
                   end
                   
   
                   
                   
                   
               end, function(data2, menu2)
                   ESX.UI.Menu.CloseAll()
               end)
           
       end, id)
   end
   
   
   local function CreateTownhallBlips()
       --for k,v in pairs({ x=-552.52, y=-190.54, z=38.22 }) do
       local v = { x=-552.52, y=-190.54, z=38.22 }
           blip = AddBlipForCoord(v.x, v.y, v.z-1)
           SetBlipSprite(blip, 419)
           SetBlipColour(blip, 4)
           SetBlipAsShortRange(blip, true)
   
           BeginTextCommandSetBlipName("STRING")
           AddTextComponentString("Rathaus")
           EndTextCommandSetBlipName(blip)
       --end
   end
   
   Citizen.CreateThread(function()
       CreateTownhallBlips()
   end)
   Citizen.CreateThread(function()
       RequestModel(GetHashKey("ig_bankman"))
       
       while not HasModelLoaded(GetHashKey("ig_bankman")) do
           Wait(1)
       end
       
       --for _, item in pairs(Config.ped) do
       local item = {x = -551.56,  y = -190.0, z=37.12, heading=164.17 }
           local npc = CreatePed(4, 0x909D9E7F, item.x, item.y, item.z, item.heading, false, true)
               
           SetEntityHeading(npc, item.heading)
           FreezeEntityPosition(npc, true)
           SetEntityInvincible(npc, true)
           SetBlockingOfNonTemporaryEvents(npc, true)	
       --end
   end)
   
   -- WEAPONDAMAGE
   
   ESX = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
         Citizen.Wait(0)
       end
   end)
   
    
   Citizen.CreateThread(function()
       while true do
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_APPISTOL"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_STUNGUN"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ADVANCEDRIFLE"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN"), 0.8) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTSMG"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLAREGUN"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PARACHUTE"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNIPERRIFLE"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GUSENBERG"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLARE"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHETE"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPDW"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SPECIALCARBINE"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.3) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL50"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BOTTLE"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GOLFCLUB"), 0.5) 
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 0.3)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BULLPUPRIFLE"), 0.5)
       N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPDW"), 0.3)  
       Wait(0)
       end
   end)
   
   --Headshot
   Citizen.CreateThread(function()
       while true do
           Wait(0)
   
           SetPedSuffersCriticalHits(PlayerPedId(), false)
       end
   end)
   
   -- WEAZLENEWS
   
   ESX                           = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
   
   end)
   newsType = nil 
   RegisterCommand('weazlenews', function()
       PlayerData = ESX.GetPlayerData()
       if PlayerData.job.name == "weazlenews" then
           ESX.UI.Menu.Open(
               'dialog', GetCurrentResourceName(), 'news',
               {
               title = "Weazle News", 
               text = "Gebe den Typ von der News ein (Event, Bericht, News)!"
               },
               function(data2, menu2)
   
               if data2.value ~= "Event" then
                   if data2.value ~= "Bericht" then
                       if data2.value ~= "News" then
                           TriggerEvent('glmp_notify', 'yellow', 'Weazle News', 'Falscher News-Typ!')
                           menu2.close()
                           return
                       end
                   end            
               end 
               newsType = data2.value
               menu2.close()
   
               
               ESX.UI.Menu.Open(
               'dialog', GetCurrentResourceName(), 'news2',
               {
               title = "Weazle News", 
               text = "Gebe den Inhalt deiner News ein!"
               },
               function(data2, menu2)
   
               
   
               menu2.close()
               
               
               TriggerServerEvent('addWeazleNews', data2.value, newsType)
               
               end, function(data2, menu2) 
                   menu2.close() 
               end) 
               
           end, function(data2, menu2) 
               menu2.close() 
           end) 
       end
   end)
   
   --XMENU
   
   local Keys = {
       ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
       ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
       ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
       ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
       ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
       ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
       ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
       ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
       ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
   }
   
   
   ESX = nil
   
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   end)
   
   
   local enable = false
   function toggleField(enable)
       SetNuiFocus(enable, enable)
       enableField = enable
    
           if enable then
               SendNUIMessage({
                   action = 'open'
               })
           else
               SendNUIMessage({
                   action = 'close'
               })
           end
      
   end
   
   AddEventHandler('closexmenus', function()
       toggleField(false)
   end)
   
   RegisterNetEvent('openGiveKeyMenu')
   AddEventHandler('openGiveKeyMenu', function(playerid, rpname, identifier)
       openGiveKeyMenu(playerid, rpname, identifier)
   end)
   function openGiveKeyMenu(playerid, rpname, identifier)
       local playerCoords = GetEntityCoords(PlayerPedId())
       PlayerData = ESX.GetPlayerData()
        
      elements = {}
       
   
      ESX.TriggerServerCallback("getOwnedPlayerVehicles", function(result)
   
           if #result == 0 then 
               TriggerEvent('glmp_singlenotify', '', 'Du besitzt keine Fahrzeuge.')
               return
           end
   
           table.insert(elements, {label = 'Schließen', value = 'close' })
           
           for i = 1, #result, 1 do
               table.insert(elements, {label = '('.. result[i].id .. ') '.. result[i].plate, value = result[i].id })
           end
   
           ESX.UI.Menu.Open(
               'default', GetCurrentResourceName(), 'giveKeysMenu',
               {
                   title = "Schlüsselvergabe - ".. playerid,
                   align = "center",
                   elements = elements
               },
           function(data2, menu2) 
               if data2.current.value ~= 'close' then
                   ----print(data2.value)
                   ----print("CHE")
                   TriggerServerEvent('byte:setKeyOwner', playerid, identifier, data2.current.value)
               end
               
   
               ESX.UI.Menu.CloseAll()
               
               
           end, function(data2, menu2)
               ESX.UI.Menu.CloseAll()
           end)
       end)
   end
   
   
   
   RegisterNetEvent('giveCarKey')
   AddEventHandler('giveCarKey', function()
       toggleField(false)
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
       if closestPlayer == -1 or closestDistance > 1.0 then
           TriggerEvent("glmp_singlenotify", "", "Keine Spieler in der Nähe!")
           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       else
           
                   
           TriggerServerEvent('byte:givecarkeys', GetPlayerServerId(closestPlayer))
           
   
       end
   end)
   
   
   
   RegisterNetEvent('stabilse')
   AddEventHandler('stabilse', function()
       toggleField(false)
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
   
       --print("STABILSE")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
       
       if closestPlayer == -1 or closestDistance > 1.0 then
           TriggerEvent("glmp_singlenotify", "", "Kein Spieler in der Nähe!")
       else
           ESX.TriggerServerCallback('byte_taxi:hasPBS', function(hasEHK)
               local closestPlayerPed = GetPlayerPed(closestPlayer)
               local health = GetEntityHealth(closestPlayerPed)
               if hasEHK == true then
                   ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
                       if quantity > 0 then
   
                           if health <= 105 then
                               local playerPed = PlayerPedId()
                               
                                   
                                       
                                       TriggerEvent('patron_inventory:progressbar', 8000)
                                       
                                       
                                           ESX.Streaming.RequestAnimDict("amb@medic@standing@tendtodead@idle_a", function()
                                               TaskPlayAnim(PlayerPedId(), "amb@medic@standing@tendtodead@idle_a", "idle_a", 8.0, -8.0, -1, 1, 0, false, false, false)
                                           end)
                                        
                                           FreezeEntityPosition(playerPed, true)
   
                                       Wait(7000) 
                                       FreezeEntityPosition(playerPed, false)
                                       ClearPedTasksImmediately(PlayerPedId()) 
                                       TriggerServerEvent("player_menu:uwe", GetPlayerServerId(closestPlayer))
                                       TriggerEvent("glmp_singlenotify", "", "Du hast jemanden stabilisiert!")
                                       TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
   
    
                                       
                   
                       
                           end
                       else
                           TriggerEvent("glmp_singlenotify", "", "Du hast kein Medikit!")
                       end
   
   
                   end, 'medikit')
               else
                   TriggerEvent("glmp_singlenotify", "", "Du hast keinen Erstehilfeschein!")
               end
           end, 'erstehilfe')
       end
   
   end)
   
   RegisterNetEvent('lspd:durchsuchen')
   AddEventHandler('lspd:durchsuchen', function()
       toggleField(false)
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
       ----print("CHECK")
       if closestPlayer == -1 or closestDistance > 1.0 then
           ----print("CHEKC 2")
           
       else
           TriggerEvent('lspd:openBodySearch')
       end
   end)
   
   
   RegisterNetEvent('durchsuchen')
   AddEventHandler('durchsuchen', function()
   
       local player, closestDistance = ESX.Game.GetClosestPlayer()
   
                   if player == -1 or closestDistance > 1.0 then
                       TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
                       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
                       return
                   end
       ESX.TriggerServerCallback('byte:isPlayerCuffed', function(isCuffed)
           if isCuffed == true then
               PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
               
                       local player, closestDistance = ESX.Game.GetClosestPlayer()
   
                       if player == -1 or closestDistance > 1.0 then
                           TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
                           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
                       else 
                           TriggerEvent('esx_policejob:durchsuchenanimation')
                           Citizen.Wait(6000)
                           ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
                       
                               local elements = {}
                           
                               local blackMoney = 0
                           
                               for i=1, #data.accounts, 1 do
                                   if data.accounts[i].name == 'black_money' then
                                       blackMoney = data.accounts[i].money
                                   end
                               end
                           
                       
                           
                               table.insert(elements, {label = '--- Waffen ---', value = nil})
                           
                               for i=1, #data.weapons, 1 do
                                   table.insert(elements, {
                                       label          = ESX.GetWeaponLabel(data.weapons[i].name),
                                       value          = data.weapons[i].name,
                                       itemType       = 'item_weapon',
                                       amount         = data.ammo,
                                   })
                               end
                           
                               table.insert(elements, {label = '--- Inventar ---', value = nil})
                           
                               for i=1, #data.inventory, 1 do
                                   if data.inventory[i].count > 0 then
                                       table.insert(elements, {
                                       label          =  data.inventory[i].count .. ' ' .. data.inventory[i].label,
                                       value          = data.inventory[i].name,
                                       itemType       = 'item_standard',
                                       amount         = data.inventory[i].count,
                                       })
                                   end
                               end
                           
                           
                                   ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
                                       title    = 'Durchsuchen',
                                       align    = 'top-left',
                                       elements = elements
                                   }, function(data, menu)
                                   end, function(data, menu)
                                       menu.close()
                                   end)
                           end, GetPlayerServerId(player))
                       end
    
               
           else
               TriggerEvent("glmp_singlenotify", "grey", "Der Spieler muss gefesselt sein.")
           end
           
       end, GetPlayerServerId(ESX.Game.GetClosestPlayer()))
   end)
   
   RegisterNetEvent('giveMoney')
   AddEventHandler('giveMoney', function()
       ----print("givemoney")
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
       if closestPlayer == -1 or closestDistance > 1.0 then
           TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
         else
           Wait(600)
           SendNUIMessage({action='GiveMoney'})
           SetNuiFocus(true, true)   
         end
   end) 
   
   RegisterNetEvent('giveausweis')
   AddEventHandler('giveausweis', function()
       ----print("ausweis geben")
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
       if closestPlayer == -1 or closestDistance > 1.0 then
           TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       else
           --TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
           TriggerServerEvent('loadIdCard', GetPlayerServerId(closestPlayer)) 
       end
   end)  

   RegisterNetEvent('getausweispd')
   AddEventHandler('getausweispd', function()
       print("ausweis ziehen")
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
       if closestPlayer == -1 or closestDistance > 1.0 then
           TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       else
           --TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
           TriggerServerEvent('loadIdCardFrom', GetPlayerServerId(closestPlayer)) 
       end
   end) 
   
   RegisterNetEvent('givedutyausweis')
   AddEventHandler('givedutyausweis', function()
       ----print("ausweis geben")
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
       if closestPlayer == -1 or closestDistance > 1.0 then
           TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       else
           --TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
           TriggerServerEvent('loadDutyCard', GetPlayerServerId(closestPlayer))
       end
   end) 
   
   local isFesselt = false
   RegisterNetEvent('kabelbinder')
   AddEventHandler('kabelbinder', function()
       ----print("use kabelbinder")
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
   
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
       if closestPlayer == -1 or closestDistance > 1.0 then
           TriggerEvent("glmp_singlenotify", "grey", "Kein Spieler in der Nähe!")
       else
           TriggerServerEvent('player_menu:handcuff', GetPlayerServerId(closestPlayer))
   
       end
   
   end)
   
   RegisterNetEvent('player_menu:handcuff')
   AddEventHandler('player_menu:handcuff', function()
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
       if not isFesselt then
           TriggerServerEvent('player_menu:trytoget', GetPlayerServerId(closestPlayer))
       else
           TriggerServerEvent('player_menu:trytoweg', GetPlayerServerId(closestPlayer))
   
       end
       local playerPed = PlayerPedId()
   
   end)
   
   RegisterNetEvent('player_menu:handcuffweg')
   AddEventHandler('player_menu:handcuffweg', function()
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
   
           isFesselt = false    
           ClearPedTasks(PlayerPedId())
           local playerPed = PlayerPedId()
   
   
                   ClearPedSecondaryTask(playerPed)
                   SetEnableHandcuffs(playerPed, false)
                   DisablePlayerFiring(playerPed, false)
                   SetPedCanPlayGestureAnims(playerPed, true)
   
               end)
   
   RegisterNetEvent('player_menu:handcuffdran')
   AddEventHandler('player_menu:handcuffdran', function()
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
       isFesselt = true
       TriggerServerEvent('player_menu:removekabelbinder', GetPlayerServerId(closestPlayer))
       local playerPed = PlayerPedId()
   
       Citizen.CreateThread(function()
           if isFesselt then
   
               RequestAnimDict('anim@move_m@prisoner_cuffed')
               while not HasAnimDictLoaded('anim@move_m@prisoner_cuffed') do
                   Citizen.Wait(100)
               end
   
               TaskPlayAnim(playerPed, 'anim@move_m@prisoner_cuffed', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
   
               SetEnableHandcuffs(playerPed, true)
               DisablePlayerFiring(playerPed, true)
               SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
               SetPedCanPlayGestureAnims(playerPed, false)
               
               ClearPedSecondaryTask(playerPed)
               SetEnableHandcuffs(playerPed, false)
               DisablePlayerFiring(playerPed, false)
               SetPedCanPlayGestureAnims(playerPed, true)
               FreezeEntityPosition(playerPed, false)
           else
   
               ClearPedSecondaryTask(playerPed)
               SetEnableHandcuffs(playerPed, false)
               DisablePlayerFiring(playerPed, false)
               SetPedCanPlayGestureAnims(playerPed, true)
           end
       end)
   
   end)
   
   
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           local playerPed = PlayerPedId()
   
           if isFesselt then
   
               DisableControlAction(0, 24, true) -- Attack
               DisableControlAction(0, 257, true) -- Attack 2
               DisableControlAction(0, 25, true) -- Aim
               DisableControlAction(0, 263, true) -- Melee Attack 1
   
   
               DisableControlAction(0, 45, true) -- Reload
               DisableControlAction(0, 22, true) -- Jump
               DisableControlAction(0, 44, true) -- Cover
               DisableControlAction(0, 37, true) -- Select Weapon
               DisableControlAction(0, 23, true) -- Also 'enter'?
   
               DisableControlAction(0, 288,  true) -- Disable phone
               DisableControlAction(0, 289, true) -- Inventory
               DisableControlAction(0, 170, true) -- Animations
               DisableControlAction(0, 167, true) -- Job
   
               DisableControlAction(0, 73, true) -- Disable clearing animation
               DisableControlAction(2, 199, true) -- Disable pause screen
   
               DisableControlAction(0, 59, true) -- Disable steering in vehicle
               DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
               DisableControlAction(0, 72, true) -- Disable reversing in vehicle
   
               DisableControlAction(2, 36, true) -- Disable going stealth
   
               DisableControlAction(0, 47, true)  -- Disable weapon
               DisableControlAction(0, 264, true) -- Disable melee
               DisableControlAction(0, 257, true) -- Disable melee
               DisableControlAction(0, 140, true) -- Disable melee
               DisableControlAction(0, 141, true) -- Disable melee
               DisableControlAction(0, 142, true) -- Disable melee
               DisableControlAction(0, 143, true) -- Disable melee
               DisableControlAction(0, 75, true)  -- Disable exit vehicle
               DisableControlAction(27, 75, true) -- Disable exit vehicle
   
               if IsEntityPlayingAnim(playerPed, 'anim@move_m@prisoner_cuffed', 'idle', 3) ~= 1 then
                   ESX.Streaming.RequestAnimDict('anim@move_m@prisoner_cuffed', function()
                       TaskPlayAnim(playerPed, 'anim@move_m@prisoner_cuffed', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                   end)
               end
           else
               Citizen.Wait(500)
           end
       end
   end)
   
   RegisterNetEvent('showLicense')
   AddEventHandler('showLicense', function()
       toggleField(false)
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
                   local player, distance = ESX.Game.GetClosestPlayer()
   
                   if distance ~= -1 and distance <= 3.0 then                    
                       TriggerServerEvent('loadLicenseBook', GetPlayerServerId(player))
                   else
                       TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
                   end
   
   end)
   RegisterNetEvent('supportId')
   AddEventHandler('supportId', function()
       toggleField(false)
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local player, distance = ESX.Game.GetClosestPlayer()
   
       if distance ~= -1 and distance <= 3.0 then                    
           TriggerEvent("glmp_singlenotify", "grey", "Support-ID vom Spieler: " .. GetPlayerServerId(player))
   
       else
           TriggerEvent("glmp_singlenotify", "grey", "Keine Spieler in der Nähe!")
   
       end
   
   end)
   
    
   RegisterKeyMapping('trunk_t3425gf54', "Fahrzeug Kofferraum", "keyboard", "k")
   RegisterCommand("trunk_t3425gf54", function()
       TriggerEvent('trunklock')
   end)
   
   
   RegisterKeyMapping('lockveh_t3425gf54', "Fahrzeug Schlüssel", "keyboard", "l")
   RegisterCommand("lockveh_t3425gf54", function()
       TriggerEvent('key')
   end)
   
   RegisterNetEvent('key')
   AddEventHandler('key', function()
   
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
   
       local coords = GetEntityCoords(GetPlayerPed(-1))
       local hasAlreadyLocked = false
       cars = ESX.Game.GetVehiclesInArea(coords, 10)
       local carstrie = {}
       local cars_dist = {}		
       notowned = 0
       if #cars == 0 then
           --TriggerEvent("glmp_singlenotify", "grey", 'Es sind keine deiner Fahrzeuge in der nähe.')
       else
           for j=1, #cars, 1 do
               local coordscar = GetEntityCoords(cars[j])
               local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
               table.insert(cars_dist, {cars[j], distance})
           end
           for k=1, #cars_dist, 1 do
               local z = -1
               local distance, car = 999
               for l=1, #cars_dist, 1 do
                   if cars_dist[l][2] < distance then
                       distance = cars_dist[l][2]
                       car = cars_dist[l][1]
                       z = l
                   end
               end
               if z ~= -1 then
                   table.remove(cars_dist, z)
                   table.insert(carstrie, car)
               end
           end
           for i=1, #carstrie, 1 do
               local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
               ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
                   if owner and hasAlreadyLocked ~= true then
                       local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
                       vehicleLabel = GetLabelText(vehicleLabel)
                       local lock = GetVehicleDoorLockStatus(carstrie[i])
                       if lock == 1 or lock == 0 then
                           SetVehicleDoorShut(carstrie[i], 0, false)
                           SetVehicleDoorShut(carstrie[i], 1, false)
                           SetVehicleDoorShut(carstrie[i], 2, false)
                           SetVehicleDoorShut(carstrie[i], 3, false)
                           SetVehicleDoorsLocked(carstrie[i], 2)
                           PlayVehicleDoorCloseSound(carstrie[i], 1)
                           TriggerEvent('glmp_singlenotify', 'red', 'Du hast dein Fahrzeug abgeschlossen.')
                           if not IsPedInAnyVehicle(PlayerPedId(), true) then
                               TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                           end
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           hasAlreadyLocked = true
                       elseif lock == 2 then
                           SetVehicleDoorsLocked(carstrie[i], 1)
                           PlayVehicleDoorOpenSound(carstrie[i], 0)
                           TriggerEvent('glmp_singlenotify', 'green', 'Du hast dein Fahrzeug aufgeschlossen.')
                           if not IsPedInAnyVehicle(PlayerPedId(), true) then
                               TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                           end
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 2)
                           Citizen.Wait(150)
                           SetVehicleLights(carstrie[i], 0)
                           hasAlreadyLocked = true
                       end
                   else
                       notowned = notowned + 1
                   end
                   if notowned == #carstrie then
                       TriggerEvent("glmp_singlenotify", "grey", 'Es sind keine deiner Fahrzeuge in der nähe.')
                   end	
               end, plate)
           end			
       end
   end)
   
   RegisterNetEvent('handschellenvorne')
   AddEventHandler('handschellenvorne', function()
       TriggerEvent('bens_cuff_item:checkCuff')
   end)
   
   RegisterNetEvent('handschellen')
   AddEventHandler('handschellen', function()
   
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                   
       if closestPlayer ~= -1 and closestDistance <= 3.0 then 
           TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
           TriggerEvent('glmp_singlenotify', '', 'Sie haben jemanden die Handschellen angelegt/abgenommen!')
       end
   
   end)


   
    
   
   
   AddEventHandler('onResourceStop', function(name)
       if GetCurrentResourceName() ~= name then
           return
       end
    
       toggleField(false)
   end)
   
   
   CreateThread(function() 
       while true do
           Citizen.Wait(0)
           local player, closestDistance = ESX.Game.GetClosestPlayer()
           PlayerData = ESX.GetPlayerData()
           if IsControlJustPressed(0, 73) then
                       
                       ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(duty)
                           
                           if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
                           if player == -1 or closestDistance > 1.0 then
                           else
                               if duty == 1 then
                                   if PlayerData.job.name == 'police' then
                                       TriggerServerEvent('getPlayerStaatMenu')
                                   elseif PlayerData.job.name == 'fib' then
                                       TriggerServerEvent('getPlayerStaatMenu')
                                   elseif PlayerData.job.name == 'ambulance' then
                                       TriggerServerEvent('getPlayerMedicMenu')
                                   elseif PlayerData.job.name == 'dmv' then 
                                       TriggerServerEvent('getPlayerDutyMenu')
                                   else
                                       TriggerServerEvent('getPlayerMenu')
                                   end 
                               else
                                   TriggerServerEvent('getPlayerMenu')
                               end
                               
                           end
                           end
                       end) 
                   
           end
       end
   end)
   
   RegisterNetEvent('player_menu:setMax')
   AddEventHandler('player_menu:setMax', function(max)
       SendNUIMessage({
           action = 'updatemax',
           max = max
       })
   end)
   
   
   
   -- VEH
   
   ESX = nil
   local isUiOpen = false 
   local speedBuffer  = {}
   local velBuffer    = {}
   local beltOn       = false
   local wasInCar     = false
   local vehicles = {}
   local RPWorking = true
   
   
   
   
   
   local allowedPumps = 
   {
       [-2007231801] = true,
       [1339433404] = true,
       [1694452750] = true,
       [1933174915] = true,
       [-462817101] = true,
       [-469694731] = true,
       [-164877493] = true
   }
   
   function FindNearestFuelPump()
       local coords = GetEntityCoords(PlayerPedId())
       local fuelPumps = {}
       local handle, object = FindFirstObject()
       local success
   
       repeat
           if allowedPumps[GetEntityModel(object)] then
               table.insert(fuelPumps, object)
           end
   
           success, object = FindNextObject(handle, object)
       until not success
   
       EndFindObject(handle)
   
       local pumpObject = 0
       local pumpDistance = 1000
   
       for _, fuelPumpObject in pairs(fuelPumps) do
           local dstcheck = GetDistanceBetweenCoords(coords, GetEntityCoords(fuelPumpObject))
   
           if dstcheck < pumpDistance then
               pumpDistance = dstcheck
               pumpObject = fuelPumpObject
           end
       end
   
       return pumpObject, pumpDistance
   end
   
   CreateThread(function()
       while true do
           local pumpObject, pumpDistance = FindNearestFuelPump()
   
           if pumpDistance < 2.5 then
               nearPump = pumpObject
           else
               nearPump = false 
           end
   
           Wait(500)
       end
   end)
   
   function VehicleInFront()
       local pos = GetEntityCoords(GetPlayerPed(-1))
       local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 4.0, 0.0)
       local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
       local a, b, c, d, result = GetRaycastResult(rayHandle)
       return result
   end
   
   
   RegisterNetEvent('vehtanken')
   AddEventHandler('vehtanken', function()
       if nearPump then
           local veh   = ESX.Game.GetVehicleInDirection()
   
           if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(veh)) <= 5000.0 then
   
               local x, y, z =  GetEntityCoords(GetPlayerPed(-1))
    
               TriggerEvent("tankstelle:open", veh)
               PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    
           
           end
           
       else
           TriggerEvent("glmp_singlenotify", "red", "Es ist keine Tankstelle in deiner Nähe!")
   
       end
   end)
   
   
   
   
   
   
   AddEventHandler('repairveh')
   RegisterNetEvent('repairveh', function()
   
       
       local vehicle   = ESX.Game.GetVehicleInDirection()
   
       ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
           if quantity > 0 then
   
               if DoesEntityExist(vehicle) then
                   
                   local playerPed = PlayerPedId()
                   
                           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
                           TriggerEvent('patron_inventory:progressbar', 16000)
                                       
                                       
                           ESX.Streaming.RequestAnimDict("mini@repair", function()
                               TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 8.0, -8.0, -1, 1, 0, false, false, false)
                           end)
                        
                           FreezeEntityPosition(playerPed, true)
                           Wait(15000) 
                           FreezeEntityPosition(playerPed, false)
                           TriggerEvent('glmp_singlenotify', '', 'Du hast ein Fahrzeug repariert!')
                           TriggerServerEvent('esx_ambulancejob:removeItem', 'fixkit')
                           SetVehicleFixed(vehicle)
                           SetVehicleDeformationFixed(vehicle)
                           SetVehicleUndriveable(vehicle, false)
                           SetVehicleEngineOn(vehicle, false, true)
                           ClearPedTasksImmediately(playerPed)
   
                       
                          
       
           
               else
                   TriggerEvent('glmp_singlenotify', 'red', 'Kein Fahrzeug in der Nähe')
   
               end
           else
               TriggerEvent('glmp_singlenotify', 'red', 'Du hast keinen Reparaturkasten')
           end
   
   
       end, 'fixkit')
   end)
    
    
   
   RegisterNetEvent('locka')
   AddEventHandler('locka', function()
   
   
   
       local coords = GetEntityCoords(GetPlayerPed(-1))
       local hasAlreadyLocked = false
       cars = ESX.Game.GetVehiclesInArea(coords, 10)
       local carstrie = {}
       local cars_dist = {}		
       notowned = 0
       if #cars == 0 then
           TriggerEvent("glmp_singlenotify", "", 'Keine Fahrzeuge in der nähe!')
       else
           for j=1, #cars, 1 do
               local coordscar = GetEntityCoords(cars[j])
               local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
               table.insert(cars_dist, {cars[j], distance})
           end
           for k=1, #cars_dist, 1 do
               local z = -1
               local distance, car = 999
               for l=1, #cars_dist, 1 do
                   if cars_dist[l][2] < distance then
                       distance = cars_dist[l][2]
                       car = cars_dist[l][1]
                       z = l
                   end
               end
               if z ~= -1 then
                   table.remove(cars_dist, z) 
                   table.insert(carstrie, car)
               end
           end
           for i=1, #carstrie, 1 do
               local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
               ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
   
                   if owner and hasAlreadyLocked ~= true then
                       local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
                       vehicleLabel = GetLabelText(vehicleLabel)
                       local lock = GetVehicleDoorLockStatus(carstrie[i])
                     
                       if lock == 1 or lock == 0 then
                           SetVehicleDoorShut(carstrie[i], 0, false)
                           SetVehicleDoorShut(carstrie[i], 1, false)
                           SetVehicleDoorShut(carstrie[i], 2, false)
                           SetVehicleDoorShut(carstrie[i], 3, false)
                           SetVehicleDoorsLocked(carstrie[i], 2)
                           --PlayVehicleDoorCloseSound(carstrie[i], 1)
                           TriggerEvent('glmp_singlenotify', 'red', 'Fahrzeug abgeschlossen')
                           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    
                           if not IsPedInAnyVehicle(PlayerPedId(), true) then
                               TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                           end
                           hasAlreadyLocked = true
                       elseif lock == 2 then
                           SetVehicleDoorsLocked(carstrie[i], 1)
                           --PlayVehicleDoorOpenSound(carstrie[i], 0)
                           TriggerEvent('glmp_singlenotify', 'green', 'Fahrzeug aufgeschlossen')
                           PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    
                           if not IsPedInAnyVehicle(PlayerPedId(), true) then
                               TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
                           end
                           hasAlreadyLocked = true
                       end
                   else
                       notowned = notowned + 1
                   end
                   if notowned == #carstrie then
                       TriggerEvent('glmp_singlenotify', '', 'Für dieses Fahrzeug hast du keine Schlüssel!')
                   end	
               end, plate)
           end			
       end
   end)
   
   
   
   CreateThread(function()
       while true do
           Citizen.Wait(0)
    
           local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(-1)), 2.5)
           local player, closestDistance = ESX.Game.GetClosestPlayer()
   
           if IsControlJustPressed(0, 73) then
               if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
               if player == -1 or closestDistance > 1.0 then
                           for key, value in pairs(vehicles) do
                       TriggerServerEvent('getVehicleAMenu')
   
                   end
               else
   
               end
               end
   
           end
       end
   end)
   
   IsCar = function(veh)
           local vc = GetVehicleClass(veh)
           return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
           end 
   
    
   
   Citizen.CreateThread(function()
       while true do 
           Citizen.Wait(100)
           if (IsPlayerDead(PlayerId()) and isUiOpen == true and beltOn == true) then
   
               isUiOpen = false
           end    
       end
   end)
   
   function table.contains(table, element)
       for _, value in pairs(table) do
         if value[1] == element then
           return true
         end
       end
       return false
     end
   
   
   
     ---- veh innen
   
   
   local isUiOpen = false 
   local speedBuffer  = {}
   local velBuffer    = {}
   local beltOn       = false
   local wasInCar     = false
   local vehicles = {}
   local RPWorking = true
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))) then
               table.insert(vehicles, {GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)), IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))})
           elseif IsPedInAnyVehicle(GetPlayerPed(-1), false) and not table.contains(vehicles, GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
               table.insert(vehicles, {GetVehiclePedIsIn(GetPlayerPed(-1), false), IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false))})
           end
           for i, vehicle in ipairs(vehicles) do
               if DoesEntityExist(vehicle[1]) then
                   if (GetPedInVehicleSeat(vehicle[1], -1) == GetPlayerPed(-1)) or IsVehicleSeatFree(vehicle[1], -1) then
                       if RPWorking then
                           SetVehicleEngineOn(vehicle[1], vehicle[2], true, false)
                           SetVehicleJetEngineOn(vehicle[1], vehicle[2])
                           if not IsPedInAnyVehicle(GetPlayerPed(-1), false) or (IsPedInAnyVehicle(GetPlayerPed(-1), false) and vehicle[1]~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
                               if IsThisModelAHeli(GetEntityModel(vehicle[1])) or IsThisModelAPlane(GetEntityModel(vehicle[1])) then
                                   if vehicle[2] then
                                       SetHeliBladesFullSpeed(vehicle[1])
                                   end
                               end
                           end
                       end
                   end
               else
                   table.remove(vehicles, i)
               end
           end
       end
   end)
   
   RegisterNetEvent('radio')
   AddEventHandler('radio', function()
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
   
       if Citizen.InvokeNative(0x5F43D83FD6738741, Citizen.ReturnResultAnyway()) == 1 then
           SetVehicleRadioEnabled(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
       else
           SetVehicleRadioEnabled(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
   
       end
   
   
   end)
   
   
   
   local mp_pointing = false
   local keyPressed = false
   
   local function startPointing()
       local ped = GetPlayerPed(-1)
       RequestAnimDict("anim@mp_point")
       while not HasAnimDictLoaded("anim@mp_point") do
           Wait(0)
       end
       SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
       SetPedConfigFlag(ped, 36, 1)
       Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
       RemoveAnimDict("anim@mp_point")
   end
   
   local function stopPointing()
       local ped = GetPlayerPed(-1)
       Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
       if not IsPedInjured(ped) then
           ClearPedSecondaryTask(ped)
       end
       if not IsPedInAnyVehicle(ped, 1) then
           SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
       end
       SetPedConfigFlag(ped, 36, 0)
       ClearPedSecondaryTask(PlayerPedId())
   end
   
   local once = true
   local oldval = false
   local oldvalped = false
   
   Citizen.CreateThread(function()
       while true do
           Wait(0)
   
           if once then
               once = false
           end
   
           if not keyPressed then
               if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                   Wait(200)
                   if not IsControlPressed(0, 29) then
                       keyPressed = true
                       startPointing()
                       mp_pointing = true
                   else
                       keyPressed = true
                       while IsControlPressed(0, 29) do
                           Wait(50)
                       end
                   end
               elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                   keyPressed = true
                   mp_pointing = false
                   stopPointing()
               end
           end
   
           if keyPressed then
               if not IsControlPressed(0, 29) then
                   keyPressed = false
               end
           end
           if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
               stopPointing()
           end
           if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
               if not IsPedOnFoot(PlayerPedId()) then
                   stopPointing()
               else
                   local ped = GetPlayerPed(-1)
                   local camPitch = GetGameplayCamRelativePitch()
                   if camPitch < -70.0 then
                       camPitch = -70.0
                   elseif camPitch > 42.0 then
                       camPitch = 42.0
                   end
                   camPitch = (camPitch + 70.0) / 112.0
   
                   local camHeading = GetGameplayCamRelativeHeading()
                   local cosCamHeading = Cos(camHeading)
                   local sinCamHeading = Sin(camHeading)
                   if camHeading < -180.0 then
                       camHeading = -180.0
                   elseif camHeading > 180.0 then
                       camHeading = 180.0
                   end
                   camHeading = (camHeading + 180.0) / 360.0
   
                   local blocked = 0
                   local nn = 0
   
                   local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                   local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                   nn,blocked,coords,coords = GetRaycastResult(ray)
   
                   Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                   Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                   Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                   Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
   
               end
           end
       end
   end)
   
   
   local speedBuffer  = {}
   local velBuffer    = {}
   local beltOn       = false
   local wasInCar     = false
   
   IsCar = function(veh)
               local vc = GetVehicleClass(veh)
               return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
           end	
   
   Fwv = function (entity)
               local hr = GetEntityHeading(entity) + 90.0
               if hr < 0.0 then hr = 360.0 + hr end
               hr = hr * 0.0174533
               return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
         end
   DiffTrigger = 0.255 
   MinSpeed    = 19.25 
   
   
   
   RegisterNetEvent("automatischanschnallen")
   AddEventHandler("automatischanschnallen", function()
   
   beltOn = true
   end)
   
   Citizen.CreateThread(function()
       Citizen.Wait(500)
       while true do
           
           local ped = GetPlayerPed(-1)
           local car = GetVehiclePedIsIn(ped)
           
       
           
               wasInCar = true
               
               if beltOn then DisableControlAction(0, 75) end
               
           
           Citizen.Wait(0)
       end
   end)
   belt = false
   RegisterNetEvent('belt')
   AddEventHandler('belt', function()
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       toggleField(false)
   
       if belt == false then
           Citizen.Wait(100)
           TriggerEvent("glmp_singlenotify","green","Du hast deinen Anschnallgurt angelegt.") 
           belt = true
       else 
           TriggerEvent("glmp_singlenotify","red","Du hast deinen Anschnallgurt abgelegt.")
           belt = false
       
   
       end
   
   
   end)
   
   
   
   
   RegisterNetEvent('engine')
   AddEventHandler('engine', function()
   
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local veh
       local StateIndex
       for i, vehicle in ipairs(vehicles) do
           if vehicle[1] == GetVehiclePedIsIn(GetPlayerPed(-1), false) then
               veh = vehicle[1]
               StateIndex = i
           end
       end
       Citizen.Wait(5)
   
       if IsPedInAnyVehicle(GetPlayerPed(-1), false) then 
           if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)) then
               ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner1)
                   ----print(GetVehicleNumberPlateText(veh))
                   ----print(owner1)
                   owner = owner1
                  -- TriggerServerEvent('byte:sendLog', 'admin', '', '```'.. GetVehicleNumberPlateText(veh) ..'```')
                   if GetVehicleNumberPlateText(veh) == '  JOB   ' then
                       ----print("set to true") 
   
                       owner = true
                   end
                   if owner == true then 
                      ESX.TriggerServerCallback('carlock:isSperre', function(sperre) 
                           if GetIsVehicleEngineRunning(veh) == false then
                               if sperre == true then
                                   TriggerEvent("glmp_singlenotify","red","Das Fahrzeug kann sich nicht bewegen, daher es eine Wegfahrsperre hat!")
                                   return
                               end
                           end
                               vehicles[StateIndex][2] =  not GetIsVehicleEngineRunning(veh)
   
                               if vehicles[StateIndex][2] then   
                                       TriggerEvent("glmp_singlenotify","green", "Du hast den Motor angeschaltet.")
   
                               else
                                   TriggerEvent("glmp_singlenotify","red","Du hast den Motor ausgeschaltet.")
                               end
   
                        
                       end, GetVehicleNumberPlateText(veh))
                      
                   else 
                       TriggerEvent('glmp_singlenotify', '', 'Du hast keine Schlüssel für dieses Fahrzeug.')
                   end
               end, ESX.Math.Trim(GetVehicleNumberPlateText(veh)))
   
           end 
       end 
   end)
   
   
   RegisterNetEvent('engineadmin')
   AddEventHandler('engineadmin', function()
   
   
       PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
       local veh
       local StateIndex
       for i, vehicle in ipairs(vehicles) do
           if vehicle[1] == GetVehiclePedIsIn(GetPlayerPed(-1), false) then
               veh = vehicle[1]
               StateIndex = i
           end
       end
       Citizen.Wait(5)
   
       if IsPedInAnyVehicle(GetPlayerPed(-1), false) then 
           if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)) then
               --ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner1)
                   
                  -- TriggerServerEvent('byte:sendLog', 'admin', '', '```'.. GetVehicleNumberPlateText(veh) ..'```')
                   
                      
                           if GetIsVehicleEngineRunning(veh) == false then
                               if sperre == true then
                                   TriggerEvent("glmp_singlenotify","red","Das Fahrzeug kann sich nicht bewegen, daher es eine Wegfahrsperre hat!")
                                   return
                               end
                           end
                               vehicles[StateIndex][2] =  not GetIsVehicleEngineRunning(veh)
   
                               if vehicles[StateIndex][2] then   
                                       TriggerEvent("glmp_singlenotify","green", "Du hast den Motor angeschaltet.")
   
                               else
                                   TriggerEvent("glmp_singlenotify","red","Du hast den Motor ausgeschaltet.")
                               end
   
                       
                      
                  
              -- end, GetVehicleNumberPlateText(veh))
   
           end 
       end 
   end)
   
   
   
   local ss = false
   
   
   
   
   
   CreateThread(function()
       while true do
           Citizen.Wait(0)
    
    
           if IsControlJustPressed(0, 73) then
               if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
   
               TriggerServerEvent('getVehicleMenu')
   
               end
           end
       end
   end)
   
   
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(100)
           if (IsPlayerDead(PlayerId()) and isUiOpen == true) then
   
               isUiOpen = false
           end    
       end
   end)
   
   function table.contains(table, element)
       for _, value in pairs(table) do
         if value[1] == element then
           return true
         end
       end
       return false
     end
   
     -- XMENU HANDLER
   
     RegisterNUICallback('trigger', function(data, cb)
       if data.args[1] == "XMenu" then
           event2 = json.decode(data.args[3])
           TriggerEvent(event2.arg)
           closeMenu()
       end
   
   cb('ok')
   end)
   
    
   
   RegisterNetEvent('responsexMenu')
   AddEventHandler('responsexMenu', function(data)
       openMenu(json.decode(data))
   end)
   
   RegisterNUICallback('close', function(data, cb)
       closeMenu()
   end)
   
   function openMenu(data)
       SendNUIMessage({
           action = "open",
           dataItems = data
       })
       SetNuiFocus(true, true)
   end
   
   function closeMenu()
       SetNuiFocus(false, false)
   end
   
   
   -- CHAT
   
   
   ESX                           = nil
   
   Citizen.CreateThread(function()
       SetTextChatEnabled(false)
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(10)
       end
   
       PlayerData = ESX.GetPlayerData()
   
   end)
   
   RegisterCommand('ooc', function(source, args)
       local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
       local argString = table.concat(args, " ")
     
       if closestPlayer ~= -1 and closestDistance <= 10.0 then
           TriggerServerEvent('OOC', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), argString)
       else
           TriggerEvent("glmp_notify", "#ab0503", "Fehler", "Keine Spieler in der Nähe")
       end
   end)
   
   RegisterCommand("id", function(source, args, rawCommand)
       local playerPed = GetPlayerPed(-1)
       ESX.ShowNotification("Deine Support-ID: " ..GetPlayerServerId(PlayerId()).. " ")
   end) 
   
   RegisterNUICallback('trigger', function(data, cb)
       ownedCars = {}
       if data.args[1] == "Chat" then
           if data.args[2] == "command" then
               ExecuteCommand(data.args[3]) 
           end
       end 
   end)
   RegisterKeyMapping('openchat', 'Chat', 'keyboard', 't')
   RegisterCommand('openchat', function(source)
       SendNUIMessage({action="openWindow", window = "Chat", windowData = {}}) 
       SetNuiFocus(true, true)
   end) 
   
   
   --LOGIN
   
   
   
   
   Citizen.CreateThread(function()
       Wait(1000)
   
       
   
       
       TriggerServerEvent('requestLogin')
   
       while true do
           Wait(1000)
           if loggedIn ~= true then
               SetEntityHeading(PlayerPedId(), 340)
           end
       end
   end) 
   
   
    oldCoords = nil
   RegisterNetEvent('openLoginScreen')
   AddEventHandler('openLoginScreen', function(name)
       
       
       ShutdownLoadingScreen()
       ShutdownLoadingScreenNui()
       TriggerEvent('setDimension', 0)
           StopPlayerSwitch()
           DisplayRadar(true)
           TriggerServerEvent('teleportPlayerToPos')
           
           SendNUIMessage({action="showPlayerPanel", state = false})
           TriggerEvent('startShowHud')  
         
          TriggerScreenblurFadeOut(250)
          FreezeEntityPosition(PlayerPedId(), false)
           loggedIn = true  
           Wait(2000)
           TriggerServerEvent('teleportPlayerToPos')
           TriggerEvent('byte_einreise:join')  
           TriggerServerEvent('showIdentityWithCheck')
       
   end)       
   
   RegisterNetEvent('sendLoginMsg') 
   AddEventHandler('sendLoginMsg', function(msg)
       SendNUIMessage({action="LoginMessage", msg = msg})
       if msg == "successfully" then 
           TriggerEvent('setDimension', 0)
           StopPlayerSwitch()
           DisplayRadar(true)
           TriggerEvent('byte_einreise:join')
           SendNUIMessage({action="showPlayerPanel", state = false})
           TriggerEvent('startShowHud') 
          TriggerServerEvent('teleportPlayerToPos')
          TriggerScreenblurFadeOut(250)
          FreezeEntityPosition(PlayerPedId(), false)
           loggedIn = true
       end
   end)
   RegisterNUICallback('trigger', function(data, cb)
       if data.args[1] == "Login" then
           if data.args[2] == "PlayerLogin" then
               TriggerServerEvent('byte:login', data.args[3])
           elseif data.args[2] == "kickPlayer" then
               TriggerServerEvent('loginKickPlayer')
           end
       end
       
   end)
   
   
   -- SHOP
   
   
   RegisterNUICallback('trigger', function(data, cb)
       ownedCars = {}
       if data.args[1] == "Shop" then 
           if data.args[2] == "shopBuy" then 
               TriggerEvent('shopBuyBasket', data.args[3])
           end
       end 
   end)
   
   local Keys = {
       ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
       ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
       ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
       ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
       ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
       ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
       ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
       ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
       ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
   }
   
   
   
   local PlayerData = {}
   local wasinside = false
   
   
   local laden = {
       {x = 372.57, y = 326.66, z = 103.57, h = 253.43, type = '24/7'},--1
       {x = 2557.02, y = 380.79, z = 108.62, h = 356.23, type = '24/7'},--2
       {x = -3038.94, y = 584.51, z = 7.91, h = 21.55, type = '24/7'},--3
       {x = -3242.3140, y = 1000.0204, z = 12.8307, h = 352.8722, type = '24/7'},--4
       {x = 549.14, y = 2671.33, z = 42.16, h = 106.57,type = '24/7'},--5
       {x = 1960.09, y = 3739.89, z = 32.34, h = 302.17, type = '24/7'},--6
       { x = 2678.09, y = 3279.31, z = 55.24, h = 331.19, type = '24/7'},--7
       {x = 1727.91, y = 6415.43, z = 35.04, h = 243.0, type = '24/7'},--8
       {x = 1134.17, y = -982.6, z = 46.42, h = 276.23, type = '24/7'},--9
       {x = -1221.9, y = -908.33, z = 12.33, h = 35,47, type = '24/7'},--10
       {x = -1486.24, y = -377.94, z = 40.16, h = 136.17, type = '24/7'},--11
       {x = - 6.34, y = 391.0, z = 15.04, h = 89.93, type = '24/7'},--12
       {x = 1165.78, y = 2710.86, z = 38.16, h = 179.76, type = '24/7'},--13
       {x = 1392.6, y = 3606.39, z = 34.98, h = 197.55, type = '24/7'},--14
       {x = 24.4, y = -1347.15, z = 29.5, h = 273.02, type = '24/7'},--15
       {x = 129.57, y = -1284.21, z = 29.27, h = 123.02, type = '24/7'},--16
       {x = -47.01, y = -1758.33, z = 29.42, h = 44.16, type = '24/7'},--17
       {x = 1164.87, y = -323.37, z = 69.21,  h = 99.75, type = '24/7'},--18
       {x = -706.07, y = -913.87, z = 19.22, h = 86.85, type = '24/7'},--19
       {x = -1820.01, y = 794.17, z = 138.09, h = 136.66, type = '24/7'},--20
       {x = 1697.82, y = 4923.0, z = 42.06, h = 323.42, type = '24/7'},--21
       {x = -2539.3391, y = 2313.8884, z = 33.4109, h = 93.1211, type = '24/7'},--21
       {x = -1070.74, y = -2836.12, z = 27.7, h =  284.54, type = 'airport'},--22
       {x = -661.64, y = -933.51, z = 21.83, h = 174.12, type = 'ammunation'},--23
       {x = 809.37, y = -2159.13, z = 29.62, h = 353.17, type = 'ammunation'},--24
       {x = 1692.54, y = 3761.32, z = 34.71, h = 223.89, type = 'ammunation'},--25
       {x = -331.25, y = 6085.43, z = 31.45, h = 218.64, type = 'ammunation'},--26
       {x = 253.64, y = -51.08, z = 69.94, h = 65.96, type = 'ammunation'},--27 
       {x = 23.04, y = -1105.61, z = 29.8, h = 255.58, type = 'ammunation'},--28
       {x = 2567.01, y = 292.55, z = 108.73, h = 356.47, type = 'ammunation'},--29
       {x = -1118.55, y = 2700.25, z = 18.55, h = 214.41, type = 'ammunation'},--30
       {x = 841.68, y = -1035.34, z = 28.19, h = 357.93, type = 'ammunation'},--31
       {x = -563.28,  y = -194.2,  z = 38.36,  h = 250.86, type = 'regierung'},--32 
       {x = -561.09,  y = -939.11,  z = 25.1,  h = 42.38, d = 0.5, type = 'tuner'},--36 
       {x = -87.2,  y = 30.28,  z = 71.96, h = 63.65 , type = 'phone'},--33
       {x = -656.6,  y = -858.72,  z = 24.48, h = 4.2, type = 'phone'},--33
       {x = -627.4,  y = -276.84,  z = 35.56, type = 'phone'},--33
       {x = 2748.16,  y = 3472.68,  z = 55.68, h = 244.53, type = 'baumarkt'},--34
       {x = -1519.12,  y = -918.08,  z = 10.16, type = 'backpack'}--35

   }
    
   RegisterNetEvent('shopBuyBasket')
   AddEventHandler('shopBuyBasket', function(shop)
       playerCanBuy = true
       ESX.TriggerServerCallback('shop:getPlayerMoney', function(playerMoney)
           price = 0
           for _, basket in pairs(shop) do
               price = price + basket.price
           end 
           if playerMoney >= price then
               shopBasket = {}
               for _, basket in pairs(shop) do 
                   ESX.TriggerServerCallback('canInInventory', function(can)
                      
                       if can == false then
                           ESX.ShowNotification('Deine Inventar Größe reicht nicht aus!') 
                           ----print("inv reicht nich")
                           playerCanBuy = false
                           return
                       else
                           ----print("inv reicht")
                       end
                   end, basket.itemId, basket.count)
                   
               end
               Wait(500)
               if playerCanBuy == true then
                   TriggerServerEvent('shop:pay', price)
                   
                   for _, basket in pairs(shop) do 
                       TriggerServerEvent('shop:giveItem', basket.itemId, basket.count)
                       
                   end
                   TriggerEvent('glmp_notify', 'green', 'Shop', 'Du hast einige Items gekauft!')
               end
           else 
               TriggerEvent('glmp_singlenotify', 'red', 'Du hast nicht genug Geld dabei!')
           end
       end)
   end)
   
   local enableField = false
   shopItems = {} 
   function toggleField(enable, type)
       shopItems = {}
       --SetNuiFocus(enable, enable)
       enableField = enable
       itemId = 0
       if enable then
           ESX.TriggerServerCallback('glmp_shops:loadItems', function(items)
               for key, value in pairs(items) do
                   itemId = itemId + 1 
                   
                   table.insert(shopItems, {id = itemId, name = value.name, price = value.price, img = value.img, label = value.display})
               end
               
           end, type)
           Wait(250)
           TriggerEvent('open247Shop', 1, shopItems)
           
       else 
       end
   end
   
   Citizen.CreateThread(function()
       while true do
           Wait(1000)
           for key, value in pairs(laden) do
               DrawMarker(-1, vector3(value.x, value.y, value.z + 1), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
           end
       end
   end)
   
   
   Citizen.CreateThread(function()
       while true do 
           Wait(500)
           --print("")
           for key, value in pairs(laden) do
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.x, value.y, value.z))
               if dist < 2.0 then
                   if wasinside == false then
                       TriggerEvent('static_interact', "E", "show")
                       wasinside = true
                   end
               elseif dist > 2.0 and dist < 5.0 then
                   if wasinside then
                       wasinside = false
                       TriggerEvent('static_interact', "E", "hide")
                   end
               end
           end
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           Wait(10) 
           ladendev = 0
           if npcSpawned == nil then
               for _,v in pairs(laden) do
                   RequestModel(GetHashKey("a_m_o_acult_02"))
                   while not HasModelLoaded(GetHashKey("a_m_o_acult_02")) do
                   Wait(1)
                   end
               
                   RequestAnimDict("mini@strip_club@idles@bouncer@base")
                   while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
                   Wait(1)
                   end
                   ped =  CreatePed(4, 0x4BA14CCA,v.x, v.y,v.z-1, 3374176, false, true)
                   SetEntityHeading(ped, v.h) 
                   FreezeEntityPosition(ped, true)
                   SetEntityInvincible(ped, true) 
                   SetBlockingOfNonTemporaryEvents(ped, true)
               end 
               npcSpawned = true
           end
           for key, value in pairs(laden) do
               ladendev = ladendev + 1
               local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.x, value.y, value.z))
   
               if dist <= 2.0 then
                   if IsControlJustReleased(0, 38) then
                       toggleField(true, value.type)
                       TriggerEvent('static_interact', "E", "hide")
                       ----print("LADEN: ".. ladendev)
                   end
               end
           end
       end 
   end) 
   
   Citizen.CreateThread(function()
       for _, coords in pairs(laden) do
           if coords.type == 'ammunation' then
               local blip = AddBlipForCoord(vector3(coords.x, coords.y, coords.z))
    
               SetBlipSprite(blip, 110)
               SetBlipScale(blip, 0.8)
               SetBlipColour(blip, 0)
               SetBlipDisplay(blip, 2)
               SetBlipAsShortRange(blip, true)
   
               BeginTextCommandSetBlipName("STRING")
               AddTextComponentString("Waffenladen")
               EndTextCommandSetBlipName(blip)
           elseif coords.type == '24/7' then
               local blip = AddBlipForCoord(vector3(coords.x, coords.y, coords.z))
   
               SetBlipSprite(blip, 52)
               SetBlipScale(blip, 0.8)  
               SetBlipColour(blip, 25)
               SetBlipDisplay(blip, 2)
               SetBlipAsShortRange(blip, true)
   
               BeginTextCommandSetBlipName("STRING")
               AddTextComponentString("Shop")
               EndTextCommandSetBlipName(blip)
    
           end
       end
   end)
   
   
   -- RNDM
   
   
   
   RegisterNetEvent('static_interact')
   AddEventHandler('static_interact', function(key, activity, msg)
   
       if activity ~= 'hide' then
           if msg == nil then
               TriggerEvent('glmp_singlenotify', '', 'Benutze '.. key .. ' zum Interagieren!')
           else
               TriggerEvent('glmp_singlenotify', '', 'Benutze '.. key .. ' ' .. msg)
           end
       end
   end) 
   
    
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           SetCanAttackFriendly(GetPlayerPed(-1), true, false)
           NetworkSetFriendlyFireOption(true)
       end
   end)
   
   Citizen.CreateThread(function()
       while true do
           StatSetInt('MP0_STAMINA', 100, true)
           Citizen.Wait(100)			
       end
   end)
   
   
   Citizen.CreateThread(function()
       while true do
           Citizen.Wait(0)
           local ped = GetPlayerPed( -1 )
           local weapon = GetSelectedPedWeapon(ped)
           if IsPedArmed(ped, 6) then
               DisableControlAction(1, 140, true)
               DisableControlAction(1, 141, true)
               DisableControlAction(1, 142, true)
           end
       end
   end)
   
   Citizen.CreateThread(function()
   
   
           local interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
           local int = {
               "rc12b_fixed",
               "rc12b_destroyed",
               "rc12b_default",
               "rc12b_hospitalinterior_lod",
               "rc12b_hospitalinterior"
           }
           Wait(10000)
           for i = 1, #int, 1 do
               if IsIplActive(int[i]) then
                   RemoveIpl(int[i])
               end
           end
           RefreshInterior(interiorID)
           LoadInterior(interiorID) 
   
           while true do
               Wait(0)
               local weapon = GetSelectedPedWeapon(PlayerPedId())
               SetCurrentPedWeapon(PlayerPedId(), weapon, true)
           end
   end)
   
   function ShowNotification(text)
       SetNotificationTextEntry("STRING")
       AddTextComponentString(text)
       DrawNotification(false, false)
   end
   
     
   RegisterKeyMapping('fewrfewr_weste', "Weste", "keyboard", "PERIOD")
   RegisterCommand('fewrfewr_weste', function()
       UseWeste()
   end) 
   
   
   RegisterNetEvent('useSpecItem')
   AddEventHandler('useSpecItem', function(item)
       --print(item)
       if item == "bulletproof" then 
           UseWeste()
       elseif item == "medikit" then 
           UseMedkit()
       end
   end)
   function UseWeste()
       ESX.TriggerServerCallback('haveWeste', function(have) 
           if have == true then 
               TriggerEvent('patron_inventory:progressbar', 3000)
               ClearPedTasksImmediately(PlayerPedId()) 
               FreezeEntityPosition(PlayerPedId(), true)
               TriggerEvent('machenWestenAnim')
               
               Wait(3000)  
               ClearPedTasksImmediately(PlayerPedId()) 
               SetPedArmour(PlayerPedId(), 100)
               TriggerServerEvent('byte:removeItem', 'bulletproof')
               FreezeEntityPosition(PlayerPedId(), false)
           end
       end)
   end
   
   RegisterKeyMapping('fewrfewr_med', "Medikit", "keyboard", "COMMA")
   RegisterCommand('fewrfewr_med', function()
       UseMedkit()
   end) 
   
   function UseMedkit()
       ESX.TriggerServerCallback('haveMedikit', function(have) 
           if have == true then 
               TriggerEvent('patron_inventory:progressbar', 3000)
               ClearPedTasksImmediately(PlayerPedId()) 
               FreezeEntityPosition(PlayerPedId(), true)
               TriggerEvent('machenWestenAnim')
               Wait(3000)  
               ClearPedTasksImmediately(PlayerPedId()) 
               SetEntityHealth(PlayerPedId(), 100)
  
                SetEntityHealth(PlayerPedId(),   GetEntityMaxHealth(PlayerPedId()))
               TriggerServerEvent('byte:removeItem', 'medikit')
               FreezeEntityPosition(PlayerPedId(), false)
           end
       end)
   end
   
   
   RegisterNetEvent('showGangwar')
   AddEventHandler('showGangwar', function()
       SendNUIMessage({action="showGangwar"})
   end)
    
   RegisterNetEvent('hideGangwar') 
   AddEventHandler('hideGangwar', function()
       SendNUIMessage({action="hideGangwar"})
   end)
    
   
   RegisterNetEvent('setupGangwar') 
   AddEventHandler('setupGangwar', function(attacker, defender)
       SendNUIMessage({action="setupGangwar", attacker = attacker, defender = defender})
   end)
    
   
   RegisterKeyMapping("crosshairtoggle", "Crosshair Toggle", "keyboard", "F4")
   RegisterCommand("crosshairtoggle", function()
       SendNUIMessage({
           action = "togglexhair"
       })
   end)
    
   
                    
   
   
          
    
   RegisterNUICallback('trigger', function(data, cb)
       if data.args[1] == "GiveMoney" then
           if data.args[2] ==  "GivePlayerMoney" then
               --print("checkenddwedwe")
               local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
               if closestPlayer == -1 or closestDistance < 1.3 then
                   --print("fwerfwe")
                   
                       
                       TriggerServerEvent("player_menu:giveCash", GetPlayerServerId(closestPlayer), tonumber(data.args[3]))
                   
               end  
           end
       end 
       if data.args[1] == "CharacterCreator" then
           if data.args[2] == "rotate" then
               --print("rotate")
               local h = GetEntityHeading(PlayerPedId())
    
               SetEntityHeading(PlayerPedId(), h + data.args[3])
           elseif data.args[2] == "changeGender" then
               TriggerEvent('skinchanger:getSkin', function(skin)
                   if skin.sex == 0 then
                       TriggerEvent('skinchanger:loadDefaultModel', 0)
                   else
                       TriggerEvent('skinchanger:loadDefaultModel', 1)
                   end
                   local skin1 = {
                       sex          = 332,
                       face         = 0,
                       skin         = 0,
                       beard_1      = 0,
                       beard_2      = 0,
                       beard_3      = 0,
                       beard_4      = 0,
                       hair_1       = 0,
                       hair_2       = 0,
                       hair_color_1 = 0,
                       hair_color_2 = 0,
                       tshirt_1     = 0,
                       tshirt_2     = 0,
                       torso_1      = 0,
                       torso_2      = 0,
                       decals_1     = 0,
                       decals_2     = 0,
                       arms         = 0,
                       pants_1      = 0,
                       pants_2      = 0,
                       shoes_1      = 0,
                       shoes_2      = 0,
                       mask_1       = 0,
                       mask_2       = 0,
                       bproof_1     = 0,
                       bproof_2     = 0,
                       chain_1      = 0,
                       chain_2      = 0,
                       helmet_1     = 0,
                       helmet_2     = 0,
                       glasses_1    = 0,
                       glasses_2    = 0,
                   }
                   
                   TriggerEvent('skinchanger:loadSkin', skin1)
               end)
           end 
       end 
   end)
   
   
   
   function OpenK()
   
   
   
       TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
   
           menu.close()
   
           ESX.UI.Menu.Open(
               'default', "Klinik", 'shop_confirm',
               {
                   title = 'Möchtest du deinen Skin so lassen?',
                   align = 'top-left',
                   elements = {
                       {label = 'Bestätigen', value = 'yes'},
                       {label = 'Abbrechen', value = 'no'},
                   }
               },
               function(data, menu)
   
                   menu.close()
   
                   if data.current.value == 'yes' then
   
                       
   
                               ESX.ShowNotification("Skin wurde Gespeichert!")
   
                               TriggerEvent('skinchanger:getSkin', function(skin)
                                   TriggerServerEvent('esx_skin:save', skin)
                               end)
   
                               
                           
   
                       
   
                   end
   
                   if data.current.value == 'no' then
   
                       TriggerEvent('esx_skin:getLastSkin', function(skin)
                           TriggerEvent('skinchanger:loadSkin', skin)
                       end)
   
                   end 
   
                   CurrentAction     = 'shop_menu'
                   CurrentActionMsg  = '_U(press_access)'
                   CurrentActionData = {}
   
               end,
               function(data, menu)
   
                   menu.close()
   
                   CurrentAction     = 'shop_menu'
                   CurrentActionMsg  = " _U('press_access')"
                   CurrentActionData = {}
   
               end
           )
   
       end, function(data, menu)
   
               menu.close()
   
               CurrentAction     = 'shop_menu'
               CurrentActionMsg  = "_U('press_access')"
               CurrentActionData = {}
   
       end, {
           'sex',
           'face',
           'skin',
           'arms',
       	'beard_1',
       	'beard_2',
       	'beard_3',
       	'beard_4',
       	'hair_1',
       	'hair_2',
       	'hair_color_1',
       	'hair_color_2',
           'eyebrows_1',
           'eyebrows_2',
           'eyebrows_3',
           'eyebrows_4',
           'makeup_1',
           'makeup_2',
           'makeup_3',
           'makeup_4',
           'lipstick_1',
           'lipstick_2',
           'lipstick_3',
           'lipstick_4',
       })
    
   end
   
   RegisterNetEvent('openCharCreator')
   AddEventHandler('openCharCreator', function()
       OpenK() 
   end)
   showEK = false
   Citizen.CreateThread(function( )
       while true do
           Citizen.Wait(1)
           local player = GetPlayerPed(-1)
           local playerloc = GetEntityCoords(player, 0)
           local distance = GetDistanceBetweenCoords(355.68, -596.84, 28.76, playerloc['x'], playerloc['y'], playerloc['z'], true)
           ----print(distance)
           if distance < 3 then 
               if showEK ~= true then 
                   ESX.ShowNotification("Nutze E um auf die Schönheitsklinik zuzugreifen!")
                   showEK = true 
               end
   
               if IsControlJustPressed(1,51) then 
   
                   TriggerEvent('openCharCreator')
               end
           elseif distance > 3 and distance < 3.5 then 
               showEK = false 
           end
       end
   end)


   
   
    
   ]]  
   loadClientGLMP = {}
   RegisterServerEvent('glmp:getclientcode')
   AddEventHandler('glmp:getclientcode', function()
       local _source = source
       if loadClientGLMP[_source] ~= "ok" then
           loadClientGLMP[_source] = "ok" 
           TriggerClientEvent('glmp:transferclientcode', _source, clientcode)
           
           --print("player ".. _source .. " loaded client side")
       else 
           --print("player ".. _source .. " attemp to load client side second")
       end
   end) 