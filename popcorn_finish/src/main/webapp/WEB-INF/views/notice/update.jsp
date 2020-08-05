<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
<title>공지 수정</title>

	<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			CKEDITOR.replace('notice_content');
		};
	</script>

</head>
<body>



<h2><span>Notice Update</span></h2>

<div class="container">
	<form class="form-horizontal"
		  action="update"
		  method="post">
		
		<input type="hidden" name="notice_num" value="${dto.notice_num }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="id">ID</label>
			<div class="col-sm-6">
				<input class="form-control" type="text"
				       name="id" id="search" value="${dto.id}">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="notice_title">제목</label>
			<div class="col-sm-6">
				<input class="form-control" type="text"
					   name="notice_title" id="search"
					   value="${dto.notice_title }">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="notice_content">내용</label>
			<div class="col-sm-8">
			<div class="container-ckeditor">
				<textarea rows="5" cols="5" class="form-control" 
						  name="notice_content" id="notice_content"
						  value="${dto.notice_content }"></textarea>
			</div>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="type">분류</label>
			<div class="col-sm-6" style="width:55%;">
			<label for="opt1" class="radio">
				<input type="radio" name="notice_type" id="opt1" value="영화관련" class="hidden"
				<c:if test="${dto.notice_type eq '영화관련' }">checked="checked"</c:if>>
				<span class="label-radio"></span> 영화
			</label>
			<label class="radio">
				<input type="radio" name="notice_type" id="opt2" value="로그인관련" class="hidden"
				<c:if test="${dto.notice_type eq '로그인관련' }">checked="checked"</c:if>>
				<span class="label-radio"></span> 로그인
			</label>
			<label class="radio">
				<input type="radio" name="notice_type" id="opt3" value="리뷰관련" class="hidden"
				<c:if test="${dto.notice_type eq '리뷰관련' }">checked="checked"</c:if>>
				<span class="label-radio"></span> 리뷰
			</label>
			<label class="radio">
				<input type="radio" name="notice_type" id="opt4" value="결제관련" class="hidden"
				<c:if test="${dto.notice_type eq '결제관련' }">checked="checked"</c:if>>
				<span class="label-radio"></span> 결제
			</label>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="notice_pw">Password</label>
			<div class="col-sm-6">
				<input class="form-control" type="password"
					   name="notice_pw" id="search">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<button class="btn btn1">수정</button>
				<button type="reset" class="btn btn1" onclick="history.back()">취소</button>
			</div>
		</div>
	</form>
</div>


</body>
</html>