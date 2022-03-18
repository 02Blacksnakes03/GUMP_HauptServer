var isComputerOpen = false
var isIpadOpen = false

var _$_bc9e = ["message", "action", "data", "open", "dataItems", "close", "addEventListener", "ready", "visible", "Hud", "http://glmp001/close", "post", "XMenu"];
showHud();
$(document)[_$_bc9e[7]](function() {
    window[_$_bc9e[6]](_$_bc9e[0], function(_0x1E7E6) {
        
        //console.log(_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]] )
        if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'openGarage') {

            openGarage(_0x1E7E6[_$_bc9e[2]]["garagename"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'openSupportTablet') {

            openSupportTablet()
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'closeSupportTablet') {
 
            closeSupportTablet()
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'updatePlayerPanel') {
            updatePlayerPanelMoney(_0x1E7E6[_$_bc9e[2]]["money"])
            updatePlayerPanelBlackMoney(_0x1E7E6[_$_bc9e[2]]["blackmoney"])
            updatePlayerPanelAduty(_0x1E7E6[_$_bc9e[2]]["aduty"])
            updatePlayerPanelVR(_0x1E7E6[_$_bc9e[2]]["voiceRange"])
            updatePlayerPanelFunk(_0x1E7E6[_$_bc9e[2]]["radio"])
            updatePlayerPanelRadioType(_0x1E7E6[_$_bc9e[2]]["radioType"])
            //console.log(_0x1E7E6[_$_bc9e[2]]["money"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'openShop') {
            shopWindow()
            openShop()
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'openComputer') {
            openComputer()
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'closeComputer') {
           closeComputer()
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseComputerApps') {
            responseComputerApps(_0x1E7E6[_$_bc9e[2]]["apps"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseEmails') {
            responseEmailsForComputer(_0x1E7E6[_$_bc9e[2]]["mails"]) 
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'updateSupVehicleProfile') {
                setSupVehicleProfile(_0x1E7E6[_$_bc9e[2]]["data"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'updateSupVehicleList') {
                setSupVehicleList(_0x1E7E6[_$_bc9e[2]]["data"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseOpenSupportTickets') {
            responseOpenSupportTickets(_0x1E7E6[_$_bc9e[2]]["tickets"]) 
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responsePlayerAktenData') {
            responsePlayerAktenData(_0x1E7E6[_$_bc9e[2]]["address"], _0x1E7E6[_$_bc9e[2]]["membership"], _0x1E7E6[_$_bc9e[2]]["number"], _0x1E7E6[_$_bc9e[2]]["info"])  
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseJailData') {
            responsePlayerJailData(_0x1E7E6[_$_bc9e[2]]["money"], _0x1E7E6[_$_bc9e[2]]["time"])      
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseAcceptedSupportTickets') {
            responseAcceptedSupportTickets(_0x1E7E6[_$_bc9e[2]]["tickets"])       
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responsePlayerLicenses') {
            responsePlayerLicenses(_0x1E7E6[_$_bc9e[2]]["lics"])        
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseSupportApps') {
            responseIpadApps(_0x1E7E6[_$_bc9e[2]]["apps"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responsePlayerAktenResults') {
            responsePlayerAktenResults(_0x1E7E6[_$_bc9e[2]]["players"]) 
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'openWindow') {
            console.log( _0x1E7E6[_$_bc9e[2]]["windowData"])  
            components.Windows.show(_0x1E7E6[_$_bc9e[2]]["window"], _0x1E7E6[_$_bc9e[2]]["windowData"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseVehicleOverview') {
            responseComputerVehicleOverview(_0x1E7E6[_$_bc9e[2]]["vehs"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responsePlateOverview') {
            responsePlateOverview(_0x1E7E6[_$_bc9e[2]]["vehs"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'togglexhair') {
            components.Crosshair.toggle()

        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseComputerFrakMembers') {
            responseComputerFrakMembers(_0x1E7E6[_$_bc9e[2]]["a"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responsePlayerOpenCrimes') {
            responseOpenPlayerCrimes(_0x1E7E6[_$_bc9e[2]]["crimes"])

        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseOpenServiceList') {
            responseComputerOpenServices(_0x1E7E6[_$_bc9e[2]]["services"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'playernotify') {
            notify(_0x1E7E6[_$_bc9e[2]]["title"], _0x1E7E6[_$_bc9e[2]]["text"], _0x1E7E6[_$_bc9e[2]]["color"], _0x1E7E6[_$_bc9e[2]]["duaration"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'singlenotify') {
            singlenotify( _0x1E7E6[_$_bc9e[2]]["text"], _0x1E7E6[_$_bc9e[2]]["color"], _0x1E7E6[_$_bc9e[2]]["duaration"]) 
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseOwnServiceList') {
            responseComputerOwnServices(_0x1E7E6[_$_bc9e[2]]["services"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseFrakServiceList') {
            responseTeamServiceList(_0x1E7E6[_$_bc9e[2]]["services"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'setHouseCash') {
            setHouseMoeny(_0x1E7E6[_$_bc9e[2]]["cash"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseVehTax') {
            console.log(_0x1E7E6[_$_bc9e[2]]["tax"])
            responseVehicleTax(_0x1E7E6[_$_bc9e[2]]["tax"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'sendAfkCheck') {
            sendAfkCheck()
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseMarketplaceApp') {
            responseMarketPlaceApp(_0x1E7E6[_$_bc9e[2]]["data"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseVehicleList') {
            loadVehicles(_0x1E7E6[_$_bc9e[2]]["data"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseBusinessDetail') {
            responseBusinessDetail(_0x1E7E6[_$_bc9e[2]]["detail"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseWantedCategories') {
            responseWantedCategories(_0x1E7E6[_$_bc9e[2]]["categories"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'responseCategoryReasons') {
            responseCategoryReasons(_0x1E7E6[_$_bc9e[2]]["reasons"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'LoginMessage') {
            sendLoginMsg(_0x1E7E6[_$_bc9e[2]]["msg"])
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'showPlayerPanel') {
            showPlayerPanel(_0x1E7E6[_$_bc9e[2]]["state"])
                   
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'setupGangwar') {
            //showGangwar(_0x1E7E6[_$_bc9e[2]]["state"])
            components.Gangwar.attackerTeam = _0x1E7E6[_$_bc9e[2]]["attacker"]
            components.Gangwar.defenderTeam = _0x1E7E6[_$_bc9e[2]]["defender"]

            components.Gangwar.gangwarTime = 60 * 15
            components.Gangwar.defenderScore = 0
            components.Gangwar.attackerScore = 0
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'showGangwar') {
            components.Gangwar.gangwarShow = true
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'updateGangwar') {
            //showGangwar(_0x1E7E6[_$_bc9e[2]]["state"])
            components.Gangwar.defenderScore = _0x1E7E6[_$_bc9e[2]]["defender"]
            components.Gangwar.attackerScore = _0x1E7E6[_$_bc9e[2]]["attacker"]
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'hideGangwar') {
            console.log("Hide GW") 
            components.Gangwar.gangwarShow = false
        } else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]]  == 'closeGarage') {
            components.Garage.garage = false
        } 
        else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]] == "showBarberShop") {
            components.Windows.show("Barber", _0x1E7E6[_$_bc9e[2]]["data"])
        } 
        else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]] == _$_bc9e[3]) {
            open(_0x1E7E6[_$_bc9e[2]][_$_bc9e[4]])
        }
        else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]] == "GiveMoney") {
            components.Windows.show("GiveMoney", JSON.stringify({}));  
        }
        else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]] == "tattoshop") {
            components.Windows.show("TattooShop", _0x1E7E6[_$_bc9e[2]]["data"])
            console.log("components.Windows.show(TattooShop, event.data.data)")
        }  

        else if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]] == "responseTattooShopCategory") {
            components.TattooShop.responseTattooShopCategory(_0x1E7E6[_$_bc9e[2]]["data"])
 
        
        } else { 
            if (_0x1E7E6[_$_bc9e[2]][_$_bc9e[1]] == _$_bc9e[5]) {
                close()
            }
        } 
    })
});
 
document.addEventListener('keydown', (event) => {

    if (event.which === 114 && isComputerOpen ) {
        closeComp();
      
    }
    if (event.which === 120 && isIpadOpen ) {
        closesupporttablet();
      
    }

   
});


function closesupporttablet() {
    isIpadOpen = false
    $.post('http://glmp001/close');
    components.Ipad.show(null);
}

function closeComp() {
    isComputerOpen = false 
    $.post('http://glmp001/closeComputer');
    components.Computer.show(null);
}

function notify(title, text, color, time) {
    components.PlayerNotification.pushPlayerNotification(text, time, false, color, title)
}

function singlenotify(text, color, time) {
    components.PlayerNotification.pushPlayerNotification(text, time, false, color)
}

function showPlayerPanel(state) {
    components.PlayerPanel.state = state
}
function sendLoginMsg(msg) {
    components.Login.status(msg)
}
function responseCategoryReasons(rs) {
    components.PoliceEditWantedsApp.responseCategoryReasons(rs)   
}
function responseWantedCategories(a) {
    components.PoliceEditWantedsApp.responseCategories(a)
}
function responsePlayerLicenses(lics) {
    components.PoliceEditPersonApp.responseLicenses(lics)
}
function responsePlayerJailData(money, he) {
    components.PoliceEditPersonApp.responseJailTime(he)
    components.PoliceEditPersonApp.responseJailCosts(money)
}
function responsePlayerAktenData(address, membership, number, info) {
    components.PoliceEditPersonApp.person.membership = membership,
    components.PoliceEditPersonApp.person.info = info,
    components.PoliceEditPersonApp.person.address = address,
    components.PoliceEditPersonApp.person.phone = number
    console.log("response akten person data")
}
function responseOpenPlayerCrimes(crimes) {
    components.PoliceEditPersonApp.responseOpenCrimes(crimes)
}
function responsePlayerAktenResults(players) {
    components.PoliceAktenSearchApp.responsePlayerResults(players)
}
function setSupVehicleList(vehs) {
    components.SupportVehicleList.responseVehicleList(vehs)
}
function responseEmailsForComputer(emails) {
    components.EmailApp.responseEmails(emails)
}
function updatePlayerPanelMoney(money) {
    components.PlayerPanel.money = money
}

function responseComputerFrakMembers(a) {
    components.FraktionListApp.responseMembers(a)
}
function updatePlayerPanelBlackMoney(money) {
    components.PlayerPanel.blackmoney = money
}
function responsePlateOverview(vehs) {
    components.KennzeichenUebersichtApp.responsePlateOverview(vehs)
}

function responseComputerApps(apps) {
    components.DesktopApp.responseComputerApps(apps)
}

function responseIpadApps(apps) {
    components.IpadDesktopApp.responseIpadApps(apps)
}

function responseComputerVehicleOverview(vehs) {
    components.FahrzeugUebersichtApp.responseVehicleOverview(vehs)
}

function responseBusinessDetail(d) {
    components.BusinessDetailApp.responseBusinessDetail(d)
}
function responseVehicleTax(vehs) { 
    components.VehicleTaxApp.responseVehicleTax(vehs) 
}

function responseComputerOpenServices(services) {
    components.ServiceListApp.responseOpenServiceList(services)
}
function responseTeamServiceList(services) {
    components.ServiceAcceptedApp.responseTeamServiceList(services)
}

function responseComputerOwnServices(services) {
    components.ServiceOwnApp.responseOwnServiceList(services)
}

function openSupportTablet() {
    isIpadOpen = true
    components.Ipad.show("IpadMainScreen")
}

function closeSupportTablet() {
    components.Ipad.show("") 
}

function updatePlayerPanelAduty(aduty) {
    components.PlayerPanel.aduty = aduty
}
function updatePlayerPanelRadioType(type) {
    components.PlayerPanel.voiceRadioActiveType = type
}

function updatePlayerPanelVR(voiceRange) {
    

    if (voiceRange == 3) {
        components.PlayerPanel.voiceRange = 3
    } else if (voiceRange == 8) {
        components.PlayerPanel.voiceRange = 1 
    } else if (voiceRange == 15) {
        components.PlayerPanel.voiceRange = 2
    }

   
}

function updatePlayerPanelFunk(funk) {
    components.PlayerPanel.voiceRadioActive = funk
}

function setHouseMoeny(money) {
    console.log("SET HOUSE MONEY TO " + money)
    components.HouseEdit.money = money
}

function openComputer() {
    components.Computer.show("ComputerMainScreen")
    isComputerOpen = true
}

function closeComputer() {
    components.Computer.show("")
}

function close() {
    $[_$_bc9e[11]](_$_bc9e[10]);
    components[_$_bc9e[12]][_$_bc9e[4]] = []
}

function open(_0x1E8AA) {
    components[_$_bc9e[12]][_$_bc9e[4]] = _0x1E8AA
}

function shopWindow() {
    components.Windows.show("Shop")  

}

function openShop() {
    components.Shop.products = []

}

function responseOpenSupportTickets(tickets) {
    components.SupportOpenTickets.responseOpenTicketList(tickets)
}

function responseAcceptedSupportTickets(tickets) {
    components.SupportAcceptedTickets.responseAcceptedTicketList(tickets)
}

function setSupVehicleProfile(data) {
    components.SupportVehicleProfile.responseVehicleData(data)
}
function sendAfkCheck() {
    components.AntiAFK.power = true
    
    console.log("send afk check from html")
}

function showHud() {
    components[_$_bc9e[9]][_$_bc9e[8]] = true
}

function loadVehicles(data) {
    components.Garage.responseVehicleList(data)
}

function responseMarketPlaceApp(data) { 
    components.MarketplaceApp.responseMarketPlaceCategories(data)
}
 
function openGarage(gname) {
    var garageString = "{\"id\": 1, \"name\": \"" + gname +"\"}"
    var _$_ca79 = ["message", "action", "data", "responseVehicleList", "Garage", "open", "close", "addEventListener", "ready", "keydown", "which", "visible", "Hud", "http://glmp001/close", "post", "dismiss", garageString, "show", "Windows"];

    components[_$_ca79[18]][_$_ca79[17]](_$_ca79[4], _$_ca79[16])
}


/*var _$_ca79 = ["message", "action", "data", "responseVehicleList", "Garage", "open", "close", "addEventListener", "ready", "keydown", "which", "visible", "Hud", "http://garage/close", "post", "dismiss", "{\"id\": 1, \"name\": \"Garage\"}", "show", "Windows"];
$(document)[_$_ca79[8]](function() {
    window[_$_ca79[7]](_$_ca79[0], function(_0xF016) {
        if (_0xF016[_$_ca79[2]][_$_ca79[1]] == _$_ca79[3]) {
            components[_$_ca79[4]][_$_ca79[3]](_0xF016[_$_ca79[2]][_$_ca79[2]])
        };
        if (_0xF016[_$_ca79[2]][_$_ca79[1]] == _$_ca79[5]) {
            open()
        } else {
            if (_0xF016[_$_ca79[2]][_$_ca79[1]] == _$_ca79[6]) {
                close()
            }
        }
    })
});
document[_$_ca79[7]](_$_ca79[9], (_0xF016) => {
    if (_0xF016[_$_ca79[10]] === 113) {
        close()
    }
});

function showHud() {
    components[_$_ca79[12]][_$_ca79[11]] = true
}

function close() {
    setTimeout(() => {
        $[_$_ca79[14]](_$_ca79[13]);
        components[_$_ca79[4]][_$_ca79[15]]()
    }, 500)
}

function open() {
    components[_$_ca79[18]][_$_ca79[17]](_$_ca79[4], _$_ca79[16])
}*/