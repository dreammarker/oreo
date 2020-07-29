<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>getSeatList.jsp</title>
<style>
ul, ol {
    list-style: none;
    float: left;
    overflow: hidden;
    padding: 0;
    margin: 0;
}

.colsHead {
    width: 100%;
    padding-left: 60px;
}
.rowsHead {
    width: 60px;
}

li {
    width: 70px;
    height: 50px;
    border: 1px;
    text-align: center;
    line-height: 50px;
}

.seat li {
    float: left;
    border: 1px solid black;
}

.colsHead li {
    float: left;
    border: 1px solid white;
}
.rowsHead li {
    border: 1px solid white;
}

.reserve {
    background-color: gray;
}

.seat .ui-selected {
    background: red; color: white;
}

.seat .ui-reserved {
    background: gray; 
}
</style>
<script>
	$(function(){
		
		var $seat=$(".seat"),
	    	$result = $('.result'),
	        $count = 0,
	        $colsHead = $('.wrap, .colsHead'),
	        $rowsHead = $('.wrap, .rowsHead');
		
		var updateView = function() {
		    var makeTag = '', i = 1, leng = 0;
	
		    colsNum = 10;
		    rowsNum = 8;
	
		    for(i = 0, leng = colsNum * rowsNum; i < leng; i++) {
		    	var colsIndex = (i % colsNum)+1;
				var rowsIndex = Math.ceil((i + 1) / colsNum);
				var rowsName = String.fromCharCode((64 + rowsIndex));
		    	var id = rowsName+colsIndex;
				var style = "";
				
				if("${reserveseat}".indexOf(id) >= 0){
					style = "class = 'ui-reserved'";
				} 
				
		        if( i % colsNum === 0 ) {
		            makeTag += "<li id='"+id+"' style='clear:both;'" +style+ " ></li>";
		        } else {
		            makeTag += "<li id='"+id+"'" +style+ "></li>";
		        }
		    }
		    $seat.html(makeTag);
		    
		    //colheader
		    for(makeTag = '', i = 1, leng = colsNum; i <= leng; i++) {
		        makeTag += '<li>' + i + '</li>';
		    }
		    $colsHead.html(makeTag);
		    
			//rowheader
		    makeTag="";
		    for(i = 65, leng = 65 + rowsNum; i < leng; i++) {
		        makeTag += '<li>' + String.fromCharCode(i) + '</li>';
		    }
		    
		    $rowsHead.html(makeTag);
		    $result.html('없음');
		    
		    $("#remainSeat").val(parseInt($("#totalSeat").val()) - $(".ui-reserved").length);
		}
	
	//인원선택
	$(".bt_up").click(function() {
		var n = $(".bt_up").index(this);
		var num = $(".num:eq(" + n + ")").val();
		
		var num1 = parseInt($(".num:eq(0)").val());
		var num2 = parseInt($(".num:eq(1)").val());
		
		console.log(num1+num2);
		if((num1+num2) > 7){
			alert("예매 가능한 인원수는 8명까지입니다.");
			
			return;
		}
		num = num * 1 + 1;
		$(".num:eq(" + n + ")").val(num);
		
		total();
		
	});

	$(".bt_down").click(function() {
		var n = $('.bt_down').index(this);
		var num = $(".num:eq(" + n + ")").val();
		if (num > 0)
			num = $(".num:eq(" + n + ")").val(num * 1 - 1);
		
		total();
		
	});
	
	

	//선택된 좌석이름 출력
	var getSeatName = function(index) {
		var colsIndex = (index % colsNum) + 1, 
			rowsIndex = Math.ceil((index + 1) / colsNum) - 1, 
			rowsName = String.fromCharCode((65 + rowsIndex));

		return rowsName + colsIndex ;
	};

	$("select").on('input', 'input', function() {
		updateView();
		return false;
	});

	//좌석 선택
	$(".seat").on("click", "li", function() {
		
		//예매된 좌석 선택X
		if($(this).hasClass("ui-reserved")){
			alert("이미 예약된 좌석입니다.");
				return;   		
		}
		
		var selectedSeat = [];
	        
	        $result.html('');
	       
	        var num1 = parseInt($(".num:eq(0)").val());
    		var num2 = parseInt($(".num:eq(1)").val());
    		var cnt = $seat.find('li.ui-selected').length;
    		var index = $seat.find("li").index( this );
    	
    		
    		if($(this).hasClass("ui-selected")){
    			$(this).removeClass("ui-selected");
    		}else if((num1+num2) > cnt){           
            	$result.append( " #" + ( index + 1 ) );
            	console.log($(this));
            	 $(this).addClass("ui-selected");
            } else{
            	alert("인원을 선택해주세요.");
            }
            
	        $(".ui-selected").each(function() {
	            var index = $seat.find("li").index( this );
	            selectedSeat.push(getSeatName(index));
	        });
	        
	      
       $count=cnt;	
       $result.val( selectedSeat.join(', ') );
	});
	
	//영화 금액
    function total() {
		var sum = 0;
		var person_num = parseInt($("#audlt").val())+parseInt($("#student").val());
		
		$("#personNum").val(person_num);
		$(".num").each(function(idx, obj) {
			console.log($(this).val()+":"+idx);
			if(idx == 0 ){
				sum += $(this).val()* 9000;
			
		}
			else{
				sum += $(this).val()* 7000;		
	}
		});

		$("[name=seatPrice]").val(sum);
		
		

	}

	updateView();
});
	
	
</script>

</head>
<body>
<h4 align="center">인원선택</h4> <br>
	<p align="center">
		일반   
		<input type="text" class="num" id="audlt" style="text-align: right" value="0" size="1" onchange="change();" readonly> 
		<input type="button" value="-" class="bt_down">
		<input type="button" value="+" class="bt_up" > 
		청소년
		<input type="text" class="num" id="student" style="text-align: right" value="0" size="1" onchange="change();" readonly> 
		<input type="button" value="-" class="bt_down">
		<input type="button" value="+" class="bt_up" >
	
	</p>
<hr>
<br>

<div align="center">
<input type="text" id="remainSeat" style ="text-align:right; border:0px; font-size:20px; color:blue" readonly="1">&nbsp&nbsp/ &nbsp
<input type="text" id="totalSeat" value="80" style ="border:0px; font-size:20px;" readonly="1"> 
</div>

<div style="position: relative; top:20px;left:550px;">
    <ul class="colsHead"></ul>
    <ul class="rowsHead"></ul>
    <ol class="seat"></ol>
</div>
<br>
<form action="getSnackList" method="post" name="seat_info" class="select" style="position:relative; top:450px;">
<input type="hidden" name="action" value="snack"/>
	총 인원 		<input type="text" name ="personNum" id="personNum" readonly/>
	좌석 명  		<input type="text"  class="result" name ="seatName" id="seatName" readonly/> <br><br>
	금액 		<input type="text" name="seatPrice" id="seatPrice" style = "text-align:right" size="10" value="0" readonly>원 <br><br>
	<button id="snack" class="btn btn-default" style="margin-bottom:70px">스낵선택</button>

</form>
</body>
</html>