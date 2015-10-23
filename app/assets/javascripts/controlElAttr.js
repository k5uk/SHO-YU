window.onload = function setFieldAttribute() {
    
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