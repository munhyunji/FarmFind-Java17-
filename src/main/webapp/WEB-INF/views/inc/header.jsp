<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!-- 세션12 -->
<%  session.setMaxInactiveInterval(43200); %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Farm Find</title>
        
        <script type="text/Javascript" src="${path}/resources/js/jquery-1.8.2.js"></script>
		<script type="text/Javascript" src="${path}/resources/js/jquery-ui.js"></script>
		<script type="text/Javascript" src="${path}/resources/js/jquery-ui.touch.js"></script>
	
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${path }/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet" type="text/css" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/home_styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/sidebar_styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/itemList_styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/itemDetail_styles.css" rel="stylesheet" />

        <!-- <script type="text/Javascript" src="${path}/resources/js/scripts.js"></script>-->
        
    </head>
    <script>
 	 //let apiurl = "http://localhost:8090/";
   	 let apiurl = "https://farmfindapi.shop:8090/";
    </script>
 				
    <style>
    	.nav-logo {
			  width: 17%; /* 이미지 크기 조절=헤더이미지 */
		}
						
		/* .show-nav{
			display : block;
			background-color: rgba(255, 255, 255, .1);
  			backdrop-filter: blur(2px);
		}
		
		.hide-nav{
			display : none;
			transition: top 0.2s ease-in-out;
		} */
		
		.fixed-top {
		    position: fixed;
		    top: 0;
		    right: 0;
		    left: 0;
		    z-index: 1030;
		}
		
		header.py-5 {
		    height: 15vw; /* 화면 높이의 10%로 조절 */
		   }
		
		.bg-light {
		    background: 
		        url("${path}/resources/images/mainBanner_front.png") fixed 0px 0px/100% auto no-repeat, 
		        url("${path}/resources/images/mainBanner_text.png") 0px -5px/100% auto no-repeat, 
		        linear-gradient(to bottom, #b2e3e2, #ffffff) !important;
		      
		  }
		  			
    </style>


 
    <body id="page-top">
        <!-- Navigation-->
         <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="${path }/"><img class="nav-logo" src="${path }/resources/assets/img/navbar-logo.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${path }/">메인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path }/item/list">농장</a></li>
                        <%-- <li class="nav-item"><a class="nav-link" href="${path}#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path}/chat">Chat AI</a></li>
                        <li class="nav-item"><a class="nav-link" href="${path}/SalesAlaram">Contact</a></li> --%>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <!--  <h1 class="fw-bolder"></h1>
                    <p class="lead mb-0"></p>  -->
                </div>
            </div>
        </header>        

   <script>
   const navbar = document.getElementById('mainNav'); // 네비게이션 바 요소

   window.addEventListener('scroll', function() {
     if (window.scrollY === 0) {
       // 스크롤이 맨 위일 때만 navbar를 보이게
       navbar.classList.remove('hidden');
     } else {
       // 스크롤을 내리면 navbar 숨기기
       navbar.classList.add('hidden');
     }
   });
   </script>

        