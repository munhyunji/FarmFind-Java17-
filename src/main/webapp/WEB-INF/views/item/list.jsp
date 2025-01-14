<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<!-- Page content-->
<div class="container">
	<div class="row">

		<%@ include file="../inc/sidebar.jsp"%>

		<!-- Blog entries-->
		<div class="col-lg-9">
			<!-- <div class="SearchResult">
				<p><em id="SearchWord"></em>검색결과</p>
			</div>
			 -->
			<div class="row" id="row">
                <!--아이템 리스트-->
			</div>
			<div class="row">
				<!-- Pagination-->
				<!-- c-tbl-paging -->
				<div class="c-tbl-paging">
					<p class="page-info">
						Total <em id="total-pages"></em> pages
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
		setItemList(1); //아이템 리스트 세팅 
	});
	
	//염색여부
	$("input[name='dyeYN']").change(function(){
		let dyeYN = $("input[name='dyeYN']:checked").val();
		$("#hiddenDyeYn").val(dyeYN);
		
		setItemList(1);			
	});
	
	//획득처 
	$("input[name='getFrom']").change(function(){
		let getFrom = $("input[name='getFrom']:checked").val();
		$("#hiddenGetFrom").val(getFrom);
		
		setItemList(1);				
	});
	
	//사이즈
	$("input[name='itemSize']").change(function(){
		let itemSize = $("input[name='itemSize']:checked").val();
		$("#hiddenItemSize").val(itemSize);
		
		setItemList(1);				
	});
	
	//상호작용
	$("input[name='itemEtc']").change(function(){
		let itemEtc = $("input[name='itemEtc']:checked").val();
		$("#hiddenItemEtc").val(itemEtc);
		
		setItemList(1);				
	});
	
	//카테고리 값 설정
	function setCateValue(category, link) { 
		$("#hiddenCate").val(category);
		// 현재 선택된 모든 링크에서 'selected' 클래스 제거
        var links = document.getElementsByTagName('a');
        for (var i = 0; i < links.length; i++) {
            links[i].classList.remove('selected');
        }

        // 클릭한 링크에 'selected' 클래스 추가
        link.classList.add('selected');				
		setItemList(1); //데이터 검색
	}

	function setItemList(num) { // 페이징처리

		let keyword = $("#keyword").val(); //검색어
		let category = $("#hiddenCate").val(); //중간카테고리
		let dyeYN = $("#hiddenDyeYn").val(); //염색여부
		let getFrom = $("#hiddenGetFrom").val(); //획득처
		let itemSize = $("#hiddenItemSize").val(); //사이즈
		let itemEtc = $("#hiddenItemEtc").val(); //상호작용

			$.ajax({
					url : apiurl + 'item/list',
					type : 'GET',
					data : {
						page : num,
						keyword : keyword,
						category : category,
						dyeYN : dyeYN,
						getFrom : getFrom,
						itemSize : itemSize,
						itemEtc : itemEtc
					},
					contentType : "application/json; charset=utf-8;",
					dataType : 'json',
					success : function(data) {
						//console.log(data.list);
						let iteminfo = data.list; //아이템정보값
						let paging = data.pagination;
						let html = "";
						let imgUrl = '${path}/resources/images/noimage.jpg';
						let newUrl = '${path}/resources/images/icon_new.png';
						let today  = new Date();

						if(iteminfo.length > 0) {
														
							for (i = 0; i < iteminfo.length; i++) {
								
								// Assuming today is defined as a Date object
								let today = new Date();

								let rgstDtArray = iteminfo[i].rgst_dt.match(/(\d{4})년 (\d{1,2})월 (\d{1,2})일/);
								let rgstDt = new Date(Number(rgstDtArray[1]), Number(rgstDtArray[2]) - 1, Number(rgstDtArray[3]));

								let timeDiff = today - rgstDt;
								let daysDiff = timeDiff / (1000 * 60 * 60 * 24);

								html += "<div class='card itemcard mb-5'>";
								
								if(iteminfo[i].item_img_aft != null && iteminfo[i].item_img_aft != '') {
									html += "<a href='${path}/item/detail?no="+iteminfo[i].item_no+"&item_nm="+iteminfo[i].item_nm+"'><div class='img_span'><img class='card-img-top' src="+iteminfo[i].item_img_aft+" /></div>";
								} else {
									html += "<a href='${path}/item/detail?no="+iteminfo[i].item_no+"&item_nm="+iteminfo[i].item_nm+"'><div class='img_span'><img class='card-img-top' src='"+imgUrl+"' /></div>";
									
								}
								//html += "<a href='#!'><img class='card-img-top' src="+iteminfo[i].item_img_aft+" alt='...' />";
								html += "<div class='item-card-body'>";
								
								if(iteminfo[i].item_get_from_dt != null && iteminfo[i].item_get_from_dt != '') {
									
									html += "<div class='small text-muted'>"+iteminfo[i].item_get_from_dt+"</div>";	
								} else {
									html += "<div class='small text-muted'>정보 없음</div>";
								}
								
								//일주일 이내의 최신 등록 아이템 
								if(daysDiff <= 7) {
									html += "<h2 class='card-title h6'>" + iteminfo[i].item_nm + "<img class='new' src='"+newUrl+"'</h2>";
								} else {
									html += "<h2 class='card-title h6'>" + iteminfo[i].item_nm + "</h2>";
									
								}
								html += "</div></a></div>";
	
							}
												
							if (iteminfo.length < 9) { //한페이지의 아이템 출력개수가 9개보다 적을 때 
								
								let s = "";
								if(iteminfo.length == 1 || iteminfo.length == 4 || iteminfo.length == 7) {
									s=2;
								} else if (iteminfo.length == 2 || iteminfo.length == 5 || iteminfo.length == 8) {
									s=1;
								}
								
								for(i=1; i<= s; i++) {
									html += "<div class='card itemcard mb-5' style='height:280px; border-style:none; '></div>";
									}						
							} 
	
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
								
								pagingHtml += "<li><a class='page-link' onclick='setItemList(1)' aria-label='처음'>";
								pagingHtml += "<span class='is-blind p-first'>처음</span></a>";
								pagingHtml += "</li>";
								pagingHtml += "<li><a class='page-link' onclick='setItemList("+ (startPage - 1) + ")' aria-label='이전'>";
								
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
									pagingHtml += "<li><a class='page-link' onclick='setItemList(" + i + ")'>" + i + "</a>&nbsp;</li>";
								}
	
							}
	
							if (existNextPage) {
								pagingHtml += "<li><a class='page-link' onclick='setItemList(" + (endPage + 1)+")' aria-label='다음'>";
								pagingHtml += "<span class='is-blind p-next'>다음</span></a>";
								pagingHtml += "</li>";
								pagingHtml += "<li><a class='page-link' onclick='setItemList(" + totalPageCount +")' aria-label='끝'>";
	
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

