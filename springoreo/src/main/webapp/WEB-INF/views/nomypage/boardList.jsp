<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head><title>목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
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
h1{
	font-family: 'Nanum Myeongjo', serif;
}

.title{
	position:relative;
	top:90px;
	left:360px;
}
th{

text-align:center;
}
hr{
	position:relative;
	top:10px;
	right:360px;
	width:1140px;
}
</style>
<script>
 $(function(){
	$(".inquiry_id_a").click(function(){
		var id = $(this).prev().text();
		location.href='${pageContext.request.contextPath}/getInquiry/{inquiry_id}'+id;
	});
 });
</script>
</head>
<body>
<div class="title">
	<h1>고객문의</h1><hr>
</div>
<div class="container" style= "margin-top:100px">
  
  <div>          
  <table class="table table-bordered table-striped table-hover">
    <thead>
      <tr>
        <th>#</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${inquiryList}" varStatus="s">
      <tr>
        <td>${s.count}</td>
        <td><span style="display:none;">${list.inquiryId}</span>
        <a href="getInquiry/${list.inquiryId}">${list.inquiryTitle}</a></td>
        <td>${list.custId}</td>
        <td>${list.inquiryDate}</td>
        <td>${list.inquiryCheck}</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
   <c:if test="${not empty sessionScope.custId}">
	 <a href="./insertInquiry"><d class="btn btn-default pull-right">글쓰기</d></a>
 </c:if>
  </div>
     <div class="center">
      <div class="pagination">
  <my:paging paging="${paging}"></my:paging>
  
  <script>
  	function doList(page){
  		location.href="./getInquiryList?page="+page
  	}
  </script>
   </div>
   </div>
  
</div>
</body>
</html>