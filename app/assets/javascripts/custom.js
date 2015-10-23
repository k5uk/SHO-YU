// 登録確定ボタン 
function pressFormSubmit() {
    var age = document.getElementById("user_age");
    age.value = calculateAge(document.getElementById("user_birthday").value);
}

function setFieldAttribute() {
    
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
    
    $(document).on('focus click', '.age-label', function(){
        var area = document.getElementById("user_age");
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

function reload() {
    if (window.name != "reloadFlag") {
        location.reload();
        window.name = "reloadFlag";
    }
    else {
        window.name = "notReload";   
    }
}

function moveScrollbar() {
    if($('#newArraivalPoint').length){
        if($("#scroll").val() == "scroll") {
            moveScrollbarToNewArrvl();
        }
        if($("#scroll").val() == "scrollOnly") {
            moveScrollbarToBottom();
        }
    }
    else {
        moveScrollbarToBottom();
    }
}

function moveScrollbarToNewArrvl() {
    var scrollbar = document.getElementById("messageContainer");
    $(scrollbar).animate({scrollTop:$('#newArraivalPoint').offset().top - 200});
    $("#scroll").val('scrollOnly');    
}

function moveScrollbarToBottom() {
    var scrollbar = document.getElementById("messageContainer");
    scrollbar.scrollTop = scrollbar.scrollHeight;    
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

function setPublication() {
    var emailPublish = document.getElementById("user_email_publish");
    var labelObj = document.getElementById("private_email");
    if (emailPublish.value == 0) {
        emailPublish.value = 1;
        labelObj.innerHTML = "メールアドレス公開";
    }
    else {
        emailPublish.value = 0;
        labelObj.innerHTML = "メールアドレス非公開";
    }
}

// 地域選択

function setArea() {
    setValue("area_serector", document.getElementById("user_area").value);
}

function changeArea() {
    setValue("user_area", document.getElementById("area_serector").value);
}

// 棋力選択
function setKiryoku() {
    setValue("kiryoku_serector", document.getElementById("user_kiryoku").value);
}

function changeKiryoku() {
    setValue("user_kiryoku", document.getElementById("kiryoku_serector").value);
}

// 年齢選択
function changeAge() {
    setValue("user_age", document.getElementById("age_serector").value);
}

function setAge() {
    setValue("age_serector", document.getElementById("user_age").value);
}

// 年連選択（問い合わせ）
function changeContactAgeValue() {
    setValue("contact_age", document.getElementById("contact_age_serector").value);
}

function setContactAgeValue() {
    setValue("contact_age_serector", document.getElementById("contact_age").value);
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

function outputMessage(id,message,speaker) {
    // 行の追加
    var table = document.getElementById(id);
    var row = table.insertRow(-1);
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    
    // 値の挿入
    var nowDateTime = formatDate(new Date(),'YYYY/MM/DD hh:mm');
    if(speaker == 'User') {
        setCellValue(cell1,"user-timestamp-cell",nowDateTime);
        setCellValue(cell2,"user-message-cell",message);
    }
    else {
        setCellValue(cell3,"friend-message-cell",message);
        setCellValue(cell4,"friend-timestamp-cell",nowDateTime);        
    }
    // スクロールバー移動
    moveScrollbar();
}

function setCellValue(cell,clsName,value) {
    cell.className = clsName;
    var divide = document.createElement('div');
    divide.innerHTML = value;
    if(clsName == "user-message-cell") {
        divide.className = "msg-baroon-left";    
    }
    else if(clsName == "friend-message-cell") {
        divide.className = "msg-baroon-right";  
    }
    cell.appendChild(divide);
}


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

// 35文字ごとに改行を入れる
function addBreakLine() {
    var message = document.getElementById("message_text");
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

function highlightMessage(targetElm,parentElm) {
    $(parentElm).on('mouseenter',targetElm,function(){
	    $(this).addClass("hover")
    });

    $(parentElm).on('mouseleave',targetElm,function(){
        if ($(this).hasClass("hover")) { 
            $(this).removeClass("hover") 
        }
    });    
}

function getAnchorOnClick(targetElm,parentElm) {
    $(parentElm).on('click',targetElm,function(){
        location.href = $(this).find("a").eq(0).attr("href");
    });
}

function highlightForNewMsg() {
    highlightMessage('.newMsgLine','.infoContainer-message');
    getAnchorOnClick('.newMsgLine','.infoContainer-message');
}

function highlightForFriendli() {
    if(document.getElementById("talking_friend_id") != null) {
        var talkingFriendId = document.getElementById('talking_friend_id').value;
        var taikingFriendListId = document.getElementById(talkingFriendId);
        taikingFriendListId.style.backgroundColor = "#fff59d";
    }
    
    highlightMessage('.partner-list','.friend-container');
    getAnchorOnClick('.partner-list','.friend-container');    
}

function highlightForNotification() {
    highlightMessage('newMsgLine','.notification-area');
    getAnchorOnClick('newMsgLine','.notification-area');
    
    // 新着情報を画面に出力する
    $('.notification-area').on('click','.newMsgLine',function(){
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
    var subjectItem = document.getElementById('display__title--subjectItem');
    var speakerItem = document.getElementById('display__message--speakerItem');
    var timestampItem = document.getElementById('display__message--timeStampItem');
    var messageItem = document.getElementById('display__message--messageItem');
    speakerItem.innerHTML = speaker;
    subjectItem.innerHTML = subject;
    timestampItem.innerHTML = timestamp;
    messageItem.innerHTML = message;
}

// 30文字以内だったら...を表示する
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

function setFieldAttribForContact() {
    $(document).on('focus click', '.age-label', function(){
        var area = document.getElementById("contact_age");
        var func = "this.blur();";
        area.setAttribute('onFocus',func);
    });   
}

// updateFlagという名前のイベント生成
(function($) {
    $.each(['updateFlag'],function(i,ev) {
        var el = $.fn[ev];
        $.fn[ev] = function () {
            this.trigger(ev);
            return el.apply(this, arguments);
        };
    });
})(jQuery);

$(function(){
    $(window).scroll(function(){
        $('.newMsgLine').each(function(){
            var read_flag = $(this).children('input').eq(0).val()   // [0]:read_flag
            var messageId = $(this).children('input').eq(1).val()   // [1]:messageId
            if(read_flag == 0){ 
                var msgHeight = $(this).offset().top; // メッセージ要素の位置
                var scroll = $(window).scrollTop();   // ユーザーがスクロールした量
                var windowHeight = $(window).height();  // ウィンドウの高さ
                if (scroll > msgHeight - windowHeight + 10 ) { //ユーザーがメッセージの位置に来たか判定
                    //イベント追加呼出
                    updateMessageFlag(messageId);
                    $(this).css("background","#fffde7");
                };   
            }
        });
    });
});

// フラグ値更新ajax
function updateMessageFlag(messageId) {
    $.ajax({
        url: "messages/read_session",
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify(messageId),
        success: function(msg,status) {
            // 成功時処理
        }
    })
}

//機能系関数(プロジェクト機能外 つまり汎用関数)

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

// 受け取ったkeyにvalueをセットする
// [0]key [1]value
// return obj
function setValue(key,val) {
    var targetObj = document.getElementById(key);
    targetObj.value = val;
    return targetObj;
}
