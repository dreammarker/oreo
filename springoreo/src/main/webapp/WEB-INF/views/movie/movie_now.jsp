<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<div class="container">
		<div class="center" align="center" id="center">
			<a href="movie_control.jsp?action=now" class="btn btn-default">현재상영작</a>
			<a href="movie_control.jsp?action=pre" class="btn btn-default">개봉예정작</a>
		</div>
<br><br>
		<div class="row" align="center">
			<c:forEach items="${movie_now}" var="movie_now">
				<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					<div class="card h-100"></div>
					 <a href="movie_info.jsp"><img class="card-img-top"
						src="../image/${movie_now.getMovie_poster()}" alt=""></a> <br>
					<h3>${movie_now.getMovie_title()}</h3>

					<a href="movie_control.jsp?action=movie_info&movie_id=${movie_now.getMovie_id()}" class="btn btn-default btninfo" >상세정보</a> 
					
					<a href="../nonmypage/movie_reserve.jsp" class="btn btn-default">예매하기</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="data-container"></div>
 	<script>
 	
/* 	 $(".btninfo").click(function(e) {
			e.preventDefault();

			var url = $(this).attr('href');

			$.get(url).done(function(data) {
				$(".data-container").html(data);
				//$(".modal-dialog").modal();
			});

		});  */
	 
 	 	$(".data-container").dialog({
			autoOpen : false,
			modal : true,
			width : 600,
			top:100,
			open: function( event, ui ) {
		    	  $(event.target).load(href);
		      }
		});
		var href = "";
		
		$(".btninfo").click(function(event){
			href = $(this).attr("href");
			$(".data-container").dialog("open");
			event.preventDefault();
		}) 
		
	</script> 

	<%-- <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					<div class="card h-100"></div>
					<a href="movie_info.jsp" ><img class="card-img-top"
						src="../image/movie_1.JPG" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="movie_control.jsp?action=pre" >${movie_now.getMovie_title()}</a>
						</h4>
					</div>
					<button type="button" class="btn btn-default" id="myBtn">상세정보</button>
					<a href="#" class="aPopupModal" data-target="#popupModal" data-title="WOW POPUP" data-url="movie_info">
					<a href="movie_reserve.jsp" class="btn btn-default">예매하기</a>
				</div> --%>

	<!--  	 Pagination 
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
				class="sr-only">Previous</span>
		</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
				class="sr-only">Next</span>
		</a></li>
	</ul>   -->

	<!-- Pagination -->

	<t:paging jsfunc="doList" paging="${paging}">
		<script>
			function doList(p) {
				document.searchFrm.p.value = p;
				document.searchFrm.submit();
			}
		</script>
	</t:paging>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Oreo Cinema</p>
		</div>

	</footer>

</body>
</html>