function _reload() {
    if ( location.search.indexOf("1") == -1 ) {
    location.href = location.href + "?1";
    }
}