<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
h2{
font-family: 'Nanum Myeongjo', serif;
}
.title{
	position:relative;
	top:90px;
	right:355px;
	margin-bottom:90px;
}

</style>
<body>
	<div class="title">
		<h2>고객님의 숨소리까지 듣겠습니다</h2>
	</div>
	<div class="container" style="margin-top: 60px">
		<form method="post" name="boardForm" action="./insertInquiry"
			enctype="multipart/form-data" onsubmit="return textExistCheck()">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th style="text-align: center; padding-top: 15px;">작성자</th>
						<td><input type="hidden" placeholder="작성자 입력 " name="custNum" 
							class="form-control" readonly="readonly"
							value="${sessionScope.custNum}" />${sessionScope.custId}</td>
					</tr>
					<tr>
						<th style="text-align: center; padding-top: 15px;">제목</th>
						<td><input type="text" placeholder="제목 입력"
							name="inquiryTitle" class="form-control"/></td>
					</tr>

					<tr>
						<th style="text-align: center; padding-top: 50px;">내용</th>
						<td><textarea class="form-control" rows="5"
								placeholder="내용 입력" id="inquiryContent" name="inquiryContent" ></textarea></td>
					</tr>
				</tbody>
			</table>
			<a href="./getInquiryList"><input type="button" value="취소"
				class="btn pull-right" /></a> <input type="submit" value="등록"
				class="btn btn-default pull-right" />
		</form>
		<script>
			function textExistCheck() {
				if (document.boardForm.inquiryTitle.value == "") {
					alert("제목을 등록하세요.");
					document.boardForm.inquiryTitle.focus();
					return false;
				}
				if (document.boardForm.inquiryContent.value == "") {
					alert("내용을 등록하세요.");
					document.boardForm.inquiryContent.focus();
					return false;
				}
				return true;
			}
		</script>
	</div>
</body>
</html>