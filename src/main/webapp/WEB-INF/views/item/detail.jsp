<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<!-- Page content-->
<div class="container">
	<div class="row">

		<%@ include file="../inc/sidebar.jsp"%>
		<!-- Blog entries-->
		<div class="col-lg-9">
			<div class="detail_row">
				<div class="info_box">
					
					<div class="label-input title">
						<h4 id="item_nm"></h4>
					</div>
					<div class="label-input line">
						아이템
					</div>
						<div class=" label-input">
							<label for="item_nm">사이즈</label> <input type="text"
								class="c-input" id="item_size" name="" value="" readonly="readonly">
						</div>
						<div class=" label-input">
							<label for="item_nm">염색 가능 여부 </label> <input type="text"
								class="c-input" id="item_dye_yn" name="" value="" readonly="readonly">
						</div>
					<div class="label-input line">
						획득처
					</div>
						<div class=" label-input">
							<label for="item_nm">획득처</label> <input type="text"
								class="c-input" id="item_getFrom_cd" name="" value="" readonly="readonly">
						</div>
						<div class=" label-input">
							<label for="item_nm">획득처 이름</label> <input type="text"
								class="c-input" id="item_getFrom_nm" name="" value="" readonly="readonly">
						</div>
						<div class=" label-input">
							<label for="item_nm">획득처 날짜 </label> <input type="text"
								class="c-input" id="item_getFrom_dt" name="" value="" readonly="readonly">
						</div>
					<div class="label-input line">
						기타
					</div>
						<div class=" label-input">
							<label for="item_nm">상호 작용 및 효과</label> <input type="text"
								class="c-input" id="item_etc" name="" value="" readonly="readonly">
						</div>
					<div class="label-input line">
						경매장
					</div>
						<div class=" label-input">
							<label for="item_nm">경매장 매물 </label> <input type="text"
																	class="c-input" id="item_auction_amount" name="" value="" readonly="readonly">
						</div>
						<div class=" label-input">
							<label for="item_nm">경매장 최저가 </label> <input type="text"
																		  class="c-input" id="item_auction_price" name="" value="" readonly="readonly">
						</div>
					<div class="label-input">
						<p id="regi">* 본 경매장 정보는 '마비노기 OPEN API'를 통해 제공됩니다. <br>* 마비노기의 게임 데이터는 평균 10분 후 확인 가능합니다.</p>
					</div>
					<div class="label-input back-space">
					<button class="btn back" onclick="history.back()" style="float:right; border: none; background-color:white;">
						<svg id="i-arrow-left" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="#6c757d" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
					    <path d="M10 6 L2 16 10 26 M2 16 L30 16" /></svg> 뒤로가기
					 </button>
					</div>
				</div>				
				<div class="img_box">
					<div class="main_img">
						<img id="big" src="">
					</div>
					<div class="label-input">
						<p id="item_dscption"></p>
					</div>
					<!-- <div class="sub_img">
						<img id="small" src="https://storage.cloud.google.com/farmfind/%EC%95%BC%EC%99%B8%EB%AC%B4%EB%8C%80.jpg">
						<img id="small" src="https://storage.cloud.google.com/farmfind/%EC%95%BC%EC%99%B8%EB%AC%B4%EB%8C%80.jpg" onclick="imgToggle()">						 									
					</div> -->	
				</div>
			</div>				
		</div>
	</div>
</div>

<%@ include file="../inc/footer.jsp"%>

<script>
	 $(document).ready(function(){
		 //아이템 번호세팅 
		 const urlParams = new URL(location.href).searchParams;
		 const itemNo = urlParams.get('no');
		 const item_nm = urlParams.get('item_nm');

		 if(itemNo != null && itemNo != '') {
			 //openapi url
			 //경매장 옥션
			 searchAction(item_nm);

			 //아이템 정보 불러오기
			 $.ajax({
				url : apiurl + "item/detail",
				type : 'get',
				data : {
					itemNo : itemNo				
				},
				success : function(data) {
					console.log("ajax 통신 성공");

					$("#item_nm").append(data.item_nm);
					$("#item_size").val(data.item_size);
					
					let item_dye_yn = data.item_dye_yn == 'Y' ? '가능' : '불가능';
					$("#item_dye_yn").val(item_dye_yn);
					
					let item_from_cd = data.item_get_from_cd == 'K' ? '키트' : '이벤트';
					$("#item_getFrom_cd").val(item_from_cd);
					$("#item_getFrom_nm").val(data.item_get_from_nm);
					$("#item_getFrom_dt").val(data.item_get_from_dt);
					
					//상호작용
					let item_etc = data.item_etc != null && data.item_etc != ''  ? data.item_etc : '정보 없음';
					$("#item_etc").val(item_etc);
					//아이템 설명
					let item_dscption = data.item_dscption != null && data.item_dscption != '' ? data.item_dscption : '-';
					$("#item_dscption").text(item_dscption);
					
					//$("#regi").text("등록날짜 : "+data.rgst_dt);

					let img1 = document.getElementById("big");
					let item_img_aft = data.item_img_aft != null && data.item_img_aft != '' ? data.item_img_aft : '${path}/resources/images/noimage.jpg';
					img1.src = item_img_aft;

					let html = "";
					if(data.item_img_nig != null && data.item_img_nig != '') {
						//console.log("밤사진있음");
						html += "<div class='fa-circle has-tooltip'>";
						html += "<i class='fa-solid fa-moon fa-fade fa-2xl' style='color: #f5f124;'></i>";
						html += "</div>";
						html += "<span class='tooltip' flow='down' >";
						html += "<img src='"+data.item_img_nig+"'>";
						html += "</span>"; 
						
						 $("#big").parent().append(html);
					}
					
					/* let img2 = document.getElementById("small");
					let item_img_nig = data.item_img_nig != null && data.item_img_nig != '' ? data.item_img_nig : '${path}/resources/images/noimage.jpg';
					img2.src = item_img_nig; */

				},
				error : function(request, error){
					// 실패 시 실행할 코드
					alert("API 통신에 실패하였습니다. \n아이템 정보를 불러오지 못했습니다.");
					console.log('AJAX 요청 실패:' + "code:" + request.status
							+ "\n" + "message:" + request.responseText);
				}			 					 
			 });
		 
		 } else {
			 alert("아이템 정보를 받아오지 못했습니다. 'no' 없음");
			 return false;
		 }
		 
	 })
	  let cnt = 1; // 전역 변수.

	 //아이템 이름으로 경매장 매물 검색
	 function searchAction(item_nm) {
		//openapi url
		 const api_url = "https://open.api.nexon.com/mabinogi/v1/auction/list";
		 const auction_item_category = "낭만농장/달빛섬";
		 const api_key = "test_ea3765375027b7116256c62ca408c843cea742e9dea55c0db5d0f7e8f05e04e1efe8d04e6d233bd35cf2fabdeb93fb0d";

		//url 인코딩
		 const encoded_category = encodeURIComponent(auction_item_category);
		 const encoded_item_nm = encodeURIComponent(item_nm.trim());

		 const request_url = api_url+`?auction_item_category=`+encoded_category+`&item_name=`+encoded_item_nm;

		 //console.log(request_url);
		 //fetch로 api 호출
		 fetch(request_url, {
			 method : "GET",
			 headers : {
				 accept: "application/json",
				 "x-nxopen-api-key": api_key,
			 }
		 })
		 .then(response => {
			 if (!response.ok) {
				 throw new Error(`HTTP error! status:`+response.status);
			 }
			 return response.json();
		 })
		 .then(data => {
			 //console.log("검색 결과:", data);
			 //console.log(data.auction_item.length);
			 //console.log(data.auction_item[0].auction_price_per_unit);
			 const count = data.auction_item.length > 0 ? data.auction_item.length+`개` : "등록된 매물이 없습니다.";
			 const price = data.auction_item.length > 0 ? formatNumber(data.auction_item[0].auction_price_per_unit)+ " Gold" : "-";

			 $("#item_auction_amount").val(count);
			 $("#item_auction_price").val(price);

		 })
		 .catch(error => {
			 console.error("에러 발생:", error);
		 });
	 }

	 //경매장 숫자 가공
	 function formatNumber(num) {
		 if (num >= 100000000) { // 1억 이상
			 let hundredMillion = Math.floor(num / 100000000);  // 억 단위
			 let remainder = num % 100000000; // 나머지 값 (천만 이하)

			 let tenMillion = Math.floor(remainder / 10000000);  // 천만 단위
			 let tenThousand = Math.floor((remainder % 10000000) / 10000);  // 만 단위

			 // 1억 이상, 천만, 만 단위 합쳐서 출력
			 return hundredMillion+"억"+tenMillion+tenThousand+"만";
		 } else if (num >= 10000) { // 1만 이상
			 let tenThousand = Math.floor(num / 10000);  // 만 단위
			 return tenThousand+"만";
		 } else {
			 return num.toString();  // 1만 미만은 그대로 숫자
		 }
	 }
	
	
</script>
</body>
</html>