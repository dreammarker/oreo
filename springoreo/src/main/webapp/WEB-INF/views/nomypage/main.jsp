<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
    // 파라메터 설정
	String  targetDt = request.getParameter("targetDt")==null?"20180710":request.getParameter("targetDt");			//조회일자
	String itemPerPage = request.getParameter("itemPerPage")==null?"5":request.getParameter("itemPerPage");		//결과row수
	String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");		//“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");			//“K: : 한국영화 “F” : 외국영화 (default : 전체)
	String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");				//“0105000000” 로서 조회된 지역코드

	// 발급키
	String key = "430156241533f1d058c603178cc3ca0e";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 일일 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
    String dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);

	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);

	request.setAttribute("dailyResult",dailyResult);

	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
	String codeResponse = service.getComCodeList(true,"0105000000");
	HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
	request.setAttribute("codeResult",codeResult);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>Main</title>



<style>
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
img {vertical-align: middle;}

/* Slideshow container */

.mySlides{
   border:1px solid black;
   margin-top:70px;
   margin-left:80px;
   width:900px;
   height:506px;
   float:left;
}
/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}
.prev{
	overflow: visible;
	position:absolute;
	top:615px;
	left:450px;
}
.next{
	overflow: visible;
	position:absolute;
	top:615px;
	right:470px;
	 border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}



.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
.active {
   margin-left: 17%;
   color: white;
   font-weight:10px;
}

.active2 {
   margin-left: 15%;
   background-color: brown;
   color: white;
}




/*--------------
   지도
   ---------------*/
.near {
   position:absolute;
   right:30px;
   width: 300px;
   margin-right: 30px;
   margin-top: 70px;
}

.map {
border: 1px solid black;
   width: 300px;
   height: 300px;
   margin-left: 0px;
   margin-top: 50px;
   float: right;
}

/*------------------
   예고편<article>
   ----------------*/




/*------------
   차트<nav>
   -------------*/
.chart{
   width: 400px;
   height:500px;
   float:left;
   margin-top:70px;
   margin-bottom:100px;

}
.rank{
   margin-top:30px;

}
/*----------------
   밑에 포스터<footer>
   ----------------*/

 .carousel-inner img {
      width: 200px;
      height: 250px;
      float:auto;
  } 
  
  .carousel-indicators li {
    position: relative;
    top:150px;
    left:165px;
    -ms-flex: 0 1 auto;
    flex: 0 1 auto;
    width: 30px;
    height: 7px;
    margin-right: 3px;
    margin-left: 3px;
    text-indent: -999px;
    background-color:red;
}
.slide1{
   position:absolute;
   top:40px;
   left:10px;
   width:40px;
   height:60px;
   border:3px solid gold;
}

.empty{
   margin:150px;
}

i {
  border: solid black;
  border-width: 0 3px 3px 0;
  display: inline-block;
  padding: 10px;
}
.left {
    transform: rotate(135deg);
    -webkit-transform: rotate(135deg);
}
.right {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg);
}

/* The dot/bullet/indicator container */
.dot-container {
	position:relative;
	top:100px;
    text-align: center;
    padding: 20px;
    background:white;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: brown;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

/* Add a background color to the active dot/circle */
.active, .dot:hover {
  background-color: white;
}
</style>
</head>
<body>
  
 <!-- 차트 -->  
  
 <nav>
      <div class="chart"> <img src="${pageContext.request.contextPath}/resources/image/boxoffice1.png" style="width:300px;height:100px;margin-left:50px;"/>
            
           <table class="table table-bordered table-dark table-sm" style="font-size:17px;padding:40px;">
           <tr>
           		<td>순위</td>
           		<td>제목</td>
           		<td>예매율</td>
           	</tr>
           	<%-- <c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}"> --%>
	<%-- <c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
	
           	
           	<tr>
           		<td><c:out value="${boxoffice.rank}"/></td>
           		<td><c:out value="${boxoffice.movieNm }"/></td>
           		
           	</tr>
           	</c:forEach> --%>
          <c:forEach items="${chart}" var="c">
          	
          	<tr>
          		<td><c:out value="${c.rank}"/></td>
          		<td><c:out value="${c.movieNm}"/></td>
          		<td><c:out value="${c.rate}"/>%</td>
          	</tr>
          </c:forEach>
	<%-- </c:if> --%>
           </table>
      
      </div>
         
     
   
 </nav>
 
 
 


<!-- 메인예고편 -->
  <article>
   
<div class="slideshow-container">

<div class="mySlides">
  
  <iframe src="https://www.youtube.com/embed/BubTvW_T2YM" frameborder="0"  allowfullscreen="1" style="width:100%;height:100%"></iframe>
  
</div>

<div class="mySlides">
  
 <iframe src="https://www.youtube.com/embed/-6beTgUz1so" frameborder="0"  allowfullscreen="1" style="width:100%;height:100%"></iframe>
  
</div>

<div class="mySlides">
  
  <iframe src="https://www.youtube.com/embed/xbxe2D5d9jk" frameborder="0"  allowfullscreen="1"style="width:100%;height:100%"></iframe>
  
</div>

<div class="mySlides">
  
  <iframe src="https://www.youtube.com/embed/lBBaE7eoeks" frameborder="0"  allowfullscreen="1" style="width:100%;height:100%"></iframe>
  
</div>

<div class="mySlides">
  
  <iframe src="https://www.youtube.com/embed/BDhqx3j0pAQ" frameborder="0"  allowfullscreen="1"style="width:100%;height:100%"></iframe>
  
</div>
<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

  </article>
  
  
  
  
  
  
  
<!-- map -->
    <nav>
        <div class="near">
        <img src="${pageContext.request.contextPath}/resources/image/location.png"/ style="width:100px;height:70px;margin-left:50px;float:left">
        <h2 style="float:left;margin-top:30px; margin-left:3px;">내 위치</h2>
      <div id="map" class="map"></div>
      </div>
      
      
      <!-- 구글map api 스크립트 -->
      <script>
       function initMap() {
  	     var uluru = [{lat: 35.944239, lng: 128.561734}, //메가박스 북대구점
  	    			 {lat: 35.942302, lng: 128.563936}, //롯데시네마 프리미엄 칠곡점
   	    			 {lat: 35.921899, lng: 128.636764}, //CGV 이시아점
  	    			 {lat: 35.913585, lng: 128.823409},//메가박스 경산하양점
  	    			 {lat: 35.877959, lng: 128.628660},//메가박스 대구신세계점
  	    			 {lat: 35.871332, lng: 128.594888},//CGV 대구
  	    			 {lat: 35.869957, lng: 128.594278},//CGV 아카데미
  	    			 {lat: 35.870421, lng: 128.595348},//CGV 대구한일
  	    			 {lat: 35.870231, lng: 128.596989},//롯데시네마 동성로점
  	    			 {lat: 35.867145, lng: 128.590805},//CGV 대구현대점
  	    			 {lat: 35.867856, lng: 128.694064},//롯데시네마 율하점
  	    			 {lat: 35.855748, lng: 128.550687},//롯데시네마 대구광장점
       				 {lat: 35.854493, lng: 128.507832},//롯데시네마 대구성서점
       				 {lat: 35.831725, lng: 128.687197},//CGV 대구스타디움
       				 {lat: 35.816655, lng: 128.539350},//롯데시네마 상인점
  	    			];
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 35.865363, lng: 128.593607},
          zoom: 15
        });
        var infoWindow = new google.maps.InfoWindow({map: map});
       
        for(var i in uluru){
        var marker = new google.maps.Marker({
            position: uluru[i],
            map: map
          });
        }
        
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=&callback=initMap">
    </script>

 </nav>

<!-- --------------밑에 포스터----------------- -->
  <footer>
     
     
<div id="demo" class="carousel slide" data-ride="carousel" 
    style="width:1220px;height:300px;
    margin-left:220px;
    margin-top:550px;">

 <!--  
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active" ></li>
    <li data-target="#demo" data-slide-to="1" ></li>
    <li data-target="#demo" data-slide-to="2" ></li>
  </ul>
   -->
   <!-- 리스타트-->
  <!-- The slideshow -->
  <div class="carousel-inner" id="carousel">
    <div class="carousel-item active">
     <img src="${pageContext.request.contextPath}/resources/image/1.jpg" 
     onmouseenter="this.src='${pageContext.request.contextPath}/resources/image/alt1.jpg'; document.getElementsByClassName('slide1')[0].style.display='' " 
     onmouseleave="this.src='${pageContext.request.contextPath}/resources/image/1.jpg';document.getElementsByClassName('slide1')[0].style.display='none'">
            <!-- <div class="slide1" style="display:none;">예매하기</div> -->
            
      <a> 
      <img src="${pageContext.request.contextPath}/resources/image/2.jpg" 
      		onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt2.jpg'" 
      		onmouseout="this.src='${pageContext.request.contextPath}/resources/image/2.jpg'"></a>
        <img src="${pageContext.request.contextPath}/resources/image/3.jpg" 
        	onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt3.jpg'" 
        	onmouseout="this.src='${pageContext.request.contextPath}/resources/image/3.jpg'">
         <img src="${pageContext.request.contextPath}/resources/image/4.jpg" 
         	onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt4.jpg'" 
         	onmouseout="this.src='${pageContext.request.contextPath}/resources/image/4.jpg'">
          <img src="${pageContext.request.contextPath}/resources/image/5.jpg" 
          	onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt5.jpg'" 
          	onmouseout="this.src='${pageContext.request.contextPath}/resources/image/5.jpg'">
    </div>
    <div class="carousel-item">
       <img src="${pageContext.request.contextPath}/resources/image/6.jpg" 
       		onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt6.jpg'" 
       		onmouseout="this.src='${pageContext.request.contextPath}/resources/image/6.jpg'">
        <img src="${pageContext.request.contextPath}/resources/image/7.jpg" 
        	onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt7.jpg'" 
        	onmouseout="this.src='${pageContext.request.contextPath}/resources/image/7.jpg'">
         <img src="${pageContext.request.contextPath}/resources/image/8.jpg" 
         	onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt8.jpg'" 
         	onmouseout="this.src='${pageContext.request.contextPath}/resources/image/8.jpg'">
          <img src="${pageContext.request.contextPath}/resources/image/9.jpg" 
          		onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt9.jpg'" 
          		onmouseout="this.src='${pageContext.request.contextPath}/resources/image/9.jpg'">
           <img src="${pageContext.request.contextPath}/resources/image/10.jpg" 
           		onmouseover="this.src='${pageContext.request.contextPath}/resources/image/alt10.jpg'" 
          		onmouseout="this.src='${pageContext.request.contextPath}/resources/image/10.jpg'"> 
       
    </div>
  </div>
  
  
</div>
     <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev"
   style="position:absolute;top:1060px;;width:50px;height:50px; margin-left:340px;">
   <p><i class="left"></i></p>
  </a>
 
 
  <a class="carousel-control-next" href="#demo" data-slide="next" 
  style="position:absolute;top:1060px;width:50px;height:50px; margin-right:360px;">
    <p><i class="right"></i></p>
  </a>                                                                 
   <div class="empty"></div>
  </footer>
  
  
</body>
</html>