<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html> 
<head>

  <title>회원가입</title>
  <meta charset="utf-8">
  
<style type="text/css">
.main-img::after{
	content: '';
	position: fixed;
	top:0;
	width:100%;
	height:100%;
	background-image: url("../images/avengers.jpg");
	background-repeat: repeat-y;
	background-size: cover;
	display: block;
	z-index: -1;
}
.main{
	background-color: rgba(0,0,0, 0.3);
	display: flex;
	justify-content: center;
}
.main-inner{
	width: 1000px;
	min-height: 650px;
	background-color: rgba(0,0,0, 0.75);
	box-sizing: border-box;
	margin: 2rem 0;
	border-radius: 4px;
	box-shadow: 1px 1px 13px 4px rgba(255,255,255,1);
	padding: 0 5rem;
}
.container{
	position: relative;
	_margin: 5% 15px;
	padding: 20px;
	margin-top: 20px;
	width: 100% !important;
}
.container3{
  background: -webkit-linear-gradient(left, #ecb1b1, #d54343);
  background: linear-gradient(to right, #494949, #000000);
  font-family: 'Roboto', sans-serif;
  border-radius: 5px;
  margin-top: 10px;
  border: 2px solid #f44336;
  max-width: 900px;
  max-height: 650px;
  margin:10px 0;
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

input[class='form-control']{
	background-color: #141414;
	color: #eee6c4;
	border: 2px solid #f44336; 
	height: 36px;
}

.radio {
  position: relative;
  cursor: pointer;
  line-height: 20px;
  font-size: 14px;
  margin: 15px;
  display: -webkit-inline-box;
}
.radio .label-radio {
  position: relative;
  display: block;
  margin-right: 10px;
  width: 20.2px;
  height: 20px;
  border: 2px solid #c8ccd4;
  border-radius: 100%;
}
.radio .label-radio:after {
  content: '';
  position: absolute;
  top: 3px;
  left: 3px;
  width: 10px;
  height: 10px;
  border-radius: 100%;
  background: #eee6c4;
  transition: all 0.2s ease;
  opacity: 0.08;
}
.radio:hover .label-radio:after {
  transform: scale(3.5);
  opacity: 0.1;
}
input[type="radio"]:checked + .label-radio {
  border-color: #f44336;
}
input[type="radio"]:checked + .label-radio:after {
  transform: scale(1);
  transition: all 0.2s cubic-bezier(0.35, 0.9, 0.4, 0.9);
  opacity: 1;
}

.checkbox{
  position: relative;
  cursor: pointer;
  line-height: 20px;
  font-size: 14px;
  margin: 15px;
  display: -webkit-inline-box;
}
.checkbox .label-cbk {
  position: relative;
  display: block;
  margin-right: 10px;
  width: 20.2px;
  height: 20px;
  border: 2px solid #c8ccd4;
}
.checkbox .label-cbk:after {
  content: '';
  position: absolute;
  top: 3px;
  left: 3px;
  width: 10px;
  height: 10px;
  background: #eee6c4;
  transition: all 0.2s ease;
  opacity: 0.08;
}
.checkbox:hover .label-cbk:after {
  transform: scale(3.5);
  opacity: 0.1;
}
input[type="checkbox"]:checked + .label-cbk {
  border-color: #f44336;
}
input[type="checkbox"]:checked + .label-cbk:after {
  transform: scale(1);
  transition: all 0.2s cubic-bezier(0.35, 0.9, 0.4, 0.9);
  opacity: 1;
}
label[class='check']{
	padding: 7px 2px 0;
    margin-bottom: 0;
    color: #fff;
}  
#need{
   color: red;
}
</style>
  
  
  <script type="text/javascript">
    function idCheck(id){ //id값이 비어있다면, alert창을 통해서 id를 입력해달라는 것을 표현하자.
      if(id==""){
        alert("아이디를 입력 해주세요.");
        document.frm.id.focus();
      }else{
        var url = "idcheck";
        var param = "id=" +id;
        
        $.get(  // getJSON이 아닌 경우 eval or parse 써야해! ajax_08.html에서 확인하자!
          url,
          param,
          function(data,textStatus){
            $("#idcheck").text(data);
          }
      );
    }
    }
    function nameCheck(name){ //id값이 비어있다면, alert창을 통해서 id를 입력해달라는 것을 표현하자.
        if(name==""){
          alert("닉네임을 입력 해주세요.");
          document.frm.name.focus();
        }else{
          var url = "nameCheck";
          var param = "name=" +name;
          
          $.get(  // getJSON이 아닌 경우 eval or parse 써야해! ajax_08.html에서 확인하자!
            url,
            param,
            function(data,textStatus){
              $("#namecheck").text(data);
            }
        );
      }
      }
    function emailCheck(email){ //id값이 비어있다면, alert창을 통해서 id를 입력해달라는 것을 표현하자.
      if(email==""){
        alert("이메일를 입력 해주세요.");
        document.frm.email.focus();
      }else{
        var url = "emailCheck";
        var param = "email=" +email;
        
        $.get(
          url,
          param,
          function(data,textStatus){
            $("#emailcheck").text(data);
          }
      );
      }
    }
    
    // 미입력시 경고창 생성되게 형성
    function incheck(f){
      if(f.id.value==""){
        alert("아이디를 입력하세요");
        f.id.focus();
        return false;
      }
      if(f.passwd.value==""){
        alert("비밀번호를 입력하세요");
        f.passwd.focus();
        return false;
      }
      if(f.repasswd.value==""){
        alert("비밀번호 확인을 입력하세요");
        f.repasswd.focus();
        return false;
      }
      if(f.passwd.value!=f.repasswd.value){
        alert("비밀번호가 일치하지 않습니다.");
        f.passwd.focus();
        return false;
      }
      if(f.name.value==""){
        alert("이름을 입력하세요");
        f.name.focus();
        return false;
      }
     
      if(f.email.value==""){
        alert("이메일을 입력하세요");
        f.email.focus();
        return false;
      }
      if(f.genre.selectedIndex==""){
        alert("장르를 선택하세요");
        f.genre.focus();
        return false;
      }
      
    }
  </script>
  
</head>
<body> 

<h2>회원가입</h2>

<div class="container">

<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span>)필수입력사항</label>
<form class="form-horizontal" name='frm'
	  action="createProc"
	  method="post" onsubmit="return incheck(this)">
      <!-- setProperty는 request로만 받을 수 있기 때문에, uploadSave?그걸로 받는다. -->

  

  <div class="form-group">
    <label class="control-label col-sm-2" for="id"><span id="need">*</span>아이디</label>  <!-- span tag 추가 -->
    <div class="col-sm-2">
      <input type="text" name="id" id="id" class="form-control">
    </div>     
      <button class="btn btn1 col-sm-2" type="button"
      onclick="idCheck(document.frm.id.value)">ID중복확인</button>
      <label class="check" id="idcheck"></label>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="pw"><span id="need">*</span>비밀번호</label>
    <div class="col-sm-3">
      <input type="password" name="pw" id="pw" class="form-control">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="repasswd"><span id="need">*</span>비밀번호 확인</label>
    <div class="col-sm-3">
      <input type="password" name="repasswd" id="repasswd" class="form-control">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="name"><span id="need">*</span>닉네임</label>
    <div class="col-sm-2">
      <input type="text" name="name" id="name" class="form-control">
    </div>
    <button class="btn btn1 col-sm-2" type="button"
      onclick="nameCheck(document.frm.name.value)">닉네임중복확인</button>
      <label class="check" id="namecheck"></label>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="age"><span id="need">*</span>나이</label>
    <div class="col-sm-1">
      <input type="text" name="age" id="age" class="form-control">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="gender"><span id="need">*</span>성별</label>
    <div class="col-sm-2" style="display: inline-flex;">
<!--       <input type="radio" name="gender" id="gender" value="남" style="color: #eee6c4">남자 -->
<!--       <input type="radio" name="gender" id="gender" value="여" style="color: #eee6c4">여자 -->
    <label for="opt1" class="radio">
   	  <input type="radio" name="gender" id="opt1" class="hidden" value="남"/>
      <span class="label-radio"></span> 남자
  	</label>
  	<label for="opt2" class="radio">
   	  <input type="radio" name="gender" id="opt2" class="hidden" value="여"/>
      <span class="label-radio"></span> 여자
  	</label>
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="email"><span id="need">*</span>Email</label>
    <div class="col-sm-4">
      <input type="email" name="email" id="email" class="form-control">
    </div>
      <button type="button" class="btn btn1 col-sm-2" onclick="emailCheck(document.frm.email.value)">Email중복확인</button>
      <label class="check" id="emailcheck"></label>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="genre">장르</label>
    <div class="col-sm-10">
     
    <label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="애니메이션">
		<span class="label-cbk">
		</span>애니메이션
	</label>
    <label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="SF">
		<span class="label-cbk">
		</span>SF
	</label>
    <label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="스릴러">
		<span class="label-cbk">
		</span>스릴러
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="액션">
		<span class="label-cbk">
		</span>액션
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="로맨스">
		<span class="label-cbk">
		</span>로맨스
	</label>
	<br>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="공포/호러">
		<span class="label-cbk">
		</span>공포/호러
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="코미디">
		<span class="label-cbk">
		</span>코미디
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="가족">
		<span class="label-cbk">
		</span>가족
	</label>
	<label class="checkbox"> 
    	<input type="checkbox" class="hidden" name="genre_str" value="범죄">
		<span class="label-cbk">
		</span>범죄
	</label>
    
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-5">
      <button class="btn btn1">등록</button>
      <button type="reset" class="btn btn1">취소</button>
    </div>
  </div>
</form>
</div>

</body> 
</html>