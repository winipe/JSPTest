function loginCheck() {
	if (document.login.id.value.length == 0) {
		alert("아이디를 입력하세요");
		document.login.id.focus();
		return false;
	}
	if (document.login.password.value.length == 0) {
		alert("비밀번호를 입력하세요");
		document.login.password.focus();
		return false;
	}

	return true;
}

function joinCheck() {
	if (document.join.id.value.length == 0) {
		alert("아이디를 입력하세요");
		document.join.id.focus();
		return false;
	}
	
	if (document.join.name.value.length == 0) {
		alert("이름을 입력하세요");
		document.join.name.focus();
		return false;
	}
	
	if (document.join.email.value.length == 0) {
		alert("이메일을 입력하세요");
		document.join.email.focus();
		return false;
	}
	
	if (document.join.password.value.length == 0) {
		alert("비밀번호를 입력하세요");
		document.join.password.focus();
		return false;
	}
	
	return true;
}