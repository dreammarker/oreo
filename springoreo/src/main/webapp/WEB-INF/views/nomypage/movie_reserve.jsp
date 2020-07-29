<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>영화예매</title>
<link type="text/css" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css" rel="Stylesheet" />
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.4.4.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script>

<style>
td {
	padding: 5px;
	text-align: left;
}
	.first a:hover {
	background-color: brown;
	color: black;
}

.first a:active {

    background-color: hotpink;
}
.first a:visited { 
    color: pink;
}
div#day {
    background: antiquewhite;
}
td#movie1 {
    background: antiquewhite;
}
td#theather {
    width: 14em;
    background: antiquewhite;
}
td#time {
    background: antiquewhite;
}
a.first {
    font-size: 18px;
}
a.movie_first_loc {
   font-size : 18px;
}
a.movie_second_loc {
   font-size : 18px;
}
a.movie_screen {
font-size : 15px;
}
a.screen_time {
font-size : 15px;
}
th {
    background-color: antiquewhite;
    
}
td#genre1 div{
  width : 100px;
  display: inline-block;
}
td.time {
    width: 130px;
}
</style>

<script>
var today = "${time}";
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy/mm/dd',
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			minDate: 0,
		    maxDate: 2,
			onSelect : function(text, object) {
				$("#hiredate2").val(text); //obj.currentYear 년도만
				checkmovie();
			}
		});

		$("#start_ti").keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});

	});

	function checkmovie() {
		//장르
		var genre = "";

		if ($("#ro").attr("checked") == true)
			genre += $("#ro").val() + ",";
		if ($("#co").attr("checked") == true)
			genre += $("#co").val() + ",";
		if ($("#ac").attr("checked") == true)
			genre += $("#ac").val() + ",";
		if ($("#an").attr("checked") == true)
			genre += $("#an").val() + ",";
		if ($("#fn").attr("checked") == true)
			genre += $("#fn").val() + ",";
		if ($("#dr").attr("checked") == true)
			genre += $("#dr").val() + ",";
		if ($("#mh").attr("checked") == true)
			genre += $("#mh").val() + ",";
		if($("#bum").attr("checked")== true)
			genre += $("#bum").val()+",";
		if($("#sf").attr("checked")== true)
			genre += $("#sf").val()+",";
		if($("#si").attr("checked")== true)
			genre += $("#si").val()+",";
		if($("#adv").attr("checked")== true)
			genre += $("#adv").val()+",";
		if($("#dacu").attr("checked")== true)
			genre += $("#dacu").val()+",";
		
		//영화  나이
		var age;
		if ($("#everybody").attr("checked") == true)
			age = $("#everybody").val();
		else if ($("#all").attr("checked") == true)
			age = $("#all").val();
		else if ($("#twelve").attr("checked") == true)
			age = $("#twelve").val();
		else if ($("#fifteen").attr("checked") == true)
			age = $("#fifteen").val();
		else if ($("#eighteen").attr("checked") == true)
			age = $("#eighteen").val();

		var end_date = $("#hiredate2").val();

		if (end_date == "") {
			alert("날짜를 선택해주세요");
			return false;
		} else {
			$("#movie_date").empty();
			$("#movie_1").empty();
			$("#movie_screen_1").empty();
			$("#screen_times").empty();
			$("#movie_date").text(end_date);
		}

		var param = {
			movieGenre : genre,
			movieAge : age,
			endDate : end_date
		};

		$.ajax({
			type: "post",
			url:"./Movie_genre_reserve",
			data :param,
			dataType : 'json',
			charSet: "utf-8",
			success : function(data){
					$("#movie").empty();
					$("#twotd").empty();
					$("#lo1").empty();
					$("#screen").empty();
					$("#movie_time").empty();
					for (i = 0; i < data.length; i++) {
						console.log("<div  name='movie_title' id='"+data[i].movieId+"'>"
										+ "<a href='#' id='first' onclick='movie_first_loc("
										+ data[i].movieId
										+ ",\""
										+ end_date
										+ "\")'>"
										+ data[i].movieTitle
										+ "</a> </div>");
						$("#movie").append(
										"<div  name='"+data[i].movieTitle+"' id='"+data[i].movieId+"'>"
												+ "<a href='#' class='first' onclick='movie_first_loc("
												+ data[i].movieId +",\""+data[i].movieTitle+"\""
												+ ",\"" + end_date
												+ "\")'>"
												+ data[i].movieTitle
												+ "</a> </div>");

						  $("#" + data[i].movieId).click(function(){
									$("#movie_1").empty();
									$("#movie_screen_1").empty();
									$("#screen_times").empty();
									$("#movie_1").text($(this).text());
									
								});  
					}
				}
			
		});
		


	}
var location_1;
var location_2;
	// 영화관 시
	function movie_first_loc(movie_id, movieTitle, end_date) {
		var param = {
			movieId : movie_id,
			endDate : end_date
		};
		location_1=$("#centerAddr").text(); //좌표를 주소로 변환한 값 저장하기
		console.log(location_1);
		var data = location_1.split(" ");
		location_1=location_1.substring(0,2); //대구광역시중에 대구글자 가져오기
		console.log(location_1);
		console.log(data[1]);  
		location_2=data[1];  //구위치가져오기
		$.ajax({
			type: "post",
			url:"./Movie_theather_loc",
			data :param,
			dataType : 'json',
			charSet: "utf-8",
			success : function(data){
				$("#twotd").empty();
				$("#lo1").empty();
				$("#screen").empty();
				$("#movie_time").empty();

				for (i = 0; i < data.length; i++) {
					console.log("<div  class='movie_first_loc' >"
							+ "<a href='#'  onclick='movie_second_loc(\""
							+ data[i].theaterFirstLoc + "\"," + data[i].movieId
							+ "," + "\"" + end_date + "\")'>"
							+ data[i].theaterFirstLoc + "</a> </div>");
					$("#twotd").append(
							"<div  >"
									+ "<a href='#' class='movie_first_loc' onclick='movie_second_loc(\""
									+ data[i].theaterFirstLoc + "\","
									+ data[i].movieId + "," + "\"" + end_date
									+ "\")'>" + data[i].theaterFirstLoc
									+ "</a> </div>");
				}
				
				
			}
		});
	}
	// 영화관 구
	function movie_second_loc(movie_first, movie_id, end_date) {
		
		
		var param = {
			theatherFirstLoc : movie_first,
			movieId : movie_id,
			endDate : end_date
		};
		$.ajax({
			type: "post",
			url:"./Movie_second_theather",
			data :param,
			dataType : 'json',
			charSet: "utf-8",
			success : function(data){
				$("#lo1").empty();
				$("#screen").empty();
				$("#movie_time").empty();
				for (i = 0; i < data.length; i++) {
					$("#lo1").append(
							"<div >"
									+ " <a href='#'  class='movie_second_loc' onclick='movie_screen(\""
									+ data[i].theaterSecondLoc + "\","
									+ data[i].movieId + ",\"" + end_date + "\")'>"
									+ data[i].theaterSecondLoc + "</a> </div>");
				}
			}
			});
				
				
			}
	
var theatherName;
	// 상영관 
	function movie_screen(movie_second_loc, movie_id, end_date) {
		var param = {
				theatherSecondLoc : movie_second_loc,
			movieId : movie_id,
			endDate : end_date
		};
		$.ajax({
			type: "post",
			url:"./Movie_screen",
			data :param,
			dataType : 'json',
			charSet: "utf-8",
			success : function(data){
				$("#screen").empty();
				$("#movie_time").empty();
				for (i = 0; i < data.length; i++) {
					$("#screen").append(
							"<div  id="+data[i].theaterId+">"
									+ " <a href='#' class='movie_screen' onclick='movie_time("
									+ "\""+data[i].theaterId+"\""+","+movie_id
									+ ",\"" + end_date + "\")'>"
									+ data[i].theaterName + "</a> </div>")
					$("#" + data[i].theaterId).click(function() {
						$("#movie_screen_1").empty();
						$("#screen_times").empty();
						$("#theaterName").text($(this).text());
						theatherName= $("#theatherName").text();
						$("#movie_screen_1").text($(this).text());
					});
				}
			}
			});

	}
	
	var screenTimes; 
	//영화시간
	var theatherId;  //극장번호
	var movieId;   //영화번호
	var endDate;   //상영날짜
	function movie_time(theather_id, movie_id, end_date) {
		var start_time = $(".start").val();
	 	/* if(start_time==null||start_time==''){
			alert("시작시간을 입력해주세요.");
			return false;
		}  */
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 

		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 

		console.log(year + "/" + month + "/" + day);
		

		console.log(today);
		
		if(theather_id!=null){
			theatherId=theather_id;
			movieId=movie_id;
			endDate=end_date;
			
		}
		var param = {
				theatherId : theatherId,
			movieId : movieId,
			endDate : endDate,
			screenStartTime : start_time
		};
		$.ajax({
			type: "post",
			url:"./screen_time",
			data :param,
			dataType : 'json',
			charSet: "utf-8",
			success : function(data){
				$("#movie_time").empty();
				$("#haexa").empty();
				if (data[0].eventInfo == "") {
					$("#haexa").append("해택없음");
				}
				$("#haexa").append(data[0].eventInfo);
				
				for (i = 0; i < data.length; i++) {
					$("#movie_time").append(
							"<div  id='"+data[i].screenId+"'>"
									+ " <a href='#' class='screen_time' onclick='movie_seat("
									+ data[i].screenId + "," + movie_id + ",\""
									+ end_date+"\"" + ","+"\""+data[i].roomName+data[i].screenStartTime+"\")'>" + 	data[i].roomName
									+ data[i].screenStartTime + "</a> </div>")
									
									
									if($("#movie_date").text()==(year + "/" + month + "/" + day)){
									if(data[i].screenStartTime<=today){
										console.log(today);
										$("#" + data[i].screenId).css("display","none");                 //다르면 숨긴다
										console.log("none");	
									}
									else if(data[i].screenStartTime>today){
										console.log(data[i].screenStartTime);
										console.log(today);
										
									}
									}
					$("#" + data[i].screenId).click(function() {
						$("#screen_times_1").text($(this).text());
						screenTimes= $("#screen_times_1").text();
						
					});
				}
				

			}
		
			});
		
			


	}

	function movie_seat(screen_id, movie_id, end_date,screen_Time) {
		
		var movie_date = $("#movie_date").text();
		var movie_id = $("#movie_1").text();
		var screen_event=$("#haexa").text();
		var theatherName=$("#theaterName").text();
		var cust_num = "${sessionScope.custNum}";
			if (cust_num == "") {
				alert("로그인후 이용가능");
				return false;
			} 
			else{
			location.href=("seatcheck?movieName="+movie_id+"&screen_id="+screen_id+"&movieDate="+movie_date+"&theatherName="+theatherName+"&screenTimes="+screen_Time+"&custNum="+cust_num+"&screenEvent="+screen_event);
			}
		

	}
	
	function location_check(){
		var loca_1 = new Array();
		var loca_2 = new Array();
		
		loca_1=$("#twotd").find("a"); //시
		loca_2=$("#lo1").find("a");  //구 
		
		loca_1.each(function(v,index){
			console.log($(this).text()+v+" : "+index);	
		});
		if ($("#now").attr("checked") === true){
			
			loca_1.each(function(v,index){
				
				if($(this).text().substring(0,2)==location_1){   //같으면 보여주고
					$(this).css("display","inline");
					console.log("inline");
				}
				else{
					$(this).css("display","none");                 //다르면 숨긴다
					console.log("none");
				}
				
				
			});
			
			loca_2.each(function(v,index){
				if($(this).text()==location_2){
				$(this).css("display","inline");
				console.log("두번째시 필터표시");
				}
				else{
					$(this).css("display","none");
					console.log("두번째시 숨김표시");
				}
			});
			
			}
			else if(($("#now").attr("checked") === false)){
				loca_1.each(function(v,index){
					$(this).css("display","inline");
					console.log("첫번째시 표시");
				});
				
				loca_2.each(function(v,index){
					$(this).css("display","inline");
					console.log("두번째시 표시")
				});
			}
			
		
	}
</script>

	

<title>movie_reserve.jsp</title>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span id="centerAddr" style="width:100%;height:100%;position:relative;overflow:hidden;display:none;"></span>
    </div>
</div>
<script>
//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

function displayCenterInfo(result, status) {
    if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}
 var latitude;
 var longitude;
 function geo_success(position) {
		console.log('latitude: ', position.coords.latitude);
		console.log('longitude: ', position.coords.longitude);
		 latitude=position.coords.latitude;
		 longitude=position.coords.longitude;	
		 if(latitude!=null||latitude!=""){
			 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new daum.maps.Map(mapContainer, mapOption);  
			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		 }
	}

		function geo_error() {
		  alert("위치 정보를 사용할 수 없습니다.");
		}

		var geo_options = {
		  enableHighAccuracy: true, 
		  maximumAge        : 0, 
		  timeout           : Infinity
		};
		
		navigator.geolocation.watchPosition(geo_success, geo_error, geo_options);
		
		
	
		Date.prototype.format = function(f) {

		    if (!this.valueOf()) return " ";



		    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

		    var d = this;



		    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {

		        switch ($1) {

		            case "yyyy": return d.getFullYear();

		            case "yy": return (d.getFullYear() % 1000).zf(2);

		            case "MM": return (d.getMonth() + 1).zf(2);

		            case "dd": return d.getDate().zf(2);

		            case "E": return weekName[d.getDay()];

		            case "HH": return d.getHours().zf(2);

		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);

		            case "mm": return d.getMinutes().zf(2);

		            case "ss": return d.getSeconds().zf(2);

		            case "a/p": return d.getHours() < 12 ? "오전" : "오후";

		            default: return $1;

		        }

		    });

		};



		String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};

		String.prototype.zf = function(len){return "0".string(len - this.length) + this;};

		Number.prototype.zf = function(len){return this.toString().zf(len);};




</script>
<input type="hidden" class="theatherId">
<input type="hidden" class="movieId">
<input type="hidden" class="endDate">

	<div class="center" align="center">
		<table class="filteringtb" align="center" >
			<tr id="genre">
				<th style="width: 55px">장르</th>
				<td id="genre1" width="505px" height="92px">
					<div>
					<input type="checkbox" value="멜로" id="ro" onchange="checkmovie()">
					<label for="ro">멜로</label> 
					</div>
					<div>
					<input type="checkbox" value="코미디" id="co" onchange="checkmovie()">
					<label for="co">코미디</label> 
					</div>
					<div>
					<input type="checkbox" value="액션" id="ac" onchange="checkmovie()">
					<label for="ac">액션</label> 
					</div>
					<div>
					<input type="checkbox" value="애니매이션" id="an" onchange="checkmovie()">
					<label for="an">애니매이션</label> 
					</div>
					<div>
					<input type="checkbox" value="판타지" id="fn" onchange="checkmovie()">
					<label for="fn">판타지</label> 
					</div>
					<div>
					<input type="checkbox" value="드라마" id="dr" onchange="checkmovie()">
					<label for="dr">드라마</label> 
					</div>
					<div>
					<input type="checkbox" value="모험" id="mh" onchange="checkmovie()">
					<label for="mh">모험</label>
					
					</div>
					<div>
					<input type="checkbox" value="범죄" id="bum" onchange="checkmovie()">
					<label for="bum">범죄</label>
					</div>
					<div>
					<input type="checkbox" value="SF" id="sf" onchange="checkmovie()">
					<label for="sf">SF</label>
					</div>
					<div>
					<input type="checkbox" value="스릴러" id="si" onchange="checkmovie()">
					<label for="si">스릴러</label>
					</div>
					<div>
					<input type="checkbox" value="어드벤쳐" id="adv" onchange="checkmovie()">
					<label for="adv">어드벤쳐</label>
					</div>
					<div>
					<input type="checkbox" value="다큐멘터리" id="dacu" onchange="checkmovie()">
					<label for="dacu">다큐멘터리</label>
					</div>
					
				</td>

			</tr>

			<tr id="age">
			
				<th>연령</th>
				<td id="age1" align="left">
					<input type="radio" name="age" value="-1" id="all" onchange="checkmovie()" 
					<c:if test="${sessionScope.custBirth<12}">checked="checked"</c:if> >
					<label for="all">전체관람가&nbsp;</label>
					
					<input type="radio" name="age" value="12" id="twelve" onchange="checkmovie()"
						<c:if test="${sessionScope.custBirth<=12}">disabled="disabled" </c:if>
						<c:if test="${sessionScope.custBirth>12}">checked="checked" </c:if>
						>
					<label for="twelve">12세이하&nbsp;</label>
					
					<input type="radio" name="age" value="15" id="fifteen" onchange="checkmovie()"  
						<c:if test="${sessionScope.custBirth<=15}">disabled="disabled" </c:if>
						<c:if test="${sessionScope.custBirth>15}">checked="checked" </c:if>
						
						>
					<label for="fifteen">15세이하&nbsp;</label>
					
					<input type="radio" name="age" value="19" id="eighteen" onchange="checkmovie()"   
						<c:if test="${sessionScope.custBirth<=19}">disabled="disabled" </c:if>
						<c:if test="${sessionScope.custBirth>19}">checked="checked" </c:if>
						
						 >
					<label for="eighteen">필터없음&nbsp;</label></td>
			</tr>
		</table>
	</div>




	<div class="table" align="center">
		<table class="table1">

			<tr id="tb1" align="center">

				<th><div id="day" align="center">&nbsp;날짜&nbsp;</div></th>
				<th id="movie1"><span>&nbsp;영화&nbsp;</span></th>
				<th colspan="3" id="theather"><span>&nbsp;극장&nbsp;</span></th>

				<th id="time" width="140px">
					&nbsp;&nbsp;&nbsp;&nbsp;상영시간&nbsp;&nbsp;&nbsp;&nbsp;</th>
			</tr>


			<tr>
				<td rowspan="3" id="start_time" onchange="checkmovie()" width="253px"><input
					type="hidden" id="hiredate2">
					<div id="datepicker"></div></td>



				<td rowspan="2" height="200px" width="265px">
								<div id="movie" style="overflow-y:scroll;overflow:auto; width:100%; height:100%; padding:0px;text-align: left">
						</div></td>


				<td rowspan="2" id="twotd" width="100px" height="236px"></td>



				<td colspan="2" class="rocation" height="60px"><input type="checkbox"
					value="내위치" id="now" onclick="location_check()"><label for=now>내위치</label></td>




				<td rowspan="1" class="time" width="200px">영화시작시간 <input type="text"
					class="start" width="30px" onkeyup="movie_time()" id="start_ti"
					maxlength=2>시
				</td>



			</tr>
			<tr>
				<td class="lo1" id="lo1"></td>
				<td id="screen" height="190px" width="200px"></td>
				<td rowspan="2"  width="123px" height="190px">
				<div id="movie_time" style="overflow-y:scroll;overflow:auto; width:100%; height:100%; padding:0px;text-align: left">    </div>
				</td>
			</tr>
		</table>

		<div>
			<span id="movie_date"></span> <span id="theaterName"></span>
		</div>
		<div>
			<span id="movie_1"></span> <span id="screen_times_1"></span>
		</div>

		<div>
			영화관 혜택: <span id="haexa"></span>
		</div>

		

	</div>
</body>
</html>