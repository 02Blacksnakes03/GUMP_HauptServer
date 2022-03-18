var _$_19fb = ["message", "action", "data", "open", "close", "addEventListener", "ready", "keydown", "which", "visible", "Hud", "http://glmp003/close", "post", "dismiss", "Inventory", "show", "Windows"];
showHud();
$(document)[_$_19fb[6]](function() {
    window[_$_19fb[5]](_$_19fb[0], function(_0x114C1) {
        if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == _$_19fb[3]) {
            open(_0x114C1[_$_19fb[2]][_$_19fb[2]])
        } else {
            if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == _$_19fb[4]) {
                close()
            }
        }
        if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == "penis") {
            open2(_0x114C1.data.data)
        }
        if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == "playernotify") {
            notify(_0x114C1.data.title, _0x114C1.data.text, _0x114C1.data.color, _0x114C1.data.duaration)
        }
        if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == "singlenotify") {
            singlenotify(_0x114C1.data.text, _0x114C1.data.color, _0x114C1.data.duaration)
        }
        if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == "gnotify") {
            gnotify(_0x114C1.data.text, _0x114C1.data.time, _0x114C1.data.color, _0x114C1.data.icon)
        }
        if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == "open") {
       
            components.XMenu.dataItems = event.data.dataItems;
        } else {
            if (_0x114C1[_$_19fb[2]][_$_19fb[1]] == "close") {
                $.post('http://glmp003/close')
                components.XMenu.dataItems = []
            }
        }
    })
});

$(document).ready(function() {
    window.addEventListener("message", function(event) {
        

    })
});

function showHud() {
    components.Hud.visible = true
}
document[_$_19fb[5]](_$_19fb[7], (_0x114C1) => {
    if (_0x114C1[_$_19fb[8]] === 113) {
        close()
    }
});

function showHud() {
    components.Hud.visible = true
}

function close() {
    setTimeout(() => {
        $[_$_19fb[12]](_$_19fb[11]);
        components[_$_19fb[14]][_$_19fb[13]]()
    }, 500)
}

function open(_0x14306) {
    components[_$_19fb[16]][_$_19fb[15]](_$_19fb[14], _0x14306)
}

function open2(A) {
    components.Progressbar.setProgressbar(A)
}

function notify(title, text, color, time) {
    components.PlayerNotification.pushPlayerNotification(text, time, false, color, title)
}

function singlenotify(text, color, time) {
    components.PlayerNotification.pushPlayerNotification(text, time, false, color)
}

function gnotify(message, duaration, textcolor, icon, bgColor) {
    components.GlobalNotification.setGlobalNotification(message, duaration, textcolor, icon, bgColor)
}


//components.Windows.show("Death")