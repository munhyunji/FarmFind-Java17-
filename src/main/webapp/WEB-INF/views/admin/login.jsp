<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
   
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>
	
	<!-- admin-->
    <link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
        
	<script type="text/Javascript" src="${path}/resources/js/jquery-1.8.2.js"></script>
	<script type="text/Javascript" src="${path}/resources/js/jquery-ui.js"></script>
	<script type="text/Javascript" src="${path}/resources/js/jquery-ui.touch.js"></script>
	
    <!-- Custom styles for this template-->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
   
</head>
	<script>
 	 //let apiurl = "http://localhost:8090/";
   	 let apiurl = "https://farmfindapi.store:8090/";	
    </script>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">관리자 페이지</h1>
                                    </div>
                                    <form class="admin" id="admin" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="adminId" aria-describedby="emailHelp"
                                                placeholder="아이디입력">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" onkeydown= "if(event.keyCode==13) javascript:adminLogin()"
                                                id="adminPw" placeholder="Password">
                                        </div>
                                        <!-- <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div> -->
                                        <a href="javascript:void(0);"  onclick="adminLogin()" class="btn btn-primary btn-user btn-block">
                                            	로그인 
                                        </a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/resources/js/sb-admin-2.min.js"></script>
	
	<script>
		function adminLogin() {
			let form = document.getElementById("admin");
			
			//폼을 만듬 
			let formdata = new FormData();
			let adminId = $("#adminId").val();
			let adminPw = $("#adminPw").val();
			
			formdata.append("adminId", adminId);
			formdata.append("adminPw", adminPw);
						
			$.ajax({
				url : apiurl+"admin/login",
				type : "POST",
				data : formdata,
				// JSON을 배열로 전달하려해서 나는 오류를
		        // 보내려해서나는 에러 form.append 할때 붙여줘야하는 설정 1.contentType, 2.processData
				contentType: false,
		        processData: false,
				success : function(data) {
					if(data == "Ok") {
						sessionStorage.setItem("id", adminId);
						location.href="${path}/admin/main";
						
						
					} else {
						alert("비밀번호가 올바르지 않습니다.");
						return false;
					}

				},
				error : function(error){
					console.log("admin 정보 확인 실패 "+error);
				}
				
			})
		}
		
		
		
			
	
	</script>
</body>
	

</html>