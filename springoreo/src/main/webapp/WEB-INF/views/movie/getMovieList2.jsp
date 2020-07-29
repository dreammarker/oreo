<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!-- 지난영화 -->
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
</script>
<style>
img.card-img-top {
    margin-top: 30px;
}
</style>
</head>

<style>
.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
}
</style>
<body>
	<br>
	<br>
	<div class="row" align="center">
		<c:forEach items="${movie_last}" var="movie_last">

			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">

				<div class="card h-100"></div>
				<br><br>
				<a href="./getMovieInfo?movieId=${movie_last.movieId}"><img
					style="width: 250px; height: 300px" class="card-img-top"


					src="${movie_last.moviePoster}"
					alt=""></a> <br>
				<a href="./getMovieInfo?movieId=${movie_last.movieId}"><h3>${movie_last.movieTitle}</h3></a>


			</div>
		</c:forEach>
	</div>
	<div class="center">
		<div class="pagination">
			<!-- 페이징 -->
			<my:paging paging="${paging}" />

			<script>
				function doList(page) {
					location.href = "./getMovieLastList?page=" + page
				}
			</script>
		</div>
	</div>

</body>
</html>