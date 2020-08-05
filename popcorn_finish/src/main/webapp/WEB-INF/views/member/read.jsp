<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %> 
<!DOCTYPE html> 
<html> 
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<title>회원정보</title>
<meta charset="utf-8">
  
  
  <script type="text/javascript">
	$(document).ready(function() {
		var modal = '${msg}'; //Controller에서 가져온 데이터
		checkModal(modal); //modal생성

		//history back일때는 modal 안보여주는 코드 1
		history.replaceState({},null,null);

		function checkModal(modal) { //modal 생성함수 선언
			if (history.state)
				return; //코드2
			if ('${msg}') {
				$(".modal-body").html(modal);
				$("#myModal").modal("show");
			}
		}
	});
	
   
  
    function listM(){
      var url = "${root}/admin/list";
      location.href = url;
    }
   
    
    function updateM(){
      var url = "update";
      url += "?id=${dto.id}";
      location.href=url;      
    }
    
    function updatePw(){
      var url = "updatePw";
      url += "?id=${dto.id}";
      location.href = url;
    }
    
    function deleteM(){
      var url = "delete";
      url += "?id=${dto.id}";
      location.href = url;
    }
  </script>
  
</head>
<body> 

<h2>${dto.id} 회원정보</h2>

<div class="container">
  <div class="container3">
  <div class="tbl-content">
  <table>
    
    <tr>
      <td>아이디</td>
      <td>${dto.id}</td>
    </tr>
    <tr>
      <td>닉네임</td>
      <td>${dto.name}</td>
    </tr>
    <tr>
      <td>성별</td>
      <td>${dto.gender}</td>
    </tr>
    <tr>
      <td>나이</td>
      <td>${dto.age}</td>
    </tr>
   
    <tr>
      <td>이메일</td>
      <td>${dto.email}</td>
    </tr>
    
    
    <tr>
      <td>장르</td>
      <td>
      
           ${dto.genre_str}
<%--           (${util:genreName(dto.genre) }) --%>
      </td>                     
    </tr>
    
  </table>
  </div>
  </div>
  
    <div style="text-align: center">
    <button class="btn btn1" onclick="updateM()">정보수정</button>
    <button class="btn btn1" onclick="deleteM()">회원탈퇴</button>
    
<%--     <c:if test="${ not empty dto.id && grade != 'A'}"> --%>
    <c:if test="${ not empty dto.id}">
    <button class="btn btn1" onclick="updatePw()">비밀번호수정</button>
  </c:if>
   
   <c:if test="${not empty dto.id && grade == 'A'}">
    <button class="btn btn1" onclick="listM()">목록</button>
    </c:if>
   
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">

						<h4 class="modal-title">Member Message!</h4>
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