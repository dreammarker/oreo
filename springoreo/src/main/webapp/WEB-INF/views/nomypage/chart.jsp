<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="//www.google.com/jsapi"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#date").datepicker({
			dateFormat : 'yy-mm-dd',
			defaultDate : "+1w",
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			fistDay : 1,
		});
	});

	$(function() {

		$("[name=radio]").on("click", function() {
			if($("#date").val() != ""){	
				if ($(this).attr("id") == "radio-1") {
					daychart();
				} else if ($(this).attr("id") == "radio-2") {
					monthchart();
				}
			}
			else{
				alert("날짜를 선택해주세요!");
			}
		});
		
		$("#salesExcel").on("click", function() {
			if($("#date").val() != ""){
				
			}
			else{
				alert("날짜를 선택해주세요!");
			}
		});
	});

	google.load('visualization', '1.0', {'packages' : [ 'corechart' ]});
	google.setOnLoadCallback(function() {});

	function daychart() {

		var option = {
			title : '일별 매출현황',
			width : 1000,
			height : 800,
			is3D : true
		};

		var data = [ [ '날짜', '매출' ] ];

		//data(ajax)
		$.ajax({
			url : "${pageContext.request.contextPath}/salesStatusDay",
			data : {
				advanceDate : $("#date").val()
			},
			dataType : 'json',
			success : function(res_data) {
				console.log(res_data);
				if(res_data.length > 0 ) {
				
					for (i = 0; i < res_data.length; i++) {
						var Date = res_data[i].Date;
						var Total = res_data[i].Total;
						var temp = [ Date, Total ];
						data.push(temp);
					}
					console.log(data);
					var chart = new google.visualization.ColumnChart(document.querySelector('#chart')); //차트 그려질 태그 지정(= getElementById)
					chart.draw(google.visualization.arrayToDataTable(data),	option); //차트데이터 변수
				}
			}
		});
	}

	function monthchart() {

		var options = {
			title : '월별 매출현황',
			width : 1000,
			height : 800,
			is3D : true
		};

		var data = [ [ '날짜', '매출' ] ];

		//data(ajax)
		$.ajax({
			url : "${pageContext.request.contextPath}/salesStatusMonth",
			data : {
				advanceDate : $("#date").val()
			},
			dataType : 'json',
			success : function(res_data) {
				for (i = 0; i < res_data.length; i++) {
					var Date = res_data[i].Date;
					var Total = res_data[i].Total;
					var temp = [ Date, Total ];
					data.push(temp);
				}
				console.log(data);
				var chart = new google.visualization.ColumnChart(document.querySelector('#chart')); //차트 그려질 태그 지정(= getElementById)
				chart.draw(google.visualization.arrayToDataTable(data), options); //차트데이터 변수
			}
		});
	}
	
</script>
</head>
<body>
	<div>
	<form action="./salesExcelView">
		<fieldset>
			<h3>매출현황</h3>
			<input type="text" id="date" name="advanceDate" /> 
			
			<input type="radio" name="radio" id="radio-1"/> 
			<label for="radio-1">Day</label>

			<input type="radio" name="radio" id="radio-2"/> 
			<label for="radio-2">Month</label>&nbsp;&nbsp;
			
			<button type="submit" class="btn btn-default" id="salesExcel"> 매출현황(일별) 다운</button>
		</fieldset>
		</form>	
		
	</div>

	<div id="chart"></div>
</body>
</html>