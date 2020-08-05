<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
  <title>회원탈퇴</title>
  <meta charset="utf-8">

<style type="text/css">
div[class="form-group"]{
    font-size: 20px;
    text-align: center;
}
</style>


</head>
<body> 

<h2 style="margin-top: 200px;">회원탈퇴</h2>

<div class="container">
<form class="form-horizontal" 
      action="delete"
      method="post"
      >
<input type="hidden" name="id" value="${param.id}">
<input type="hidden" name="oldfile" value="${param.oldfile}">

<div class="form-group">
  
    탈퇴를 하시면 더이상 콘텐츠를 제공받을 수 없습니다.<br>
    그래도 탈퇴를 원하시면 아래 탈퇴버튼을 눌러 주세요.
  
  </div>

   <div class="form-group">
   <div>
    <button class="btn btn1">탈퇴</button>
    <button type="reset" class="btn btn1" onclick="history.back()">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 