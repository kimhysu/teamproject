<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<script type="text/javascript">
function read(id){
  var url = "${root}/member/read";
  url += "?id="+id;
  location.href=url;
}
</script>
</head>
<body> 

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">회원목록</h1>
<form class="form-inline" action="./list">
    <div class="form-group">
    <select class="form-control" name="col">
      <option value="mname" 
      <c:if test="${col=='name'}">selected</c:if>
      >성명</option>
      <option value="title"
       <c:if test="${col=='id'}">selected</c:if>
      >아이디</option>
      <option value="email"
        <c:if test="${col=='email'}">selected</c:if>
      >이메일</option>
      <option value="total"
         <c:if test="${col=='total'}">selected</c:if>
      >전체출력</option>
    </select>
    </div>
    <div class="form-group">
    <input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="${word}">
    </div>
    <button type="submit" class="btn btn-default">검색</button>
    <button type="button" class="btn btn-default" onclick="location.href='${root}/member/create'">등록</button>
    </form>
    <c:forEach var="dto" items="${list }">
	<br>
<table class="table table-bordered">
    
    <tr>
      
      <th>아이디</th>
      <td><a href="javascript:read('${dto.id}')">${dto.id}</a></td>
    </tr>
    <tr>
      <th>닉네임</th>
      <td>${dto.name}</td>
    </tr>
    
    <tr>
      <th>이메일</th>
      <td>${dto.email}</td>
    </tr>
    <tr>
      <th>나이</th>
      <td>${dto.age}</td>
    </tr>
    <tr>
      <th>성별</th>
      <td>${dto.gender}</td>
    </tr>
    <tr>
      <th>장르</th>
      <td>${dto.genre_str}</td>
    </tr>
   
</table>
</c:forEach>
${ paging}
</div>
</body> 
</html> 