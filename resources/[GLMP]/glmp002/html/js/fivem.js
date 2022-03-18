function fiveMtrigger(event, ...args) {
    if (event == "componentReady") {
        if (args[1] == "ContactsApp") {
            $.post("https://glmp002/loadContacts")
        }
    };
    if (event == "") {
        setTimeout(() => {
            $.post('https://glmp002/close')
        }, 500)
    };
    $.post("http://glmp002/trigger", JSON.stringify({
        event: event,
        args: args
    }))
}