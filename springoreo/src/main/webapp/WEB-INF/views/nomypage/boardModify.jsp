<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
th{

text-align:center;
}
.title{
	position:relative;
	top:90px;
	right:320px;
	margin-bottom:90px;
}
h2{
	font-family: 'Nanum Myeongjo', serif;
}

</style>

</head>
<body>
  <div class="title">
		<h2>변화를 읽는 것, Oreo의 지향점입니다.</h2>
	</div>
   <div class="container" style= "margin-top:100px">
    <form action="../inquiryUpdate/${OneView.inquiryId}" method="post">
     <input type="hidden" name="action" value="update"/>
     <input type="hidden" name="inquiryId" value="${OneView.inquiryId}"/>
     <input type="hidden" name="inquiryCheck" value="${OneView.inquiryCheck}"/>
     <input type="hidden" name="inquiryDate" value="${OneView.inquiryDate}"/>
      <table class="table table-bordered">
         
         <tbody>

               <tr>
                  <th style="vertical-align:middle;">작성자</th>
                  <td><input type="text" name="custId" 
                     class="form-control" value="${OneView.custId}" readonly/></td>
               </tr>

               <tr>
                  <th style="vertical-align:middle;">제목</th>
                  <td><input type="text"  name="inquiryTitle"
                     class="form-control" value="${OneView.inquiryTitle}"/></td>
               </tr>

               <tr>
                  <th style="vertical-align:middle;">내용</th>
                  <td><textarea class="form-control" rows="5" name="inquiryContent"
                        id="comment">${OneView.inquiryContent}</textarea></td>
               </tr>
            
         </tbody>
      </table>
      <script>
   
      </script>
		<%-- <c:if test="${sessionScope.custNum==OneView.custNum}">   --%>
      <input type="button" value="취소" onclick="history.go(-1);" class="btn btn-default pull-right" />
      <input type="submit" value="완료" class="btn btn-default pull-right" />
       <%-- </c:if> --%>
      </form>
   </div>
</body>

</html>