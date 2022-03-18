
var isPhoneOpen = false
var showIdCard = false
showHud();

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        //components.IdCard.perso = false;
        if (event.data.action == 'showPhone') {
            showPhone();
            isPhoneOpen = true
        }
        if (event.data.action == 'responsePhoneCalls') {
            components.TelefonCalls.responsePhoneCalls(event.data.calls)
        }
        if (event.data.action == 'hideCallManage') {
            components.CallManageApp.cancelCall('[]'), components.HomeApp.declineCall(), components.Smartphone.change(), + components.Smartphone.show(PhoneMainScreen), isincall = nein
        }
        if (event.data.action == "openWindow") {
            console.log(event.data.window)
            console.log(event.data.windowData)
            components.Windows.show(event.data.window, event.data.windowData)
        }
        if (event.data.action == "SCHWARZEMENSCHEN") {
            components.Windows.show("EjectWindow", event.data.data)
        }
        if (event.data.action == "responseWallpaper") {
            components.HomeApp.responsePhoneWallpaper(event.data.url);
        }
        if (event.data.action == "responseTeamMembers") {
            components.TeamListApp.responseTeamMembers(event.data.data);
        }
        if (event.data.action == "responseNews") {
            components.NewsListApp.updateNews(event.data.data)
        }
        if (event.data.action == "receiveCall") {
            components.Smartphone.show("CallManageApp");
            setTimeout(function() {components.CallManageApp.setCallData(event.data.data, 1, false)}, 200);
        }
        if (event.data.action == "test") { 
            components.Smartphone.show("CallManageApp");
            setTimeout(function() {components.CallManageApp.setCallData(event.data.data, 1, false);}, 1000);
        }
        if (event.data.action == 'responsePhoneWallpaper') {
            components.HomeApp.responsePhoneWallpaper(event.data.wallpaper);
        }
        if (event.data.action == "updateOverview") {
            components.MessengerOverviewApp.myphone = event.data.data;
        } 
        if (event.data.action == "responseBusinessMotd") {
            components.BusinessListApp.responseBusinessMOTD(event.data.motd)
        }
        if (event.data.action == "responseBusinessMembers") {
            components.BusinessListApp.responseBusinessMembers(event.data.members)
        }
        if (event.data.action == "callAcceptedS") {
            components.CallManageApp.acceptCall()
        }
        if (event.data.action == "responsePhoneSettings") {

            components.SettingsApp.responsePhoneSettings(JSON.stringify({
                flugmodusStatus: event.data.flugmodus,
                lautlosStatus: event.data.lautlos,
                anrufAblehnen: event.data.anrufeablehnen
            }));
        }
        if (event.data.action == "responseVehicleGps") {
            components.GpsApp.gpsLocationsResponse(event.data.data)
        }
        if (event.data.action == 'responseWallpaperList') {
            components.SettingsEditWallpaperApp.responseWallpaperList(JSON.stringify({
                silentv: {
                    id: 'https://cdn.discordapp.com/attachments/855764806967754783/875460813132025916/staudamm.429092e6.jpg',
                    file: 'https://cdn.discordapp.com/attachments/855764806967754783/875460813132025916/staudamm.429092e6.jpg',
                    name: 'Berg'
                },
                army: {
                    id: 'https://i.imgur.com/heO7CYP.png',
                    file: 'https://i.imgur.com/heO7CYP.png',
                    name: 'Army'    
                },
                ballas: {
                    id: 'https://i.imgur.com/8u7OC0b.png',
                    file: 'https://i.imgur.com/8u7OC0b.png',
                    name: 'Ballas'
                },
                bratwa: {
                    id: 'https://i.imgur.com/OLdLskn.png',
                    file: 'https://i.imgur.com/OLdLskn.png',
                    name: 'Bratwa'
                },
                ballas: {
                    id: 'https://i.imgur.com/8u7OC0b.png',
                    file: 'https://i.imgur.com/8u7OC0b.png',
                    name: 'Ballas'
                },
                brigada: {
                    id: 'https://i.imgur.com/m4y0WKC.png',
                    file: 'https://i.imgur.com/m4y0WKC.png',
                    name: 'Brigada'
                },
                dpos: {
                    id: 'https://i.imgur.com/04oQ7j4.png',
                    file: 'https://i.imgur.com/04oQ7j4.png',
                    name: 'DPOS'
                },
                fahrschule: {
                    id: 'https://i.imgur.com/Dz8PH6u.png',
                    file: 'https://i.imgur.com/Dz8PH6u.png',
                    name: 'Fahrschule'
                },
                fib: {
                    id: 'https://i.imgur.com/R8OJiU5.png',
                    file: 'https://i.imgur.com/R8OJiU5.png',
                    name: 'FBI'
                },
                vagos: {
                    id: 'https://cdn.discordapp.com/attachments/877903807491743754/877906276317794304/Vagos.6aac918d.png',
                    file: 'https://cdn.discordapp.com/attachments/877903807491743754/877906276317794304/Vagos.6aac918d.png',
                    name: 'Vagos'
                },
                lcn: {
                    id: 'https://i.imgur.com/qGeyOE8.png',
                    file: 'https://i.imgur.com/qGeyOE8.png',
                    name: 'LCN'
                },
                lsc: {
                    id: 'https://i.imgur.com/dIoAWFA.jpg',
                    file: 'https://i.imgur.com/dIoAWFA.jpg',
                    name: 'LSC'
                },
                md: {
                    id: 'https://i.imgur.com/JcKQaHG.png',
                    file: 'https://i.imgur.com/JcKQaHG.png',
                    name: 'MD'
                },
                mg: {
                    id: 'https://i.imgur.com/HRwvH3v.png',
                    file: 'https://i.imgur.com/HRwvH3v.png',
                    name: 'MG13'
                },
                pier: {
                    id: 'https://i.imgur.com/vLKtJDq.jpg',
                    file: 'https://i.imgur.com/vLKtJDq.jpg',
                    name: 'Pier'
                },
                pferd: {
                    id: 'https://i.imgur.com/GpcBRrd.jpg',
                    file: 'https://i.imgur.com/GpcBRrd.jpg',
                    name: 'Pferd'
                },
				lord: {
                    id: 'https://cdn.discordapp.com/attachments/867503597477953536/880935880204894208/milakunis.87ddf809.gif',
                    file: 'https://cdn.discordapp.com/attachments/867503597477953536/880935880204894208/milakunis.87ddf809.gif',
                    name: 'Feuerlord'
                },
				fastcitycl: {
                    id: 'https://cdn.discordapp.com/attachments/867503597477953536/881001544579973161/Download.gif',
                    file: 'https://cdn.discordapp.com/attachments/867503597477953536/881001544579973161/Download.gif',
                    name: ''
                },
				jackistgeil: {
                    id: 'https://cdn.discordapp.com/attachments/867503597477953536/880935877608611910/bubblebutt.684890cc.gif',
                    file: 'https://cdn.discordapp.com/attachments/867503597477953536/880935877608611910/bubblebutt.684890cc.gif',
                    name: 'Bubblebutt'
                },
            }));
        }
//        if (event.data.action == 'responseRingtoneList') {
//            components.SettingsEditRingtonesApp.responseRingtoneList(JSON.stringify([
//                {
//                    id: 1,
 //                   name: "XTentacion",
 //                   link: "https://cdn.discordapp.com/attachments/841781443302260787/855115650670264330/xtentacion.ogg"
  //               },
    //             {
      //              id: 2,
        //            name: "Iphone 11",
          //          link: "https://cdn.discordapp.com/attachments/841781443302260787/855115651819896942/iphone_11.ogg"
            //     },
              //   {
                //    id: 3,
//                    name: "Bella Ciao",
  //                  link: "https://cdn.discordapp.com/attachments/841781443302260787/855117719371382794/bella_ciao.ogg"
    //             },
      //           {
        //            id: 4,
          //          name: "Astronomia",
            //        link: "https://cdn.discordapp.com/attachments/841781443302260787/855117721242042368/ring.ogg"
              //   }
           // ]));
   //     }

        if (event.data.action == 'responseContacts') {
            // components.ContactsApp.setContactListData(event.data.contacts);
            components.ContactsApp.setContactListData(JSON.stringify({
                number: data.number,
                name: data.name,
            }))
            components.ContactsApp.setContactListData(JSON.stringify({
                number: data.number,
                name: data.name,
            }))
        }
        if (event.data.action == 'getHomeScreen') {
            components.Smartphone.show("HomeApp");

        }

        if (event.data.action == 'responseProfil') {
            data = event.data
            components.ProfileApp.setProfileData(event.data.data);
        }
        if (event.data.action == "openLifeinvader") {
            components.Windows.show("LifeInvader", '[]');
        }

        if (event.data.action == 'addContact') {
            var data = event.data.data;
            components.ContactsApp.addContact(JSON.stringify({
                name: data.name,
                number: data.number
            }));
        } //
        if (event.data.action == "setGPS") {
            components.MessengerOverviewApp.setGPSdata(event.data.x, event.data.y);
        }
        if (event.data.action == 'updateLifeInvaderAds') {
            components.LifeInvaderApp.updateLifeInvaderAds(event.data.data);
        }

        if (event.data.action == "setContactListData") {
            components.ContactsApp.setContactListData(event.data.data);
        }

        if (event.data.action == "pushMsg") {
            components.MessengerOverviewApp.updateChat(event.data.data);
        }
        if (event.data.action == "pushPlayerNotification") {
            components.PlayerNotification.pushPlayerNotification(event.data.msg, event.data.duration, event.data.stumm, event.data.color, event.data.title, "rgba(51, 51, 51, 0.7)")
        }
        if (event.data.action == "updateCurContact") {
            components.ContactsOverview.contactName = event.data.name;
            components.ContactsOverview.contactNumber = event.data.nummer;
        }
        if (event.data.action == 'responseKonversations') {
            components.MessengerListApp.responseKonversations(event.data.data);
        }
        if (event.data.action == "setKonversationen") {
            components.MessengerListApp.responseKonversations(event.data.data);
        }
        if (event.data.action == 'gpsLocationsResponse') {
            components.GpsApp.gpsLocationsResponse(event.data.gpsPositions);
        }
        if (event.data.action == "bankingAppTransfer") {
            components.BankAppTransfer.bankingmaxcap = 1000000;
        }
        if (event.data.action == "updateBankOverview") {
            components.BankAppOverview.responseBankAppOverview(event.data.balance, event.data.history);
        }
        if (event.data.action == 'responseApps') {
            var lastapps = event.data.apps;
            components.HomeApp.responseApps(event.data.apps);
        }
        if (event.data.action == 'responseTaxiList') {
            components.TaxiListApp.responseTaxiList(event.data.taxiList);
        }
        if (event.data.action == 'responseTaxiServiceList') {
            components.TaxiServiceListApp.responseServiceList(event.data.isInTaxiService, event.data.taxiServiceList);
        }
        if (event.data.action == 'updateTaxiApp') {
            components.TaxiServiceListApp.responseServiceList(event.data.isInTaxiService, event.data.taxiServiceList);
        }

        if (event.data.action == 'showLic') {
            //components.TaxiServiceListApp.responseServiceList(event.data.isInTaxiService, event.data.taxiServiceList);
            components.Licenses.showLic(event.data.A, event.data.B, event.data.g, event.data.V, event.data.Q, event.data.E, event.data.I, event.data.q, event.data.C, event.data.i, event.data.M, event.data.U, event.data.o)
        }

        if (event.data.action == 'showCarHud') {
            components.VehiclePanel.activeTacho = true
        }

        if (event.data.action == 'hideCarHud') {
            components.VehiclePanel.activeTacho = false
        }

        if (event.data.action == 'carHudsetFuel') {
            components.VehiclePanel.fuel = event.data.fuel
        }
        if (event.data.action == 'carHudtoggleEndinge') {
            components.VehiclePanel.engine = event.data.engine
        }

        if (event.data.action == 'carHudsetLock') {
            components.VehiclePanel.lock = event.data.locked
        }

        if (event.data.action == 'carHudSetMileage') {
            components.VehiclePanel.mileage = event.data.mileage
        }

        if (event.data.action == 'carHudSetSpeed') {
            components.VehiclePanel.speed = event.data.speed
        }

        if (event.data.action == 'showIdCard') {
            if(event.data.test == 'zeigen') {
                showIdCard = true
                showIdCard1(event.data.firstName, event.data.lastName, event.data.birthday, event.data.house, event.data.level, event.data.casino, event.data.gov)
            }
        }

        if (event.data.action == 'showDutyCard') {
            if(event.data.test == 'zeigen') { 
                components.IdCard.updateDutyCard(event.data.fraktion, event.data.rank, event.data.dienstnummer)
            } 
        }

        if (event.data.action == "pushPlayerNotification") {
            components.PlayerNotification.pushPlayerNotification(event.data.msg, event.data.duration, event.data.stumm, event.data.color, event.data.title, "rgba(51, 51, 51, 0.7)")
        } 
        if (event.data.action == "updateNutrition") {
            components.Nutrition.responseNutrition(event.data.data)
        }
        if (event.data.action == "responseAduty") {
            components.PlayerPanel.aduty = event.data.aduty;
        }
        if (event.data.action == "responseMoney") {
            components.PlayerPanel.money = event.data.money
        }
        if (event.data.action == "responseVoiceRange") {
            components.PlayerPanel.voiceRange = event.data.voiceRange;
        }
        if (event.data.action == "responseRadioRange") {
            components.PlayerPanel.voiceRadio = event.data.radio;
            if (parseInt(event.data.radio) > 0) { 
                components.PlayerPanel.voiceRadioActive = true;
            } else {
                components.PlayerPanel.voiceRadioActive = false;
            }
        }
        if (event.data.action == "openClothingShop") {
            components.Windows.show("ClothingShop", event.data.data)
        }
        if (event.data.action == "responseWardrobeClothes") {
            components.Wardrobe.responseWardrobeClothes(event.data.data);
        }
        if (event.data.action == "openWardrobe") {
            components.Windows.show("Wardrobe", event.data.data)
            setTimeout(function() {
                components.Wardrobe.slots = [
                    { Id: 1, Name: 'Masken' },
                    { Id: 4, Name: 'Hosen' },
                    { Id: 6, Name: 'Schuhe' },
                    { Id: 7, Name: 'Accessories' },
                    { Id: 8, Name: 'Unterbekleidung' },
                    { Id: 11, Name: 'Oberbekleidung' },
    
                    // Props  
                    
                    { Id: 69, Name: 'Arm' },
                    { Id: 'p-0', Name: 'Hut' },
                    { Id: 'p-1', Name: 'Brille' },
                    { Id: 'p-2', Name: 'Ohr' },
                    { Id: 'p-6', Name: 'Uhr' },
                ]
            }, 100)
    
        }
        if (event.data.action == "responseClothingShopCategories") {
            console.log("load catego")
            components.ClothingShop.responseClothingShopCategories(event.data.data)
            console.log(event.data.data)
        }
        if (event.data.action == "responseClothingShopClothes") {
            components.ClothingShop.responseClothingShopClothes(event.data.data)
        }
        
        
    })
});


$(document).on('click', '#pacs-call', function() {
    var number = $('#pacs-call').data('number');;
    var element = document.getElementById("phone-call-outgoing-caller");
    element.innerHTML = number;
    CloseAll();
    $(".phone-call-app").show();
    $(".phone-call-outgoing").fadeIn(250);

    if (mutes == true) {
        sendData("notification", { text: locale.yourecallingsb, length: 5000 })
    } else {
        if (outgoingsound != null) {
            outgoingsound.pause();
        }

        outgoingsound = new Audio("./sound/Phonecall.ogg");
        outgoingsound.volume = 0.2;
        outgoingsound.currentTime = 0;
        outgoingsound.loop = true;
        outgoingsound.play();
    }
    sendData("startcall", { number: number });
});


let callnumber
var outgoingsound = null;
var messagesound = null;
var bmessagesound = null;
var incomingsound = null;
var mutes = false;

$(document).on('click', '.phone-enter', function() {
    let number = $(this).data('id');

    var element = document.getElementById("phone-number-enter");
    element.innerHTML = element.innerHTML + number;

    $("#phone-enter-deletelast").fadeIn(250);
});


$(document).on('click', '#phone-enter-deletelast', function() {
    let number = $(this).data('id');

    $("#phone-number-enter").html($("#phone-number-enter").text().replace(/.$/g, ''));

    if ($('#phone-number-enter').text().trim() === "") {
        $("#phone-enter-deletelast").fadeOut(250);
    }
});


$(document).on('click', '.phone-enter-call', function() {
    callnumber = $('#phone-number-enter').val()
    var number = document.getElementById("phone-number-enter");
    var element = document.getElementById("phone-call-outgoing-caller");
    element.innerHTML = number.innerHTML;
    $(".phone-call").hide();
    $(".phone-call-app").show();
    $(".phone-call-outgoing").fadeIn(250);

    if (mutes == true) {
        sendData("notification", { text: locale.yourecallingsb, length: 5000 })
    } else {
        if (outgoingsound != null) {
            outgoingsound.pause();
        }

        outgoingsound = new Audio("./sound/Phonecall.ogg");
        outgoingsound.volume = 0.2;
        outgoingsound.currentTime = 0;
        outgoingsound.loop = true;
        outgoingsound.play();
    }
    sendData("startcall", { number: callnumber });
});


$(document).on('click', '#outgoing-cancel', function() {
    $(".phone-call").fadeIn(250);
    $(".phone-call-app").hide();
    $(".phone-call-outgoing").hide();
    sendData("stopcall")
    outgoingsound.pause();
});

function IncomingCall(number, contact) {
    CloseAll();
    $(".phone-call-app").show();
    $(".phone-call-incoming").fadeIn();

    var element = document.getElementById("phone-call-incoming-caller");
    element.innerHTML = contact;

    if (mutes == true) {
        sendData("notification", { text: locale.somebodyiscallingyou, length: 5000 })
    } else {

        incomingsound = null

        if (incomingsound != null) {
            incomingsound.pause();
        }

        incomingsound = new Audio("./sound/ring.ogg");
        incomingsound.volume = 0.2;
        incomingsound.currentTime = 0;
        incomingsound.loop = true;
        incomingsound.play();
    }
}

$(document).on('click', '#incoming-answer', function() {
    sendData("acceptcall")

});

$(document).on('click', '#incoming-deny', function() {
    $(".phone-applications").fadeIn(250);
    $(".phone-call-app").hide();
    $(".phone-call-incoming").hide();

    sendData("declinecall")
    incomingsound.pause();
});


let incall = false
let Timer

function AcceptCall(number, contact) {
    $(".phone-call-outgoing").hide();
    $(".phone-call-incoming").hide();
    $(".phone-call-app").show();
    $(".phone-call-ongoing").fadeIn(250);
    if (outgoingsound != null) {
        outgoingsound.pause();
    };
    if (incomingsound != null) {
        incomingsound.pause()
    };
    incall = true

    var element = document.getElementById("phone-call-ongoing-caller");
    element.innerHTML = contact;

    let seconds = 0
    let minutes = 0

    Timer = setInterval(() => {
        if (seconds == 60) {
            minutes = minutes + 1
            seconds = 0
        } else {
            seconds = seconds + 1
        }

        var element = document.getElementById("phone-call-ongoing-time");
        if (seconds < 10) {
            if (minutes < 10) {
                element.innerHTML = '0' + minutes + ':0' + seconds;
            } else {
                element.innerHTML = minutes + ':0' + seconds;
            }
        } else {
            if (minutes < 10) {
                element.innerHTML = '0' + minutes + ':' + seconds;
            } else {
                element.innerHTML = minutes + ':' + seconds;
            }
        }
    }, 1000);
}

$(document).on('click', '#ongoing-cancel', function() {
    clearInterval(Timer);
    sendData("endcall")
});


function EndCall() {
    CloseAll();
    $(".phone-applications").fadeIn(250);

    incall = false
}

function DeclineCall() {
    CloseAll();
    $(".phone-applications").fadeIn(250);
    sendData("stopcall")

    if (outgoingsound != null) {
        outgoingsound.pause();
    };
    if (incomingsound != null) {
        incomingsound.pause()
    };
}

function StopCall() {
    CloseAll();
    $(".phone-applications").fadeIn(250);

    if (outgoingsound != null) {
        outgoingsound.pause();
    };
    if (incomingsound != null) {
        incomingsound.pause()
    };
}

$(document).on('click', '#pcb-numpad', function() {
    $(".phone-all-call-sector").hide();
    $(".phone-call-sector").fadeIn(250);
});

$(document).on('click', '#pcb-calls', function() {
    sendData("loadrecentcalls")
});

$(document).on('click', '#pacs-call', function() {
    var number = $('#pacs-call').data('number');;
    var element = document.getElementById("phone-call-outgoing-caller");
    element.innerHTML = number;
    CloseAll();
    $(".phone-call-app").show();
    $(".phone-call-outgoing").fadeIn(250);

    if (mutes == true) {
        sendData("notification", { text: locale.yourecallingsb, length: 5000 })
    } else {
        if (outgoingsound != null) {
            outgoingsound.pause();
        }

        outgoingsound = new Audio("./sound/Phonecall.ogg");
        outgoingsound.volume = 0.2;
        outgoingsound.currentTime = 0;
        outgoingsound.loop = true;
        outgoingsound.play();
    }
    sendData("startcall", { number: number });
});

$(document).on('click', '#pacs-message', function() {
    var number = $('#pacs-call').data('number');;

    sendData("loadmessage", {
        number: number
    });
    selectednumber = number;
    lastcontact = 'message'
});

function loadrecentcalls(html) {
    $(".phone-all-call-sector").children().detach();
    $(".phone-all-call-sector").append(html);

    $(".phone-call-sector").hide();
    $(".phone-all-call-sector").fadeIn(250);
}

document.addEventListener('keydown', (event) => {
    if (event.which === 112 && isPhoneOpen) {
        closePhone();
    }
});

function closePhone() {
    isPhoneOpen = false
    $.post('http://glmp002/close');
    components.Smartphone.dismiss();
}

function showHud() {
    components.Hud.visible = true
}

function showPhone() {
    components.Smartphone.show("PhoneMainScreen");
}

function antiAFK() {
    components.AntiAFK.setAFK();
}

function showIdCard1(A, B, g, V, Q, E, I) {
    if(showIdCard == true) {
        //components.IdCard.perso = true;
        components.IdCard.updatePerso(A, B, g, V, Q, E, I, 0);
    }
}


if (event.data.action == "setCallData") {
    components.HomeApp.call = true;
    components.Smartphone.show("CallManageApp");
    obj = JSON.parse(event.data.data);
    if (obj.name == undefined) {
        obj.name = null
    }
    setTimeout(function() {components.CallManageApp.setCallData(JSON.stringify(obj), event.data.ringtone, event.data.stumm)}, 100);
}
if (event.data.action == "responseRingtoneList") {
    components.SettingsEditRingtonesApp.responseRingtoneList(event.data.data);
}