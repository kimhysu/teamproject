<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head>
  <title>비밀번호 변경</title>
  <meta charset="utf-8">
  
<script type="text/javascript">
function incheck(f){
  if(f.pw.value==""){
    alert('비밀번호를 입력하세요');
    f.pw.focus();
    return false;
  }
  if(f.repasswd.value==""){
    alert('비밀번호 확인을 입력하세요');
    f.repasswd.focus();
    return false;
  }
  if(f.pw.value != f.repasswd.value){
    alert('비밀번호가 서로 다릅니다.');
    f.pw.value="";
    f.repasswd.value="";
    f.pw.focus();
    return false;
  }
}
</script>

<style type="text/css">
div[class="form-group"]{
    font-size: 14px;
    text-align: center;
}
.main-img::after{
	content: '';
	position: fixed;
	top:0;
	width:100%;
	height:100%;
	background-image: url("../images/avengers.jpg");
	background-repeat: repeat-y;
	background-size: cover;
	display: block;
	z-index: -1;
}
.main{
	background-color: rgba(0,0,0, 0.3);
	display: flex;
	justify-content: center;
}
.main-inner{
	width: 1000px;
	min-height: 650px;
	background-color: rgba(0,0,0, 0.75);
	box-sizing: border-box;
	margin: 2rem 0;
	border-radius: 4px;
	box-shadow: 1px 1px 13px 4px rgba(255,255,255,1);
	padding: 0 5rem;
}
.container{
	position: relative;
	_margin: 5% 15px;
	padding: 20px;
	margin-top: 20px;
	width: 100% !important;
}
</style>


</head>
<body>


<h2 style="margin-top: 200px;">비밀번호번경</h2>

<div class="container">
<form class="form-horizontal" 
      action="updatePw"
      method="post"
      onsubmit="return incheck(this)"
      >

<input type="hidden" name="id" value="${param.id}">

  <div class="form-group">
    <label class="control-label col-sm-5" for="pw">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="pw" id="search" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-5" for="repasswd">비밀번호확인</label>
    <div class="col-sm-6">
      <input type="password" name="repasswd" id="search" class="form-control">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-4 col-sm-4">
    <button class="btn btn1">변경</button>
    <button type="reset" class="btn btn1">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 