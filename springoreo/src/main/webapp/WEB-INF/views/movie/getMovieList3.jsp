<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 관심영화 -->
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
	}) */
	
	function deleteFavorite(id){
		location.href="./deleteFavoriteMovie?favoriteId="+id;
		alert('관심영화에서 삭제되었습니다.');
	}
</script>
</head>
<body>
	<form name="delform" id="delform" action="./deleteFavoriteMovie" method="post">
	<%-- <input type="hidden" name="custNum" id="custNum" value="${sessionScope=custNum}"> --%>
		<br> <br>
		<div class="row" align="center">
			<c:forEach items="${movie_favorite}" var="movie_favorite">

				<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">

					<div class="card h-100"></div>
					<br><br>
					<a href="./getMovieInfo?movieId=${movie_favorite.movieId}"><img
						style="width: 250px; height: 300px" class="card-img-top"
						src="${movie_favorite.moviePoster}"
						alt=""></a> <br> <a
						href="./getMovieInfo?movieId=${movie_favorite.movieId}"><h3>${movie_favorite.movieTitle}</h3></a>
					<input type="button" value="삭제" class="btn btn-default" onclick="deleteFavorite(${movie_favorite.favoriteId})">
				</div>
			</c:forEach>
		</div>
	</form>

</body>
</html>