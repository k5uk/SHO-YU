function reload() {
    if (window.name != "alreadyReload") {
        location.reload();
        window.name = "alreadyReload";
    }
    else {
        window.name = "notReload";   
    }
}