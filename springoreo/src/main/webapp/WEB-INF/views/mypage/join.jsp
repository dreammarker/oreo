<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<title>ȸ������</title>
<script>
	function inputCheck() {
		var name = document.frm.name.value;
		if (name == "") {
			alert("�̸��� �Է��ϼ���.");
			return false;
		}
		var id = document.frm.id.value;
		if (id == "") {
			alert("���̵� �Է��ϼ���.");
			return false;
		}
		var password = document.frm.password.value;
		if (password == "") {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		var pwdcheck = document.frm.pwdcheck.value;
		if (pwdcheck == "") {
			alert("��й�ȣ Ȯ���� �Է��ϼ���.");
			return false;
		}
		var phonenumber = document.frm.phonenumber.value;
		if (phonenumber == "") {
			alert("��ȭ��ȣ�� �Է��ϼ���.");
			return false;
		}
		var emailid = document.frm.emailid.value;
		if (emailid == "") {
			alert("�̸����� �Է��ϼ���.");
			return false;
		}
		var emailaddr = document.frm.emailaddr.value;
		if (emailaddr == "") {
			alert("�̸����� �Է��ϼ���.");
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
				<h2>ȸ������</h2>
				<div class="page">
					<div class="c_name">
						*�̸� <br> <br> *���̵� <br> <br> *��й�ȣ <br> <br>
						*��й�ȣ Ȯ��<br> <br> *��ȭ��ȣ<br> <br> *�̸��� <br>
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
							<option value="1" selected>�����Է�</option>
							<option value="2">naver.com</option>
							<option value="3">daum.net</option>
							<option value="4">google.com</option>

							<input class="cust_c" type="reset" value="���">
							<input class="cust_d" type="submit" value="����">
					</div>

				</div>
		</center>
	</form>
</body>
</html>
