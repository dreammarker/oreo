<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
 $(function() {
	$(".cust_birth").datepicker({
		dateFormat : 'yy/mm/dd',
		 changeMonth: true,
	      changeYear: true,
	      maxDate: 0
	});
	
}); 
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
		
		var cust_birth = document.getElementById('birth').value;
		if(cust_birth==""){
			alert("생년월일을 입력하세요");
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
		var emailaddr = emailid = document.getElementById('email2').value;
		if (emailaddr == "") {
			alert("이메일주소선택 해주세요.");
			return false;
		}
		
		if(password!=pwdcheck){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		document.form1.custMail.value=document.getElementById("email").value+"@"+document.getElementById("email2").value;
		document.form1.submit();
		
	}
	function goch(){
		history.go(-1);
	}
	
		
	function idCheck(){
		var id = {"custId":document.getElementById('id').value};
		$.ajax({ 
			type: "post",
			url:"./CustomerIdCheck",
			data :id,
			dataType : 'json',
			success : function(data){
				if(data.custId!=null){
					$("#checkUser").empty();
					$("#checkUser").append("<b><font color=red size=2pt> 사용중인 아이디입니다. </font></b>");
				}
				else if(data.custId==""){
					$("#checkUser").empty();
					$("#checkUser").append("<b><font color=red size=2pt> 아이디를 입력해주세요 </font></b>");
				}
				else{
					$("#checkUser").empty();
					$("#checkUser").append("<b><font color=green size=2pt> 사용가능아이디입니다.</font></b>");
				}
					
				
			}
			
		});
	}
	
	
	function pwdChecktest() {
		var password = document.getElementById("password").value;
		var pwdcheck = document.getElementById("pwdcheck").value;
		if (pwdcheck == "") {
			document.getElementById("pwdCheck").innerHTML = "";
		} else if (password != pwdcheck) {
			document.getElementById("pwdCheck").innerHTML = "<b><font color=red size=3pt> 비밀번호 불일치 </font></b>";
		} else if (password == pwdcheck) {
			document.getElementById("pwdCheck").innerHTML = "<b><font color=green size=3pt> 비밀번호 일치 </font></b>";
		}

	}

	function SetEmailTail(emailValue) {
		var email = document.all("email"); // 사용자 입력
		var emailTail = document.all("email2"); // Select box

		if (emailValue == "notSelected") {
			emailTail.readOnly = false;
			emailTail.value = "";
			
		} else if (emailValue == "etc") {
			emailTail.readOnly = false;
			emailTail.value = "";

		} else {
			emailTail.readOnly = true;
			emailTail.value = emailValue;
		}
	}
	

</script>
<style>
.loginbutton {
	float: right;
	color: lightblack;
	background: lightgray;
	margin-right: 10px;
	border-radius: 6px;
	padding: 5px;
	font-size: 12px;
}

a:link {
	text-decoration: none;
}

a:visited {
	color: black;
}

.secnav a:visited {
	color: white;
}

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
	margin-top: 15px;
	margin-right: 41px;
	float: right;
}

.cust_d {
	margin-top: 15px;
	margin-right: 10px;
	float: right;
}

.page {
	position: center;
	width: 550px;
	text-align: left;
	border: 3px solid gray;
	padding: 10px;
	height: 360px;
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

body {
	font-family: Arial;
	padding: 10px;
	background: white;
}

/* Header/Blog Title */
.header {
	padding: 30px;
	text-align: center;
	background: white;
}

.header h1 {
	font-size: 50px;
}

/* Style the top navigation bar */
.topnav {
	overflow: hidden;
	background-color: #333;
}

.secnav {
	margin-top: 1%;
	height: 25px;
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.topnav a:hover {
	background-color: #ddd;
	color: brown;
}

.a {
	margin-left: 15%;
}

.b {
	margin-left: 13%;
	color: white;
}

.oreo {
	margin-top: 100px;
}
</style>

</head>
<body>
	
		<form name="form1" method="post" action="./insertCustomer">
		<div class="oreo" align="center">
			<h2>회원가입</h2>
			<div class="page">
				<div class="c_name">
					*이름 <br> <br> *아이디 <br> <br> *비밀번호 <br> <br>
					*비밀번호 확인<br> <br> *생년월일<br><br>*전화번호<br> <br> *이메일 <br>
					<br>
				</div>
			
				<div class="cust">

						<input class="cust_b" type="text" name="custName" size="25" id="name">
						<br>
						
						<input class="cust_a" type="text" name="custId" size="25" id="id" onkeyup="idCheck()">
						<span id="checkUser"></span>
						
	
					<br> <input class="cust_a" type="password" name="custPwd"
						id="password" size="25" onkeyup="pwdChecktest()"><br> <input class="cust_a"
						type="password"  id="pwdcheck" size="25"
						onkeyup="pwdChecktest()"><span id="pwdCheck"></span><br>
						
					<input class="cust_birth" type="text" id="birth" name="custBirth"><br>
						
					<input class="cust_a" type="text" name="custPhone" size="25"
						id="phonenumber"><br> 
						
						
						<input class="cust_a"
				
						type="text" name="custEmail" size="10" id="email"> @ <input
						class="cust_a" type="text" name="email2" size="10" id="email2">

					<select class="cust_a" name="emailCheck"
						onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)"
						id="emailaddr_selecte">


						<option value="notSelected" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="google.com">google.com</option>
						
					</select> 
					
					<input type="hidden" name="custMail">
					<input type="hidden" name="action">
					<br><br>

					<center>
					<input class="btn btn-default" type="button" value="취소" onclick="goch()"> 
					<input class="btn btn-default" type="button" value="가입" onclick="inputCheck()">
					</center>
									                   
				</div>

			</div>
			
			
</div>
</form>
</body>
</html>
