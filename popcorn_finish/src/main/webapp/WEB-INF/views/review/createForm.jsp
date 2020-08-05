<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_review.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<!-- <meta charset="UTF-8"> -->
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<title>Insert title here</title>


<script type="text/javascript">

	$(function(){
		$('#star').barrating({
			theme: 'fontawesome-stars'
			, initialRating: -1
			, readonly: false
			, onSelect: function(value, text, event){
				
			}
		});
	});
	
	function reviewList(){
		var url = "list";
		url += "?movie_num=${param.movie_num}";
		location.href=url;
	}	
</script>

</head>

<style>
body {
      overflow-x: auto;
      padding-left: 100px;
      padding-right: 100px;
      background-color: #141414; 
    }

input:enabled{
	background : #141414;
	color: #eee6c4;
}
#review_content{
 background : #141414;
 color: #eee6c4;
}
</style>

<body>
	<div class="container">

 <form class="form-horizontal" method="post" 
       action="create">
       
<input type="hidden" name="id" value="${sessionScope.id }">
<input type="hidden" name="movie_num" value="${param.movie_num}">
<input type="hidden" name="movie_name" value="${movie_name}">

  
 <div class="form-group">
 <br>
  <div class="col-sm-4 col-sm-offset-2">
	<h4 class="h_review"><strong class="blind">리뷰쓰기</strong></h4>
  </div>

 </div>
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">영화</label>
    <div class="col-sm-6" id="movie_name">${movie_name}</div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="review_title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="review_title" id="review_title" class="form-control">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="review_star">별점</label>
    <div class="col-sm-6">
      <select id="star" name="review_star" class="form-control">
      	<option value="1">1</option>
      	<option value="2">2</option>
      	<option value="3">3</option>
      	<option value="4">4</option>
      	<option value="5">5</option>
      </select>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="review_content">내용</label>
    <div class="col-sm-6">
     <textarea rows="5" cols="5" id="review_content" name="review_content" class="form-control"></textarea>
    </div>  
  </div>
  
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn btn1">등록</button>
    <button type="reset" class="btn btn1">취소</button>
    <button type="button" class="btn btn1" onclick="reviewList()">목록</button>
    
   </div>
  </div> 

</form>  
</div>
</body>
</html>

<!-- $('.starRev span').click(function(){ -->
<!--   $(this).parent().children('span').removeClass('on'); -->
<!--   $(this).addClass('on').prevAll('span').addClass('on'); -->
<!--   return false; -->
<!-- }); -->