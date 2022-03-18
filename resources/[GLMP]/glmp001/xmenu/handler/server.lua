RegisterServerEvent("getPlayerMenu")
AddEventHandler("getPlayerMenu", function()

    player = {
        {
            label = "Abbrechen",
            description = "Schließe dieses Menü.",
            icon = "https://cdn.discordapp.com/attachments/837415842466889739/837455210867064882/exit.png",
            id = "1",
            arg = "gferwgwer"
        },
        {
            label = "Dursuchen",
            description = "Dursuche einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619527176388618/search.png",
            id = "2",
            arg = "durchsuchen"
        },
        {
            label = "ID",
            description = "Ziehe dir die Support ID eines Spielers.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619522395537408/information.png",
            id = "3",
            arg = "supportId"
        },
        {
            label = "Fesseln/Entfesseln",
            description = "Fessle oder Entfessle einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898980694963933264/rope.png",
            id = "4",
            arg = "kabelbinder"
        },
        {
            label = "Ausweis", 
            description = "Gebe einem Spieler deinen Ausweis",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "5",
            arg = "giveausweis"
        },
        {
            label = "Lizenzbuch",
            description = "Zeige einem Spieler dein Lizenzbuch",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619524736352266/lic.png",
            id = "6",
            arg = "showLicense"
        },
        {
            label = "Stabilisieren",
            description = "Stabilisiere einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898979564322177064/stabilize.png",
            id = "7",
            arg = "stabilse"
        },
        {
            label = "Schlüssel",
            description = "Gebe dem Spieler neben dir deine Fahrzeugschlüssel.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619523771531264/key.png",
            id = "8",
            arg = "giveCarKey"
        },
        {
            label = "Geld Geben",
            description = "Gebe einem Spieler Geld.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619529589162074/wallet.png",
            id = "9",
            arg = "giveMoney"
        },
    }
    TriggerClientEvent("responsexMenu", source, json.encode(player))
end)


RegisterServerEvent("getPlayerNotMenu")
AddEventHandler("getPlayerNotMenu", function()

    player = {
        {
            label = "Abbrechen",
            description = "Schließe dieses Menü.",
            icon = "https://cdn.discordapp.com/attachments/837415842466889739/837455210867064882/exit.png",
            id = "1",
            arg = "gferwgwer"
        },
    }
    TriggerClientEvent("responsexMenu", source, json.encode(player))
end)



RegisterServerEvent("getPlayerDutyMenu")
AddEventHandler("getPlayerDutyMenu", function() 

    player = {
        {
            label = "Abbrechen",
            description = "Schließe dieses Menü.",
            icon = "https://cdn.discordapp.com/attachments/837415842466889739/837455210867064882/exit.png",
            id = "1",
            arg = "gferwgwer"
        },
        {
            label = "Dursuchen",
            description = "Dursuche einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619527176388618/search.png",
            id = "2",
            arg = "durchsuchen"
        },
        {
            label = "ID",
            description = "Ziehe dir die Support ID eines Spielers.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619522395537408/information.png",
            id = "3",
            arg = "supportId"
        },
        {
            label = "Fesseln/Entfesseln",
            description = "Fessle oder Entfessle einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898980694963933264/rope.png",
            id = "4",
            arg = "kabelbinder"
        },
        {
            label = "Ausweis", 
            description = "Gebe einem Spieler deinen Ausweis",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "5",
            arg = "giveausweis"
        },
        {
            label = "Dienstausweis", 
            description = "Gebe einem Spieler deinen Dienstausweis",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "6",
            arg = "givedutyausweis"
        },
        {
            label = "Lizenzbuch",
            description = "Zeige einem Spieler dein Lizenzbuch",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619524736352266/lic.png",
            id = "7",
            arg = "showLicense"
        },
        {
            label = "Stabilisieren",
            description = "Stabilisiere einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898979564322177064/stabilize.png",
            id = "8",
            arg = "stabilse"
        },
        {
            label = "Schlüssel",
            description = "Gebe dem Spieler neben dir deine Fahrzeugschlüssel.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619523771531264/key.png",
            id = "9",
            arg = "giveCarKey"
        },
        {
            label = "Geld Geben",
            description = "Gebe einem Spieler Geld.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619529589162074/wallet.png",
            id = "10",
            arg = "giveMoney"
        },
    }
    TriggerClientEvent("responsexMenu", source, json.encode(player))
end)


  
RegisterServerEvent("getVehicleMenu")
AddEventHandler("getVehicleMenu", function()

    vehicle = {
        {
            label = "Abbrechen",
            description = "Schließe dieses Menü.",
            icon = "https://cdn.discordapp.com/attachments/837415842466889739/837455210867064882/exit.png",
            id = "1",
            arg = "gferwgwer"
        },
        {
            label = "Ab/Aufschließen",
            description = "Schließe dein Fahrzeug Ab/Auf",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619523771531264/key.png",
            id = "2",
            arg = "locka"
        },
        {
            label = "Motor",
            description = "Schalte den Motor Ein/Aus",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846626414308753418/motor.png",
            id = "5",
            arg = "engine"
        },
        
        {
            label = "Radio",
            description = "Schalte das Radio Ein/Aus",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846626411606441994/radio.png",
            id = "4",
            arg = "radio"
        },
        
        {
            label = "Rauswerfen",
            description = "Werfe eine Person aus dem Fahrzeug",
            icon = "https://cdn.discordapp.com/attachments/914543916269854870/914555510508912720/unknown.png",
            id = "3",
            arg = "ejectWindow" 
        },
    }
    TriggerClientEvent("responsexMenu", source, json.encode(vehicle))
end)

RegisterServerEvent("getVehicleAMenu")
AddEventHandler("getVehicleAMenu", function()

    vehiclea = {
        {
            label = "Abbrechen",
            description = "Schließe dieses Menü.",
            icon = "https://cdn.discordapp.com/attachments/837415842466889739/837455210867064882/exit.png",
            id = "1",
            arg = "gferwgwer"
        },
        {
            label = "Ab/Aufschließen",
            description = "Schließe dein Fahrzeug Ab/Auf",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619523771531264/key.png",
            id = "2",
            arg = "locka"
        },
        {
            label = "Tanken",
            description = "Tanke dein Auto an einer Tankstelle",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846630316114182154/gasstation.png",
            id = "4",
            arg = "vehtanken"
        },
        {
            label = "Reparieren",
            description = "Repariere dein Fahrzeug",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846627943618445332/repair.png",
            id = "5",
            arg = "repairveh"
        },
        {
            label = "Kofferraum",
            description = "Öffne/Schließe den Kofferraum von deinem Fahrzeug",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898982048981717002/trunk.png",
            id = "3",
            arg = "trunklock"
        },
    }
    TriggerClientEvent("responsexMenu", source, json.encode(vehiclea))
end)


--- STAAT

RegisterServerEvent("getPlayerStaatMenu")
AddEventHandler("getPlayerStaatMenu", function()

    player = {
        {
            label = "Abbrechen",
            description = "Schließe dieses Menü.",
            icon = "https://cdn.discordapp.com/attachments/837415842466889739/837455210867064882/exit.png",
            id = "1",
            arg = "gferwgwer"
        },
        {
            label = "Dursuchen",
            description = "Dursuche einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619527176388618/search.png",
            id = "2",
            arg = "lspd:durchsuchen"
        },
        {
            label = "ID",
            description = "Ziehe dir die Support ID eines Spielers.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619522395537408/information.png",
            id = "3",
            arg = "supportId"
        },
        {
            label = "Fesseln/Entfesseln",
            description = "Fessle oder Entfessle einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898980694963933264/rope.png",
            id = "4",
            arg = "kabelbinder"
        },
        {
            label = "Handschellen",
            description = "Fessle oder Entfessle einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898981159558598736/cuff.png",
            id = "5",
            arg = "handschellen"
        },
        {
            label = "Handschellen Vorne",
            description = "Fessle oder Entfessle einen Spieler vorne",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898981159558598736/cuff.png",
            id = "6",
            arg = "handschellenvorne"
        },
        {
            label = "Ausweis Nehmen", 
            description = "Den Ausweis eines Spielers nehmen.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "7",
            arg = "getausweispd"
        },
        {
            label = "Ausweis", 
            description = "Gebe einem Spieler deinen Ausweis",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "8",
            arg = "giveausweis"
        },
        {
            label = "Dienstausweis", 
            description = "Gebe einem Spieler deinen Dienstausweis",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "9",
            arg = "givedutyausweis"
        },
        {
            label = "Lizenzbuch",
            description = "Zeige einem Spieler dein Lizenzbuch",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619524736352266/lic.png",
            id = "10",
            arg = "showLicense"
        },
        {
            label = "Stabilisieren",
            description = "Stabilisiere einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898979564322177064/stabilize.png",
            id = "11",
            arg = "stabilse"
        },
        {
            label = "Schlüssel",
            description = "Gebe dem Spieler neben dir deine Fahrzeugschlüssel.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619523771531264/key.png",
            id = "12",
            arg = "giveCarKey"
        },
        {
            label = "Geld Geben",
            description = "Gebe einem Spieler Geld.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619529589162074/wallet.png",
            id = "13",
            arg = "giveMoney"
        },
    }
    TriggerClientEvent("responsexMenu", source, json.encode(player))
end)


RegisterServerEvent("getPlayerMedicMenu") 
AddEventHandler("getPlayerMedicMenu", function()

    player = {
        {
            label = "Abbrechen",
            description = "Schließe dieses Menü.",
            icon = "https://cdn.discordapp.com/attachments/837415842466889739/837455210867064882/exit.png",
            id = "1",
            arg = "gferwgwer"
        },
        {
            label = "Dursuchen",
            description = "Dursuche einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619527176388618/search.png",
            id = "2",
            arg = "durchsuchen"
        },
        {
            label = "ID",
            description = "Ziehe dir die Support ID eines Spielers.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619522395537408/information.png",
            id = "3",
            arg = "supportId"
        },
        {
            label = "Fesseln/Entfesseln",
            description = "Fessle oder Entfessle einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898980694963933264/rope.png",
            id = "4",
            arg = "kabelbinder"
        },

        {
            label = "Ausweis", 
            description = "Gebe einem Spieler deinen Ausweis",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "5",
            arg = "giveausweis"
        },
        {
            label = "Dienstausweis", 
            description = "Gebe einem Spieler deinen Dienstausweis",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619526124535818/perso.png",
            id = "5",
            arg = "givedutyausweis"
        },
        {
            label = "Lizenzbuch",
            description = "Zeige einem Spieler dein Lizenzbuch",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619524736352266/lic.png",
            id = "6",
            arg = "showLicense"
        },
        {
            label = "Stabilisieren",
            description = "Stabilisiere einen Spieler",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898979564322177064/stabilize.png",
            id = "8",
            arg = "stabilse"
        },
        { 
            label = "Wiederbeleben",
            description = "Belebe einen Speler wieder",
            icon = "https://cdn.discordapp.com/attachments/841703158396092426/898979552523583518/medicate.png",
            id = "7",
            arg = "medic:revivePlayer"
        },
        {
            label = "Schlüssel",
            description = "Gebe dem Spieler neben dir deine Fahrzeugschlüssel.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619523771531264/key.png",
            id = "9",
            arg = "giveCarKey"
        },
        {
            label = "Geld Geben",
            description = "Gebe einem Spieler Geld.",
            icon = "https://cdn.discordapp.com/attachments/840959177354117140/846619529589162074/wallet.png",
            id = "10",
            arg = "giveMoney" 
        },
    }
    TriggerClientEvent("responsexMenu", source, json.encode(player))
end)
