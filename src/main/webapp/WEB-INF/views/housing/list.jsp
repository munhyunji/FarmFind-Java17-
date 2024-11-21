<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp"%>

<style>

/*Pagination*/
.c-tbl-paging {
	margin-top: 12px;
	margin-left: 20px;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
}

.page-link {
	width: 24px;
	height: 24px;
	line-height: 24px;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	color: #d2d2d1;
	cursor: pointer;
	font-weight: bold;
}

#c-pagination { > ul { display:flex;li { padding:02px; } } }

.page-link .is-blind {
	width: 24px;
	height: 24px;
	background-image:
		url(../resources/images/ico/ico_sprites_pagination.svg);
	background-size: auto 24px;
	background-repeat: no-repeat;
	overflow: hidden;
	text-indent: 100%;
	white-space: nowrap;
	display: inline-block;
}

.page-link.is-active {
	color: #494949;
}

.page-link .is-blind.p-prev {
	background-position: -30px 0;
}

.page-link .is-blind.p-next {
	background-position: -60px 0;
}

.page-link .is-blind.p-end {
	background-position: -94px 0;
}

/* 부모 요소에 대한 스타일링 */
#row {
  position: relative; /* 위치 지정을 위해 상대 위치 설정 */
  min-height: 340px;
  width: 100%;
  margin-left:10px;
}

/* 가운데 정렬을 위한 스타일링 */
#noResult {
  position: absolute; /* 절대 위치 설정 */
  top: 50%; /* 상단 기준으로 50% 위치로 이동 */
  left: 50%; /* 좌측 기준으로 50% 위치로 이동 */
  transform: translate(-50%, -50%); /* 중앙 정렬을 위해 이동 값 조정 */
  text-align: center; /* 가운데 정렬을 위해 텍스트 정렬 설정 */
}

.selected {
	color : red;
}

.SearchResult p {
	text-align: right;
}

/*아이템 이미지*/
.itemcard {
	overflow : hidden;
	margin: auto;
}

.itemcard img {
  transition: all 0.2s linear;
}
.itemcard:hover img {
  transform: scale(1.05);
}

/* 하우징 css 추가 */

.mb-6 {
	width: 48%;
	margin-bottom : 3em !important;
	margin: auto;
	height: 360px;
}


.card-img-top {
    width: 100%;
    height: 100%;
}

.img_span {
	overflow : hidden;
	height: 280px;
}
.item-card-body {
	width : auto;
}

.text_under {
         position: relative;    
}
.text_under::after {
        content: ""; 
        width: 100%; 
        height: 10px; 
        background: #99fee7; 
        position: absolute; 
        display: inline-block; 
        left: 0;          
 		bottom: 1px;  
        z-index: -1; 
}

</style>

<!-- Page content-->
<div class="container">
	<div class="row">

		<%@ include file="../inc/sidebar.jsp"%>

		<!-- Blog entries-->
		<div class="col-lg-9">
			<!-- 아이템 리스트 -->
			<!-- <div class="SearchResult">
				<p><em id="SearchWord" class="text_under"></em>검색결과</p>				
			</div> -->
			
			<div class="row" id="row">
				<!-- <div class="card mb-12">
                    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                    <div class="card-body">
                        <div class="small text-muted">January 1, 2023</div>
                        <h2 class="card-title">Featured Post Title</h2>
                    </div>
                </div>-->   
                							

			               <%--  <div class='card itemcard mb-6'>
											<a href='${path}/item/detail?no="+housinginfo[i].item_no+"'><div class='img_span''><img class='card-img-top' src='https://dummyimage.com/850x350/dee2e6/6c757d.jpg' alt='이미지'/></div>
											<div class='item-card-body'>
											<div class='small text-muted'>2023-12</div>
											<h2 class='card-title h6'>낭만 농장 두근두근 아일랜드 하우징 세트 A타입</h2>
											</div>
											</a>
							</div>
										 --%>          
			</div>
			<div class="row">
				<!-- Pagination-->
				<!-- c-tbl-paging -->
				<div class="c-tbl-paging">
					<p class="page-info">
						Total <em id="total-pages"></em> page
					</p>
					<nav id="c-pagination">
						<!-- <ul>
							<li><a class="page-link" href="javascript:setItemList('1')"
								   aria-label="처음"> <span class="is-blind p-first">처음</span>
							</a></li>
							<li><a class="page-link"
								   href="javascript:setItemList('${pageMap.prevPage}')" aria-label="이전">
								<span class="is-blind p-prev">이전</span>
							</a></li>
							
										<li><a class="page-link is-active" href="javascript:;">1</a></li>
									
									
										<li><a class="page-link" href="javascript:setItemList('1')">1</a>&nbsp;</li>
										<li><a class="page-link" href="javascript:setItemList('1')">1</a>&nbsp;</li>
										<li><a class="page-link" href="javascript:setItemList('1')">1</a>&nbsp;</li>
										<li><a class="page-link" href="javascript:setItemList('1')">1</a>&nbsp;</li>
										<li><a class="page-link" href="javascript:setItemList('1')">1</a>&nbsp;</li>
										
							
							<li><a class="page-link"
								   href="javascript:setItemList(23)" aria-label="다음">
								<span class="is-blind p-next">다음</span>
							</a></li>
							<li><a class="page-link"
								   href="javascript:setItemList(26)" aria-label="끝">
								<span class="is-blind p-end">끝</span>
							</a></li>
						</ul>-->
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>

</body>
</html>
<script>

	$(document).ready(function() {
		setHousingList(1); //아이템 리스트 세팅 

	});
	
	//염색여부
	$("input[name='tab2_dyeYN']").change(function(){
		let dyeYN = $("input[name='tab2_dyeYN']:checked").val();
		$("#tab2_hiddenDyeYn").val(dyeYN);
		
		setHousingList(1);			
	});
	
	//획득처 
	$("input[name='tab2_getFrom']").change(function(){
		let getFrom = $("input[name='tab2_getFrom']:checked").val();
		$("#tab2_hiddenGetFrom").val(getFrom);
		
		setHousingList(1);				
	});

	//카테고리 값 설정
	/*function setCateValue(category, link) { 
		$("#hiddenCate").val(category);
		// 현재 선택된 모든 링크에서 'selected' 클래스 제거
        var links = document.getElementsByTagName('a');
        for (var i = 0; i < links.length; i++) {
            links[i].classList.remove('selected');
        }

        // 클릭한 링크에 'selected' 클래스 추가
        link.classList.add('selected');				
		setItemList(1); //데이터 검색
	}*/

	function setHousingList(num) { // 페이징처리

		let keyword = $("#tab2_keyword").val(); //검색어
		let category = $("#tab2_hiddenCate").val(); //중간카테고리
		let dyeYN = $("#tab2_hiddenDyeYn").val(); //염색여부
		let getFrom = $("#tab2_hiddenGetFrom").val(); //획득처
		let itemSize = $("#tab2_hiddenItemSize").val(); //사이즈

			$.ajax({
					url : apiurl + 'housing/list',
					type : 'GET',
					data : {
						page : num,
						keyword : keyword,
						dyeYN : dyeYN,
						getFrom : getFrom
					},
					contentType : "application/json; charset=utf-8;",
					dataType : 'json',
					success : function(data) {
						// 성공 시 실행할 코드
						let housinginfo = data.list; //아이템정보값

						let paging = data.pagination;
						let html = "";
						
						if(housinginfo.length > 0) {
														
							for (i = 0; i < housinginfo.length; i++) {
	
								html += "<div class='card itemcard mb-6'>";
								html += "<a href='${path}/housing/detail?no="+housinginfo[i].housing_no+"'>";
								

								if(housinginfo[i].housing_img_aft != null && housinginfo[i].housing_img_aft != '') {
									html += "<div class='img_span''><img class='card-img-top' src='"+housinginfo[i].housing_img_aft+"' alt='이미지'/></div>";
								} else {
									html += "<a href='${path}/housing/detail?no="+housinginfo[i].housing_no+"'><div class='img_span''><img class='card-img-top' src='${path}/resources/images/noimage.jpg' alt='이미지'/></div>";										
								}
								
								html += "<div class='item-card-body'>";
								html += "<div class='small text-muted'>"+housinginfo[i].housing_get_from_dt+"</div>";
								html += "<h2 class='card-title h6'>" + housinginfo[i].housing_nm + "</h2>";
								html += "</div></a></div>";
	
							}
							
							if(housinginfo.length  % 2 != 0 ) {
								html += "<div class='card itemcard mb-6' style='height:280px; border-style:none; '></div>";															
							}
		
							/*if (housinginfo.length < 9) { //한페이지의 아이템 출력개수가 9개보다 적을 때 
								
								let s = "";
								if(housinginfo.length == 1 || housinginfo.length == 4 || housinginfo.length == 7) {
									s=2;
								} else if (housinginfo.length == 2 || housinginfo.length == 5 || housinginfo.length == 9) {
									s=1;
								}
								
								for(i=1; i<= i; i++) {
									html += "<div class='card itemcard mb-6' style='height:280px; border-style:none; '></div>";
									}						
							} */
	
							$("#row").empty();
							$("#row").append(html);
							
							//검색 단어 페이지 출력 
							$("#SearchWord").empty();
							$("#SearchWord").append(keyword+" ");
	
							//페이징 설정
							let endPage = paging.endPage; //마지막페이지
							let existNextPage = paging.existNextPage; //다음페이지 존재여부
							let existPrevPage = paging.existPrevPage; //이전페이지 존재여부
							let limitStart = paging.limitStart; //
							let startPage = paging.startPage; //시작페이지
							let totalPageCount = paging.totalPageCount; //전체페이지 수
							let totalRecordCount = paging.totalRecordCount; //아이템수
	
							//전체페이지 수 
							$("#total-pages").text(totalPageCount);
	
							let pagingHtml = "";
															
								pagingHtml += "<ul>";
							
							if (existPrevPage) {
								
								pagingHtml += "<li><a class='page-link' onclick='setHousingList(1)' aria-label='처음'>";
								pagingHtml += "<span class='is-blind p-first'>처음</span></a>";
								pagingHtml += "</li>";
								pagingHtml += "<li><a class='page-link' onclick='setHousingList("+ (startPage - 1) + ")' aria-label='이전'>";
								
							} else {
	
								pagingHtml += "<li><a class='page-link' aria-label='처음'>";
								pagingHtml += "<span class='is-blind p-first'>처음</span></a>";
								pagingHtml += "</li>";
								pagingHtml += "<li><a class='page-link' aria-label='이전'>";
	
							}						
								pagingHtml += "<span class='is-blind p-prev'>이전</span></a>";
								pagingHtml += "</li>";
							
	
							for (i = startPage; i <= endPage; i++) {
	
								if (num == i) {
									pagingHtml += "<li><a class='page-link is-active'>"+ i + "</a></li>";
								} else {
									pagingHtml += "<li><a class='page-link' onclick='setHousingList(" + i + ")'>" + i + "</a>&nbsp;</li>";
								}
	
							}
	
							if (existNextPage) {
								pagingHtml += "<li><a class='page-link' onclick='setHousingList(" + (endPage + 1)+")' aria-label='다음'>";
								pagingHtml += "<span class='is-blind p-next'>다음</span></a>";
								pagingHtml += "</li>";
								pagingHtml += "<li><a class='page-link' onclick='setHousingList(" + totalPageCount +")' aria-label='끝'>";
	
							} else {
	
								pagingHtml += "<li><a class='page-link' aria-label='다음'>";
								pagingHtml += "<span class='is-blind p-next'>다음</span></a>";
								pagingHtml += "</li>";
								pagingHtml += "<li><a class='page-link' aria-label='끝'>";
								
							}
								pagingHtml += "<span class='is-blind p-end'>끝</span></a>";
								pagingHtml += "</li>";
								pagingHtml += "</ul>";
	
							$("#c-pagination").empty();
							$("#c-pagination").append(pagingHtml);
						
						} else {
							
							html += "<div id='noResult'>검색 결과가 없습니다.</div>";
							
							$("#row").empty();
							$("#row").append(html);
							$("#c-pagination").empty();
						}

					},
					error : function(request, error) {
						// 실패 시 실행할 코드
						alert("API 통신에 실패하였습니다. \n관리자에게 문의 바랍니다.");
						console.log('AJAX 요청 실패:' + "code:" + request.status
								+ "\n" + "message:" + request.responseText);
					}
				});
	
	}
	
	
</script>