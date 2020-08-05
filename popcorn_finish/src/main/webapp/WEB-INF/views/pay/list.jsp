<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ include file = "/ssi/ssi_pay.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart list</title>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">



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
<h2>결제내역</h2>

<c:choose>
	<c:when test="${map.count == 0}">
	  <hr style="margin-left: 8%;
	             margin-right: 8%">
	  <p style="text-align:center">결제내역이 없습니다.</p>
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
               
                  
                  <table class="table">
                  <colgroup>
                  	<col width="5%"/>
                  	<col width="40%"/>
                  	<col width="20%"/>
                  	<col width="20%"/>
                  	<col width="5%"/>
                  </colgroup>
                    <thead>
                      <tr>
                        <th scope="col"></th>
                        <th scope="col">영화명</th>
					    <th scope="col">가격</th>
					    <th scope="col" style="text-align:right">결제날짜</th>
					    <th scope="col"></th>
                      </tr>
                    </thead>
                    <tbody>    
                   
                   
                   <c:forEach var="dto" items="${map.list}" varStatus="i">  <!-- forEach문 -->
                      <tr>
                      	 <td scope="col"></td>
                         <td scope="col">${dto.movie_name}</td>
                         <td scope="col" style="width:80px" align="right">
		      				<fmt:formatNumber pattern="###,###,###" value="${dto.pay_item_price}"/>
		    			 </td>
		    			 <td scope="col"  style="text-align:right">
		      				${dto.pay_date}
	    				 </td>
	    				 <td scope="col"></td>		
                      </tr>
                   </c:forEach>
                      </tbody>
                  </table>
                </div>
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



</body>
</html>