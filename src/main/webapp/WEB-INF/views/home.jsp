<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%@ include file="./inc/header.jsp"%>
<style>

/* list styles */
ol {
	list-style: none;
	color: #ccc;
}

ol li {
	font: bold 15pt NotoSansKR-Thin, arial, NotoSansKR-Thin;
	position: relative;
	margin-bottom: 20px;
}

li p {
	font: 12pt NotoSansKR-Thin, arial, NotoSansKR-Thin;
	color: #555;
	
}

li .lip {
	padding-left: 60px;
}

.lispan {
	position: absolute;
	line-height: 25px;

}

.text-center {
	margin-bottom: 30px;
}

.main {
	margin: 20px 0;
}

.main-section {
	display: flex;
	align-items: flex-start;
	min-height: 350px;
}

.main-section .main {
	display: flex;
	/*justify-content: end;*/
}

.main-section .main-img {
	display: flex;
	justify-content: center;
}

.main-img {
	width: 40%;
	margin: 20px 20px 0 50px;
}

.visitorCounter {
	border : 1px solid #ced4da;
	border-radius: 0.375rem;
	width: 120px;
	padding-left: 30px;
}

/*하단 이미지 */
.portImg {
	width: 400px;
	height: 210px;
	border : 1px solid #ced4da;
	border-radius: 0.575rem;
	margin : auto;
	overflow : hidden;
}

.img-fluid {
	width: 100%;
	height: 100%;
	border-radius: 0.575rem;
	
}

.portImg img {
  transition: all 0.2s linear;
}

.portImg:hover img {
	transform: scale(1.05);
}

.portfolio-modal .modal-content img {
  margin-bottom: 2rem;
  
}

.centerline {
  display: flex;
  flex-basis: 100%;
  align-items: center;
  justify-content: center; /* Center the text */
  color: black;
  font-size: 16px;
  margin: 8px 0px;
}

.centerline::before,
.centerline::after {
  content: "";
  flex-grow: 1;
  background: #e9e9e9;
  height: 1px;
  font-size: 0px;
  line-height: 0px;
}

.centerline::before {
  margin: 0px 16px; /* Space on the right side */
}

.centerline::after {
  margin: 0px 16px; /* Space on the left side */
}


</style>
<!-- Masthead-->
<!-- <header class="masthead">
            <div class="container">
            	<div class="text-center">
	                <h6 class="masthead-subheading">Welcome To Our Site!</h6>
	                <div class="masthead-heading text-uppercase">낭만농장 하우스</div>
	                <div class="visitorCnt">38</div>
                </div>
            </div>
        </header>  -->
<!-- Services-->
<section class="page-section">
	<div class="container main-section">
		<div class="col-md-6 main">				
			<ol>
				<!-- <li class="visitorLi"><p class="visitorCounter">TODAY <span id="hitCt"></span></p></li>-->
				<li class="centerline"><p >NOTICE</p></li>
				<li><span class="lispan">01</span><p class="lip">옛 시절 부터 현재까지의 낭만 농장 아이템을 검색 하실 수 있습니다.</p></li>
				<li><span class="lispan">02</span><p class="lip">낭만 농장 설치물에 대한 정보를 검색 하실 수 있습니다.<br> (미니어처, 하우징, 리플레이 낭농 아이템은 포함되어 있지 않습니다.)</p></li>
				<li><span class="lispan">03</span><p class="lip">이미지, 잘못된 정보 제보 부탁드립니다.</p></li>
				<li><span class="lispan">04</span><p class="lip">모바일 페이지는 지원하지 않습니다.</p></li>
				
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
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            
                            	<div class="portImg">
                            	<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal${index }">
                                <!-- <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>-->
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
<!-- Portfolio Grid-->
 <%-- <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Portfolio</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${path }/resources/assets/img/portfolio/1.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Threads</div>
                                <div class="portfolio-caption-subheading text-muted">Illustration</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/2.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Explore</div>
                                <div class="portfolio-caption-subheading text-muted">Graphic Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/3.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Finish</div>
                                <div class="portfolio-caption-subheading text-muted">Identity</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/4.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Lines</div>
                                <div class="portfolio-caption-subheading text-muted">Branding</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/5.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Southwest</div>
                                <div class="portfolio-caption-subheading text-muted">Website Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/6.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Window</div>
                                <div class="portfolio-caption-subheading text-muted">Photography</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>  --%>
<!-- Clients-->
<!--  <div class="py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/microsoft.svg" alt="..." aria-label="Microsoft Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/google.svg" alt="..." aria-label="Google Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/facebook.svg" alt="..." aria-label="Facebook Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/ibm.svg" alt="..." aria-label="IBM Logo" /></a>
                    </div>
                </div>
            </div>
        </div> -->
<!-- Contact-->
<!-- <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Contact Us</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                * * * * * * * * * * * * * * *
                * * SB Forms Contact Form * *
                * * * * * * * * * * * * * * *
                This form is pre-integrated with SB Forms.
                To make this form functional, sign up at
                https://startbootstrap.com/solution/contact-forms
                to get an API token!
                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                Name input
                                <input class="form-control" id="name" type="text" placeholder="Your Name *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            <div class="form-group">
                                Email address input
                                <input class="form-control" id="email" type="email" placeholder="Your Email *" data-sb-validations="required,email" />
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <div class="form-group mb-md-0">
                                Phone number input
                                <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                Message input
                                <textarea class="form-control" id="message" placeholder="Your Message *" data-sb-validations="required"></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                        </div>
                    </div>
                    Submit success message
                   
                    This is what your users will see when the form
                    has successfully submitted
                    <div class="d-none" id="submitSuccessMessage">
                        <div class="text-center text-white mb-3">
                            <div class="fw-bolder">Form submission successful!</div>
                            To activate this form, sign up at
                            <br />
                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                        </div>
                    </div>
                    Submit error message
                   
                    This is what your users will see when there is
                    an error submitting the form
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                    Submit Button
                    <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase disabled" id="submitButton" type="submit">Send Message</button></div>
                </form>
            </div>
        </section> -->
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
