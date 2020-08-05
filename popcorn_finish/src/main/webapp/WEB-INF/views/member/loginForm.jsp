<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인 처리</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">


</head>
<body>

	<h2 style="margin-top: 200px;">LOGIN</h2>
	
	<div class="container">

		<form class="form-horizontal" method="post"
			action="${root}/member/login">
			<input type="hidden" name="rurl" value="${param.rurl}"> 
<%-- 			<input type="hidden" name="id" value="${param.id}">  --%>
			<input type="hidden" name="nowPage" value="${param.nowPage}">
			<input type="hidden" name="nPage" value="${param.nPage}"> 
			<input type="hidden" name="col" value="${param.col}"> 
			<input type="hidden" name="word" value="${param.word}">

			<!-- admin으로 list를 옮겨서, forward되었기 때문에 loginProc.jsp가 아니라 절대경로를 써주어야한다! -->
			<!-- 그러면, admin/list.jsp에서 member/loginProc.jsp로 이동한다. -->
			<div class="form-group">
				<label class="control-label col-sm-4" for="id" >아이디</label>
				<div class="col-sm-6" style="display: -webkit-inline-box;">
					<input type="text" name="id" id="search" class="form-control"
						required="required" value="${ c_id_val }" style="width: 237px;">

				<div class="col-sm-2" style="width: auto;">
					
					<c:choose>
						<c:when test="${c_id=='Y'}">
						
						<label class="checkbox"> 
    						<input type="checkbox" class="hidden" name="c_id" value="Y" checked="checked">
							<span class="label-cbk">
							</span>ID저장
						</label>
						
    					</c:when>
						<c:otherwise>
						
						<label class="checkbox"> 
    						<input type="checkbox" class="hidden" name="c_id" value="Y">
							<span class="label-cbk">
							</span>ID저장
						</label>
						
    					</c:otherwise>
					</c:choose>
					
				</div>
				
				</div>				
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="pw">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" name="pw" id="search"
						class="form-control" required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<button class="btn btn1">로그인</button>
					<button type="button" class="btn btn1"
						onclick="location.href='${root}/member/agreement'">회원가입</button>
					<button type="button" class="btn btn1"
						onclick="location.href='${root}/member/findId'">ID 찾기</button>
					<button type="button" class="btn btn1"
						onclick="location.href='${root}/member/findPasswd'">PW 찾기</button>
				</div>
			</div>

		</form>
		
	</div>

</body>
</html>