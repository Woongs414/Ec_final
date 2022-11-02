
/*변수 선언*/


var id = document.querySelector('#id');
var nick = document.querySelector('#nick');
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

var email = document.querySelector('#email');

var mobile = document.querySelector('#mobile');

var error = document.querySelectorAll('.error_next_box');

     idSignal = false;
	 nickSignal = false;
	 pswd1Signal = false;
	 pswd2Signal = false;
	 nameSignal = false;
	 birth_yySignal = false;
	 birth_mmSignal = false;
	 birth_ddSignal = false;
	 genderSignal = false;
	 emailSignal = false;
	 mobileSignal = false;
	 
	 idSignal2 = false;
	 nickSignal2 = false;
	 emailSignal2 = false;
	 mobileSignal2 = false;
	

/*이벤트 핸들러 연결*/


id.addEventListener("focusout", checkId);
nick.addEventListener("focusout", checkNick);
pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);
userName.addEventListener("focusout", checkName);
yy.addEventListener("focusout", isBirthCompleted);
mm.addEventListener("focusout", isMonthSelected);
dd.addEventListener("focusout", isDateCompleted);
gender.addEventListener("focusout", function() {
    if(gender.value === "성별") {
        error[6].style.display = "block";
         genderSignal = false;
    } else {
        error[6].style.display = "none";
         genderSignal = true;
    }
})
email.addEventListener("focusout", isEmailCorrect);
mobile.addEventListener("focusout", checkPhoneNum);





/*콜백 함수*/


function checkId() {
    var idPattern = /^[a-z0-9]{5,20}$/;
    if(id.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
        idSignal = false;
        
    } else if(!idPattern.test(id.value)) {
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자만 사용 가능합니다.";
        error[0].style.display = "block";
        idSignal = false;
    } else {
        error[0].style.display = "none";
        idSignal = true;
    }
}

function checkNick() {
    var nickPattern = /^[a-zA-Z0-9가-힣]{2,15}$/;
    if(nick.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
        nickSignal = false;
    } else if(!nickPattern.test(nick.value)) {
        error[1].innerHTML = "한글과 영문 대소문자, 숫자만 사용하세요. (특수기호, 공백 사용 불가)";
        error[1].style.display = "block";
        nickSignal = false;
    } else {
        error[1].style.display = "none";
        nickSignal = true;
    }
}

function checkPw() {
    var pwPattern = /^(?=.*[a-z])(?=.*\d)(?=.*[$@$!%*#?&])[a-z\d$@$!%*#?&]{8,16}$/;
    if(pw1.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
        pswd1Signal = false;
    } else if(!pwPattern.test(pw1.value)) {
        error[2].innerHTML = "8~16자 영문 소문자, 숫자, 특수문자를 조합하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
       
        pwMsg.style.display = "block";
        pwImg1.src = "../image/m_icon_not_use.png";
         error[2].style.display = "block";
        pswd1Signal = false;
    } else {
        error[2].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "../image/m_icon_safe.png";
         pswd1Signal = true;
    }
}

function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "../image/m_icon_check_enable.png";
        error[3].style.display = "none";
         pswd2Signal = true;
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "../image/m_icon_check_disable.png";
        error[3].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[3].style.display = "block";
         pswd2Signal = false;
    } 

    if(pw2.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
         pswd2Signal = false;
    }
}

function checkName() {
    var namePattern = /^[a-zA-Z가-힣]{2,15}$/;
    if(userName.value === "") {
        error[4].innerHTML = "필수 정보입니다.";
        error[4].style.display = "block";
         nameSignal = false;
    } else if(!namePattern.test(userName.value)) {
        error[4].innerHTML = "2~15자의 한글과 영문 대 소문자만 사용하세요.";
        error[4].style.display = "block";
         nameSignal = false;
    } else {
        error[4].style.display = "none";
         nameSignal = true;
    }
}


function isBirthCompleted() {
    var yearPattern =  /^(19|20)\d{2}$/;

    if(!yearPattern.test(yy.value)) {
  
        error[5].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
        error[5].style.display = "block";
         birth_yySignal = false;
    } else {
    
    error[5].style.display ="none";
    birth_yySignal = true;
    
         
    }
    }


    function isMonthSelected() {
    
        if(mm.value == "월") {
            error[5].innerHTML = "태어난 월을 선택하세요.";
             error[5].style.display ="block";
            	 birth_mmSignal = false;
            	 
        } else {
       
        error[5].style.display ="none";
         birth_mmSignal = true;
       
            	
        }
    }

    function isDateCompleted() {
    var ddPattern = /^(0[1-9]|[12][0-9]|3[01])$/;
        if(!ddPattern.test(dd.value)) {
       
            error[5].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
            error[5].style.display ="block";
            birth_ddSignal = false;
        } else {
        
        error[5].style.display ="none";
        birth_ddSignal = true;
        
            
        }
    }


/*
function isBirthRight() {
    if(Number(dd.value)<1||Number(dd.value)>=32) {
    	console.log("Number(dd.value)::"+Number(dd.value));
        error[5].innerHTML = "생년월일을 다시 확인해주세요.";
         error[5].style.display ="block";
        birth_ddSignal = false;
    } else {
    console.log("Number(dd.value)::"+Number(dd.value));
    birth_ddSignal = true;
    error[5].style.display ="none";
       
    	}
	}

*/


function isEmailCorrect() {
    var emailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    if(email.value == ""){ 
    console.log("7");
    	error[7].innerHTML = "필수 정보입니다.";
        error[7].style.display = "block"; 
        emailSignal = false;
    } else if(!emailPattern.test(email.value)) {
     console.log("8");
     	error[7].innerHTML = "이메일 형식을 확인해주세요.";
        error[7].style.display = "block";
        emailSignal = false;
    } else {
     console.log("9");
    emailSignal = true;
        error[7].style.display = "none"; 
    }

}
    

function checkPhoneNum() {
    var isPhoneNum = /^01(?:0|1|[6-9])(?:\d{4})\d{4}$/;
	/*[01] = 둘중하나만있어도 true , {2} = [01]문자중 하나가 2번 반복되었는지 
	{3,4} = [0-9]사이가 3~4회 반복되었는지*/
	
    if(mobile.value === "") {
        error[8].innerHTML = "필수 정보입니다.";
        error[8].style.display = "block";
        mobileSignal = false;
    } else if(!isPhoneNum.test(mobile.value)) {
        error[8].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[8].style.display = "block";
        mobileSignal = false;
    } else {
    mobileSignal = true;
        error[8].style.display = "none";
    }

    
}


