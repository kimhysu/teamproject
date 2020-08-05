<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/main.css">
<link rel="stylesheet" type="text/css" href="${root}/css/button.css">


  <title>회원정보수정</title>
  <meta charset="utf-8">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
  function sample6_execDaumPostcode() {
    new daum.Postcode({
      oncomplete : function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
                : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }

        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample6_postcode').value = data.zonecode;
        document.getElementById("sample6_address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("sample6_detailAddress").focus();
      }
    }).open();
  }
  </script>
  <style type="text/css">
  #need{
    color:red;
  }
  .need{
    color:red;
  }
  </style>
  
<script type="text/javascript">

function incheck(f){
 
  if(f.email.value==""){
    alert('이메일을 입력해주세요');
    f.email.focus();
    return false;
  }
  
  if(f.job.selectedIndex==0){
    alert('장르을 선택하세요');
    f.job.focus();
    return false;
  }
}
function emailCheck(email){ //id값이 비어있다면, alert창을 통해서 id를 입력해달라는 것을 표현하자.
      var url = "emailCheck";
      var param = "email=" +email;
      
      $.get(
        url,
        param,
        function(data,textStatus){
          $("#emailcheck").text(data);
        });
  }
function nameCheck(name){ 
      var url = "nameCheck";
      var param = "name=" +name;
      
      $.get(
        url,
        param,
        function(data,textStatus){
          $("#nameCheck").text(data);
        });
  }
</script>

</head>
<body> 

<h2>회원수정</h2>

<div class="container">
<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span> 는 필수 입력 사항입니다.)</label>
<form class="form-horizontal" 
      action="update"
      method="post" 
      onsubmit ="return incheck(this)"
      name="frm"
      >
  <input type="hidden" name="id" value="${dto.id}"> 
  <input type="hidden" name="xemail" value="${dto.email}"> 
  <div class="form-group">
    <label class="control-label col-sm-2" for="id"><span id="need">*</span>아이디</label>
    <div class="col-sm-3" style="padding-top: 7px; margin-bottom: 0; color: #eee6c4;">
    ${dto.id}
    </div>
  </div>

  
  <div class="form-group">
    <label class="control-label col-sm-2" for="name"><span id="need">*</span>닉네임</label>
    <div class="col-sm-4">
    <input type="text" name="name" id="search" class="form-control" value="${dto.name}">
    </div>
    <button  type="button" class="btn btn1" onclick="nameCheck(this.form.name.value)">Name변경</button>
    <div id="nameCheck" class="need"></div>
    </div>
  
  
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="email"><span id="need">*</span>Email</label>
    <div class="col-sm-4">
    <input type="text" name="email" id="search" class="form-control" value="${dto.email}" required="required">
    </div>
    <button  type="button" class="btn btn1" onclick="emailCheck(this.form.email.value)">Email변경</button>
    <div id="emailcheck" class="need"></div>
    </div>
  
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="genre">장르</label>
    <div class="col-sm-10">
     
    <label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="애니메이션"
		<c:if test="${dto.genre_str.indexOf('애니메이션') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>애니메이션
	</label>
    <label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="SF"
		<c:if test="${dto.genre_str.indexOf('SF') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>SF
	</label>
    <label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="스릴러"
		<c:if test="${dto.genre_str.indexOf('스릴러') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>스릴러
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="액션"
		<c:if test="${dto.genre_str.indexOf('액션') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>액션
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="로맨스"
		<c:if test="${dto.genre_str.indexOf('로맨스') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>로맨스
	</label>
	<br>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="공포/호러"
		<c:if test="${dto.genre_str.indexOf('공포/호러') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>공포/호러
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="코미디"
		<c:if test="${dto.genre_str.indexOf('코미디') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>코미디
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="가족"
		<c:if test="${dto.genre_str.indexOf('가족') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>가족
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="범죄"
		<c:if test="${dto.genre_str.indexOf('범죄') != -1}">checked
		</c:if>>
		<span class="label-cbk">
		</span>범죄
	</label>
    
    </div>
  </div>
  
 
    
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn btn1">수정</button>
    <button type="reset" class="btn btn1" onclick="history.back()">취소</button>
   </div>
 </div>
</form>
</div>

</body> 
</html> 