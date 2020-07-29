<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>정보수정</title>
<script>
	function inputCheck() {
		var name = document.getElementById('name').value;
		if (name == "") {
			alert("이름을 입력하세요.");
			return false;
		}
		var id = document.getElementById('id').value;
		if (id == "") {
			alert("아이디를 입력하세요.");
			return false;
		}

		var password = document.getElementById('password').value;
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		var pwdcheck = document.getElementById('pwdcheck').value;
		if (pwdcheck == "") {
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}
		var phonenumber = document.getElementById('phonenumber').value;
		if (phonenumber == "") {
			alert("전화번호를 입력하세요.");
			return false;
		}
		var emailid = document.getElementById('email').value;
		if (emailid == "") {
			alert("이메일을 입력하세요.");
			return false;
		}

		if (password != pwdcheck) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}

	
			document.form3.submit();
			alert("정보가 수정되었습니다.")
		
	}
	/* 	function goch(){
	 history.go(-1);
	 }
	 */
	var passwordconfirm = false;
	function pwdChecktest() {
		var password = document.getElementById("password").value;
		var pwdcheck = document.getElementById("pwdcheck").value;
		if (pwdcheck == "") {
			document.getElementById("pwdCheck").innerHTML = "";
		} else if (password != pwdcheck) {
			document.getElementById("pwdCheck").innerHTML = "<b><font color=red size=3pt> 불일치 </font></b>";
			passwordconfirm = false;
		} else if (password == pwdcheck) {
			document.getElementById("pwdCheck").innerHTML = "<b><font color=green size=3pt> 일치 </font></b>";
			passwordconfirm = true;

		}

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

.cust_a {
	margin-top: 9px;
}

.cust_c {
	margin-top: 30px;
	margin-right: 41px;
	float: right;
}

.cust_d {
	margin-top: 10px;
	margin-right: 10px;
	float: right;
}

.page {
	position: center;
	width: 450px;
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

input.cust_b {
	margin-top: 12px;
	background-color: gray;
}

input.cust_aa {
	margin-top: 9px;
	background-color: gray;
}

.oreo {
	margin-top: 100px;
}
</style>
</head>
<body>
	<form action="./updateMycust" method="post" name="form3" id="form3">
		<!-- <input type="hidden" name="action" value="updatecustomer"> -->
		<center>
			<div class="oreo">
				<h2>회원정보</h2>
				<div class="page">
					<div class="c_name">
						이름 <br> <br> 아이디 <br> <br> 비밀번호 <br> <br>
						비밀번호 확인<br> <br>생년월일<br> <br> 전화번호<br> <br>
						이메일 <br> <br>
					</div>

					<div class="cust">
						<input readonly="readonly" class="cust_b" type="text" id="name" name="custName" size="25" value="${mycust.custName}"><br>
						<input readonly="readonly" class="cust_aa" type="text" id="id" name="custId" size="25" value="${mycust.custId}"><br>
						<input class="cust_a" type="password" id="password" name="custPwd" size="25" onkeyup="pwdChecktest()" value="${mycust.custPwd}"><br> 
						<input class="cust_a" type="password" id="pwdcheck" size="25" onkeyup="pwdChecktest()" value="${mycust.custPwd}"> 
							<span id="pwdCheck"></span><br>
						<input readonly="readonly" class="cust_aa" type="text" id="birth" name="custBirth" size="25" value="${mycust.custBirth}"><br>
						<input class="cust_a" type="text" id="phonenumber" name="custPhone" size="25" value="${mycust.custPhone}"><br>
						<input readonly="readonly" class="cust_aa" type="text" name="custMail" size="25" id="email" value="${mycust.custMail}"><br>
						<!-- <input class="cust_c" type="reset" value="취소" onclick="goch()"> -->


						<input class="cust_d" type="button" value="수정" onclick="inputCheck()">

					</div>

				</div>
			</div>
		</center>
	</form>
</body>
</html>
