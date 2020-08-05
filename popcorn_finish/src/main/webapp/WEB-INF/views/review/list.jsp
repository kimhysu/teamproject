<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file = "/ssi/ssi_review.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<title>Insert title here</title>

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

$(document).ready(function(){
	var url = "total";
	
	$.get(
			url,
			{movie_num:"${param.movie_num}"},
			function(data, textStatus){
			$("#total").text(data);
           }
	);		
});

function read(review_num){  //javascript변수:bbsno,url / jsp변수: col,word,nowPage
		var url = "read";
		url += "?review_num="+review_num;
		url += "&col=${col}";
		url += "&nowPage=${nowPage}";
		
		
		location.href=url;
	}

function Lfunc(movie_num){
	$("#frm").attr("action", "./list?movie_num="+movie_num);
	$("#frm").submit();
	}
</script>

</head>
<style>

table{
	border : #999999;
}

body {
      background-color: #141414;
      overflow-x: auto;
      padding-left: 80px;
      padding-right: 80px;
      color: #999999;
    }
    
.black{
		color: black;}

#myModal{
	color: black;
}

 .btn { 
   border: none; 
   padding: 10px; 
   text-align: center; 
   text-decoration: none; 
   display: inline-block; 
   font-size: 13px; 
   margin: 4px 2px; 
   cursor: pointer;
   border-radius: 4px; 
   -webkit-transition-duration: 0.4s; /* Safari */ 
   transition-duration: 0.4s; 
 } 
 
 #select{
 	background-color: #141414;
 	color: #eee6c4;
 	border: 1px solid #f44336;
 } 

            
</style>
<body>
<div class="container">
<br>
 <div class="container" style="height: 69px; ">
  <div class="col-sm-10">
  <h4><strong class="blind" id="eng">Review</strong></h4>
  </div>
 </div>
 
 <div class="container">
 <div class="col-sm-10">
  <span class="cnt pull-left">총 <span id="total"></span> 건</span></div>
  
  <div class="col-sm-2">
  <form id="frm" name="frm" class="form-inline" action="./list" method="post">
  <input type="hidden" name="movie_num" value="${param.movie_num}">
    <div class="form-group">
        <select id="select" class="form-control" name="col" onchange="Lfunc(frm.movie_num.value)">
          <option value="date" 
          <c:if test="${col=='date'}">selected</c:if>
          >최신순</option>
          <option value="thumb"
          <c:if test="${col=='thumb'}">selected</c:if>
          >추천순</option>
        </select>
        </div>
       </form>
<!--   <select class="black"> -->
<!--    <option value="최신순">최신순</option> -->
<!--    <option value="추천순">추천순</option> -->
<!--   </select> -->
  </div>
 </div>
	

 
<div class="container">
<hr/>
  <table class="table table-hover">
    	<thead id="eng">
    		<tr>
    		 	<th>title</th>
    		 	<th>id</th>
       		 	<th>date</th>
    		 	<th><img src="${root}/images/thumb.png" width="20" height="20" ></th>
    		 </tr>
    		</thead>
     <tbody>
     
     <c:choose>
     	<c:when test="${empty list}">
     	<tr><td colspan="5">등록된 게시판정보가 없습니다.</td></tr>
     	</c:when>
     	<c:otherwise>
     		<c:forEach var="dto" items="${list}">
     		<tr>
     		
			<td>
<%-- 			<c:set var="rcount" value="${util:rcount(dto.review_num, rService)}"/> --%>
			<a href="javascript:read('${dto.review_num}')">${dto.review_title}</a>
<%-- 			<c:if test="${rcount>0 }"> --%>
<%-- 				<span class="badge">${rcount}</span> --%>
<%-- 			</c:if> --%>
			<c:if test="${util:newImg(dto.review_date)}">
			<img src="${root}/images/new.gif">
			</c:if>
			
			</td>
			
			<td>${dto.id}</td>
			<td>${dto.review_date}</td>
			<td>${dto.review_thumb}</td>
	    </tr>
     		</c:forEach>
     	</c:otherwise>
     </c:choose>		
     </tbody>
  </table>
<!-- <button type="button" onclick="location.href='createForm.jsp'">등록</button> -->
${paging }
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