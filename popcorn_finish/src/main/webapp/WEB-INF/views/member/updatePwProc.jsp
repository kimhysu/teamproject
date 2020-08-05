<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
 <title>비밀번호변경 확인</title>
  <meta charset="utf-8">
</head>
<body> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">비밀번호변경 확인</h1>
<div class="well well-lg">
<c:choose>
<c:when test="${flag }">
비밀번호 번경을 성공하였습니다.
</c:when>
<c:otherwise>
비밀번호 번경을 실패하였습니다.
</c:otherwise>
</c:choose>
</div>
<button class="btn" onclick="location.href='read.do?id=${id}'">나의정보</button>
<button class="btn" onclick="hisory.back()">다시시도</button>
</div>

</body> 
</html> 