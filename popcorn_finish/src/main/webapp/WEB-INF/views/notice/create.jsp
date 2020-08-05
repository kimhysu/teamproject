<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
<title>공지 등록</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
	window.onload=function(){
		CKEDITOR.replace('notice_content');
	};
	</script>
<style type="text/css">
.form-control{
	background-color: #141414;
	border: 1px solid #999999;
}
</style>



</head>
<body>



<h2><span>공지 등록</span></h2>

<div class="container">
	<form class="form-horizontal"
		  action="create"
		  method="post">
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="id">ID</label><!-- user부분은 변경할 수 없게 가져오고 싶다! = 상우형  member와 합쳐야 함! -->
			<div class="col-sm-6">
				<input type="text" name="id" id="search" value="admin" class="form-control">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="notice_title">제목</label>
			<div class="col-sm-6">
				<input type="text" name="notice_title" id="search" class="form-control">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="notice_content">내용</label>
			<div class="col-sm-8">
			<div class="container-ckeditor">
				<textarea rows="7" cols="7" name="notice_content" id="search" class="form-control"></textarea>
			</div>
			</div>
		</div>
		
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="type">분류</label>
			<div class="col-sm-6" style="width:55%;">
			
				<label for="opt1" class="radio">
   					<input type="radio" name="notice_type" id="opt1" class="hidden" value="moive"/>
    				<span class="label-radio"></span> 영화
  				</label>
				<label for="opt2" class="radio">
				    <input type="radio" name="notice_type" id="opt2" class="hidden" value="login"/>
				    <span class="label-radio"></span> 로그인
  				</label>
				<label for="opt3" class="radio">
				    <input type="radio" name="notice_type" id="opt3" class="hidden" value="review"/>
				    <span class="label-radio"></span> 리뷰
  				</label>
				<label for="opt4" class="radio">
				    <input type="radio" name="notice_type" id="opt4" class="hidden" value="payment"/>
				    <span class="label-radio"></span> 결제
  				</label>
  				
			</div>
		</div>
		
<!-- 		<div class="form-group"> -->
<!-- 			<label class="control-label col-sm-2" for="type">Checkbox</label> -->
<!-- 			<div class="col-sm-6" style="width:70%;"> -->
				
<!-- 				<label class="checkbox"> -->
<!-- 					<input type="checkbox" class="hidden" value="cbk1"> -->
<!-- 					<span class="label-cbk"></span> checkbox01 -->
<!-- 				</label> -->
<!-- 				<label class="checkbox"> -->
<!-- 					<input type="checkbox" class="hidden" value="cbk2"> -->
<!-- 					<span class="label-cbk"></span> checkbox02 -->
<!-- 				</label> -->
<!-- 				<label class="checkbox"> -->
<!-- 					<input type="checkbox" class="hidden" value="cbk3"> -->
<!-- 					<span class="label-cbk"></span> checkbox03 -->
<!-- 				</label> -->
<!-- 				<label class="checkbox"> -->
<!-- 					<input type="checkbox" class="hidden" value="cbk4"> -->
<!-- 					<span class="label-cbk"></span> checkbox04 -->
<!-- 				</label> -->
				
<!-- 			</div> -->
<!--     	</div> -->
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="notice_pw">비밀번호</label>
			<div class="col-sm-6">
				<input type="password" name="notice_pw" id="search" class="form-control">
			</div>
		</div>
		
		<div class="form-group">
		<div class="col-sm-offset-2 col-sm-5">
			<button class="btn btn1">등록</button>
			<button type="reset" class="btn btn1" onclick="history.back()">취소</button>
		</div>
		</div>
	</form>
</div>

</body>
</html>