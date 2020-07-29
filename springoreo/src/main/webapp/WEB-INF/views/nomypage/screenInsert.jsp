<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>
</style>
<body>
	
	날짜선택: <input type="text" id="date"  class="datepicker" style="width:200px;background-color: gray;" value="${param.showDt}">     
	<script>
	
$(function() {
	$(".datepicker").datepicker({
		dateFormat : 'yymmdd',
		 changeMonth: true,
	      changeYear: true,
	      onSelect : function(text, object) {
				$("#datehi").text(text); //obj.currentYear 년도만
				console.log($("#datehi").text());
			}
	});
	
});
function movie_insert(){
	var showDt = document.getElementById('date').value;
	$("[name=action]").text(showDt);
	if(showDt!=null||showDt!=""){
		location.href="insertScreen?showDt="+showDt;
	}
	else if(showDt==null||showDt==""){
		alert("날짜값을 선택해주세요");
	}
}
function movie_check(){
	var showDt = document.getElementById('date').value;
	if(showDt==null||showDt==""){
		alert("날짜값을 선택해주세요")
	}
	else if(showDt!=null||show!=""){
		location.href="checkScreen?showDt="+showDt;
	}
}
</script>	
	<input type="button" value="영화시간표조회" onclick="movie_check()">		    
	<input type="button" value="영화시간표등록" onclick="movie_insert()">
	<input type="hidden" id="datehi" name="action">
	

	
	<table>
	<tr>
	<td>영화제목</td>
	<td>영화시간</td>
	<td>극장이름</td>
	</tr>
	<c:forEach items="${List}" var="p" varStatus="a">
         <tr>
                     
            <td>${p.movieTitle}</td>
            <td>${p.screenStartTime}</td>
            <td>${p.theaterName}</td>
            
         </tr>
      </c:forEach>
	</table>
  <my:paging paging="${paging}"> </my:paging> 
	<script>
	
	function doList(page){
		var showDt=$("#datehi").text();
		location.href="./checkScreen?page="+page+"&showDt="+${param.showDt};
	}
	</script>
</body>
</html>