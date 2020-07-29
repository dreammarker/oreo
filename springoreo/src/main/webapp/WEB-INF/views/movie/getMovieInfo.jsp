<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>
<style>
	#score{
		width:50px;
	}
</style>

<script>

/* function btnDelete(id){
	var param = {action:"reviewdelete", review_id : id};
	$.get{""}
} */



 $(function(){
	$("#btnSubmit").click(function(event){
		var session="${sessionScope.custNum}";
		if(session==""){
			alert("로그인후 댓글입력가능합니다.");
			return false;
		}
		var param = $("[name=reviewform]").serialize();
		console.dir(param);
		$.get("insertReview", param, function(review){
			var btn1 = "";
			if ("${sessionScope.custNum}"==review.custNum){
				btn1 =" <input type='button' value='삭제' onclick='btnDelete("+review.reviewId+")'>"
			}
			console.log(btn1);
			$("#reviewlist").append("<div id="+review.reviewId+"> 평점"+review.reviewStar+" 리뷰  "+review.reviewContent
					+btn1 + "</div>"); 
		});
	});
});



function btnDelete(reviewId){

	var param = {reviewId:reviewId};
	
	$.get("deleteReview",param,function(data){
		$("#"+reviewId).html("");
	});
} 

/* $("#btnSubmit").click(function(){
	var requestVale=$("#reviewform").serialize();
	$.ajax({
		type:"post",
		url:"./insertReview",
		data:requestValue,
		success:function(data){
			var append="<br><span> 평점"+review.reviewStar+" 리뷰  "+review.reviewContent+"</span>";
			$("#"+reviewId).replaceWith(append);
		}
	})
}

 */
</script>
</head>
<body>

<form name="reviewform" id="reviewform" action="./insertReview" method="post">
<input type="hidden" name="movieId" value="${movieinfo.movieId}">
<input type="hidden" name="custNum" value="${sessionScope.custNum}">
<!-- Modal -->

<h1 class="modal-title btn-lg"><b>===${movieinfo.movieTitle}===</b></h1>

<div class="modal-body">

	<br> 평점 : ${avg} 점<br> <br> 
	<hr class="hr">
	<br> 
	감독 : ${movieinfo.movieDirector}<br>
	배우 : <c:forEach items="${actorinfo}" var="actor"> ${actor.actorName},</c:forEach> <br>
	장르 : ${movieinfo.movieGenre}<br>
	기본 : ${movieinfo.movieAge}세 이상, ${movieinfo.movieShowtime}<br>
	개봉 : ${fn:substring(movieinfo.movieOpenDate,0,10)}<br>

	<hr class="hr">
	<h4><B>줄거리</B></h4>
	<br> ${movieinfo.movieSummary} <br>
	<hr class="hr">
	<br> 
	
	
	<h4><B>배우</B></h4>
	<c:forEach items="${actorinfo}" var="actor"> 
	<table border="1" style="margin:5px; float:left;">
	<tr><td  style="width:180px; height:150px"><img src="${actor.actorPhoto}"/></td></tr>
	<tr><td>${actor.actorName}</td></tr>
	<tr><td>${actor.actorRole}/${actor.charName}</td></tr>
	</table></c:forEach>
	<div style="clear: left;"></div>
	<br><br>
	<hr class="hr">
	<br><iframe src="${movieinfo.movieTrailer}" style="width:800px;height:600px"></iframe>
	<hr class="hr">
	
	<br> 
	<select name="reviewStar" id="reviewStar">
		<option value='0'  selected>0점</option>
		<option value='1' >1점</option>
		<option value='2' >2점</option>
		<option value='3' >3점</option>
		<option value='4' >4점</option>
		<option value='5' >5점</option>
	</select>
	<input type="text" name="reviewContent" id="reviewContent"><input type="button" value="확인" id="btnSubmit">
	<br>
	
	<div id="reviewlist">
	<c:forEach items="${review}" var="review">
		<div id="${review.reviewId}">
		평점 ${review.reviewStar} 리뷰 ${review.reviewContent} 
		<c:if test="${sessionScope.custNum eq review.custNum}">
		<input type="button" value="삭제" onclick="btnDelete(${review.reviewId})">
		</c:if>
		</div>
	</c:forEach>
	</div>

</div>
</form>
</body>
</html>