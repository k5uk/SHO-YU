function outputMessage(id,message,speaker) {
    // add row
    var table = document.getElementById(id);
    var row = table.insertRow(-1);
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    
    // insert value in row
    var nowDateTime = formatDate(new Date(),'YYYY/MM/DD hh:mm');
    if(speaker == 'User') {
        setCellValue(cell1,"nowMsgLine__userTimeCell",nowDateTime);
        setCellValue(cell2,"nowMsgLine__userMsgCell",message);
    }
    else {
        setCellValue(cell3,"nowMsgLine__friendMsgCell",message);
        setCellValue(cell4,"nowMsgLine__friendTimeCell",nowDateTime);        
    }
    // move scroll bar
    moveScrollbar();
}

// 新着情報を画面に出力する
function outputNotification(notificateId) {
    var speaker = document.getElementById("speaker_info" + notificateId ).value;
    var subject = document.getElementById("subject_info" + notificateId ).value;
    var message = document.getElementById("message_info" + notificateId).value;
    var timestamp = document.getElementById("timestamp_info" + notificateId).value;
    outputDisplay(speaker, subject, message, timestamp);
}

// scrollして未読メッセージが現れる度に既読フラグを更新する
$(function(){
    $(window).scroll(function(){
        "//@ sourceURL=dynamicScript.js;"
        $('.newMsgLine').each(function(){
            var read_flag = $(this).children('input').eq(0).val()   // [0]:read_flag
            var messageId = $(this).children('input').eq(1).val()   // [1]:messageId
            if(read_flag == 0){ 
                var msgHeight = $(this).offset().top; // メッセージ要素の位置
                var scroll = $(window).scrollTop();   // ユーザーがスクロールした量
                var windowHeight = $(window).height();  // ウィンドウの高さ
                if (scroll > msgHeight - windowHeight + 10 ) { //ユーザーがメッセージの位置に来たか判定
                    updateMessageFlag(messageId);
                    $(this).css("background","#fffde7");
                };   
            }
        });
    });
});

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

// 新着情報メッセージの詳細表示
function outputDisplay(speaker,subject,message,timestamp) {
    var subjectItem = document.getElementById('display__title--subjectItem');
    var speakerItem = document.getElementById('display__message--speakerItem');
    var timestampItem = document.getElementById('display__message--timeStampItem');
    var messageItem = document.getElementById('display__message--messageItem');
    speakerItem.innerHTML = speaker;
    subjectItem.innerHTML = subject;
    messageItem.innerHTML = message;
    timestampItem.innerHTML = timestamp;
}

// break line for each 30 number of characters
function addBreakLine() {
    var message = document.getElementById("message_text");
    var messageVal = message.value;
    var addReturnMessage = ""; //
    var addMessage = "";       //文字列追加用メッセージ
    var fromIndex = 0;
    var toIndex = 29;
    var addBrCount = Math.floor(messageVal.length / 30);
    
    if(!(message % 30 == 0 )) {
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
        fromIndex += 30;
        toIndex += 30;
    }
}

function setCellValue(cell,clsName,value) {
    cell.className = clsName;
    var divide = document.createElement('div');
    divide.innerHTML = value;
    if(clsName == "nowMsgLine__userMsgCell") {
        divide.className = "msg-baroon-left";    
    }
    else if(clsName == "nowMsgLine__friendMsgCell") {
        divide.className = "msg-baroon-right";  
    }
    cell.appendChild(divide);
}