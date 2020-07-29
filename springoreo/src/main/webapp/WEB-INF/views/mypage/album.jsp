<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<title>앨범</title>

<style>
.oreo {
   margin-top: 100px;
}

</style>

<head>
<script>

/*  var com=${album_comment};
 function check(){
	 if(com==null){
		 $("#insertbtn").show();
		 $("#updatebtn").hide();
	 }
	 else{
		 $("#insertbtn").hide();
		 $("#updatebtn").show();
	 }

 } */
 
 function deletebtn(id){
	 	alert("앨범이 삭제되었습니다.")
		 location.href="./deleteMyalbum?albumId="+id; 
		
	}

function updatebtn(id){
		alert("앨범이 수정되었습니다.")
		document.forms["frm"+id].action.value="updateMyalbum";
		document.forms["frm"+id].submit();
		
	}

function insertbtn(id){
		alert("앨범이 입력되었습니다.")
	 	document.forms["frm"+id].action.value="insertMyalbum";
		document.forms["frm"+id].submit(); 
		
	}	



</script> 
</head>
<body>
<div class="oreo">
            <h2>영화앨범</h2>


<c:forEach items="${album}" var="albumlist">

<c:if test="${empty albumlist.albumId}">
	<c:set value="insertMyalbum" var="u"/>
</c:if>

<c:if test="${not empty albumlist.albumId}">
	<c:set value="updateMyalbum" var="u"/>
</c:if>

<form name="frm" id="frm${albumlist.movieId}" action="./${u}" method="post">
<input type="hidden" name="action" value="">
<input type="hidden" name="custNum" value="${albumlist.custNum}" >
<input type="hidden" name="movieId" value="${albumlist.movieId}" > 

<table class="albumtb" border=2 align="center" style="margin-top:100px";>
<tr>
	<th width=100px height=50px>영화 제목</th>
	<td width=500px colspan="2">${albumlist.movieTitle}</td>
</tr>
<tr>
	<th height=200px rowspan="2">
	<img style="height:250px" src="${albumlist.moviePoster}"></th>
	<td rowspan="2"><input type="text" name="albumComment" class="comment" style="width:500px;height:250px;" value="${albumlist.albumComment}">
	</td>
	<th>

	<c:if test="${empty albumlist.albumId}">
	<input type="button" value="등록" class="insertbtn"  onclick="insertbtn(${albumlist.movieId})" style="height:120px;">
	</c:if>
	<c:if test="${not empty albumlist.albumId}">
	<input type="button" value="수정" class="updatebtn"  onclick="updatebtn(${albumlist.movieId})" style="height:120px;">
	</c:if>
	</th>
</tr>
<tr>
	<th><input type="button" value="삭제"  class="deletebtn" onclick="deletebtn(${albumlist.albumId})" style="height:120px;"></th>
</tr>
</table>
</form>
</c:forEach> 


<!-- <div class="bt">


<img  class="img1" src="movie_1.jpg" /> 
<textarea rows="19" cols="80" tabindex="2" name="mov1" class="text1"></textarea>
<input type="button" name="but1" value="확인" onclick="inputCheck()"> 
</div>

<div class="bt1">
<img src="movie_2.jpg" class="img2"/> 
<textarea  rows="19" cols="80"tabindex="2" name="mov2" class="text2"></textarea>
<input type="button" name="but1" value="확인" onclick="inputCheck1()"> 
</div>
<div class="bt2">
  <img src="movie_3.jpg" class="img3"/> 
<textarea  rows="19" cols="80"    tabindex="2" name="mov3" class="text3"></textarea>
<input type="button" name="but1" value="확인" onclick="inputCheck2()"> 
 </div> -->

</div>
</body>
</html>