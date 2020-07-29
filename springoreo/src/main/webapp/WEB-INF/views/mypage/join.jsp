<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<script>
	function inputCheck() {
		var name = document.frm.name.value;
		if (name == "") {
			alert("이름을 입력하세요.");
			return false;
		}
		var id = document.frm.id.value;
		if (id == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		var password = document.frm.password.value;
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		var pwdcheck = document.frm.pwdcheck.value;
		if (pwdcheck == "") {
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}
		var phonenumber = document.frm.phonenumber.value;
		if (phonenumber == "") {
			alert("전화번호를 입력하세요.");
			return false;
		}
		var emailid = document.frm.emailid.value;
		if (emailid == "") {
			alert("이메일을 입력하세요.");
			return false;
		}
		var emailaddr = document.frm.emailaddr.value;
		if (emailaddr == "") {
			alert("이메일을 입력하세요.");
			return false;
		}
		return true;
	}
</script>
<style>

.c_name {
	float: left;
	display: inline-block;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 50px;
}

.cust_b {
	margin-top: 20px;
	float: display:inline-block;
}

.cust_a {
	float: display:inline-block;
	margin-top: 9px;
}

.cust_c {
	margin-top: 30px;
	margin-right: 41px;
	float: right;
}

.cust_d {
	margin-top: 30px;
	margin-right: 10px;
	float: right;
}

.page {
	position: center;
	width: 550px;
	text-align: left;
	border: 3px solid gray;
	padding: 10px;
	height: 330px;
}

input[type=text] {
	background-color: lightgray;
	border: 3px solid gray;
	border-radius: 7px;
	border: none;
	color: black;
	height: 30px;
}

input[type=password] {
	background-color: lightgray;
	border: 3px solid gray;
	border-radius: 7px;
	border: none;
	color: black;
	height: 30px;
}

.oreo {
	margin-top: 100px;
}
</style>
</head>
<body>
	
		<center>
			<div class="oreo">
				<h2>회원가입</h2>
				<div class="page">
					<div class="c_name">
						*이름 <br> <br> *아이디 <br> <br> *비밀번호 <br> <br>
						*비밀번호 확인<br> <br> *전화번호<br> <br> *이메일 <br>
						<br>
					</div>

					<div class="cust">
						<input class="cust_b" type="text" name="name" size="25"/><br>
						<input class="cust_a" type="text" name="id" size="25"/><br>
						<input class="cust_a" type="password" name="password" size="25"/><br>
						<input class="cust_a" type="password" name="pwdcheck" size="25"/><br>
						<input class="cust_a" type="text" name="phonenumber" size="25"/><br>
						<input class="cust_a" type="text" name="emailid" size="10"/>
						@ <input class="cust_a" type="text" name="emailaddr" size="10"/>
						<select class="cust_a" name="emailaddr_select">
							<option value="1" selected>직접입력</option>
							<option value="2">naver.com</option>
							<option value="3">daum.net</option>
							<option value="4">google.com</option>

							<input class="cust_c" type="reset" value="취소">
							<input class="cust_d" type="submit" value="가입">
					</div>

				</div>
		</center>
	</form>
</body>
</html>
