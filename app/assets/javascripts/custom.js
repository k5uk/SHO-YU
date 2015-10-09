function readyAction() {
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
function fromSubmit() {
    // 年齢のセット
    settingAge();
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

// 暫定メソッド
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

// ランダムな文字列を生成する
function makeRundomStr() {
    var strLength = 50;
    var pattern = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var patternLength = pattern.length;
    var returnStr = "";
    for(var i=0; i<strLength; i++) {
        returnStr += pattern[Math.floor(Math.random()*patternLength)];
    }
    return returnStr;
}

// 文字列に改行を入れる
function addBr() {
    var message = document.getElementById("message_text"); //40
    var messageVal = message.value;
    var addReturnMessage = ""; //最終的なリターンメッセージ
    var addMessage = "";       //文字列追加用メッセージ
    var fromIndex = 0;
    var toIndex = 34;
    var addBrCount = Math.floor(messageVal.length / 35); 
    if(!(message % 35 == 0 )) {
        addBrCount += 1
    }
    
    for(var i = 1 ; i <= addBrCount ; i++) {
        
        if (addBrCount == i) {
            addMessage = messageVal.substring(fromIndex,messageVal.length);
            message.value = addReturnMessage + addMessage;
        }
        addMessage = messageVal.substring(fromIndex,toIndex);
        addMessage += "\n";
        addReturnMessage += addMessage
        fromIndex += 35;
        toIndex += 35;
    }
}

function highlight_messagelist() {
    $('.message-area').on('mouseenter','.newArraivalMessages',function(){
	    $(this).addClass("hover")
    });

    $('.message-area').on('mouseleave','.newArraivalMessages',function(){
        if ($(this).hasClass("hover")) { 
            $(this).removeClass("hover") 
        }
    });
    
    $('.message-area').on('click','.newArraivalMessages',function(){
        location.href = $(this).find("a").eq(0).attr("href");
    });
}

function highlight_friendlist() {
    
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

function highlight_notificationList() {
    $('.notification-area').on('mouseenter','.newArraivalMessages',function(){
	    $(this).addClass("hover")
    });

    $('.notification-area').on('mouseleave','.newArraivalMessages',function(){
        if ($(this).hasClass("hover")) { 
            $(this).removeClass("hover") 
        }
    });

    $('.notification-area').on('click','.newArraivalMessages',function(){
        var notificationId = $(this).find("input").eq(0).attr("value");
        var speaker = document.getElementById("speaker_info" + notificationId ).value;
        var subject = document.getElementById("subject_info" + notificationId ).value;
        var message = document.getElementById("message_info" + notificationId).value;
        var timestamp = document.getElementById("timestamp_info" + notificationId).value;
        outputDisplay(speaker, subject, message, timestamp);
    });
    
}

// 進捗情報メッセージを表示する
function outputDisplay(speaker,subject,message,timestamp) {
    var speaker_item = document.getElementById('speaker-item');
    speaker_item.innerHTML = speaker;
    var subject_item = document.getElementById('subject-item');
    subject_item.innerHTML = subject;
    var timestamp_item = document.getElementById('timestamp-item');
    timestamp_item.innerHTML = timestamp;
    var message_item = document.getElementById('message-item');
    message_item.innerHTML = message;
}

function trimMessage() {
    var $setElm = $('.messageInfo');
    var cutFigure = '30';
    var afterTxt = ' …';
    
    $setElm.each(function(){
        var textLength = $(this).text().length;
        var textTrim = $(this).text().substr(0,(cutFigure))
 
        if(cutFigure < textLength) {
            $(this).html(textTrim + afterTxt).css({visibility:'visible'});
        } else if(cutFigure >= textLength) {
            $(this).css({visibility:'visible'});
        }
    });
}

function setFieldElement() {
    
    $(document).on('focus click', '.area-label', function(){
        var area = document.getElementById("user_area");
        var func = "this.blur();";
        area.setAttribute('onFocus',func);
    });

    $(document).on('focus click', '.kiryoku-label', function(){
        var area = document.getElementById("user_kiryoku");
        var func = "this.blur();";
        area.setAttribute('onFocus',func);
    });    

    $(document).on('focus click', '.birthday-label', function(){
        var area = document.getElementById("user_birthday");
        var func = "addSlash(this)";
        area.setAttribute('onkeyup',func);
        area.setAttribute('maxlength',10);
    });   

}

function setElementForContact() {
    $(document).on('focus click', '.age-label', function(){
        var area = document.getElementById("contact_age");
        var func = "this.blur();";
        area.setAttribute('onFocus',func);
    });   
}