<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi_movie.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
 <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    * {
      color : white;
      font-weight: bold;
    }
    .dropbtn {
      position:absolute;
      background-color: inherit; /* Blue background */
      border: none; /* Remove borders */
      color: white; /* White text */
      padding: 12px 16px; /* Some padding */
      font-size: 20px; /* Set a font size */
      font-weight: bold;
      cursor: pointer; /* Mouse pointer on hover */
      top: 90%;
      left: 15%;
      transform: translate(-50%, -50%);
      -ms-transform: translate(-50%, -50%);
    }
    /* Darker background on mouse-over */
    .dropbtn:hover {
      background-color: inherit;
    }
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color: black;
    }
    body {
      background-color: black;
      overflow-x: auto;
    }
    .dropdown-content {

      display: none;
      position: relative;
      z-index: 9;
    }
    .dropdown-content div {
      padding: 12px 16px;
      display: block;
    }

  </style>
  <script>
  $(document).ready(function(){
  	$("i").hide();
  $("#avengers").on("click",function(){
  	$("#myDropdown").hide(1000);
  	$("i").show();
  	$("#movie").slideToggle();


  });

  $("#avengers").mouseout(function(){
  		$("#imgdiv").css("margin-top","50px");
     	 	$("#avengers").css("width","80%");
  });

  $("#avengers").mouseover(function(){
 	 	$("#imgdiv").css("margin-top","0px");
 	 	$("#avengers").css("width","100%");
 });

  $("#caption_marvel").on("click",function(){
  	$("#movie").hide(1000);
  	$("i").show();
  	$("#myDropdown1").slideToggle();

 
  	$("#myDropdown1").mouseout(function(){
     	 	$("#myDropdown1").hide(1000);
     	 });
  });

  $("#caption_marvel").mouseout(function(){
  		$("#imgdiv1").css("margin-top","50px");
     	 	$("#caption_marvel").css("width","80%");

  });

  $("#caption_marvel").mouseover(function(){
 	 	$("#imgdiv1").css("margin-top","0px");
 	 	$("#caption_marvel").css("width","100%");

 });

  });   
</script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">PopCorn</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">홈</a></li>
        <li><a href="#">TV 프로그램</a></li>
        <li><a href="#">영화</a></li>
        <li><a href="#">최신 등록 컨텐츠</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid bg-3 text-left">
  <h3>현재 가장 Hot 한 영화</h3><br>
  <div class="row">
    <div class="container col-sm-3" align="center" style="margin-top: 50px" id="imgdiv">
      <button onclick="myFunction()" class="dropbtn"><i class="fa fa-angle-down" id="downi"></i></button>
      <img src="${root}/images/avengers_endgame.jpg" class="img-responsive" style="width:80%" alt="Images" id="avengers">

    </div>
    <div class="col-sm-3" align="center" style="margin-top: 50px" id="imgdiv1">
      <img src="../images/captain_marvel.jpg" class="img-responsive" style="width:80%" alt="Images" id="caption_marvel">
    </div>
    <div class="col-sm-3">
      <img src="../images/howtotrainyourdragon3.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="../images/alita_battleangel.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>

  <div id="myDropdown" class="dropdown-content">
    <div>
      <img src="../images/avengers_endgame_horizontal.jpg" class="img-responsive" style="width:100%" alt="Images">
    </div>
  </div>
  <div id="myDropdown1" class="dropdown-content">
    <div>
      <img src="../images/captain_marvel.jpg" class="img-responsive" style="width:100%" alt="Images">
    </div>
  </div>

</div><br>

<div id="movie" class="dropdown-content" style="width:100%; height:100%" >
<img src="../images/1.jpg" >
	<table style="background-color: black; width:100%; height:100%">
		<tr>
			<td colspan="2" ><img src="../images/avengers_endgame_horizontal.jpg" class="img-responsive" style="width:100%" alt="Images"></td>
		<td valign="top" colspan="2">
		<font color="white">
		인피니티 워 이후 절반만 살아남은 지구
 		마지막 희망이 된 어벤져스
 		먼저 떠난 그들을 위해 모든 것을 걸었다! 
 		위대한 어벤져스
 		운명을 바꿀 최후의 전쟁이 펼쳐진다!
 		짜란다짜란다 짜란~~다
 		</font>
 		</td>
	</tr>
	<tr>
		<td><img src="../images/avengers_endgame_horizontal.jpg" class="img-responsive" style="width:100%" alt="Images"></td>
		<td><img src="../images/avengers_endgame_horizontal.jpg" class="img-responsive" style="width:100%" alt="Images"></td>
		<td><font color="white">영화장르: <br>주연: <br>개봉날짜: </font></td>

		<td><font color="white">리뷰</font></td>
	</tr>
	</table>
</div>
<div id="movie1" class="dropdown-content"><img src="../images/1.jpg" >
	<table style="background-color: black; width:100%; heihgt:100%">
		<tr>
			<td colspan="2" ><img src="../images/avengers_endgame_horizontal.jpg" class="img-responsive" style="width:100%" alt="Images"></td>
		<td valign="top" colspan="2">
		<font color="white">
		인피니티 워 이후 절반만 살아남은 지구
 		마지막 희망이 된 어벤져스
 		먼저 떠난 그들을 위해 모든 것을 걸었다! 
 		위대한 어벤져스
 		운명을 바꿀 최후의 전쟁이 펼쳐진다!
 		짜란다짜란다 짜란~~다
 		</font>
 		</td>
	</tr>
	<tr>
		<td><img src="../images/movie2.jpg" class="img-responsive" style="width:100%" alt="Images"></td>
		<td><img src="../images/movie2.jpg" class="img-responsive" style="width:100%" alt="Images"></td>
		<td><font color="white">영화장르: <br>주연: <br>개봉날짜: </font></td>

		<td><font color="white">리뷰</font></td>
	</tr>
	</table>
</div>



<div class="container-fluid bg-3 text-left">
  <h3>20대 Best Choice</h3>
  <div class="row">
    <div class="col-sm-3">
      <img src="../images/avengers_endgame.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="../images/shazam.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="../images/pikachu.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="../images/after.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br><br>

<div class="container-fluid bg-3 text-left">
  <h3>내가 찜 한 영화</h3>
  <div class="row">
    <div class="col-sm-3">
      <img src="../images/captain_marvel.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="../images/dumbo.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="../images/escaperoom.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <img src="../images/avengers_endgame.jpg" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br><br>

</body>
</html>