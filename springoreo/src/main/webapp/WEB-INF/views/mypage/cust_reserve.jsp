<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>

<title>스탬프</title>
<!-- <script>
	function inputCheck() {
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
</script> -->
<style>
.r_name {
	float: left;
	display: inline-block;
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 50px;
}

.reserve_a {
	margin-top: 9px;
	float: display:inline-block;
}

.reserve_b {
	margin-top: 20px;
	float: display:inline-block;
}

.reserve_c {
	margin-top: 15px;
	padding: 4px;
	margin: 10px;
	float: right;
	padding: 4px;
}

.page {
	float: center;
	width: 400px;
	text-align: center;
	border: 3px solid gray;
	padding: 10px;
	margin-top: 30px;
	height: 430px;
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

.oreo {
	margin-top: 100px;
}

.rect {
	position: fixed;
	top: 350px;
	right: 0px;
	width: 400px;
	height: 200px;
	text-align: left;
	border: 3px solid lightgray;
	background-color: lightgray;
	padding: 10px;
	margin-top: 260px;
	margin-right: 200px;
}

.circle1 {
	position: absolute;
	top: 45px;
	left: 10px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle2 {
	position: absolute;
	top: 45px;
	left: 90px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle3 {
	position: absolute;
	top: 45px;
	left: 170px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle4 {
	position: absolute;
	top: 45px;
	left: 250px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle5 {
	position: absolute;
	top: 45px;
	left: 330px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle6 {
	position: absolute;
	top: 120px;
	left: 10px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle7 {
	position: absolute;
	top: 120px;
	left: 90px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle8 {
	position: absolute;
	top: 120px;
	left: 170px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle9 {
	position: absolute;
	top: 120px;
	left: 250px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.circle10 {
	position: absolute;
	top: 120px;
	left: 330px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	border: 3px solid gray;
	background-color: gray;
}

.oreo {
	margin-top: 100px;
}

.stampadd{
background-color: brown;
}
#mileage{
position: absolute;
top:500px;
border: 3px solid lightgray;
background-color: lightgray;

}
</style>

<script type="text/javascript">
	function delcheck(id, custNum, advanceSeatNum) {
		result = confirm("정말로 취소하시겠습니까 ?");

		if (result == true) {
			location.href = "./deleteMyadvance?advanceId="+id+"&custNum="+custNum+"&advanceSeatNum="+advanceSeatNum;
		} else
			return;
	}
	
</script>

</head>
<body>
	<form name="advanceform" id="advanceform" action="./deleteMyadvance" method="post">
	<input type="hidden" name="action" value="">
		<center> 
			<div class="oreo">
				<h2 class="innertitle">예매내역</h2>
				<c:forEach items="${myadvance}" var="nowadvance">
					<div class="page">
						<div class="r_name">
							예매일시 <br> <br> 예매번호 <br> <br> 영화관 <br> <br>
							영화상영일시 <br> <br> 제목<br> <br> 상영관<br> <br>
							예매 좌석수 <br> <br> 좌석번호 <br> <br> 스낵 <br> <br>
						</div>
						<div class="reserve">
							<input readonly="readonly" class="reserve_b" type="text"
								name="advanceDate" size="25"
								value="${nowadvance.advanceDate}"><br> 
							<input
								readonly="readonly" class="reserve_a" type="text"
								name="advanceId" size="25"
								value="${nowadvance.advanceId}"><br> 
							<input
								readonly="readonly" class="reserve_a" type="text" name="theaterName"
								size="25" value="${nowadvance.theaterName}"><br>
							<input readonly="readonly" class="reserve_a" type="text"
								name="movieDate" size="25"
								value="${fn:substring(nowadvance.screenDate,0,10)}/${nowadvance.screenStartTime}"><br>
							<input readonly="readonly" class="reserve_a" type="text"
								name="movieTitle" size="25"
								value="${nowadvance.movieTitle}"><br> 
							<input
								readonly="readonly" class="reserve_a" type="text" name="roomName"
								size="25" value="${nowadvance.roomName}"><br>
							<input readonly="readonly" class="reserve_a" type="text"
								name="advanceSeatNum" size="25"
								value="${nowadvance.advanceSeatNum}"><br>
							<input
								readonly="readonly" class="reserve_a" type="text"
								name="seatNumber" size="25" value="${nowadvance.seatNumber}"><br>
							<input
								readonly="readonly" class="reserve_a" type="text"
								name="snack" size="25" value="${nowadvance.snack}"><br>
							<input name="advanceId" type="button" value="예매취소"
								onClick="delcheck(${nowadvance.advanceId},${sessionScope.custNum},${nowadvance.advanceSeatNum})"
								class="reserve_c"> <br>
						</div>


					</div>
					<br>
					<hr>

				</c:forEach>
				<br> <br>
			</div>
		</center>
		
		<div class="stamp">	
			<div class="rect">
				<h4><b>적립금 : ${mileage.mileage} 원</b></h4>
				<div class="circle1  <c:if test="${1<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle2 <c:if test="${2<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle3 <c:if test="${3<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle4 <c:if test="${4<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle5 <c:if test="${5<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle6 <c:if test="${6<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle7 <c:if test="${7<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle8 <c:if test="${8<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle9 <c:if test="${9<=stamp.stamp}">stampadd</c:if>"></div>
				<div class="circle10 <c:if test="${10<=stamp.stamp}">stampadd</c:if>"></div>
			
			</div>
		</div>
	</form>
</body>
</html>
