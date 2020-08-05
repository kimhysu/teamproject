<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">
.modal-content{
	color: #fff;
	background-color: rgba(0,0,0, 0.75);
    box-sizing: border-box;
    margin: 15rem 0;
    border-radius: 4px;
    box-shadow: 1px 1px 15px 7px rgba(255,255,255,1);
    padding: 0 2rem;
    text-align: center;
}
h4 span{
	color: #f44336;
}
textarea{
	font-family: 'Jua', sans-serif;
	border: 2px solid #f44336;
}
.modal-header{
	border-bottom: none;
}
.modal-footer{
	display: inline-block;
	border-top: none;
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
</script>
	
</head>
<body>


<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="margin: 30rem 0;">
        <div class="modal-header">
          <button type="button" class="hidden" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">All <span>Notice</span></h4>
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
