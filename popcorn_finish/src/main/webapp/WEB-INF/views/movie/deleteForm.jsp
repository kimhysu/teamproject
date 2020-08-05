<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
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



<h2>영화삭제</h2>

<div class="container">
    
    <form class="form-horizontal"
    	  method="post"
    	  action="delete"
    >
	  
	  <input type="hidden"  name="movie_num" value="${param.movie_num}">
	  <input type="hidden"  name="oldfile1" value="${param.oldfile1}">
	  <input type="hidden"  name="oldfile2" value="${param.oldfile2}">
	  <input type="hidden"  name="oldfile3" value="${param.oldfile3}">
	  
	  <div class="form-group" id="in">
			<div>
				<label class="control-label">영화관리</label>
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