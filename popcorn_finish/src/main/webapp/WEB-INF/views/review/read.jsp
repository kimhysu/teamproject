<%@page import="org.springframework.web.context.request.SessionScope"%>
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
		, readonly: true
		, initialRating: ${dto.review_star}
		
	});
});


function recommend(){
			var url = "thumb";
			var param = "review_num="+${dto.review_num};
			$.get(
					url,
					param,
					function(data, textStatus){
					$("#recommend_success").text(data);
		           }
			);		
	    }
	

$(document).ready(function(){
	  var modal = '${msg}';//Controller에서 가져온 데이터
	  
	  checkModal(modal); //modal 생성
	  
	  //history back일때는 modal 안보여주는 코드 1
	  history.replaceState({},null,null);
	  
	  function checkModal(modal){ //modal 생성함수 선언
		  if(history.state) return; //코드2
		  if(modal){
			  $(".modal-body").html(modal);
			  $("#myModal").modal("show");
		  }
	  }
});

function updateM(){
	var url = "update";
	url += "?review_num=${dto.review_num}";
	url += "&col=${param.col}";
	url += "&nowPage=${param.nowPage}";
	url += "&movie_num=${dto.movie_num}";
	
	location.href=url;
}

function reviewList(){
	var url = "list";
	url += "?col=${param.col}";
	url += "&nowPage=${param.nowPage}";
	url += "&movie_num=${dto.movie_num}";
	location.href=url;
}

function deleteM(){
	if(confirm("정말 삭제하시겠습니까?")==true){
		var url = "delete";
		url += "?review_num=${dto.review_num}";
		url += "&col=${param.col}";
		url += "&nowPage=${param.nowPage}";
		url += "&movie_num=${dto.movie_num}";
		location.href=url;
		
	}else{
		return;
	}
	
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

#myModal{
	color: black;
}
.panel-body{
	color: black;
}

.btn1 {
   background-color: #141414;  
   color: #eee6c4;
   border: 2px solid #f44336; 
 } 
.btn1:hover { 
   color: #f44336; 
 }

</style>

<body>
<div class="container">
 <br>
 <div class="title_area">
 <div class="row">
 <div class="col-sm-10">
 <h2><strong class="blind" id="eng">Review</strong></h2></div>
 <div class="col-sm-2">
 <button class="btn btn1 pull-right" onclick="javascript:reviewList();">목록</button></div>
 </div>
 </div>
 
 <div class="top_behavior">
  <div class="star_score">
  
      <select id="star" name="review_star" class="star_score">
      	<option value="1">1</option>
      	<option value="2">2</option>
      	<option value="3">3</option>
      	<option value="4">4</option>
      	<option value="5">5</option>
      </select>
    
  </div>
  <h4><strong class="review_title">${dto.review_title }</strong></h4>
  <span class="review_date pull-right">${dto.review_date }</span>
 </div>
 
 <div class="board_title">
  <div class="cnt_thumb">
  <span><img style="filter:invert(100%)" src="${root}/images/viewcnt.png" width="20" height="20">${dto.review_viewcnt }</span>
  <span><img src="${root}/images/thumb.png" width="20" height="20" >${dto.review_thumb }</span>
  </div>
 </div>
 <hr/>
 <div class="review_content">
  <div class="panel-body" style="color:white">${dto.review_content}</div>
 </div>
 
 <hr/>
 
 <div class="review_thumb">
  <a href="javascript:recommend();" class="pull-right"><img src="${root}/images/thumb.png" width="20" height="20" ></a><!-- N=a:rvi.recomd -->
  <div id="recommend_success" class="col-sm-offset-10"></div>
  <br>
 </div>
<br>

 <div>
 <br>
 <c:if test= "${sessionScope.id == dto.id}">
 <button type="button" class="btn btn1" onclick="updateM()">수정</button>
 <button type="button" class="btn btn1" onclick="deleteM()">삭제</button>
 </c:if>
 </div>

</div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Notification</h4>
        </div>
        <div class="modal-body">
          <p>This is a small modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

</body>
</html>