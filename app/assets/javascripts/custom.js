// 画面起票時１回だけリロードする
function _reload() {
    console.log("てすと");
    console.log(location.search);
    console.log(location.search.indexOf("1"));
        if ( location.search.indexOf("1") == -1 ) {
            location.href = location.href + "?1";
        }
    
}

// メッセージ画面をリロードする
function _messageReload() {
    if ((location.href.indexOf("message?") != -1) && (counter(location.href,"?1") != 1)) {
        location.href = location.href + "?1";
    }
    
}

// スクロールバーを一番下に移動する
function moveScrollbarToBottom() {
    var scrollbar = document.getElementById("Both-Field");
    scrollbar.scrollTop = scrollbar.scrollHeight;
}

// 特定の文字列の個数を返却する部品
function counter(str,seq) {
    return str.split(seq).length -1;
}

function _submit() {
    var userAge = calculateAge(document.getElementById("user_birthday").value);
    var age = document.getElementById("user_age");
    age.value = userAge
}

// 年齢計算
function calculateAge(birthday) {
    var birthdayDelmit = birthday.substr(0,4) + "/" + birthday.substr(4,2) + "/" + birthday.substr(6,2);
    var birth = birthdayDelmit.split('/');
    var _birth = parseInt("" + birth[0] + birth[1] + birth[2]);
    var today = new Date();
    var _today = parseInt("" + today.getFullYear() + affixZero(today.getMonth() + 1) + affixZero(today.getDate()));
    return parseInt((_today - _birth) / 10000);
}

function affixZero(int) {
    if (int < 10)int = "0" + int;
        return "" + int;
}

// メールアドレス公開/非公開

function public_change() {
    var email_publish = document.getElementById("user_email_publish");
    var labelObj = document.getElementById("private_email");
    if (email_publish.value == 0) {
        email_publish.value = 1;
        labelObj.innerHTML = "メールアドレス公開";
    }
    else {
        email_publish.value = 0;
        labelObj.innerHTML = "メールアドレス非公開";
    }
}

// 性別 男性/女性

function change_Man() {
    var sex = document.getElementById("user_sex");
    sex.value = 0;
    document.getElementById("checkboxLady").checked = false;
}

function change_Lady() {
    var sex = document.getElementById("user_sex");
    sex.value = 1;
    document.getElementById("checkboxMan").checked = false;
}

// 地域選択

function changeArea() {
    var area = document.getElementById("user_area");
    var area_Selector = document.getElementById("area_serector").value;
    area.value = area_Selector;
}

function set_area_value() {
    var area = document.getElementById("user_area").value;
    var area_Selector = document.getElementById("area_serector");
    area_Selector.value = area;
}

// 棋力選択
function changeKiryoku() {
    var kiryoku = document.getElementById("user_kiryoku");
    var kiryoku_Selector = document.getElementById("kiryoku_serector").value;
    kiryoku.value = kiryoku_Selector;
}

function set_kiryoku_value() {
    var kiryoku = document.getElementById("user_kiryoku").value;
    var kiryoku_Selector = document.getElementById("kiryoku_serector");
    kiryoku_Selector.value = kiryoku;
}

// 年齢選択
function changeAge() {
    var age = document.getElementById("user_age");
    var age_Selector = document.getElementById("age_serector").value;
    age.value = age_Selector;
}

function set_age_value() {
    var age = document.getElementById("user_age").value;
    var age_Selector = document.getElementById("age_serector");
    age_Selector.value = age;
}

// メッセージパートナの選択

function selectPartner(id) {
    // パートナーのIDをhiddenに埋め込む
    var partner_user_id = document.getElementById("user_id2");
    partner_user_id.value = document.getElementById(id);
}