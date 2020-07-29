<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>내가 쓴 리뷰</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

/***header***/
div.top_menu {
   float: right;
   margin: 5px;
   padding: 1px 3px 1px 3px;
   font-size: 70%;
}

element.style {
   
}

* {
   box-sizing: border-box;
}

input.start {
   width: 30px;
}

input#date {
   margin-top: 10px;
}

* {
   box-sizing: border-box;
}

element.style {
   
}

* {
   box-sizing: border-box;
}

td#theather {
   width: 300px;
}

.center {
   margin-top: 100px;
   margin-bottom: 6%;
   text-align: center;
}

#tb1 {
   text-align: center;
   background: #333;
   color: ghostwhite;
}



#start_time {
   border-right: 20px solid #f1f1f1;
}


/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {
   margin: auto;
   width: 75%;
}

/* Right column */
.rightcolumn {
   float: left;
   width: 25%;
   background-color: #f1f1f1;
   padding-left: 20px;
}

nav {
   float: left;
   max-width: 160px;
   margin: 0;
   padding: 1em;
}

article {
   margin-left: 170px;
   border-left: 1px solid gray;
   padding: 1em;
   overflow: hidden;
}

.lo1 {
   border-right: 1px solid gray;
}

textarea {
   width: 100%;
   height: 150px;
   padding: 12px 20px;
   box-sizing: border-box;
   border: 2px solid #ccc;
   border-radius: 4px;
   background-color: #f8f8f8;
   font-size: 16px;
   resize: none;
}

/* Fake image */
.fakeimg {
   background-color: #ccc;
   width: 100%;
   padding: 20px;
}

/* Add a card effect for articles */
.card {
   background-color: white;
   padding: 20px;
   margin-top: 30px;
}

/* Clear floats after the columns */
.row:after {
   content: "";
   display: table;
   clear: both;
}

@media screen and (max-width: 800px) {
   .leftcolumn, .rightcolumn {
      width: 100%;
      padding: 0;
   }
}

.snack_price {
   margin-top: 1%;
   background-color: #f1f1f1;
}

input>snack_text {
   background-color: #f1f1f1;
   background: #f1f1f1;
}

.payment {
   align: center;
}

#tb2 { /* table-layout: fixed; */
   width: 850px; /* padding-left: unset; */
}

@media screen and (max-width: 400px) {
   .topnav a {
      float: none;
      width: 100%;
   }
}

.rocation {
   border-bottom: 1px solid gray;
}

.time {
   border-left: 15px solid #f1f1f1;
}

table.filteringtb td, th {
   border: 2px solid lightgray
}

table.filteringtb {
   border-spacing: 0;
   border-collapse: collapse;
}

table{
   margin-top: 50px;
}

</style>
</head>
<body>

<div class="container">
  
  <div class="table-responsive">          
  <table class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>3</td>
        <td><a href="#">어벤져스</a></td>
        <td>재밌었어요~</td>
        <td>2018.05.09</td>
      </tr>
      
      <tr>
        <td>2</td>
        <td><a href="#">챔피언</a></td>
        <td>별로에요ㅠㅠ</td>
        <td>2017.07.01</td>
      </tr>
      
      <tr>
        <td>1</td>
        <td><a href="#">괴물</a></td>
        <td>해피엔딩이에요</td>
        <td>2015.12.09</td>
      </tr>
    </tbody>
  </table>
  <div class="text-center">
  <ul class="pagination">
     <li><a href="#">1</a></li>                  
  </ul>
  
  </div>
  </div>
</div>
</body>
</html>