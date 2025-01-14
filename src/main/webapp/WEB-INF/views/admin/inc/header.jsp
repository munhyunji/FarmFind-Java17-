<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="isme" value="dlwlrma2341" />
    
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
   	 let apiurl = "https://farmfindapi.shop:8090/";
   	 
   	 $(document).ready(function(){
   		 let userId = sessionStorage.getItem("id");
   		 let confirm = '${isme}';
   		 
   		 if(userId === '' || userId === null || userId != confirm) {
   			 alert("로그인페이지로 이동합니다.");
   			 location.href='${path}/admin/login';
   			 sessionStorage.clear();
   		 } 
   	 })
    </script>
