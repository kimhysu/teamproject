<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="apple-touch-icon" sizes="57x57" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="60x60" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="120x120" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="144x144" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="152x152" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="apple-touch-icon" sizes="180x180" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="icon" type="image/png" sizes="192x192"  href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="icon" type="image/png" sizes="96x96" href="<%=request.getContextPath()%>/images/favicon.PNG">
<link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/images/favicon.PNG">

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <!-- jquery에 필요한 부분 start -->
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>
  <!-- jquery에 필요한 부분 end -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Patua+One&display=swap" rel="stylesheet">
  <!-- star-rating -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/star-rating/fontawesome-stars.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/star-rating/jquery.barrating.min.js"></script>

<style type="text/css">
.main {
  padding: 16px;
  margin-top: 50px;
  font-family: 'Jua', sans-serif;
}
header{
	font-family: 'Patua One', cursive;
}
body{
	background-color: #141414;
	color: #eee6c4;
}
label{
	color: #eee6c4;
	font-family: 'Jua', sans-serif;
}

h2 {
  text-align: center;
  color: #fff;
  font-size: 40px;
  font-family: 'Jua', sans-serif;
  font-weight: 700px;
  margin-top: 60px;
  text-shadow: 1px 5px 4px #f44336;
}

#search{
	background-color: #141414;
	color: #eee6c4;
	border: 2px solid #f44336;
	height: 36px;
}
.btn1 {
   background-color: #141414;  
   color: #eee6c4;
   border: 2px solid #f44336; 
   font-weight: 700px;
}
.btn1:hover {
   color: #f44336;
}
input[type=password]{
	width: 118px;
}


</style>

<title><tiles:getAsString name="title"></tiles:getAsString></title>
</head>
<body leftmargin="50" topmargin="50">
<!-- 상단 메뉴 -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<!-- 상단 메뉴 끝 -->
<div class="main-img">
<div class="main">
<div class="main-inner">
<!-- 내용 시작 -->
<tiles:insertAttribute name="body"></tiles:insertAttribute>

</div>
</div>
</div>
</body>
</html>