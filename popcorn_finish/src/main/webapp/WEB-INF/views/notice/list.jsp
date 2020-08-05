<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp"%>
<c:if test="${empty sessionScope.id }">
<script>
location.href = "../member/login";
</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 목록</title>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">


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
	 
function read(notice_num){
	var url = "read"
	url += "?notice_num="+notice_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}
</script>



</head>
<body>



<h2><span>공지 목록</span></h2>

<div class="container">
	<div class="container2">
	<form class="form-inline" action="list">
		<div class="form-group">
			<select class="form-control" name="col" id="search">
				<option value="title" id="a">
					<c:if test="${col=='notice_title' }">selected</c:if>
					공지제목
				</option>
				<option value="content" id="a">
					<c:if test="${col=='notice_content' }">selected</c:if>
					공지내용
				</option>
			</select>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="word" value="${word}" id="search">
		</div>
			<button type="submit" class="btn btn1">검색</button>
			<c:if test="${grade == 'A'}">
			<button type="button" class="btn btn1" onclick="location.href='create'">등록</button>
			</c:if>
	</form>
	</div>
	
	<div class="container3">
	<div class="tbl-header">
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>분류</th>
					<th>작성자</th>
				</tr>
			</thead>
		</table>	
	</div>
	
	<div class="tbl-content">
		<table>
			<tbody>
			
			<c:choose>
				<c:when test="${empty list }">등록된 게시판이 없습니다.</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
					
				<tr>
					<td>${dto.notice_num}</td>
					<td>
					
					<c:if test="${util:newImg(dto.notice_date)}">
  						<img src ='${root}/images/new.gif'>
  					</c:if>
<%--   					<c:set var="rcount" value="${util:rcount(dto.notice_num, NrService) }"/> --%>
  					<a href="javascript:read('${dto.notice_num}')">
  					${dto.notice_title}
  					</a>
  					
  					<c:if test="${rcount>0 }">
            			<span class="badge">${rcount}</span>
      				</c:if>
  					
  					</td>
					<td>${dto.notice_type}</td>
					<td>${dto.id}</td>
				</tr>
			
					</c:forEach>
				</c:otherwise>	
			</c:choose>
			
			</tbody>
		</table>
	</div>
	</div>
	
</div>
${paging}
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content" style="margin: 30rem 0; text-align: center;">
			<div class="modal-header">
				<button type="button" class="hidden" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">REPLY <span>COMPLETED</span></h4>
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