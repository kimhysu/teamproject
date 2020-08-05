<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head>
  <title>Error Message</title>
  <META CHARSET="UTF-8">
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
$(document).ready(function(){
 var modal = '${msg}'; //Controller에서 가져온 데이터
 checkModal(modal); //modal생성
 
 //history back일때는 modal 안보여주는 코드 1
 //history.replaceState({},null,null);
 
 function checkModal(modal){ //modal 생성함수 선언
     if(history.state) return; //코드2
     if(modal){
         $(".modal-body").html(modal);
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
.modal-header{
	border-bottom: none;
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
      
          <h4 class="modal-title">Common <span>Errors</span></h4>
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