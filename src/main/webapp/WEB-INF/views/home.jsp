<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%@ include file="./inc/header.jsp"%>

<section class="page-section">
	<div class="container main-section">
		<div class="col-md-6 main">
			<ol>
				<!-- <li class="visitorLi"><p class="visitorCounter">TODAY <span id="hitCt"></span></p></li>-->
				<li class="centerline"><p >NOTICE</p></li>
				<li><span class="lispan">01</span><p class="lip">옛 시절 부터 현재까지의 낭만 농장 아이템을 검색 하실 수 있습니다.</p></li>
				<li><span class="lispan">02</span><p class="lip">낭만 농장 설치물에 대한 정보를 검색 하실 수 있습니다.<br> (미니어처, 하우징, 리플레이 낭농 아이템은 포함되어 있지 않습니다.)</p></li>
				<li><span class="lispan">03</span><p class="lip">이미지, 잘못된 정보 제보 부탁드립니다.</p></li>
				<li><span class="lispan">04</span><p class="lip">모바일 페이지는 개발중 입니다.</p></li>
				
			</ol>
		</div>
		<div class="col-md-6 main-img">
			<div class="row text-center">
				<div class="col-md-12 centerline"><p>SPECIAL THANKS</p></div>
				<div class="col-md-4">	
					<img src='${path }/resources/images/character/a.png' style="width:90%">			
					<h4 class="my-3">LT 던에어</h4>
					<p class="text-muted">낭농</p>
				</div>			
				<div class="col-md-4">	
					<img src='${path }/resources/images/character/bi.png' style="width:90%">			
					<h4 class="my-3">WF 연월비</h4>
					<p class="text-muted">낭농 마스터</p>
				</div>
				<div class="col-md-4">
					<img src='${path }/resources/images/character/gae.png' style="width:90%">	
					<h4 class="my-3">LT 연춘심</h4>
					<p class="text-muted">낭농 낭농 낭농</p>
				</div>
			</div>
		</div>
	</div>
</section>

 <section class="page-section" id="services">
	<div class="container">
		<div class="text-center">			
			<h5 class="section-heading text-uppercase">낭만농장</h5>
			<h6 class="section-subheading text-muted">Farm Find</h6>
		</div>
		<div class="row text-center">
            <c:forEach var="index" begin="1" end="6">
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                        <div class="portImg">
                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal${index }">
                            <img class="img-fluid" src="${path }/resources/images/screenshot/pic-${index }.png"  alt="..."/>
                        </a>
                        </div>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">Threads</div>
                        <div class="portfolio-caption-subheading text-muted">Illustration</div>
                    </div>
                </div>
            </div>
          </c:forEach>
		</div> 
	</div>
</section>

<%@ include file="./inc/footer.jsp"%>
<%@ include file="./inc/modalScreenShot.jsp" %>

<script>
		$(document).ready(function() {

			let sessionId = $("#sessionId").val();
			// 현재 날짜와 시간을 얻습니다.
			const currentDate = new Date();

			// 오늘 날짜의 23:59:59로 설정합니다.
			const endOfDay = new Date(currentDate);
			endOfDay.setHours(23, 59, 59, 999);

			let hitCt = 0;
			// 쿠키 설정 GMT- 9시간느림
			document.cookie = "visitor=" + sessionId + ";expires="
					+ endOfDay.toGMTString();

			$.ajax({
				url : apiurl + "visitor/today",
				type : 'get',
				data : {
					sessionId : sessionId
				},
				dataType : 'json',
				success : function(data) {
					if (data == 0) {
						//console.log("이미 저장된 회원 count 올라가지않음");
					} else {
						//console.log("신규 회원 입니다 어서오셈 ");
					}
				},
				fail : function(error) {
					console.log('방문자 저장 실패:' + "code:" + request.status + "\n" + "message:" + request.responseText);
				}
			});

			$.ajax({
				url : apiurl + "visitor/todayCount",
				type : 'get',
				dataType : 'json',
				success : function(data){
					//$("#hitCt").text(data);
					console.log(data);
				},
				fail : function(error) {
					console.log('방문자 저장 실패:' + "code:" + request.status+ "\n" + "message:" + request.responseText);
				}
			})

		})
</script>
</body>
</html>
