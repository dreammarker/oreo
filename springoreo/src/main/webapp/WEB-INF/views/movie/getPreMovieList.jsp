<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 개봉예정영화 -->
<!DOCTYPE html>
<html>
<head>
<title>getMovieList.jsp</title>

<script>
	/* $(".data-container").dialog({
		autoOpen : false,
		modal : true,
		width : 600,
		top : 100,
		open : function(event, ui) {
			$(event.target).load(href);
		}
	});
	var href = "";

	$(".btninfo").click(function(event) {
		href = $(this).attr("href");
		$(".data-container").dialog("open");
		event.preventDefault();
	})

	$("#add_cart").click(function(event) {
		location.assign("getMovieFavoriteList");
	})
	 */
	function insertbtn(id, custNum){
		var session="${sessionScope.custNum}";
		if(session==""){
			alert("로그인이 필요합니다.");
			return false;}
		else{
		 	location.href="./insertFavoriteMovie?movieId="+id+"&custNum="+custNum;
		 	alert('관심영화에 등록되었습니다.');}
	}
</script>
<style>
img.card-img-top {
    margin-top: 30px;
}
</style>
</head>
<body>
	<form name="moform1" id="moform1" action="./insertFavoriteMovie" method="post">
		<input type="hidden" name="action" value="">
	<%-- 	<input type="hidden" name="custNum" value="${sessionScope.custNum}">
		<input type="hidden" name="movieId" value="${movie_favorite.movieId}"> --%>
		<div class="container">
			<div class="center" align="center" id="center">
				<a href="./getMovieList" class="btn btn-default">현재상영작</a> <a
					href="./getMoviePreList" class="btn btn-default">개봉예정작</a>
			</div>
		</div>
		<br> <br>
		<div class="row" align="center">
			<c:forEach items="${movie_pre}" var="movie_pre">
				<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">

					<div class="card h-100"></div>
					<br><br>
					<a href="./getMovieInfo?movieId=${movie_pre.movieId}"><img
						style="width: 250px; height: 300px" class="card-img-top"
						src="${movie_pre.moviePoster}"
						alt=""></a> <br>
					<h3>${movie_pre.movieTitle}</h3>
					
					<a href="./getMovieInfo?movieId=${movie_pre.movieId}"class="btn btn-default btninfo">상세정보</a> 
					<%-- <a href="./Movie_reserve?movieId=${movie_pre.movieId}" class="btn btn-default">예매하기</a>  --%>
					<input type="button" value="관심영화" class="btn btn-default" onclick="insertbtn(${movie_pre.movieId},${sessionScope.custNum} )">
					<!-- <a href="./getMovieFavoriteList" class="btn btn-default" title="관심영화" id="add_cart" name="add_cart">관심영화</a> -->

				</div>
			</c:forEach>
		</div>
	</form>
</body>

</html>