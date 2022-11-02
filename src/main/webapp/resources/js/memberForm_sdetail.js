
/*변수 선언*/


var id = document.querySelector('#id');

var pw1 = document.querySelector('#pswd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');

var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var userName = document.querySelector('#name');

var yy = document.querySelector('#yy');
var mm = document.querySelector('#mm');
var dd = document.querySelector('#dd');

var gender = document.querySelector('#gender');

var mobile = document.querySelector('#mobile');

var bizReg = document.querySelector('#bizReg');

var local = document.querySelector('#local');

var business = document.querySelector('#business');

var error = document.querySelectorAll('.error_next_box');

var key1 = document.querySelector('#key1');
var key2 = document.querySelector('#key2');
var key3 = document.querySelector('#key3');



/*이벤트 핸들러 연결*/


id.addEventListener("focusout", checkId);
pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);
userName.addEventListener("focusout", checkName);
yy.addEventListener("focusout", isBirthCompleted);
mm.addEventListener("focusout", isBirthCompleted);
dd.addEventListener("focusout", isBirthCompleted);
gender.addEventListener("focusout", function() {
    if(gender.value === "성별") {
        error[5].style.display = "block";
    } else {
        error[5].style.display = "none";
    }
})

mobile.addEventListener("focusout", checkPhoneNum);

bizReg.addEventListener("focusout", checkbizReg);

local.addEventListener("focusout", isLocalSelected);
business.addEventListener("focusout", isLocalSelected);

key1.addEventListener("focusout", iskeyCompleted);
key2.addEventListener("focusout", iskeyCompleted);
key3.addEventListener("focusout", iskeyCompleted);











/*콜백 함수*/


function checkId() {
    var idPattern = /^[a-z0-9]{5,20}$/;
    if(id.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
    } else if(!idPattern.test(id.value)) {
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자만 사용 가능합니다.";
        error[0].style.display = "block";
    } else {
        error[0].style.display = "none";
    }
}

function checkPw() {
    var pwPattern = /^(?=.*[a-z])(?=.*\d)(?=.*[$@$!%*#?&])[a-z\d$@$!%*#?&]{8,16}$/;
    if(pw1.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    } else if(!pwPattern.test(pw1.value)) {
        error[1].innerHTML =  "8~16자 영문 소문자, 숫자, 특수문자를 조합하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
       
        pwMsg.style.display = "block";
        pwImg1.src = "../image/m_icon_not_use.png";
         error[1].style.display = "block";
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "../image/m_icon_safe.png";
    }
}

function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "../image/m_icon_check_enable.png";
        error[2].style.display = "none";
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "../image/m_icon_check_disable.png";
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    } 

    if(pw2.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    }
}

function checkName() {
    var namePattern = /^[a-zA-Z가-힣]{2,15}$/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "2~15자의 한글과 영문 대 소문자만 사용하세요.";
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}


function isBirthCompleted() {
    var yearPattern = /[0-9]{4}/;

    if(!yearPattern.test(yy.value)) {
        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
        error[4].style.display = "block";
    } else {
        isMonthSelected();
    }


    function isMonthSelected() {
        if(mm.value === "월") {
            error[4].innerHTML = "태어난 월을 선택하세요.";
        } else {
            isDateCompleted();
        }
    }

    function isDateCompleted() {
        if(dd.value === "") {
            error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
        } else {
            isBirthRight();
        }
    }
}



function isBirthRight() {
    var datePattern = /\d{1,2}/;
    if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
    } else {
        checkAge();
    }
}

function checkAge() {
    if(Number(yy.value) < 1920) {
        error[4].innerHTML = "정말이세요?";
        error[4].style.display = "block";
    } else if(Number(yy.value) > 2023) {
        error[4].innerHTML = "미래에서 오셨군요. ^^";
        error[4].style.display = "block";
    } else if(Number(yy.value) > 2008) {
        error[4].innerHTML = "만 14세 미만의 어린이는 보호자 동의가 필요합니다.";
        error[4].style.display = "block";
    } else {
        error[4].style.display = "none";
    }
}


function checkPhoneNum() {
    var isPhoneNum = /^01(?:0|1|[6-9])(?:\d{4})\d{4}$/;
	/*[01] = 둘중하나만있어도 true , {2} = [01]문자중 하나가 2번 반복되었는지 
	{3,4} = [0-9]사이가 3~4회 반복되었는지*/
	
    if(mobile.value === "") {
        error[6].innerHTML = "필수 정보입니다.";
        error[6].style.display = "block";
    } else if(!isPhoneNum.test(mobile.value )) {
        error[6].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[6].style.display = "block";
    } else {
        error[6].style.display = "none";
    }
}


function checkbizReg() {
	
	var valueMap =/([0-9]{3})([0-9]{2})([0-9]{5})/;

      if(bizReg.value === "") {
        error[7].innerHTML = "필수 정보입니다.";
        error[7].style.display = "block";
    } else if(!valueMap.test(bizReg.value)) {
        error[7].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[7].style.display = "block";
    } else {
        error[7].style.display = "none";
    }
}

function isLocalSelected() {

    if(local.value === "위치") {
        error[8].innerHTML = "필수 정보입니다.";
        error[8].style.display = "block";
    } else {
        isbusinessSelected();
    }


    function isbusinessSelected() {
        if(business.value === "업종") {
            error[8].innerHTML = "업종을 선택해주세요.";
        } else {
            error[8].style.display="none";
        }
    }
}


function iskeyCompleted() {
		
	 var keyPattern = /[a-zA-Z가-힣]/;
    if(key1.value === "") {
    error[9].style.color = "red";
        error[9].innerHTML = "필수 정보입니다.";
        error[9].style.display = "block";
    } else if(!keyPattern.test(key1.value) || key1.value.indexOf(" ") > -1) {
    	error[9].style.color = "red";
        error[9].innerHTML = "한글과 영문 대 소문자를 사용하세요(특수기호, 공백 사용불가)";
    } else {
        iskey2Completed();
    }
    
    function iskey2Completed() {
        if(key2.value === "") {
        	error[9].style.color = "green";
            error[9].innerHTML = "키워드가 많을수록 검색에 유리해집니다(선택)";
        } else {
            iskey3Completed();
        }
    }

    function iskey3Completed() {
        if(key3.value === "") {
        error[9].style.color = "green";
            error[9].innerHTML = "키워드가 많을수록 검색에 유리해집니다(선택)";
        } else {
            error[9].style.display ="none";
        }
    }
}




/*
2월 : 윤년에는 29일까지, 평년에는 28일까지.
1,3,5,7, 8,10,12 -> 31일
2,4,6, 9,11 -> 30일

    var days31 = [1, 3, 5, 7, 8, 10, 12];
    var days30 = [4, 6, 9, 11];

    if(mm.value )

var sel = document.getElementById("sel");
var val = sel.options[sel.selectedIndex].value;

var id = document.querySelector('#id');
var pw1 = document.querySelector('#pswd1');
var pw2 = document.querySelector('#pswd2');
var yourName = document.querySelector('#name');
var yy = document.querySelector('#yy');
var mm = document.querySelector('#mm');
var dd = document.querySelector('#dd');
var email = document.querySelector('#email');
var mobile = document.querySelector('#mobile');
var error = document.querySelectorAll('.error_next_box');

var pattern_num = /[0-9]/;
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;


id.onchange = checkId;
pw1.onchange = checkPw;
pw2.onchange = comparePw;
yourName.onchange = checkName;
yy.onchange = checkYear;


function checkId() {
    if(id.value === "") {
        error[0].style.display = "block";
    } else if(id.value.length < 5 || id.value.length > 20){
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.display = "block";
    }
}

function checkPw() {
    if(pw1.value === "") {
        error[1].style.display = "block";
    } else if (pw1.value.length < 8 || pw1.value.length > 16) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        error[1].style.display = "block";
    }
}

function comparePw() {
    if(pw2.value === "") {
        error[2].style.display = "block";
    } else if (pw2.value !== pw1.value) {
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    }
}

function checkName() {
    if( yourName.value.indexOf(" ") >= 0 || pattern_spc.test(yourName.value) || pattern_num.test(yourName.value) ) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
    } else if(yourName.value.length === 0) {
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}

function checkYear() {
    isBirthEntered();
    if(yy.value.length !== 4 || !pattern_num.test(yy.value)) {
        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
    } else if (parseInt(yy.value) < 1920) {
        error[4].innerHTML = "정말이세요?";
        error[4].style.display = "block";
    }

}

function isBirthEntered() {
    
}

function checkEmail() {
    
}

function checkNumber() {
    

}
*/