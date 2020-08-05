<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_movie.jsp"%>

<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/modal.css">
<link rel="stylesheet" type="text/css" href="${root}/css/button.css">


<style type="text/css">
h1 span{
	color: #f44336;
}
table, td{
	margin:0px;
	padding:5px;
	background-color: black;
}
.table{
	margin-bottom: 30px;
}
.table-bordered>tbody>tr>td{
	box-shadow: 1px 0px 10px 5px rgba(255,255,255, 1);
}
.table-borderless>tbody>tr>td{
	border-top:none !important;
}
</style>

<script type="text/javascript">
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


function addCart(movie_num){  
	var url = "./cart/create";
	url += "?movie_num="+movie_num;

	location.href=url;
}
function addReview(movie_num){  
	var url = "./review/create";
	url += "?movie_num="+movie_num;

	location.href=url;
}
function Reviewlist(movie_num){  
	var url = "./review/list";
	url += "?movie_num="+movie_num;

	location.href=url;
}

function addPay(movie_num){  
	var url = "./pay/createOne";
	url += "?movie_num="+movie_num;

	location.href=url;
}


$(document).ready(function(){
	$("#movie").hide();
	
}); 

function movie_show(data, containner){
	//Map으로 보낸 데이터를 꺼내옴 json형태로 받았기 때문에 data.(map에 넣은 값으로 접근가능)
	movieDto  = data.movieDto; //movieDTO
	star_avg = data.star_avg; //별점평균
	
	var str = "";
	str += "<table style='width:100%; height:100%' cellspacing='0' cellpadding='0'>";
	str += "<tr><td rowspan='2'><img src='${root}/movie/storage/"+movieDto.movie_img1+"'style='width:297px; height:420px' alt='Image'></td>";
	str += "<td><h1 style='text-align: center; margin-top: 10px; font-size: 50px;'>"+movieDto.movie_name+"</h1></td>";
	str += "<td style='text-align: center'><button type='button' class='btn btn1' onclick='addCart("+movieDto.movie_num+");'>장바구니</button>"
    str += "<button type='button' class='btn btn1' style='margin-left: 2px;' onclick='addReview("+movieDto.movie_num+");'>리뷰쓰기</button>";
    str += "<button type='button' class='btn btn1' style='margin-left: 2px;' onclick='Reviewlist("+movieDto.movie_num+");'>리뷰보기</button>";
    str += "</td></tr>";
	str += "<tr><td colspan='2' valign='top' style='font-size: 20px'>"+movieDto.movie_content+"</td></tr></table>";
	str += "<table><tr><td><img src='${root}/movie/storage/"+movieDto.movie_img2+"'style='width:100%; height:250px' alt='Image'></td>";
	str += "<td><img src='${root}/movie/storage/"+movieDto.movie_img3+"'style='width:100%; height:250px' alt='Image'></td>";
	str += "<td style='font-size: 14px; color: white; padding: 0px 5px;'>영화장르: "+movieDto.movie_genre_str+"<br>주연: "+movieDto.movie_cast+"<br>";
	str += "별점: <div class='star_score' style='display: inline-block;'>";
    str += "<select id='star' name='"+star_avg+"' class='star_score'>"
    str += "<option value='1'>1</option>";
    str += "<option value='2'>2</option>";
    str += "<option value='3'>3</option>";
    str += "<option value='4'>4</option>";
    str += "<option value='5'>5</option>";
    str += "</select></div></td>";
    str += "</table>";
    
    //별점평균에 대한 부분
	$("#"+containner).html(str);
	$("#"+containner).find('#star').barrating({
		theme: 'fontawesome-stars'
		, readonly: true
 		, initialRating: String(star_avg)
	});

	$("#"+containner).slideDown();
}
//movie_num은 누른 영화 pk, containner는 onclick에 따른  div의 id가 movie에 대한 위치를 지정해주기 위해
function movie_img_click(movie_num, containner){
	//$(document).ready(function(){
		var movie_num = movie_num;
		
	$.ajax({//ajax는 한번 호출해서 받아오면 모든 데이터의 값이 다 넘어온다고 생각.
		type : "POST",
	    dataType: "json",
	    data : { movie_num : movie_num },
	    url : "movie/movie_img_click",
		success : function(data) {
			movieDto  = data.movieDto; //movieDTO에 대한 리스트
			star_avg = data.star_avg; //하나의 영화에 대한 별점 평균
			
			console.log("data.movieDto.movie_num" + movieDto.movie_num);
			console.log("star_avg" + star_avg);
			
			//이전데이터를 가져오기 처음에는 null
			var ago_data = $("#ago-data").attr("data-id");
			//데이터를 변경 누른 movie_num값으로
			$("#ago-data").attr("data-id", movieDto.movie_num);
			
			//이전데이터와 현재 누른 movie_num과 같은지 확인
			var valid = ago_data == movieDto.movie_num;
			//console.log("이전클릭과 동일한지..:" + valid);
			
			if(valid){
				if($("#"+containner).is(":visible")){//slide가 down인 상태라면
					//닫기
					$("#"+containner).slideUp();
				}else{//누르고-> 닫고 ->다시 눌렀을때 이벤트가 실행되기 위해
					movie_show(data, containner);
				}
			}else{//이전데이터와 현재 누른 movie_num이 다를때는  movie_num에 대한 내용
				movie_show(data, containner);
			}
		}//end of success		
	});
}
	
function col_word_button(){
     //word에 대한 값이 없다면 /index페이지로 이동
     if(!document.getElementsByName("word")[0].value){
    	//alert('검색어를 입력해주세요');
    	location.reload(); 
    	return;
     }
     
    $.ajax({
		type : "POST",
	    dataType: "json",
 	    data : $("form[name=frm]").serialize(),
		//data : queryString,
	    url : "./index/col",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    error: function(xhr, status, error){
            alert(error);
        },
        success : function(data){
        	//moiveDto가 data의 배열로 가져옴. 따라서 data[]로 접근가능
        	var str = "";
        	$("#main_list").html(str);
        	var new_str="";
        
        	//가져온 데이터가 없다(word값에 입력한 내용이 검색되지 않았다면)
        	if(data==""){
        		new_str += "<h2>검색한 내용이 없습니다.</h2>";
        		$("#main_list").html(new_str);
        	}
            	new_str += "<table class='table table-borderless'>";
            	new_str += "<tr>";
            
            //onclick에 보낼 값으로 사용
            var rows=0;
            
            //onclick의 위치를 잡기 위해 사용
            var cnt = data.length;
            for(var i=0; i<data.length; i++) {
        	  	console.log(cnt);
            	if(data!=null){ 
	            	new_str += "<td>";
		            new_str += "<img src='${root}/movie/storage/"+data[i].movie_img1+"' class='img-responsive'";
		            new_str += "onclick=\"movie_img_click(\'"+data[i].movie_num+"\', \'movies_"+rows+" div.movie5_content\')\"";
		            new_str += "style='width:300px; height:300px' alt='Image'>";
		            new_str += "</td>";	
		            
		            //영화 이미지를 5개씩 출력
		            if((i+1)%5==0){
			            new_str += "</tr>";
			            new_str += "<tr>";
			            //table의 특성상 div는 tr과 td가 있지않다면 넣어줄 수 없기때문에 먼저 div를 넣기위한 td를 생성
			            new_str += "<td colspan='5'>";
			            //div가 한줄씩 생성
			            new_str += "<div id='movies_"+rows+"'>";
			            
			            new_str += "<div class='movie5_content' class='dropdown-content' style='width:100%; height:100%' ></div>"
				        new_str += "</div>";
			            new_str += "</td></tr><tr>";
			            rows++;
		           
	        	   }else{
	        		   if(cnt==1){
				            new_str += "</tr>";
				            new_str += "<tr>";
				            new_str += "<td colspan='5'>";
				            new_str += "<div id='movies_"+rows+"'>";
				            new_str += "<div class='movie5_content' class='dropdown-content' style='width:100%; height:100%' ></div>"
					        new_str += "</div>";
				            new_str += "</td></tr><tr>";
				            rows++;
	        		   }
	        		}
		            
            	}
        	  	cnt--;
            }
	            new_str += "</table>";
	              
            $("#main_list").html(new_str);
        },
    });

}
</script>



</head>
<body>



<span id="ago-data"></span>
<div class="container">

<form class="form-inline" method="post" name="frm" id="frm">

<h1 class="col-sm-offset-2 col-sm-10"> </h1>

<div class="form-group">
	<select class="form-control" name="col" id="search">
		<option value="movie_name"
		<c:if test="${col=='movie_name'}">selected</c:if>
		>영화명</option>
		<option value="movie_cast"
		<c:if test="${col=='movie_cast'}">selected</c:if>
		>출연진</option>
		<option value="movie_content"
		<c:if test="${col=='movie_content'}">selected</c:if>
		>영화내용</option>
		<option value="total"
		<c:if test="${col=='movie_name_movie_content'}">selected</c:if>
		>전체 출력</option>
	</select>
</div>
<div class="form-group">
	<input type="text" class="form-control" placeholder="검색어를입력해주세요." name="word" value="${word}" id="search">
</div>
	<button type="button" class="btn btn1" id="col_button" onclick="col_word_button()">검색</button>
</form>

<br><br>

<%-- </c:forEach> --%>
<div id="main_list">
<h1><span>${memberDto.name}</span>님이 선택한 <span>${memberDto.genre_str}</span>이/가 포함된 영화</h1>
<table class="table table-bordered" style="border-style: hidden">
		<tr>
	<c:forEach var="favorite" items="${list}" begin="0" end="4">
				<td >
				     <img src="${root}/movie/storage/${favorite.movie_img1}" class="img-responsive" 
				     onclick="movie_img_click('${favorite.movie_num }', 'movie')"
				     style="width:300px; height:300px" id="list1" alt="Image">
				    
				</td>
				</c:forEach>
				</tr>
	</table>
	<div id="movie" class="dropdown-content" style="width:100%; height:100%" ></div>

<h1>최신 개봉작 영화</h1>
<table class="table table-bordered" style="border-style: hidden">
		<tr>
	<c:forEach var="dto" items="${list2}" begin="0" end="4">
				<td >
				     <img src="${root}/movie/storage/${dto.movie_img1}"class="img-responsive" 
				     style="300px; height:300px" alt="Image" onclick="movie_img_click('${dto.movie_num }', 'movie2')">
				     </td>
				</c:forEach>
				</tr>
</table>
<div id="movie2" class="dropdown-content" style="width:100%; height:100%" ></div>

<h1>리뷰가 많은 순</h1>
<table class="table table-bordered" style="border-style: hidden">
		<tr>
	<c:forEach var="review" items="${list3}" begin="0" end="4">
				<td >
				     <img src="${root}/movie/storage/${review.movie_img1}"class="img-responsive" 
				     style="300px; height:300px" alt="Image" onclick="movie_img_click('${review.movie_num }', 'movie3')">
				     </td>
				</c:forEach>
				</tr>
</table>
<div id="movie3" class="dropdown-content" style="width:100%; height:100%" ></div>

<h1>평점이 높은 순 </h1>
<table class="table table-bordered" style="border-style: hidden">
		<tr>
	<c:forEach var="review_avg" items="${list4}" begin="0" end="4">
				<td >
				     <img src="${root}/movie/storage/${review_avg.movie_img1}"class="img-responsive" 
				     style="300px; height:300px" alt="Image" onclick="movie_img_click('${review_avg.movie_num }', 'movie4')">
				     </td>
				</c:forEach>
				</tr>
</table>
<div id="movie4" class="dropdown-content" style="width:100%; height:100%" ></div>
</div>
</div>


<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="margin: 30rem 0;">
        <div class="modal-header">
          <button type="button" class="hidden" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">All <span>Notices</span></h4>
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