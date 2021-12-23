
// 이메일 정규표현식
function checkEmail() {
	
	var e_RegExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
	var email = $("#email").val();
	
	if (!e_RegExp.test(email))
	{
		$("#emailErrMsg").html("이메일 형식이 올바르지 않습니다.");
		$("#emailErrMsg").css("color", "red");
		return false;
	}
	
	return true;
	
}

