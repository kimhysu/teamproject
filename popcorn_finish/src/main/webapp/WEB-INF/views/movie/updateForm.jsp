<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_movie.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>영화등록</title>
<META CHARSET="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${root}/css/style.css">  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript">
$(function() {
    $( ".testDatepicker" ).datepicker({
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        closeText: '닫기', 
        dateFormat: "yymmdd",
        changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });
});
</script>
<style type="text/css">
#need {
	color: red;
}

#idcheck, #emailcheck {
	color: red;
}

h1 {
	font-family: 'Patua One', cursive;
	font-size: 50px;
}
</style>
</head>
<body style="font-family: 'Jua', sans-serif; font-size: 20px;">
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">MOVIE</h1>
		<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span>
			필수입력 사항입니다.)
		</label>

		<form class="form-horizontal" method="post" name="frm" action="update">
		
			<input type="hidden" name="movie_num" value="${dto.movie_num}">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id"><span
					id="need">*</span>영화 이름</label>
				<div class="col-sm-3">
					<input type="text" name="movie_name" id="movie_name"
						class="form-control" value="${dto.movie_name}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="movie_price"><span
					id="need">*</span>영화 가격</label>
				<div class="col-sm-3">
					<input type="text" name="movie_price" id="movie_price"
						class="form-control" value="${dto.movie_price}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="movie_content">내용</label>
				<div class="col-sm-8">
					<textarea rows="12" cols="7" id="movie_content"
						name="movie_content" class="form-control">${dto.movie_content}</textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="movie_date"><span
					id="need">*</span>개봉날짜</label>
				<div class="col-sm-3">
					<input type="text" name="movie_date" id="movie_date" class="testDatepicker form-control" value="${dto.movie_date}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">장르</label>
				<div class="col-sm-10">
					<label class="checkbox-inline"> 
					<input type="checkbox" name="movie_genre_str" value="애니메이션"
						<c:if test="${dto.movie_genre_str.indexOf('애니메이션') != -1}">checked</c:if>>SF
					</label> 
					<label class="checkbox-inline"> 
					<input type="checkbox" name="movie_genre_str" value="SF"
						<c:if test="${dto.movie_genre_str.indexOf('SF') != -1}">checked</c:if>>SF
					</label> 
					<label class="checkbox-inline"> <input type="checkbox"
						name="movie_genre_str" value="스릴러"
						<c:if test="${dto.movie_genre_str.indexOf('스릴러') != -1}">checked</c:if>>스릴러
					</label> 
					<label class="checkbox-inline"> <input type="checkbox"
						name="movie_genre_str" value="액션"
						<c:if test="${dto.movie_genre_str.indexOf('액션') != -1}">checked</c:if>>액션
					</label> 
					<label class="checkbox-inline"> <input type="checkbox" name="movie_genre_str" value="로맨스"
						<c:if test="${dto.movie_genre_str.indexOf('로맨스') != -1}">checked</c:if>>로맨스
					</label>
					<label class="checkbox-inline"> <input type="checkbox" name="movie_genre_str" value="공포/호러"
						<c:if test="${dto.movie_genre_str.indexOf('공포/호러') != -1}">checked</c:if>>공포/호러
					</label>
					<label class="checkbox-inline"> <input type="checkbox" name="movie_genre_str" value="코미디"
						<c:if test="${dto.movie_genre_str.indexOf('코미디') != -1}">checked</c:if>>코미디
					</label>
					<label class="checkbox-inline"> <input type="checkbox" name="movie_genre_str" value="가족"
						<c:if test="${dto.movie_genre_str.indexOf('가족') != -1}">checked</c:if>>가족
					</label>
					<label class="checkbox-inline"> <input type="checkbox" name="movie_genre_str" value="범죄"
						<c:if test="${dto.movie_genre_str.indexOf('범죄') != -1}">checked</c:if>>범죄
					</label>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">등급<span id="need">*</span></label>
				<div class="col-sm-10">
				<label class="radio-inline"> 
				<input type="radio" name="movie_grade" id="movie_grade" value="전체이용가" 
				<c:if test="${ dto.movie_grade eq '전체이용가'}">checked="checked"</c:if>/>전체이용가
				</label> 
				<label class="radio-inline"> 
				<input type="radio" name="movie_grade" id="movie_grade" value="12세" 
				<c:if test="${ dto.movie_grade eq '12세'}">checked="checked"</c:if>/>12세
				</label> 
				<label class="radio-inline"> 
				<input type="radio" name="movie_grade" id="movie_grade" value="15세" 
				<c:if test="${ dto.movie_grade eq '15세'}">checked="checked"</c:if>/>15세
				</label> 
				<label class="radio-inline"> 
				<input type="radio" name="movie_grade" id="movie_grade" value="18세" 
				<c:if test="${ dto.movie_grade eq '18세'}">checked="checked"</c:if>/>18세
				</label> 
				<label class="radio-inline"> 
				<input type="radio" name="movie_grade" id="movie_grade" value="19세" 
				<c:if test="${ dto.movie_grade eq '19세'}">checked="checked"</c:if>/>19세
				</label> 
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="content">출연진</label>
				<div class="col-sm-8">
					<textarea rows="5" cols="7" id="movie_cast" name="movie_cast"
						class="form-control">${dto.movie_cast}</textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn btn-danger">등록</button>
					<button type="reset" class="btn btn-warning">취소</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>
