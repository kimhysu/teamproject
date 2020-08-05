<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_movie.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
<title>영화 정보</title>
<script type="text/javascript">
$(document).ready(function(){
	  var modal = '${msg}'; //Controller에서 가져온 데이터
	  checkModal(modal); //modal생성
	  
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
function update_movie_img(){
	var url = "update_movie_img";
	url += "?movie_num=${dto.movie_num}";
	url += "&oldfile1=${dto.movie_img1}";
	url += "&oldfile2=${dto.movie_img2}";
	url += "&oldfile3=${dto.movie_img3}";
	location.href = url;
	}
function update_movie(){
	var url = "update";
	url += "?movie_num=${dto.movie_num}";
	location.href = url;
	}
function delete_movie(){
	var url = "delete";
	url += "?movie_num=${dto.movie_num}";
	url += "&oldfile1=${dto.movie_img1}";
	url += "&oldfile2=${dto.movie_img2}";
	url += "&oldfile3=${dto.movie_img3}";
	location.href=url;	
}
</script>
</head>
<body>
	
	<h2>영화정보</h2>
	
	<div class="container">
	<div class="container3">
		<div class="panel panel-default">
			<div class="panel-heading">번호</div>
			<div class="panel-body">${dto.movie_num}</div>

			<div class="panel-heading">영화 이미지</div>
			<div class="panel-body">
				<img src="./storage/${dto.movie_img1}" class="img-rounded" width="210px" height="297px">
				<img src="./storage/${dto.movie_img2}" class="img-rounded" width="324px" height="297px">
				<img src="./storage/${dto.movie_img3}" class="img-rounded" width="280px" height="297px">
			</div>

			<div class="panel-heading">영화명</div>
			<div class="panel-body">${dto.movie_name}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.movie_price}</div>
			
			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.movie_content}</div>
			
			<div class="panel-heading">출연진</div>
			<div class="panel-body">${dto.movie_cast}</div>

			<div class="panel-heading">장르</div>
			<div class="panel-body">${dto.movie_genre_str}</div>

			<div class="panel-heading">등급</div>
			<div class="panel-body">${dto.movie_grade}</div>
		
			<div class="panel-heading">개봉일</div>
			<div class="panel-body">${dto.movie_date}</div>
		
		</div>
	</div>
	
		<div>
			<button type="button" class="btn btn1" onclick="location.href='./create'">등록</button>
			<button class="btn btn1" onclick="update_movie_img()">이미지 수정</button>
			<button type="button" class="btn btn1" onclick="update_movie()">수정</button>
			<button type="button" class="btn btn1" onclick="delete_movie()">삭제</button>
<!-- 			<button type="button" class="btn" onclick="listM()">목록</button> -->
		</div>
	</div>
	
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
      
          <h4 class="modal-title">확인 메세지!</h4>
        </div>
        <div class="modal-body">
          <p>This is a small modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn1" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
	</div>

</body>
</html>