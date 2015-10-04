function readyAction() {
    editCheck();
    _reload();
}

// 画面起票時１回だけリロードする
function _reload() {
    if (window.name != "reloadFlag") {
        location.reload();
        window.name = "reloadFlag";
    }
    else {
        window.name = "notReload";   
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

// 登録確定ボタン 
function newSubmit() {
    // 年齢のセット
    settingAge();
}

// 変更確定ボタン
function editSubmit() {
    settingAge();
    window.name = "editFlag"
}

// 変更後にアラートを表示する
function editCheck() {
    if (window.name == "editFlag") {
        alert("プロフィールを更新しました");
        window.name = "alreadyOutput";
    }
}


// 年齢の設定
function settingAge() {
    var userAge = calculateAge(document.getElementById("user_birthday").value);
    var age = document.getElementById("user_age");
    age.value = userAge    
}

// 年齢計算
function calculateAge(birthday) {
    var birth = birthday.split('/');
    var _birth = parseInt("" + birth[0] + birth[1] + birth[2]);
    var today = new Date();
    var _today = parseInt("" + today.getFullYear() + affixZero(today.getMonth() + 1) + affixZero(today.getDate()));
    return parseInt((_today - _birth) / 10000);
}

function affixZero(int) {
    if (int < 10)int = "0" + int;
        return "" + int;
}

// 日付自動スラッシュ挿入
function addSlash(birthday) {
    textLength = birthday.value.length;
    if((textLength == 5)||(textLength == 8)) {
        var textAfter = birthday.value.substr(-1 , 1);
        if (textAfter != '/') {
            birthday.value = birthday.value.substr(0,textLength -1 ) + '/' + textAfter;
        }
    }
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

// 年連選択（問い合わせ）
function change_contact_age_value() {
    var age = document.getElementById("contact_age");
    var age_Selector = document.getElementById("contact_age_serector").value;
    age.value = age_Selector;
}

function set_contact_age_value() {
    var age = document.getElementById("contact_age").value;
    var age_Selector = document.getElementById("contact_age_serector");
    age_Selector.value = age;
}

// メッセージパートナの選択

function selectPartner(id) {
    // パートナーのIDをhiddenに埋め込む
    var partner_user_id = document.getElementById("user_id2");
    partner_user_id.value = document.getElementById(id);
}

// チェックボックスの制御

function controlCheckMan() {
    var sex = document.getElementById("user_sex");
    sex.value = 1;
    var checkboxLady = document.getElementById("checkboxLady_label");
    checkboxLady.className = "mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-upgraded"
}

function controlCheckLady() {
    var sex = document.getElementById("user_sex");
    sex.value = 2;
    var checkboxMan = document.getElementById("checkboxMan_label");
    checkboxMan.className = "mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-upgraded"
}

// 行の追加
function insertRow(id,message,speaker) {
    var table = document.getElementById(id);
    var row = table.insertRow(-1);
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    var row_len = table.rows.length;
    
    var nowDateTime = formatDate(new Date(),'YYYY/MM/DD hh:mm');
    
    if(speaker == 'User') {
        cell1.className = "user-timestamp-cell";
        var messagediv1 = document.createElement('div');
        messagediv1.innerHTML = nowDateTime;
        cell1.appendChild(messagediv1);

        cell2.className = "user-message-cell";
        var messagediv2 = document.createElement('div');
        messagediv2.innerHTML = message;
        messagediv2.className = "msg-baroon-left";
        cell2.appendChild(messagediv2);
    }
    
    else {
        cell3.className = "friend-message-cell";
        var messagediv3 = document.createElement('div');
        messagediv3.innerHTML = message;
        messagediv3.className = "msg-baroon-right";
        cell3.appendChild(messagediv3);

        cell4.className = "friend-timestamp-cell";
        var messagediv4 = document.createElement('div');
        messagediv4.innerHTML = nowDateTime;
        cell4.appendChild(messagediv4);
    }
    
    moveScrollbarToBottom();
}

// 日付の書式を置換する
function formatDate(date, format) {
  if (!format) format = 'YYYY-MM-DD hh:mm:ss.SSS';
  format = format.replace(/YYYY/g, date.getFullYear());
  format = format.replace(/MM/g, ('0' + (date.getMonth() + 1)).slice(-2));
  format = format.replace(/DD/g, ('0' + date.getDate()).slice(-2));
  format = format.replace(/hh/g, ('0' + date.getHours()).slice(-2));
  format = format.replace(/mm/g, ('0' + date.getMinutes()).slice(-2));
  format = format.replace(/ss/g, ('0' + date.getSeconds()).slice(-2));
  if (format.match(/S/g)) {
    var milliSeconds = ('00' + date.getMilliseconds()).slice(-3);
    var length = format.match(/S/g).length;
    for (var i = 0; i < length; i++) format = format.replace(/S/, milliSeconds.substring(i, i + 1));
  }
  return format;
};

function highlight() {
    
    if(document.getElementById("talking_friend_id") != null) {
        
        var talking_friend_id = document.getElementById('talking_friend_id').value;
        var taiking_friend_li_id = document.getElementById(talking_friend_id);
        taiking_friend_li_id.style.backgroundColor = "#fff59d";
    }

    
    $('.Friend-Field').on('mouseenter','.partner',function(){
	    $(this).addClass("hover")
    });

    $('.Friend-Field').on('mouseleave','.partner',function(){
        if ($(this).hasClass("hover")) { 
            $(this).removeClass("hover") 
        }
    });
    
    $('.Friend-Field').on('click','.partner',function(){
        location.href = $(this).find("a").eq(0).attr("href");
    });
    
}
