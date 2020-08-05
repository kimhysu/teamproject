<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ include file = "/ssi/ssi_cart.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
<title>Cart list</title>

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
	  $("#checkall").click(function(){
		  if($("#checkall").prop("checked")){
		  	$("input[name=movie_price]").prop("checked",true);
	  }else{
		  $("input[name=movie_price]").prop("checked",false);
	  }
	  itemSum(this.form);
	  });
  });	

  function itemSum(frm){
	  var sum = 0;
	  var count = $(".chbox").size();
	  
	  $(".chbox").each(function(){
		  if($(this).is(":checked")){
			  sum += parseInt($(this).val());
		  }		  
	  });
	  document.getElementById("totalprice").innerHTML = sum;
  }
	  
// 	  var count = frm.movie_price.length;	  
// 	  for(var i=0;i<count;i++){
// 		  if(frm.movie_price[i].checked == true){
// 			  sum += parseInt(frm.movie_price[i].value);
// 		  }
// 	  }

  function deleteM(cart_num){
  	if(confirm("정말 삭제하시겠습니까?")==true){
  		var url = "delete";
  		url += "?cart_num="+cart_num;
  		location.href=url;
  		
  	}else{
  		return;
  	}
  	
  }
</script>

<script type="text/javascript">
// function SelectAll(n,obj){
// 	  var i;
// 	  var chk = document.getElementsByName(obj);
// 	  var select = chk.length;
// 	  for(i=0;i<select;i++){
// 		  if(n == 1) chk[i].checked = true;
// 		  if(n == 2) chk[i].checked = false;
// 	  }
// 	  itemSum(this.form);
// }

function pay(){
	var list = new Array();
	//결제 할 아이템들 정보
	if($(".chbox:checked").size()==0){
		alert("체크해주세요");
		return;
	}else{
		$(".chbox:checked").each(function(){
			var obj = new Object();
			
			var id = $(this).attr("data-id");
			var cart_num = $("#cart_num"+id).val();
			var movie_num = $("#movie_num"+id).val();
			var movie_price = $("#movie_price"+id).val();
			
			
			obj = {
					"cart_num": cart_num,
					"movie_num": movie_num,
					"movie_price": movie_price
			};
			list.push(obj);
		});
		//결제수단
		var pay_way_arr = document.getElementsByName("pay_way");
		var pay_way = "";
		for(var i=0; i<pay_way_arr.length; i++){
			if(pay_way_arr[i].checked){
				pay_way = pay_way_arr[i].value;
		    }
		}
		if(!pay_way){
			alert('결제수단을 선택해주세요');
			return;
		}
		//총 금액
		var pay_sum = $("#totalprice").text();
		var data = {"list":list, "pay_way":pay_way,"pay_sum":pay_sum};
		$.ajax({
			url : '../pay/create',
			type: 'POST',
			data: JSON.stringify(data),
			dataType: 'json',
			contentType: 'application/json',
			success: function(data){
			   if(data=='1'){
				   alert("결제가 완료되었습니다.");
				   location.replace("../pay/list");
			   }else{
				   alert("다시 시도하세요.");
			   }
			}
		});
} 
}
</script>

<style type="text/css">
input:enabled{
	background : #141414;
	color: #eee6c4;
	border-style: none;
}
p{
	color: #eee6c4;
}

</style>

</head>

<body>
<h4>장바구니</h4>

<c:choose>
	<c:when test="${map.count == 0}">
	  <hr style="margin-left: 8%;
	             margin-right: 8%">
	  <p style="text-align:center">장바구니가 비어있습니다.</p>
	</c:when>
	<c:otherwise>
	 <!-- Cart view section -->
 <section id="cart-view">
   <div class="container">
     <div class="dto">
       <div class="col-md-12">
         <div class="cart-view-area">
           <div class="cart-view-table">
             <form action="./list" method="post" name="form" onsubmit="return false">
               <div class="table-responsive">
               
                  <!-- 장바구니 표 -->
                  <table class="table">
                    <thead>
                      <tr>
                        <th><input type="checkbox" id="checkall" />
<!--                             <button class="btn btn1" type="button" value="전체선택" onclick="SelectAll(1,'movie_price')" ></button> -->
<!--                          	<button class="btn btn1" type="button" value="전체해제" onclick="SelectAll(2,'movie_price')" ></button> -->
                        </th>
                        <th>영화명</th>
					    <th>가격</th>
					    <th></th>
					    <th style="text-align:center">취소</th>
                      </tr>
                    </thead>
                    <tbody>    
                   
                   
                   <c:forEach var="dto" items="${map.list}" varStatus="i">  <!-- forEach문 -->
                      <tr>
                         <td><input type="checkbox" name="movie_price" id="movie_price${dto.cart_num}" class="chbox"
                                    value="${dto.movie_price}" onClick="itemSum(this.form);" data-id="${dto.cart_num}"></td>
                         <td>${dto.movie_name}</td>
                         <td style="width:80px" align="right">
		      				<fmt:formatNumber pattern="###,###,###" value="${dto.movie_price}"/>
		    			 </td>
		    			 <td><input type="hidden" id="movie_num${dto.cart_num}" name="movie_num" value="${dto.movie_num}">
		    			     <input type="hidden" id="cart_num${dto.cart_num}" name="cart_num" value="${dto.cart_num}">
		    			 </td>
		    			 <td style="text-align:center">
		      				<a href="javascript:deleteM('${dto.cart_num }')">삭제</a>
	    				 </td>		
                      </tr>
                   </c:forEach>

                      </tbody>
                  </table>
                </div>
                
             <!-- 총 합계 계산 -->
             <div class="total">
               <table class="total-table">
                 <tbody>
                   <tr>
                     <th style="text-align:left; width:80px">total : </th>
                     <td id="totalprice" style="text-align:left">&nbsp;0</td>
                 </tbody>
               </table>
             </div>
              <br>
          
 				
 			<div class="form-group">
			<label class="control-label col-sm-2" for="pay_way">결제수단</label>
			<div class="col-sm-6" style="width:55%;">
				<label for="opt1" class="radio">
   					<input type="radio" name="pay_way" id="opt1" class="hidden" value="card"/>
    				<span class="label-radio"></span> 카드
  				</label>
				<label for="opt2" class="radio">
				    <input type="radio" name="pay_way" id="opt2" class="hidden" value="phone"/>
				    <span class="label-radio"></span> 휴대폰
  				</label>
				<label for="opt3" class="radio">
				    <input type="radio" name="pay_way" id="opt3" class="hidden" value="ba"/>
				    <span class="label-radio"></span> 계좌이체
  				</label>
			</div>
			
		</div>
            
             
               <br><button type="button" class="btn btn1 pull-right" onclick="pay();">결제</button>
             </form>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>
 <!-- / Cart view section -->
	</c:otherwise>
</c:choose>

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