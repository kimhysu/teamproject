<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_movie.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">
<meta charset="UTF-8">
<title>영화 이미지 수정</title>
</head>
<body>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">영화 이미지 수정</h2>
 
 <form class="form-horizontal" method="post" 
       action="update_movie_img" enctype="multipart/form-data">
  
 <input type="hidden"  name="movie_num" value="${param.movie_num}">
 <input type="hidden"  name="oldfile1" value="${param.oldfile1}">
 <input type="hidden"  name="oldfile2" value="${param.oldfile2}">
 <input type="hidden"  name="oldfile3" value="${param.oldfile3}">
 
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile1">영화명</label>
    <div class="col-sm-6">
      ${dto.movie_name}
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile1">원본 이미지1</label>
    <div class="col-sm-6">
      <img src="./storage/${param.oldfile1}" class="img-rounded" width="200" height="200">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile2">원본 이미지2</label>
    <div class="col-sm-6">
      <img src="./storage/${param.oldfile2}" class="img-rounded" width="200" height="200">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile3">원본 이미지3</label>
    <div class="col-sm-6">
      <img src="./storage/${param.oldfile3}" class="img-rounded" width="200" height="200">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="fname" >변경 이미지1</label>
    <div class="col-sm-6">
     <input type="file" name="movie_img1MF" class="form-control" 
                    accept=".png, .jpg, .gif" required="required">
    </div>  
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="fname" >변경 이미지2</label>
    <div class="col-sm-6">
     <input type="file" name="movie_img2MF" class="form-control" 
                    accept=".png, .jpg, .gif" required="required">
    </div>  
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="fname" >변경 이미지3</label>
    <div class="col-sm-6">
     <input type="file" name="movie_img3MF" class="form-control" 
                    accept=".png, .jpg, .gif" required="required">
    </div>  
  </div>
  
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="button" class="btn" onclick="history.back()">취소</button>
   </div>
  </div> 

</form>  
</div>
</body>
</html>