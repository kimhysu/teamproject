<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/main.css">

<meta charset="utf-8">
  
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>  
<script type="text/javascript">
  function idCheck(){
    if(name.value==""){
    	alert('닉네임을 입력해주세요.');
    	document.frm.name.focus();
  	}else{
  		
    	var url = 'findIdCheck';
    	var param = $('#frm').serialize();
    	$.get(
        	url,
        	param,
        	function(data, textStatus){
         	 $('#idcheck').text(data);
        	}
    	);
  }
 }
</script>

<style type="text/css">
.btn1 {
   background-color: #141414;  
   color: #eee6c4;
   border: 2px solid #f44336; 
   font-weight: 700px;
}
.btn1:hover {
   color: #f44336;
}

input[class='form-control']{
	background-color: #141414;
	color: #eee6c4;
	border: 2px solid #f44336; 
	height: 36px;
	width: 220px;
}
div[name='a']{
	padding: 7px 2px;
    margin-bottom: 0;
    color: #fff;
}
</style>


</head>
<body>



<h2 style="margin-top: 200px;">ID 찾기</h2>

<div class="container">

<form class="form-horizontal"
	  action="findIdCheck"
	  method="post"
	  name="frm"
	  id="frm"
	  >
	  
  <div class="form-group">
    <label class="control-label col-sm-4" for="name">닉네임</label>
    <div class="col-sm-6">
      <input type="text" name="name" id="name" class="form-control" >
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-4" for="email">이메일</label>
    <div class="col-sm-6">
      <input type="text" name="email" id="email" class="form-control" >
    </div>
  </div>
  
  <div class="col-sm-offset-4 col-sm-5" id="idcheck" name="a">
  </div>

  <div class="form-group">
	<div class="col-sm-offset-4 col-sm-5">  
  	<input type="button" class="btn btn1" name="btnSubmit" id="btnSubmit" value="찾기" onclick="idCheck()">
    <button type="reset" class="btn btn1">취소</button>
    <button type="button" class="btn btn1" onclick="location.href='login'">로그인이동</button>
    </div>
  </div>
  
</form>

</div>



</body>
</html>