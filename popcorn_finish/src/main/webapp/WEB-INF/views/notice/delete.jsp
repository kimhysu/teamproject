<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
<title>공지 삭제</title>

<style type="text/css">
	#p{
		color: white;
	}
	#out{
  		position: relative;
  		text-align: center;
  		color: white;
	}
	#in{
		display: inline-block;
	}
</style>


</head>
<body>



<h2 style="margin-top: 200px;">공지 삭제</h2>

<div class="container">

	<form class="form-horizontal"
		  action="delete"
		  method="post"
		  id="out"
		  >
		
		<input type="hidden" name="notice_num" value="${notice_num }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		
		<div class="form-group" id="in">
			<label class="control-label" for="notice_pw">비밀번호</label>
			<div>
				<input type="password" name="notice_pw" id="search" class="form-control">
			</div>
		</div>
		<p id="p">삭제하면 복구할 수 없습니다.</p>
		
		<div class="form-group">
			<div>
				<button class="btn btn1">삭제</button>
				<button type="reset" class="btn btn1" onclick="history.back()">취소</button>
			</div>
		</div>
	</form>
	
</div>

</body>
</html>