<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_review.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#star').barrating({
			theme: 'fontawesome-stars'
			, initialRating: ${dto.review_star}
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
      background-color: black;
      overflow-x: auto;
      padding-left: 100px;
      padding-right: 100px;
      color: white;
    }
</style>
<body>
	<div class="container">

 <form class="form-horizontal" method="post" 
       action="update">
       
<input type="hidden" name="review_num" value= "${dto.review_num}">       
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="nowPage" value="${param.nowPage}">      
<input type="hidden" name="movie_num" value="${param.movie_num}">      
  
 <div class="row">
  <div class="col-sm-4 col-sm-offset-2">
	<h4 class="h_review"><strong class="blind">리뷰수정</strong></h4>
  </div>

 </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">영화</label>
    <div class="col-sm-6">악인전</div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="review_title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="review_title" id="review_title" class="form-control" value="${dto.review_title }">
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
     <textarea rows="5" cols="5" id="review_content" name="review_content" class="form-control">${dto.review_content }</textarea>
    </div>  
  </div>
  
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn btn1">수정</button>
    <button type="reset" class="btn btn1">취소</button>
    <button type="button" class="btn btn1" onclick="reviewList()">목록</button>
   </div>
  </div> 

</form>  
</div>
</body>
</html>