<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>getPaymentList.jsp</title>
<style>
tr{
	border:0px;
}
th{
	width:200px;
	height:60px;
	text-align:center;
}
td{
	width:400px;
	border:0px;
}
img.card-img-top {
    margin-top: 30px;
}
</style>
<script>
	$(function(){
		$("#payment_card").hide();
		$("#payment_cash").hide();
		$("#payment_tcash").hide();
		
		$("[name=paymentMethod]").on("click", function(){
			if($(this).attr("id") == "paymethod1"){
				$("#payment_cash").show();
				$("#payment_card").hide();
				$("#payment_tcash").hide();
			} else if ($(this).attr("id") == "paymethod2"){
				$("#payment_card").show();
				$("#payment_cash").hide();
				$("#payment_tcash").hide();
			}else if ($(this).attr("id") == "paymethod5"){
				$("#payment_tcash").show();
				$("#payment_cash").hide();	
				$("#payment_card").hide();
			}else {
				$("#payment_card").hide();
				$("#payment_cash").hide();
				$("#payment_tcash").hide();
			}		
			
		});

		
	$("#pay").click(function(){
		alert("결제가 완료되었습니다.");
		
	});
	
});	
	
	//적립금
	function mileagecheck() {
	    var unit = 0;
	
	    //1000원 단위 입력
	    var mileage = parseInt($("#mileage").val());
	    
	    console.log(mileage);
	    console.log('${mileage}');
	    if( mileage % 1000 != 0  ) {	    	
	    	$("#mileage").val(0);
	    	$("#mileage").focus();
	    	return;
	    }
	    //적립금 초과 여부
	    
	    if(mileage > parseInt('${mileage}')){
	    	alert("사용가능한 적립금을 초과했습니다.");
	    	$("#mileage").val(0);
	    	$("#mileage").focus();
	    	return;
	    }
	    //결제금액 초과 여부
	    if(mileage > parseInt($("#paymentAmount").html())) {	 
			alert('적립금액이 결제금액보다 많습니다!'); 
			$("#mileage").val(unit);
	    	$("#mileage").focus();
	    	return;
			
		}
	    //최종 결제 금액
	    $("#totalPrice").val(parseInt($("#paymentAmount").html()) - parseInt($("#eventPrice").val()) - mileage);
	}
	
</script>
</head>
<body>
<form name=insert3 method=post action=./insertPayment>
<input type=hidden name="action" value="insert">
	<h3>예매내역</h3> 
	<br>

<table>

		<tr>	
		<th>
			영화
		</th>
		<td>
			<%=session.getAttribute("movieName")%> 
		</td>
	</tr>
	
	<tr>	
		<th>
			극장
		</th>
		<td>
			<%=session.getAttribute("theatherName")%>,<br>
			<%=session.getAttribute("screenTimes")%>
		</td>
	</tr>
	
	<tr>	
		<th>
			일시
		</th>
		<td>
			<%=session.getAttribute("moiveDate")%>			
		</td>
	</tr>

	<tr>	
		<th>
			인원
		</th>
		<td>
			<%=session.getAttribute("personNum")%>
		</td>
	</tr>

	<tr>	
		<th>
			좌석
		</th>
		<td>
			<%=session.getAttribute("seatName")%>
		</td>
	</tr>
	
	<tr>	
		<th>
			스낵
		</th>
		<td>
			<%=session.getAttribute("snack")%>
		</td>
	</tr>

</table>
	
	<br><hr>
	
	<!-- 결제 예정 금액 -->
	<div>
	<h3>결제예정 금액</h3>
		<table>
			<tr>	
				<th>
					총 주문 금액 
				</th>
				<td style="text-align:left">
					<span id="paymentAmount"><%=session.getAttribute("paymentAmount")%></span>
				</td>
			</tr>
			
			<tr>	
				<th>
					극장 할인
				</th>
				<td style="text-align:left">
					<input type="text" id="eventPrice" size="7" value="<%=session.getAttribute("screenEvent")%>" style="text-align:right" readonly/> 원
				</td>
			</tr>
			
			<tr>	
				<th>
					적립금
				</th>
				<td style="text-align:left">
					<input type="text" class="mileage" name="paymentMileage" id="mileage" size="7" onchange="mileagecheck()" value="0" style="text-align:right"/> 원
					(사용 가능한 적립금 : ${mileage})
					<p style="font-size:8pt; color:gray">적립금은 1,000원 단위로 사용 가능합니다.</p>
				</td>
			</tr>
		</table> 
	</div> 
	<hr>

	<!-- 결제수단 -->
	<div class="title">
		<h3>결제수단</h3>
		<div class="payment" style="margin-bottom:50px">
			<div class="method" >
				<span class="ec-base-label">
					<input id="paymethod1" name="paymentMethod" value="cash" type="radio"/>
					<label for="paymethod1">무통장 입금</label>
				</span> 
					
				<span class="ec-base-label">
					<input id="paymethod2" name="paymentMethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="card" type="radio" />
					<label for="paymethod2">카드 결제</label>
				</span> 
					
				<span class="ec-base-label">
					<input id="paymethod3" name="paymentMethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="payco" type="radio" />
					<label for="paymethod3">페이코(간편결제) <a href="http://www.payco.com/payco/guide.nhn" target="_blank">
					<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_info2.gif" alt="info" /></a></label>
				</span> 
				
				<span class="ec-base-label">
					<input id="paymethod4" name="paymentMethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cell" type="radio" />
					<label for="paymethod4">휴대폰 결제</label>
				</span> 
				
				<span class="ec-base-label">
					<input id="paymethod5" name="paymentMethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="tcash" type="radio" />
					<label for="paymethod5">실시간 계좌이체</label>
				</span>
				</div>
			</div>
			<br>
			
			
			<div class="ec-base-table">
				<!-- 무통장입금 -->
				<table border="1" summary="" id="payment_cash">
					<caption>무통장입금</caption>
					<colgroup>
						<col style="width: 154px" />
						<col style="width: auto" />
					</colgroup>
					
					<tbody>
						<tr>
							<th scope="row">입금자명</th>
							<td>
								<input type="text" id="pname" name="pname" fw-filter="" fw-label="무통장 입금자명" fw-msg="" class="inputTypeText"
								placeholder="" size="15" maxlength="20" value="" /></td>
						</tr>
						<tr>
							<th scope="row">입금은행</th>
							<td>
							<select id="bankaccount1" name="bankaccount" fw-filter="" fw-label="무통장 입금은행" fw-msg="">
									<option value="-1">::: 입금은행 선택 :::</option>
									<option value="bank_04:604802-04-101794:(주)Oreo:국민은행:www.kbstar.com">국민은행:604802-04-101794 (주)Oreo</option>
									<option value="bank_11:110-232-101794:(주)Oreo:신한은행:www.shinhan.com">신한은행:110-232-101794 (주)Oreo</option>
									<option value="bank_26:1234-56-101794:(주)Oreo:대구은행:www.daegu.com">대구은행:1234-56-101794 (주)Oreo</option>
							</select>
							</td>
						</tr>
					</tbody>
				</table>
				
				<!-- 카드결제 -->
				<div id="payment_card">
				카드선택 
				<br>
				<button type="button" id="lotte" class="btn btn-default"> 롯데카드</button>
				<button type="button" id="lotte2" class="btn btn-default"> 국민카드</button>
				<button type="button" id="lotte3" class="btn btn-default"> 신한카드</button>
				<button type="button" id="lotte4" class="btn btn-default"> 삼성카드</button>
				<button type="button" id="lotte5" class="btn btn-default"> 현대카드</button>
				<button type="button" id="lotte6" class="btn btn-default"> 하나카드</button>
				<button type="button" id="lotte7" class="btn btn-default"> 외환카드</button>
				<button type="button" id="lotte8" class="btn btn-default"> 우리BC카드</button>
				<select type="button" id="bankaccount" name="bankaccount" fw-filter="" fw-label="무통장 입금은행" fw-msg="">
					<option value="-1"> 그외 카드선택</option>
					<option value="bc_card">BC카드</option>
					<option value="city_card">씨티카드</option>
					<option value="nh_card">NH카드</option>
					<option value="jb_card">전북카드</option>
					<option value="gj_card">광주카드</option>
				</select>
				</div>
				
				<!-- 실시간 계좌이체 -->
				<table border="1" summary="" id="payment_tcash"
					style="display: none;">
					<caption>실시간 계좌이체</caption>
					<colgroup>
						<col style="width: 154px" />
						<col style="width: auto" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">예금주명</th>
							<td>
								<input id="account_nm" name="account_nm" fw-filter="" fw-label="무통장 입금자명" fw-msg="" class="inputTypeText"
								placeholder="" size="26" maxlength="30" value="" type="text" />
							</td>
						</tr>
					</tbody>
				</table>
		</div>

	</div>
	<hr><br>
	
	<!-- 최종결제금액 -->
    <div class="total">
	<h3><span>최종결제 금액</span></h3>
	    <p class="price"><span></span>
	    <input type="text" style="text-align:right; ime-mode:disabled; clear:none; border:0px; float:none; font-size:15px;" size="10" readonly="1" name="paymentAmount" id="totalPrice" value="${paymentAmount-screenEvent}"/>
	    <strong>원</strong></p>
	    <p class="paymentAgree" id="chk_purchase_agreement">
	    	<input id="chk_order" value="T" type="checkbox"  />
	    	<label for="purchase_agreement" >결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
	    </p>

	<a href="./main"><input type="submit" class="btn btn-default" id="pay" value="결제"></a>
	
	</div>
</form>
</body>
</html>