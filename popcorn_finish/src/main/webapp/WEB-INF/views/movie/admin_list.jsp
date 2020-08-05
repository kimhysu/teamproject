<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_movie.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
  <title>영화목록</title>
  <META CHARSET="UTF-8">
  <script type="text/javascript" >
  
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
  function read(movie_num){  //javascript변수:bbsno,url / jsp변수: col,word,nowPage
	  var url = "admin_read";
  url += "?movie_num="+movie_num;
  //게시물을 확인하고 다시 목록으로 돌아갈 때 초기화되는것을 막기위해
  url += "&col=${col}";
  url += "&word=${word}";
  url += "&nowPage=${nowPage}";
  location.href=url;
  }
  	
  
  </script>
  </head>
<body>

<h2>영화목록</h2>

<div class="container">
<div class="container2">
<form class="form-inline" method="post" action="./admin_list" >

<div class="form-group">
<select class="form-control" name="col" id="search">
		<option value="movie_cast"
		<c:if test="${col=='movie_cast'}">selected</c:if>
		>출연진</option>
		<option value="movie_name"
		<c:if test="${col=='movie_name'}">selected</c:if>
		>영화명</option>
		<option value="movie_content"
		<c:if test="${col=='movie_content'}">selected</c:if>
		>영화내용</option>
		<option value="movie_name_movie_content"
		<c:if test="${col=='movie_name_movie_content'}">selected</c:if>
		>영화제목+영화내용</option>
		<option value="total"
		<c:if test="${col=='total'}">selected</c:if>
		>영화제목+영화내용</option>
</select>
</div>
<div class="form-group">
		<input type="text" class="form-control" placeholder="Enter 검색어" name="word" value="${word}" id="search">
</div>
<button type="submit" class="btn btn1">검색</button>
<button type="button" class="btn btn1"
                  onclick="location.href='${root}/movie/create'">등록</button>

<br><br>
</form>
</div>

<div class="container3">
<div class="tbl-header">
<table>
	<thead>
		<tr>
			<th>메인 이미지</th>
			<th>영화이름</th>
			<th>가격</th>
			<th>개봉날짜</th>
			<th>출연진</th>
			<th>수정</th>
		</tr>
	</thead>
</table>
</div>

<div class="tbl-content">
<table>
	<tbody>
	
	<c:forEach var="dto" items="${list}">
		<tr>
				<td >
				     <img src="${root}/movie/storage/${dto.movie_img1}" class="img-rounded" width="50">
				</td>
				
				<td>${dto.movie_name}</td>

				<td>${dto.movie_price}</td>

				<td>${dto.movie_date}</td>

				<td>${dto.movie_cast}</td>
				
				<td><a href="javascript:read('${dto.movie_num}')">자세히</a></td>
	    </tr>
	</c:forEach>

	</tbody>
</table>
</div>
</div>

</div>
${m_paging}
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
          <button type="button" class="btn btn1" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</body> 
</html> 