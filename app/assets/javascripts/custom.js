// 画面起票時リロードする
function _reload() {
    if ( location.search.indexOf("1") == -1 ) {
    location.href = location.href + "?1";
    }
}

function _submit(){
    var userAge = calculateAge(document.getElementById("user_birthday").value);
    var age = document.getElementById("user_age");
    age.value = userAge
    alert("Hello world");
    console.log("Hello world");
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

function set_kiryoku_value() {
    var kiryoku = document.getElementById("user_kiryoku").value;
    var kiryoku_Selector = document.getElementById("kiryoku_serector");
    kiryoku_Selector.value = kiryoku;
}

// 棋力選択

function changeKiryoku() {
    var kiryoku = document.getElementById("user_kiryoku");
    var kiryoku_Selector = document.getElementById("kiryoku_serector").value;
    kiryoku.value = kiryoku_Selector;
}

