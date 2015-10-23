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

function highlightForNewMsg() {
    highlightFieldForHover('.newMsgLine','.infoContainer-message');
    getAnchorOnClick('.newMsgLine','.infoContainer-message');
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

function highlightForNotification() {
    highlightFieldForHover('newMsgLine','.notification-area');
    getAnchorOnClick('newMsgLine','.notification-area');
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