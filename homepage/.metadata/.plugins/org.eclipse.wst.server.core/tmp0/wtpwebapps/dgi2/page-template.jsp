<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%

    String region = "경상북도";
    String period = "2020년 07월";
    
%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <!-- Required meta tags -->
    <meta charset="euck-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>데이터 기반 정책지원시스템</title>

    <!-- vendor css -->
    <link href="lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="http://themepixels.me/demo/dashforge1.1/lib/select2/css/select2.min.css" rel="stylesheet">

    <!-- DashForge CSS -->
    <link rel="stylesheet" href="assets/css/dashforge.css">
    <link rel="stylesheet" href="assets/css/dashforge.nice.css">

</head>
<body>

    <%@ include file = "navbar.jsp" %>

    <div class="content content-fixed"> 
		<div class="container pd-x-0 pd-lg-x-10 pd-xl-x-0">
			<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
	        	<div>
	            	<nav aria-label="breadcrumb">
	              		<ol class="breadcrumb breadcrumb-style1 mg-b-10">
	                		<li class="breadcrumb-item"> title</li>
	                		<li class="breadcrumb-item active" aria-current="page">sub-title</li>
	              		</ol>
	            	</nav>
	            	<h4 class="mg-b-0 tx-spacing--1">데이터로 보는 <b><%= region %></b> 현황 <span class="tx-color-03 tx-14">(<%= period %>)</span></h4>
	          	</div>
				<%@ include file = "print.jsp" %>
	        </div>
	        
	    	<%@ include file = "header.jsp" %>
	    	
      	</div><!-- container -->
    </div><!-- content -->

    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="lib/feather-icons/feather.min.js"></script>
    <script src="lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="lib/chart.js/Chart.bundle.min.js"></script>
    <script src="http://themepixels.me/demo/dashforge1.1/lib/select2/js/select2.min.js"></script>

    <script src="assets/js/dashforge.js"></script>
    <script src="assets/js/dashforge.nice.js"></script>
	<script>

	$(function(){
		'use strict'

		// 선택 메뉴 활성화
		setNavbarMenu(1);

	});
	</script>
</body>
</html>