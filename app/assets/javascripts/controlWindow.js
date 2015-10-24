$(document).ready(function(){
    $('.infoContainer-display').hide();
})

function moveScrollbar() {
    if($('#newMsgTable__newArrvlPoint').length){
        if($("#scroll").val() == "scroll") {
            moveScrollbarToNewArrvl();
            alert("")
        }
        if($("#scroll").val() == "scrollOnly") {
            moveScrollbarToBottom();
        }
    }
    else {
        moveScrollbarToBottom();
    }
}

function highlightForFriendli() {
    // highlight talking friend field
    if(document.getElementById("talking_friend_id") != null) {
        var talkingFriendId = document.getElementById('talking_friend_id').value;
        var taikingFriendListId = document.getElementById(talkingFriendId);
        taikingFriendListId.style.backgroundColor = "#fff59d";
    }
    highlightFieldForHover('.partner-list','.friend-container');
    getAnchorOnClick('.partner-list','.friend-container');    
}

function highlightForNewMsg() {
    highlightFieldForHover('.newMsgLine','.newArrvlList');
    getAnchorOnClick('.newMsgLine','.newArrvlList');
}

function highlightForNotification() {
    highlightFieldForHover('.newMsgLine','.infoMsgList');
    getDetailMsgOnClick('.newMsgLine','.infoMsgList');
}

function moveScrollbarToNewArrvl() {
    var scrollbar = document.getElementById("messageContainer");
    $(scrollbar).animate({scrollTop:$('#newMsgTable__newArrvlPoint').offset().top - 200});
    $("#scroll").val('scrollOnly');    
}

function moveScrollbarToBottom() {
    var scrollbar = document.getElementById("messageContainer");
    scrollbar.scrollTop = scrollbar.scrollHeight;    
}

function highlightFieldForHover(targetElm,parentElm) {
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

function getDetailMsgOnClick(targetElm,parentElm) {
    $(parentElm).on('click',targetElm,function(){
        $('.infoContainer-display').show();
        var notificateId = $(this).find("input").eq(0).attr("value");
        outputNotification(notificateId);
    })
}