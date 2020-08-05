<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <!-- jquery ajax에 필요한 부분 start -->
    <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script type="text/javascript"
    src="<%=request.getContextPath()%>/js/ajaxerror.js"></script>
  <!--jquery ajax에 필요한 부분 end  -->

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<script type="text/javascript">
//BbsController.java의 pwcheck시 if문을 pflag, flag 따로 썼을 때, 사용하도록 함.
$(document).ready(function(){
 var modal = ${pflag}; //Controller에서 가져온 데이터
 checkModal(modal); //modal생성
 
 //history back일때는 modal 안보여주는 코드 1
 //history.replaceState({},null,null);
 
 function checkModal(modal){ //modal 생성함수 선언
     if(history.state) return; //코드2
     if(modal==false){
         $(".modal-body").html('에러가 발생했습니다.<br>잠시 후 다시 확인하세요');
         $("#myModal").modal("show");
     }
   }
});
</script>

<style type="text/css">
.container{
	position: relative;
	_margin: 5% 15px;
	padding: 20px;
	margin-top: 20px;
	width: 100% !important;
	font-family: 'Jua', sans-serif;
}

h2 span{
	color: #f44336;
}

.btn1 {
   background-color: #141414;  
   color: #eee6c4;
   border: 2px solid #f44336; 
   font-weight: 700px;
}
.btn1:hover {
   color: #f44336;
}

#myModal{
	background-color: rgba(0,0,0, 0.7);
    display: flex;
    justify-content: center;
}

.modal-header{
	border-bottom: none;
}
.modal-content{
	text-align: center;
	color: #fff;	
	background-color: rgba(0,0,0, 0.75);
    box-sizing: border-box;
    margin: 25rem 0;
    border-radius: 4px;
    box-shadow: 1px 1px 13px 4px rgba(255,255,255,1);
    padding: 0 2rem;
}
.modal-footer{
	display: inline-block;
	border-top: none;
}
</style>



</head>
<body>



<div class="container">


<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
      
          <h2 class="modal-title">Page <span>Error</span></h2>
        </div>
        <div class="modal-body">
          <p>This is a small modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn1" data-dismiss="modal" onclick="history.back()">Close</button>
        </div>
      </div>
    </div>
	</div>
</div>

</body>
</html>