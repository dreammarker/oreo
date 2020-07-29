<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 내용</title>
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
	width:150px;
}
.title{
	position:relative;
	top:90px;
	right:465px;
	margin-bottom:90px;
}
.commentsTitle{
	position:relative; 
	top:30px;
	left:380px; 
	margin-bottom:30px;
}
h2{
	font-family: 'Nanum Myeongjo', serif;
}
h4{
	font-family: 'Nanum Myeongjo', serif;
}
hr{
	position:relative;
	top:15px;
	width:1140px;
}
.comments{
	width:500px;
	position:relative;
	left:370px;
}
</style>
<script>
$(function(){
	
	$("#btnCommentAdd").click(function(){
		result = confirm("등록하겠습니까?");
		   if(result == true){
		var requestData = {comName:$("[name=name]").val() ,
							comContent:$("[name=content]").val(),
							boardseq : "${OneView.inquiryId}"};
		   }
	 	/*requestData= $("#commentFrm").serialzie();
		requestData.inquiryId = "${OneView.inquiryId}"; */
		$.ajax({
			url : "../insertComments",
			data : requestData,
			dataType : 'json',
			success : function(data) {
					var html = '<div id = "div'+data.seq+'">'+
									'<div><B>'+data.comName+'</B></div>'+
									'<div style="margin:10px;">'+data.comContent+'</div>'+
									'<div style="margin:10px;">'+data.regdate+'</div>'+
									'<div style="margin:10px;">'+
										'<input type="button"  class="btn btn-xs btn-success  btnCommentModify" data-toggle="modal" style="width:40px;height:30px" value="수정" data="'+data.seq+'"/>'+
									
										'<input type="button" class="btn  btn-xs btn-danger  btnCommentDel" style="width:40px;height:30px;margin-left:4px;" value="삭제" data="'+data.seq+'" />'+
									'</div>'+
								'</div>'+
								'<hr>';
					$("#commentsList").append(html);
			}
		});
	});
	
 	$("#commentsList").on("click",".btnCommentDel",function(){
		result = confirm("삭제하겠습니까?");
	      if(result == true){
		  	var requestData={"seq" :  $(this).attr("data")}
				$.ajax({
					url : "${pageContext.request.contextPath}/deleteComments",
					data : requestData,
					dataType : 'json',
					success : function(data) {
			               $("#div"+data.seq).remove();
			               alert('처리되었습니다');
			               
			      		}
				});
	   		}
	});
	//수정처리
 	$("#btnCommentModify").click(function(){
		 result = confirm("수정하겠습니까?");
	      if(result == true){
		 		var requestData = {
		 						   comName:$("[name=comName]").val() ,
								   comContent:$("[name=comContent]").val(), 
								   seq:$("[name=seq]").val()
		 						  }
	     					 
				$.ajax({
					url : "${pageContext.request.contextPath}/updateComments",
					data : requestData,
					dataType : 'json',
					success : function(data) {
						var html =  '<div id = "div'+data.seq+'">'+
										'<div><B>'+data.comName+'</B></div>'+
										'<div style="margin:10px;">'+data.comContent+'</div>'+
										'<div style="margin:10px;">'+data.regdate+'</div>'+
										'<div style="margin:10px;">'+
											'<input type="button"  class="btn btn-xs btn-success  btnCommentModify" style="height:30px;width:40px;" data-toggle="modal" value="수정" data="'+data.seq+'"/>'+
										
											'<input type="button" class="btn btn-xs btn-danger  btnCommentDel" style="height:30px;width:40px;margin-left:4px;" value="삭제" data="'+data.seq+'" />'+
										'</div>'+
									'</div>'+
									'<hr>';
						$("#div"+data.seq).replaceWith(html);
						$("#modifyModal").modal('hide');
						}
					
					});
	     	}
	      
	}); 
	 
	 //수정팝업 호출
	$("#commentsList").on("click",".btnModifyPopup",function(){
		   
		 	 var seq = $(this).attr("data");
		 	 var name = $("#div"+seq).find("div").eq(0).text();
		 	 var content = $("#div"+seq).find("div").eq(1).text();
		 	 
		 	 $("#seq").val(seq);
		 	 $("#comName").val(name);
		 	 $("#comContent").val(content);
	         $("#modifyModal").modal();
	         
	     });
	 
	
}); 

</script>
</head>
<body>
  <div class="title">
		<h2>고객님의 가르침</h2>
	</div>
   <div class="container" style= "margin-top:100px">
      <table class="table table-bordered" >
         
         <tbody>
         
               <tr>
                  <th>작성자</th>
                  <td>${OneView.custId}</td>
                  <td style="width:150px;text-align:center;">${OneView.inquiryDate}</td>
                  <td style="width:100px;text-align:center;">조회수 : ${OneView.inquiryCheck}</td>
               </tr>

               <tr>
                  <th>제목</th>
                  <td colspan="3">${OneView.inquiryTitle}</td>
               </tr>
               
               <tr style="height:100px;">
                  <th style="vertical-align:middle;">내용</th>
                  <td colspan="3">${OneView.inquiryContent}</td>
               </tr>
		
         </tbody>
      </table>
     
     <c:if test="${sessionScope.custId==OneView.custId}">  
      <span style="display:none;">${OneView.inquiryId}</span><a href="#"> 
      <a href="../deleteInquiry/${OneView.inquiryId}">
      <input type="button" value="삭제"  class="btn btn-default pull-right" />
      </a>
   	 </c:if>  
    
    <c:if test="${sessionScope.custId==OneView.custId}">  
     <a href="../inquiryUpdate/${OneView.inquiryId}">
      <input type="button" value="수정" class="btn btn-default pull-right" />
      </a>
    </c:if>
      <a href="../getInquiryList">
        <input type="button" value="목록" class="btn btn-default pull-right" /> </a>
   </div>
   
 
		
	<!-- 수정 Modal -->
		<div class="modal fade" id="modifyModal" role="dialog">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Oreo</h4>
          </div>
          <div class="modal-body">
              <div class="form-group">
                  <label for="replyNo">댓글 번호</label>
                  <input class="form-control" id="seq" name="seq" readonly />
              </div>
              <div class="form-group">
                  <label for="replyWriter">댓글 작성자</label>
                  <input class="form-control" id="comName" name="comName" placeholder="작성자를 입력해주세요" />
              </div>
               <div class="form-group">
                  <label for="replyText">댓글 내용</label>
                  <textarea class="form-control" rows="5"  id="comContent" name="comContent" style="margin-bottom:20px;"></textarea>
                  <!-- <input class="form-control" id="comContent" name="comContent" placeholder="댓글 내용을 입력해주세요"/> -->
              </div>
          </div>
          <div class="modal-footer">
              
              <input type="button" class="btn btn-success" id="btnCommentModify" value="수정"/>
              <input type="button" class="btn btn-default" data-dismiss="modal" value="닫기"/>
          </div>
      </div>
  </div>
</div>
	
	<div class="commentsTitle">
		<h4>댓글</h4>
	</div>
   <hr>
	<div class="comments">
		 <div id="commentsList">
			 <c:forEach var="com" items="${comments}"> 
			 	<div id="div${com.seq}">
				 	<div style="margin:10px;"><B>${com.comName}</B></div>
				 	<div style="margin:10px;">${com.comContent}</div>
				 	<div style="margin:10px;">${com.regdate}</div>
				 	<div style="margin:10px;">
				 	
				 		<input type="button"  class="btn btn-xs btn-success  btnModifyPopup" data-toggle='modal' value="수정" data="${com.seq}" style="height:30px;width:40px;"/>
				 		<input type="button" class="btn  btn-xs btn-danger  btnCommentDel" value="삭제"  data="${com.seq}" style="height:30px;width:40px;"/>
				 	
				 	</div>
				 	<hr>	
				</div>
			 </c:forEach> 
		 </div>

   	</div>
   		<!-- 댓글 작성 -->
		  <c:if test="${sessionScope.custId=='admin'}">
   
   
		<form id="commentFrm"> 
			<div class="form-group container">
						<input type="hidden" name="name" class="form-control" style="width:500px;margin-bottom:30px;" value="${sessionScope.custId}"> 
				<label for="formGroupExampleInput" style="margin-bottom:20px;margin-top:20px;">댓글 내용</label>
						<textarea class="form-control" rows="5" name="content" style="margin-bottom:20px;" placeholder="댓글을 입력해주세요"></textarea>
				<input type="button" id="btnCommentAdd" value="댓글 등록" class="btn btn-default pull-right" />
			</div>
		</form>
		</c:if>	
</body>
</html>