<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/ssi/ssi_notice.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
<title>공지내용</title>
	
<script type="text/javascript">
	function listF(){
		var url = "list";
		url += "?notice_num=${notice_num}";
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}"; // 만약, 10번째 page에서 '목록'으로 이동하면 초기값으로 이동하기 때문에 값을 넣어주어야 한다.
		location.href = url;
	}
	
	function updateF(){
		var url = "update";
		url += "?notice_num=${notice_num}";
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	
	function deleteF(){
		var url = "delete";
		url += "?notice_num=${notice_num}";
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>

<style type="text/css">
	.container{
		margin-top: 50px;
	}
</style>



</head>
<body>



<h2><span>Notice Read</span></h2>

<div class="container">
	<div class="container3">
	<div class="panel panel-default">
		<div class="panel-heading">Notice Num</div>
		<div class="panel-body">${dto.notice_num }</div>
		<div class="panel-heading">User Id</div>
		<div class="panel-body">${dto.id}</div>
		<div class="panel-heading">Notice Type</div>
		<div class="panel-body">${dto.notice_type }</div>
		<div class="panel-heading">Notice Title</div>
		<div class="panel-body">${dto.notice_title }</div>
		<div class="panel-heading">Notice Content</div>
		<div class="panel-body">${dto.notice_content }</div>
		<div class="panel-heading">Registration Date</div>
		<div class="panel-body">${dto.notice_date }</div>
	</div>
	</div>
	<div>
		<button type="button" class="btn btn1" onclick="listF()">목록</button>
		<c:if test="${grade == 'A'}">
		<button type="button" class="btn btn1" onclick="location.href='create'">등록</button>
		<button type="button" class="btn btn1" onclick="updateF()">수정</button>
		<button type="button" class="btn btn1" onclick="deleteF()">삭제</button>
		</c:if>
	</div>
	
	
	
	<!-- 새로운 댓글창이 보여질 부분 : Srping_OJT[2강] -->

<div class='row'>
 
  <div class="col-lg-12">
 
    <!-- /.panel -->
    <div class="container3">
    <div class="panel panel-default">
      
      <!-- /.panel-heading -->
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Comment
        <button id='addReplyBtn' class='btn btn1 btn-xs pull-right'>New Reply</button>
      </div>      
      
      <div class="panel-body">        
      
        <ul class="chat list-group">
         <li class="left clearfix" data-rno="12">
         <div>
           <div class="header">
            <strong class="primary-font">user1</strong>
            <small class="pull-right text-muted">2019-05-12</small>
           </div>
           <p>Good job!</p>
           
         </div>
         </li>
        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->
 
<div class="panel-footer"></div>
 
   </div>
   </div>
   
  </div>
  <!-- ./ end row -->
</div>


<!-- Modal -->
<!-- 댓글을 쓰거나, 내용 보기를 할 때'만' 보여진다! -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">	<!-- hidden이므로 처음에는 숨겨져있음 -->
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY <span>MODAL</span></h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Contents</label> 
                <textarea cols="10" rows="3" class="form-control" name='content'
                style="border: 2px solid #f44336;">New Reply!!!!</textarea> 
              </div>      
              <div class="form-group">
                <label>아이디</label> 
                <input class="form-control" name='id' value='${sessionScope.id}'><!-- session에 id값을 불러와서, 창을 띄우면 이미 보여져잇다! -->
              </div>
              <div class="form-group">
                <label>등록날짜</label> 
                <input class="form-control" name='regdate' value='2018-01-01 13:13'>
              </div>
      
            </div>
       		<div class="modal-footer">
        		<button id='modalModBtn' type="button" class="btn btn1">Modify</button>
        		<button id='modalRemoveBtn' type="button" class="btn btn1">Remove</button>
        		<button id='modalRegisterBtn' type="button" class="btn btn1">Register</button>
        		<button id='modalCloseBtn' type="button" class="btn btn1">Close</button>
      		</div>
      	  </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
	
	
	
	  <script type="text/javascript" src="${root}/js/breply.js"></script>
      <script type="text/javascript">
      $(document).ready(function () {
    	  											// script 전역변수
          var notice_num = '<c:out value="${notice_num}"/>';	// bbsController의 read()mothod안에서 가져오는 것이다!
    	  var sno = '<c:out value="${sno}"/>';		 
    	  var eno = '<c:out value="${eno}"/>';
    	  var replyUL = $(".chat");	// chat라는 클래스를 찾아서 replyUL을 가리키는 것? //질문! : <ul>태그의 chat 클래스를 찾는다.
    	  
    	  showList();	// 페이지가 로딩되면서 바로 호출됨
    	  
    	  function showList(){	// replyService.getList() : breply.js의 JSON 결과들을 가져오겠다?정도라고 생각!
   		    
    	    var param = {notice_num:notice_num,sno:sno,eno:eno};
    		replyService.getList(param, function(list) {
   		     var str="";
   		     
   		     if(list == null || list.length == 0){
   		       return;
   		     }
   		     
   		     for (var i = 0, len = list.length || 0; i < len; i++) {
   		       str +="<li class='list-group-item' data-nreply_num='"+list[i].nreply_num+"'>";
   		       str +="<div><div class='header'><strong class='primary-font'>"+list[i].id+"</strong>"; 
   		       str +="<small class='pull-right text-muted'>"+list[i].nreply_date+"</small></div>";
   		       str +=replaceAll(list[i].nreply_content,'\n','<br>')+"</div></li>";
   		     }
   		 
   		     replyUL.html(str);	//innerHTML
   		     
   		     showReplyPage();
   	
   		  });//end function 호출
   		     
   		 }//end showList
      
      function replaceAll(str, searchStr, replaceStr) {
    	  return str.split(searchStr).join(replaceStr);
      }
      
      var nPage = '<c:out value="${nPage}"/>';
      var nowPage = '<c:out value="${nowPage}"/>';
      var colx = '<c:out value="${col}"/>';
      var wordx = '<c:out value="${word}"/>';
      var replyPageFooter = $(".panel-footer");
      
      var param = "nPage="+nPage;	//댓글페이지
      param += "&nowPage="+nowPage;	//게시판페이지
      param += "&notice_num="+notice_num;
      param += "&col="+colx;
      param += "&word="+wordx;
       
      function showReplyPage(){
      
   	  //위의 param과 callback Method를 호출!

//==================================== 댓글 페이징 주석 처리 =============================//
//================================================================================//
//       replyService.getPage(param, function(paging) {
//           var str ="<div><small class='text-muted'>"+paging+"</small></div>";
//           replyPageFooter.html(str);
//       });
//================================================================================//   	  
      }//end showReplyPage
      
      //댓글 조회 클릭 이벤트 처리 
      $(".chat").on("click", "li", function(e){	//class가 chat인 li를 click하면, function(e)를 실행하겠다!
        
        var nreply_num = $(this).data("nreply_num");	// 여기서 말하는 this는 li
        
        //alert(rnum)
        replyService.get(nreply_num, function(reply){
/*질문!*/  modalInputContent.val(reply.nreply_content);
          modalInputId.val(reply.id);	// input태그들은 모드 val값이 있으니까, 밑의 var modalInputId = modal.find()의 input[name='id']를 갖고오겟다는 뜻!
/*질문!*/  modalInputRegDate.val(reply.nreply_date);
		  modalInputId.closest("div").hide();	// input태그들은 모드 val값이 있으니까, 밑의 var modalInputId = modal.find()의 input[name='id']를 갖고오겟다는 뜻!
/*질문!*/  modalInputRegDate.closest("div").hide();
          modal.data("nreply_num", reply.nreply_num);	// reply.rnum : 무슨말?
          
          modal.find("button[id !='modalCloseBtn']").hide();
          
          if('${sessionScope.id}'==reply.id){
              modalModBtn.show();
            modalRemoveBtn.show();
          }
          $(".modal").modal("show");  //modalInput~을 통해 modal에 넣어준 값을 show뿌려준다.
              
        });
      });
      
      var modal = $(".modal");
      var modalInputContent = modal.find("textarea[name='content']");
      var modalInputId = modal.find("input[name='id']");
      var modalInputRegDate = modal.find("input[name='regdate']");
      
      var modalModBtn = $("#modalModBtn");
      var modalRemoveBtn = $("#modalRemoveBtn");
      var modalRegisterBtn = $("#modalRegisterBtn");
      
      $("#modalCloseBtn").on("click", function(e){
    	  
    	  modal.modal('hide');  
      });
      
      modalModBtn.on("click", function(e){
    	  
    	  var reply = {nreply_num:modal.data("nreply_num"), nreply_content: modalInputContent.val()}; //240번째줄에 저장한? rnum을 여기서 갖고온다?
    	  //alert(reply.rnum);
    	  replyService.update(reply, function(result){
    	          
    	  alert(result);
    	  modal.modal("hide");
    	  showList();	//갱신된 댓글 목록 가져오기
    	      
    	  });
    	  
      }); //modify
    	 
    	 
      modalRemoveBtn.on("click", function (e){
    	    
    	  var nreply_num = modal.data("nreply_num");
    	  
    	  replyService.remove(nreply_num, function(result){
    	        
    	  alert(result);
    	  modal.modal("hide");
    	  showList();	//갱신된 댓글 목록 가져오기
    	      
    	  });
    	   
      });//remove
      
      
      
      
      $("#addReplyBtn").on("click", function(e){
    	  
//     	  if('${sessionScope.id}'==''){
//     	   if(confirm("로그인을 해야 댓글을 쓸수 있습니다.")) {
//     	        var url = "../member/login";
//     	        url += "?col=${col}";
//     	        url += "&word=${word}";
//     	        url += "&nowPage=${nowPage}";
//     	        url += "&nPage=${nPage}";
//     	        url += "&notice_num=${notice_num}";
//     	        url += "&rurl=../bbs/read";
//     	   location.href = url;
    	   
//     	   }
//     	  }else{
    	 
    	  modalInputContent.val("");
    	  modalInputId.closest("div").hide();
    	  modalInputRegDate.closest("div").hide();
    	  modal.find("button[id !='modalCloseBtn']").hide(); 
    	  
    	  modalRegisterBtn.show();
    	  
    	  $(".modal").modal("show");
    	  
    	  
//     	  }
    	});
      
      modalRegisterBtn.on("click",function(e){
    	  
    	  if(modalInputContent.val()==''){
    	  alert("댓글을 입력하세요")
    	  return ;
    	  }
    	 
    	  var reply = {
    	        nreply_content: modalInputContent.val(),
    	        id:'<c:out value="${sessionScope.id}"/>',
    	        notice_num:'<c:out value="${notice_num}"/>'
    	      };
    	  //alert(reply.content);
    	  replyService.add(reply, function(result){
    	    
    	    alert(result);
    	    
    	    modal.find("input").val("");
    	    modal.modal("hide");
    	    
    	    //showList(1);
    	    showList();
    	    
    	  }); //end add
    	  
    	}); //end modalRegisterBtn.on
    	
      
      });
      
      
      </script>
      
</div>

</body>
</html>