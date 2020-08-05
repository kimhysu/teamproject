<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
  <title>회원탈퇴</title>
  <meta charset="utf-8">
</head>
<body> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">회원탈퇴</h1>
<div class="well well-lg">
<c:choose>
<c:when test="${flag}">
회원탈퇴를 성공했습니다. 자동 로그아웃 됩니다.s
</c:when>
<c:otherwise>
회원탈퇴를 실패했습니다.
</c:otherwise>
</c:choose>

</div>
    <button class="btn" onclick="location.href='${root}/index.jsp'">홈</button>
    <button type="reset" class="btn" onclick="history.back()">다시시도</button>
</div>
</body> 
</html> 