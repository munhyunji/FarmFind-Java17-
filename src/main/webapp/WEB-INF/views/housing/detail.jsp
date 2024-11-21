<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<style>

.detail_row {
	display: flex;
	margin-top: 20px;
}

.info_box {
	width: 40%;
	padding: 10px;
	box-sizing: border-box;
}

.img_box {
	width: 60%;
}

/*등록일자*/
.label-input #regi {
      text-align: right; /* 텍스트를 오른쪽 정렬합니다. */
      font-size: 10px; /* 글씨 폰트 크기를 5px로 설정합니다. */
      color: #1c1c1b;
      opacity: 0.4;
}
/*메인 이미지*/
.main_img img {
	width: 594px;
	height: 420px;
	display: block; /* Remove default inline display */
	border-radius: 0.375em;
}

/*서브 이미지*/
.sub_img {
	display: flex;
      flex-direction: row-reverse;
}

.sub_img img {
	width: 50%;
	height: 200px;
	border-radius: 0.375em;
	margin-top : 10px;
	cursor : pointer;
}

.title {
	margin-bottom: 20px;
}

input:focus {
	outline: none;
}

.c-input {
	color: #494949;
	border: 0;
	/*border-bottom: 1px solid #e9e9e9;*/
	border-radius: 0;
	padding: 0 0 4px 0;
	background: transparent;
	overflow: hidden;
}

.label-input {
	align-housings: center;
}

.label-input label {
	width: 30%;
	/* Optional: Adjust the spacing between label and input */
	font-size: 14px;
	font-weight: 400;
	color: #494949;
	margin : 5px 10px 8px 5px;
}

.label-input input.c-input {
	width: 60%;
	font-family: 'NotoSansKR-Thin';
}

h4 {
	font-weight: bold;
}

textarea[readonly=readonly] {
    line-height: 20px;
    background-color: #fcfcfc;
    border-color: #e9e9e9;
    min-height: 100px;
    overflow: auto;
    border-radius: 8px;
	width : 60%;
	resize : none;
}

.line {
	display:flex;
	flex-basis:100%;
	align-items:center;
	color:black;
	font-size:16px;
	margin:8px 0px;
	font-weight: bold;
}
.line::after {
	content:"";
	flex-grow:1;
	margin:0px 16px;
	background:#e9e9e9;
	height:1px;
	font-size:0px;
	line-height: 0px;
}

.back {
	text-align : right;
}

.back-space {
	display:flex;
	flex-basis:100%;
	align-items:center;
	color:black;
	font-size:16px;
	margin-bottom: 10px;
	font-weight: bold;
	flex-direction: row-reverse;
}

</style>
<!-- Page content-->
<div class="container">
	<div class="row">

		<%@ include file="../inc/sidebar.jsp"%>
		<!-- Blog entries-->
		<div class="col-lg-9">
			<div class="detail_row">
				
				<div class="info_box">
					<div class="label-input title">
						<h4 id="housing_nm"></h4>
					</div>
					<div class="label-input line">
						하우징
					</div>
					<div class=" label-input">
						<label for="housing_nm">사이즈</label> <input type="text"
							class="c-input" id="housing_size" name="" value="" readonly="readonly">
					</div>
					<div class=" label-input">
						<label for="housing_nm">염색 가능 여부 </label> <input type="text"
							class="c-input" id="housing_dye_yn" name="" value="" readonly="readonly">
					</div>
					<div class=" label-input">
						<label for="housing_nm">염색 가능 파트 </label> <input type="text"
							class="c-input" id="housing_dye_part" name="" value="" readonly="readonly">
					</div>
					<div class="label-input line">
						획득처
					</div>
					<div class=" label-input">
						<label for="housing_nm">획득처</label> <input type="text"
							class="c-input" id="housing_getFrom_cd" name="" value="" readonly="readonly">
					</div>
					<div class=" label-input">
						<label for="housing_nm">획득처 이름</label> <input type="text"
							class="c-input" id="housing_getFrom_nm" name="" value="" readonly="readonly">
					</div>
					<div class=" label-input">
						<label for="housing_nm">획득처 날짜 </label> <input type="text"
							class="c-input" id="housing_getFrom_dt" name="" value="" readonly="readonly">
					</div>
					<div class="label-input line">
						기타
					</div>
					<div class=" label-input">
						<label for="housing_nm">상호 작용 및 효과</label> <input type="text"
							class="c-input" id="housing_etc" name="" value="" readonly="readonly">
					</div>	
					<div class="label-input line">
						설명
					</div>				
					<div class=" label-input">
						<p id="housing_dscption"></p>
					</div>
					<div class="label-input">
						<p id="regi">등록날짜: 2023년 12월 14일</p>
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
					<div class="sub_img">
						<img id="small" src="">
					</div>
						
					</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/footer.jsp"%>

<script>

	 $(document).ready(function(){
		 //아이템 번호세팅 
		 let urlParams = new URL(location.href).searchParams;
		 let housingNo = urlParams.get('no');

		 if(housingNo != null && housingNo != '') {
			 
			 //아이템 정보 불러오기
			 $.ajax({
				url : apiurl + "housing/detail",
				type : 'get',
				data : {
					housingNo : housingNo				
				},
				success : function(data) {
					console.log("ajax 통신 성공");
					$("#housing_nm").append(data.housing_nm);
					$("#housing_size").val(data.housing_size);
					
					let housing_dye_yn = data.housing_dye_yn == 'Y' ? '가능' : '불가능';
					$("#housing_dye_yn").val(housing_dye_yn);
					
					$("#housing_dye_part").val(data.housing_dye_part);
					
					let housing_from_cd = data.housing_get_from_cd == 'K' ? '키트' : '이벤트';
					$("#housing_getFrom_cd").val(housing_from_cd);
					$("#housing_getFrom_nm").val(data.housing_get_from_nm);
					$("#housing_getFrom_dt").val(data.housing_get_from_dt);
					
					let housing_etc = data.housing_etc != null && data.housing_etc != ''  ? data.housing_etc : '정보 없음';
					$("#housing_etc").val(housing_etc);
					
					//아이템 설명
					let housing_dscption = data.housing_dscption != null && data.housing_dscption != '' ? data.housing_dscption : '정보 없음';
					$("#housing_dscption").append(housing_dscption);
					
					let img1 = document.getElementById("big");
					let housing_img_aft = data.housing_img_aft != null && data.housing_img_aft != '' ? data.housing_img_aft : '${path}/resources/images/noimage.jpg';
					img1.src = housing_img_aft;
					
					let img2 = document.getElementById("small");
					let housing_img_nig = data.housing_img_nig != null && data.housing_img_nig != '' ? data.housing_img_nig : '${path}/resources/images/noimage.jpg';
					img2.src = housing_img_nig;
					
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
	  var cnt = 1; // 전역 변수.
	  function imgToggle() {
	    var img1 = document.getElementById("big");
	    var img2 = document.getElementById("small");
	 
	    if(cnt%2==1){
	      img1.src="https://storage.cloud.google.com/farmfind/%ED%94%BC%ED%95%A0%20%EC%88%98%20%EC%97%86%EB%8A%94%20%EC%8A%B9%EB%B6%80%20%ED%8C%90%EB%84%AC.jpg";
	      img2.src="https://storage.cloud.google.com/farmfind/%EC%95%BC%EC%99%B8%EB%AC%B4%EB%8C%80.jpg";
	    } else {
	      img1.src="https://storage.cloud.google.com/farmfind/%EC%95%BC%EC%99%B8%EB%AC%B4%EB%8C%80.jpg";
	      img2.src="https://storage.cloud.google.com/farmfind/%ED%94%BC%ED%95%A0%20%EC%88%98%20%EC%97%86%EB%8A%94%20%EC%8A%B9%EB%B6%80%20%ED%8C%90%EB%84%AC.jpg";
	    }
	    cnt++; // cnt 변수 1씩 증가 시키기
	  }
	  
	
</script>


</body>
</html>