<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	String str = "기본페이지";
	if(id !=null && !grade.equals("A")){
		str = "안녕하세요" + id + "님"; 
		}else if(id != null && grade.equals("A")){
			str = "관리자페이지";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	function myFunction() {
		var x = document.getElementById("myLinks");
		if (x.style.display === "block") {
			x.style.display = "none";
		} else {
			x.style.display = "block"; 
		}
	}
</script>
<style>
.navbar {
  overflow : visible;
  background-color: black;
  background:rgba(0,0,0,0.9);
  position: fixed;
  top: 0;
}
.nav{
	font-size: 20px;
	font-family: 'Patua One', cursive;
}

.topnav #myLinks {
  display: none;
  text-align: right;
}

.topnav a {
  color: #eee6c4;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  font-weight: bold;
  display: block;
}
#login{
  right: 0;
  top: 0;
}

.topnav a.icon {
  background: black;
  display: block;
  position: absolute;
  right: 0;
  top: 0;
}

.topnav a:hover {
  background-color: #5a5a5a;
  color: #f44336;
}

</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			<% if(id == null) {%>
				<a href="<%=root%>"><img
					src="<%=root%>/images/popCorn_red.png"
					style="width: 250px; height: 70px;"></a>
					<%}%>
			<%if(id != null && grade.equals("H")){ %>
			<a href="<%=root%>/index"><img
					src="<%=root%>/images/popCorn_red.png"
					style="width: 250px; height: 70px;"></a>
					<%}%>
			<%if(id != null && grade.equals("A")){ %>
			<a href="<%=root%>/movie/admin_list"><img
					src="<%=root%>/images/popCorn_red.png"
					style="width: 250px; height: 70px;"></a>
					<%}%>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#"></a></li>
				<li class="active"><a href="#"></a></li>
<%-- 				<li><a href="<%=root%>/movie/create" style="padding-top: 25px">MOVIE</a></li> --%>
				<li><a href="<%=root %>/notice/list" style="font-size:20px; font-weight:normal;
													padding-top: 25px; color: #eee6c4; display: inline-block;">NOTICE</a></li>
				
			</ul>
	<ul class="nav navbar-nav navbar-right">
	<% if(id == null) {%>
      <li><a href="<%=root %>/member/agreement" style="font-size:20px; font-weight:normal; padding-top: 25px;
      										color: #eee6c4; display: inline-block;"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<%=root %>/member/login" style="font-size:20px; font-weight:normal; padding-top: 25px;
      										color: #eee6c4; display: inline-block;"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
    			<%}%>
    </ul>
		</div>
		<div class="topnav">
			<%if(id != null && grade.equals("H")){ %>
		<a href="javascript:void(0);" class="icon" onclick="myFunction()" style="width: 70px; height: 70px; text-align: center;">
			<i class="fa fa-bars" style="font-size: 42px; color: #f44336;"></i>
			</a>
			<%}%>
			<%if(id != null && grade.equals("A")){ %>
		<a href="javascript:void(0);" class="icon" onclick="myFunction()" style="width: 70px; height: 70px; text-align: center;">
			<i class="fa fa-bars" style="font-size: 42px; color: #f44336;"></i>
			</a>
			<%}%>
			<div id="myLinks">
			  <% if(id == null) {%>
			  <a href="<%=root %>/member/agreement">회원가입</a>   
			  <a href="<%=root %>/member/login">로그인</a>
         <%}%>
      	 <%if(id != null && grade.equals("H")){ %>
         <a href="<%=root %>/member/read">나의정보</a>        
         <a href="<%=root %>/member/update">회원수정</a>        
         <a href="<%=root %>/cart/list">장바구니</a>
         <a href="<%=root %>/pay/list">결제내역</a>
         <a href="<%=root %>/member/logout">로그아웃</a>
         
         <%}else if(id!=null && grade.equals("A")) {%>
         <a href="<%=root %>/member/update">회원수정</a>        
         <a href="<%=root %>/admin/list">회원목록</a>
         <a href="<%=root %>/member/logout">로그아웃</a>
        <%}%>         
			</div>

		
	</div>
	</nav>
</body>
</html>