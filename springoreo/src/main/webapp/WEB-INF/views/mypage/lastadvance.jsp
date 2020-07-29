<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>

<title>���� ��ȭ ����</title>

<style>
.r_name {
   float: left;
   display: inline-block;
   margin-top: 20px;
   margin-left: 20px;
   margin-right: 50px;
}

.reserve_a {
   margin-top: 9px;
   float: display:inline-block;
}

.reserve_b {
   margin-top: 20px;
   float: display:inline-block;
}

.reserve_c {
   margin-top: 15px;
   padding: 4px;
   margin: 10px;
   float: right;
   padding: 4px;
}

.page {
   float: center;
   width: 400px;
   text-align: center;
   border: 3px solid gray;
   padding: 10px;
   margin-top: 30px;
   height: 400px;
}

input[type=text] {
   background-color: lightgray;
   border: 3px solid gray;
   border-radius: 7px;
   border: none;
   color: black;
   height: 30px;
}

input[type=password] {
   background-color: lightgray;
   border: 3px solid gray;
   border-radius: 7px;
   border: none;
   color: black;
   height: 30px;
}

body {
   font-family: Arial;
   padding: 10px;
   background: white;
}


.oreo {
   margin-top: 100px;
}
</style>
</head>
<body>
   <center> 
      <!-- �������ų��� 1 -->
      <h4>==2�ް��� ���� ���ų���==</h4>
         <div class="oreo">
            <h2>�������ų���</h2>
               <c:forEach items="${lastmyadvance}" var="lastadvance">
            <div class="page">
               <div class="r_name">
                  �����Ͻ�<br> <br> ���Ź�ȣ <br> <br> ��ȭ�� <br> <br> 
                  ��ȭ���Ͻ� <br> <br> ����<br> <br> �󿵰�<br> <br> ���� �¼��� <br> <br>
                  �¼���ȣ <br> <br> ���� <br> <br>
               </div>

               <div class="reserve">
                  <input readonly="readonly" class="reserve_b" type="text" name="advanceDate" size="25" value="${lastadvance.advanceDate}"><br>
                  <input readonly="readonly" class="reserve_a" type="text" name="advanceId" value="${lastadvance.advanceId}" size="25"><br> 
                  <input readonly="readonly" class="reserve_a" type="text"name="theaterName" size="25" value="${lastadvance.theaterName}"><br> 
                  <input readonly="readonly" class="reserve_a" type="text"
								name="movieDate" size="25"
								value="${fn:substring(lastadvance.screenDate,0,10)}/${lastadvance.screenStartTime}"><br>
                  <input readonly="readonly" class="reserve_a" type="text" name="movieTitle" size="25" value="${lastadvance.movieTitle}"><br> 
                  <input readonly="readonly" class="reserve_a" type="text" name="roomName" size="25" value="${lastadvance.roomName}"><br> 
                  <input readonly="readonly" class="reserve_a" type="text" name="advanceSeatNum" size="25" value="${lastadvance.advanceSeatNum}"><br>
                  <input readonly="readonly" class="reserve_a" type="text" name="seatNumber" size="25" value="${lastadvance.seatNumber}"><br>
               	  <input readonly="readonly" class="reserve_a" type="text" name="snack" size="25" value="${lastadvance.snack}"><br>
               </div>
            </div><br><hr>
            </c:forEach>
            <br><br>
         </div>
  </center>  

</body>

</html>