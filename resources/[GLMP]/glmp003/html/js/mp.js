var _$_67d8 = ["componentReady", "onWindowClosed", "http://glmp003/close", "post", "http://glmp003/trigger", "stringify"];

function fiveMtrigger(_0x114C1, ..._0x142EF) {
    if (_0x114C1 == _$_67d8[0]) {
        return
    };
    if (_0x114C1 == _$_67d8[1]) {
        setTimeout(() => {
            $[_$_67d8[3]](_$_67d8[2])
        }, 500)
    };
    $[_$_67d8[3]](_$_67d8[4], JSON[_$_67d8[5]]({
        event: _0x114C1,
        args: _0x142EF
    }))
}