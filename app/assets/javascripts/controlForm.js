// on press submit of input form
function pressFormSubmit() {
    var age = document.getElementById("user_age");
    age.value = calculateAge(document.getElementById("user_birthday").value);
}

// add slash of birthday
function addSlash(birthday) {
    var textLength = birthday.value.length;
    if((textLength == 5)||(textLength == 8)) {
        var textAfter = birthday.value.substr(-1 , 1);
        if (textAfter != '/') {
            birthday.value = birthday.value.substr(0,textLength -1 ) + '/' + textAfter;
        }
    }
}

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

function setArea() {
    setValue("area_serector", document.getElementById("user_area").value);
}

function changeArea() {
    setValue("user_area", document.getElementById("area_serector").value);
}

function setKiryoku() {
    setValue("kiryoku_serector", document.getElementById("user_kiryoku").value);
}

function changeKiryoku() {
    setValue("user_kiryoku", document.getElementById("kiryoku_serector").value);
}

function changeAge() {
    setValue("user_age", document.getElementById("age_serector").value);
}

function setAge() {
    setValue("age_serector", document.getElementById("user_age").value);
}

function changeContactAgeValue() {
    setValue("contact_age", document.getElementById("contact_age_serector").value);
}

function setContactAgeValue() {
    setValue("contact_age_serector", document.getElementById("contact_age").value);
}

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

function setValue(key,val) {
    var targetObj = document.getElementById(key);
    targetObj.value = val;
    return targetObj;
}