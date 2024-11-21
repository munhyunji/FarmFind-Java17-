<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <style>
     
        /* 탭 스타일 */
        .tabs {
            display: flex;
        }

        .tab {
           flex: 1;
           text-align: center;
           padding: 10px;
           cursor: pointer;
           border: 1px solid #ced4da;
		   border-radius: 0.375rem;  
       }

        /* 내용 스타일 */
        .tab-content {
            display: none;
        }

        /* 섹션 스타일 */
        .section {
            margin-top: 20px;
        }

        /* 검색 버튼 스타일 */
        #searchButton {
            width: 25%;
            margin-top: 10px;
        }
	
        .tab {
            padding: 10px;
            cursor: pointer;
            margin-right: 10px;
        }

        .active-tab {
            background-color: rgba(0, 0, 0, 0.03); /* Change to red or your desired color */
        }
        
        .active-content {
        	display: block;
        }
        
        .btn-search {
		    content: "";
		    position: absolute;
		    background: url(../resources/images/ico/ico_search_01.svg) 0/auto no-repeat;
		    background-size: 18px;
		    background-repeat: no-repeat;
		    right: 12px;
		    top: 50%;
		    -webkit-transform: translateY(-50%);
		    -ms-transform: translateY(-50%);
		    transform: translateY(-50%);
		    width: 20px;
		    height: 20px;
		    display: inline-block;
		    overflow: hidden;
		    border : 0;
		}
		
		.search-card {
			border-style : none;
			margin-top: 20px;
		}
		
		.list-unstyled input[type=radio]{
		    display: none;
		}
		.list-unstyled input[type=radio]+label{
		    display: inline-block;
		    cursor: pointer;
		    height: 24px;
		    width: 65px;
		    border: 1px solid #ced4da;
		    border-radius: 0.375rem;
		    line-height: 24px;
		    text-align: center;
		    font-weight:bold;
		    font-size:13px;
		    font-family: 'NotoSansKR-Thin';
		}
		.list-unstyled input[type=radio]+label{
		    background-color: #fff;
		    color: #333;
		}
		.list-unstyled input[type=radio]:checked+label{
		    background-color: rgba(204, 208, 240, 1);
		    color: #fff;
		}
		.back {
			text-align: center;
		}		
		.initBtn {
			margin-top : 10px;
		}
		
		.hr-dotted {
		  border : 0px;
		  border-top: 5px dotted #663399;
		  margin-top : 15px;
		}
		
    </style>
    			<input type="hidden" id="hiddenCate" value="">
				<input type="hidden" id="hiddenDyeYn" value="">
				<input type="hidden" id="hiddenGetFrom" value="">
				<input type="hidden" id="hiddenItemSize" value="">
				<input type="hidden" id="hiddenItemEtc" value="">
				
				<input type="hidden" id="tab2_hiddenCate" value="">
				<input type="hidden" id="tab2_hiddenDyeYn" value="">
				<input type="hidden" id="tab2_hiddenGetFrom" value="">
				<input type="hidden" id="tab2_hiddenItemSize" value="">
				
 			<!-- Side widgets-->
                <div class="col-lg-3">				
					<div class="tabs">
					    <div class="tab" onclick="openTab('tab1', this)">설치물</div>
					    <div class="tab" onclick="openTab('tab2', this)">하우징</div>
					</div>
					
					<div id="tab1" class="tab-content">
						   <!-- Search widget-->
	                   <div class="card mb-4 search-card">
	                        <!-- <div class="card-header">검색</div>
	                        <div class="card-body"> -->
	                            <div class="input-group">
	                                <input class="form-control" id="keyword" type="text" placeholder="아이템 이름 검색.." value=""  onkeydown="if(event.keyCode==13) javascript:setItemList(1);"  />
	                                <!-- <button class="btn btn-primary" id="button-search" type="button" onclick="setItemList(1)">검색</button> -->
	                                
	                                <button type="button" class="btn-search" id="customerSearchModal" onclick="setItemList(1)"></button>
	                            </div>
	                        <!-- </div> -->
	                    </div>
	                    <!-- Categories widget-->
	                    <div class="card mb-4">
	                        <div class="card-header">검색 카테고리</div>
	                        <div class="card-body">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <ul class="list-unstyled mb-0">
	                                        <li><a href='javascript:void(0);' onclick="setCateValue('', this)" class="selected">전체 </a></li>
	                                        <li><a href='javascript:void(0);' onclick="setCateValue('B', this)">건축물</a></li>
	                                        <li><a href='javascript:void(0);' onclick="setCateValue('P', this)">식물(나무, 꽃)</a></li>
	                                        <li><a href='javascript:void(0);' onclick="setCateValue('T', this)">타일(울타리, 꽃)</a></li>
	                                    </ul>
	                                </div>
	                                <div class="col-sm-6">
	                                    <ul class="list-unstyled mb-0">
	                                    	<li><div>ㅤ</div></li>
	                                        <li><a href='javascript:void(0);' onclick="setCateValue('A', this)" >공중 타입</a></li>
	                                        <li><a href='javascript:void(0);' onclick="setCateValue('W', this)" >벽 타입</a></li>
	                                        <li><a href='javascript:void(0);' onclick="setCateValue('E', this)" >기타 타입</a></li>
	                                    </ul>
	                                </div>	                                
	                                <hr class="hr-dotted">
	                                <div class="col-sm-6">
	                                    <ul class="list-unstyled mb-0">
	                                        <li>
 												염색 
  											</li>
	                                         <li>
 												획득처 
  											</li>
  											<li>
 												상호작용,특수
  											</li>
	                                         <li>
 												사이즈 
  											</li>
	                                    </ul>
	                                </div>
	                                <div class="col-sm-6">
	                                	<ul class="list-unstyled mb-0">
	                                		<li><input type='radio' id="selectdyeYN" name='dyeYN' value='Y' /><label for="selectdyeYN">가능</label>
  												<input type='radio' id="selectdyeYN2" name='dyeYN' value='N' /><label for="selectdyeYN2">불가능</label>
  											</li>
  											<li><input type='radio' id="selectGetFrom" name='getFrom' value='K' /><label for="selectGetFrom">키트</label>
  												<input type='radio' id="selectGetFrom2" name='getFrom' value='E' /><label for="selectGetFrom2">이벤트</label>
  											</li>
  											<li><input type='radio' id="selectItemEtc" name='itemEtc' value='Y' /><label for="selectItemEtc">있음</label>
  												<input type='radio' id="selectItemEtc2" name='itemEtc' value='' /><label for="selectItemEtc2">없음</label>
  											</li>
  											<li><input type='radio' id="selectItemSize"  name='itemSize' value='1x1' /><label for="selectItemSize">1x1</label>
  												<input type='radio' id="selectItemSize2" name='itemSize' value='' /><label for="selectItemSize2">그 외 </label>
  											</li>
	                                	</ul>
	                                </div>
	                                <div class="col-sm-6 back" style="width:100%"> 
	                                	<button class="btn initBtn"  type="button" onclick="init()">
	                                		<i class="fa-solid fa-arrow-rotate-left fa-flip-horizontal fa-lg"></i> 검색 조건 초기화
	                                	</button> 
	                                 </div> 
	                            </div>
	                        </div>
	                    </div>
	                    
					</div>

					<div id="tab2" class="tab-content">
					    <!-- 탭2 내용 -->
					    <div class="card mb-4 search-card">
	                        <!-- <div class="card-header">검색</div>
	                        <div class="card-body"> -->
	                            <div class="input-group">
	                                <input class="form-control" id="tab2_keyword" type="text" placeholder="하우징 이름 검색.." value=""  onkeydown="if(event.keyCode==13) javascript:setHousingList(1);"  />
	                                <!-- <button class="btn btn-primary" id="button-search" type="button" onclick="setItemList(1)">검색</button> -->
	                                
	                                <button type="button" class="btn-search" id="customerSearchModal" onclick="setHousingList(1)"></button>
	                            </div>
	                        <!-- </div> -->
	                    </div>
	                     <!-- Categories widget-->
	                    <div class="card mb-4">
	                        <div class="card-header">카테고리</div>
	                        <div class="card-body">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <ul class="list-unstyled mb-0">
	                                        <li>
 												염색 가능 여부
  											</li>
	                                         <li>
 												획득처 
  											</li>
	                                         <!-- <li>
 												사이즈 
  											</li> -->
	                                    </ul>
	                                </div>
	                                <div class="col-sm-6">
	                                	<ul class="list-unstyled mb-0">
	                                		<li><input type='radio' id="tab2_selectdyeYN" name='tab2_dyeYN' value='Y' /><label for="tab2_selectdyeYN">가능</label>
  												<input type='radio' id="tab2_selectdyeYN2" name='tab2_dyeYN' value='N' /><label for="tab2_selectdyeYN2">불가능</label>
  											</li>
  											<li><input type='radio' id="tab2_selectGetFrom" name='tab2_getFrom' value='K' /><label for="tab2_selectGetFrom">키트</label>
  												<input type='radio' id="tab2_selectGetFrom2" name='tab2_getFrom' value='E' /><label for="tab2_selectGetFrom2">이벤트</label>
  											</li>
	                                	</ul>
	                                </div>
	                                <div class="col-sm-6 back" style="width:100%"> 
	                                	<button class="btn initBtn"  type="button" onclick="init()">
	                                		<i class="fa-solid fa-arrow-rotate-left fa-flip-horizontal fa-lg"></i> 검색 조건 초기화
	                                	</button> 
	                                 </div> 
	                            </div>
	                        </div>
	                    </div>
					</div>
                
 
                    <!-- Search widget-->
                    <!-- <div class="card mb-4">
                        <div class="card-header">검색</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search.." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">검색</button>
                            </div>
                        </div>
                    </div> -->
                    <!-- Categories widget-->
                    <!-- <div class="card mb-4">
                        <div class="card-header">카테고리</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">건축물</a></li>
                                        <li><a href="#!">식물(나무,꽃)</a></li>
                                        <li><a href="#!">타일(울타리)</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">공중</a></li>
                                        <li><a href="#!">벽</a></li>
                                        <li><a href="#!">기타분류</a></li>
                                        <li><a href="#!">기타분류</a></li>
                                    </ul>
                                </div>
                                <p>---------------------------------</p>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">하우징</a></li>
                                    </ul>
                                </div>
                                <p>---------------------------------</p>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">염색 여부</a></li>
                                        <li><a href="#!">획득처</a></li>
                                        <li><a href="#!">사이즈 1x1 2x2~</a></li>
										<li>
										    <input type="radio" name="fruit" value="사과" /> 사과
											<input type="radio" name="fruit" value="바나나" checked="checked" /> 바나나
										</li>
										<li> <a class="btn btn-primary" href="#!">검색 →</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>
                
                
               
     <script>
	     document.addEventListener("DOMContentLoaded", function () {
	         checkAndHighlightTab();

	         document.querySelectorAll('.tab').forEach(function (tab) {
	             tab.addEventListener('click', function () {

	                 if (this.innerText === '설치물') {
	                     location.href = "${path}/item/list"; // Redirect to 설치물 page
	                 } else if (this.innerText === '하우징') {
	                     location.href = "${path}/housing/list"; // Redirect to 하우징 page
	                 }
	             });
	         });
	     });
	
	     function checkAndHighlightTab() {
	         var url = window.location.href;

	         if (url.includes('item')) {
	             document.querySelector('.tab:nth-child(1)').classList.add('active-tab');
	             document.querySelector('#tab1').classList.add('active-content');
	             
	         }
	         if (url.includes('housing')) {
	             document.querySelector('.tab:nth-child(2)').classList.add('active-tab');
	             document.querySelector('#tab2').classList.add('active-content');
	         }
	     }
	 
	     function init() {
	    	 window.location.reload();	    	 	 
	     }

     </script>           