// 未使用 マッピングファイル作成後使用する
// setFieldAttribute()の共通化予定関数
function setFieldAttributeForFoucus(targetElm) {
    $(document).on('focus click', targetElm, function(){
        var element = ""; //ここで外部マッピングファイルから対応のエレメントを返す
        document.getElementById(element);
        var func = "this.blur();";
        element.setAttribute('onFocus',func);
    });
}