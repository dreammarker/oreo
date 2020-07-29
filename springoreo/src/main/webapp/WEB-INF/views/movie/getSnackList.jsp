<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>getSnackList.jsp</title>
<script>
		$(function() {
			
			//checkbox 선택 -> 버튼 disable
			$(".checkbox").change(function(){
				if($("#nocheck").is(":checked")) {
					$(".btn1 input").prop("disabled", true);
				} else {
					$(".btn1 input").prop("disabled", false);
				}
				
				 if($("#nocheck1").is(":checked")) {
					 $(".btn2 input").prop("disabled", true);
						
					} else {
						$(".btn2 input").prop("disabled", false);
					
					}
				
				if($("#nocheck2").is(":checked")) {
					$(".btn3 input").prop("disabled", true);
					
				} else {
					$(".btn3 input").prop("disabled", false);
				
				}
				total();
			});

			$(".bt_up").click(function() {
				var n = $(".bt_up").index(this);
				var snack_cnt = $(".snack_cnt:eq(" + n + ")").val();
				snack_cnt = $(".snack_cnt:eq(" + n + ")").val(snack_cnt * 1 + 1);
				total();
			});

			$(".bt_down").click(function() {
				var n = $('.bt_down').index(this);
				var snack_cnt = $(".snack_cnt:eq(" + n + ")").val();
				if (snack_cnt > 0)
					snack_cnt = $(".snack_cnt:eq(" + n + ")").val(snack_cnt * 1 - 1);
				total();
			});
			
			 $("#pay").click(function(){
				 var snack = "";
				$(".snack_cnt").each(function(){
					if($(this).val() > 0){
						snack += $(this).parent().prev().prev().text()+ "_" + $(this).val() + ", ";
					}
				});						
				
				snack = snack.substring(0, snack.length-2);
				$("[name=snack]").val(snack);
				
			});
			
			//금액 합계
			function total() {
				var sum = 0;
				$(".snack_cnt").each(function(idx, obj) {
					var price = $(this).parent().prev().text() * 1;
					var cnt = $(this).val();
					if($(this).prop("disabled") == false) {
						sum += price * cnt;
					} 
					
				});

				$("#snackPrice").val(sum);
				$("#paymentAmount").val(parseInt($("#snackPrice").val()) + parseInt($("#seatPrice").val()));

			}
			
		});
	</script>
</head>
<body>
<div class="row" align="center" style="margin-top:100px">
		<table class="table table-bordered table-dark table-sm" style="width:70%;">

			<tr align="center">

				<th colspan="3">팝콘</th>
				<th colspan="3">음료</th>
				<th colspan="3">기타</th>

			</tr>

			<tr align="center">
				<td colspan="3"><input type="checkbox" class = "checkbox" id="nocheck"> <label
					for=nocheck>선택안함</label></td>

				<td colspan="3"><input type="checkbox" class = "checkbox" id="nocheck1"> <label
					for=nocheck1>선택안함</label></td>

				<td colspan="3"><input type="checkbox" class = "checkbox" id="nocheck2"> <label
					for=nocheck2>선택안함</label></td>

			</tr>

			<tr>
				<td>오리지널(M)</td>
				<td>4500</td>
				<td class="btn1">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc1_1" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>사이다</td>
				<td>2000</td>
				<td class="btn2">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc2_1" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>나쵸</td>
				<td>4500</td>
				<td class="btn3">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc3_1" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>
			</tr>

			<tr>
				<td>오리지널(L)</td>
				<td>5000</td>
				<td class="btn1">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc1_2" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>콜라</td>
				<td>2000</td>
				<td class="btn2">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc2_2" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>핫도그</td>
				<td>4500</td>
				<td class="btn3">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc3_2" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>
			</tr>

			<tr>
				<td>카라멜</td>
				<td>5000</td>
				<td class="btn1">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc1_3" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>환타</td>
				<td>2000</td>
				<td class="btn2">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc2_3" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>츄러스</td>
				<td>3000</td>
				<td class="btn3">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc3_3" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

			</tr>

			<tr>
				<td>어니언</td>
				<td>4500</td>
				<td class="btn1">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc1_4" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>마운틴듀</td>
				<td>2000</td>
				<td class="btn2">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc2_4" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>

				<td>오징어</td>
				<td>3500</td>
				<td class="btn3">
				<input type="button" value="-" class="bt_down"> 
				<input type="text" id="etc3_4" class="snack_cnt" style="text-align: right" value="0" size="2" onchange="change();" readonly> 
				<input type="button" value="+" class="bt_up" >
				</td>
			</tr>
		</table>

	</div>

	<br>
	
	<form action="getPaymentList" method="post" name="snack_info">
	<div class="snack_price" align="center">
	<input type="hidden" name="action" value="pay"/>
	<input type="hidden" id = "snack" name="snack"/>

		영화금액 <input type="text" id="seatPrice" style = "text-align:right" size="6" value="${sessionScope.seatPrice}" readonly> 원 
		스낵 금액 <input type="text" id="snackPrice" name="snackPrice" style = "text-align:right" size="6" value="0" readonly> 원 <br><br>
		총 금액<input type="text" id="paymentAmount" name="paymentAmount" style = "text-align:right" size="6" value="${sessionScope.seatPrice}" readonly> 원 <br><br>
		<input type="button" class="btn btn-default" onclick="history.go(-1)" value="뒤로가기">
		<input type="submit" class="btn btn-default" id="pay" value="결제">
		
	</div>
	</form>
</body>
</html>