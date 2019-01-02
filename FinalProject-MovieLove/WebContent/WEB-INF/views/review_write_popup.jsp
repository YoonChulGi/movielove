<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
var grade = 0.5;

$(document).ready(function(){
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  $("#review_grade").html($(this).attr('value'));
	  return false;
	});
});
</script>
<script>
$(function() {
	$('#review-content').keyup(function (e){
		var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        if(content.length < 40){
        	$('#review-counter').html(content.length + '/40자');
        }
    });
    $('#review-content').keyup();
});
</script>

<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- Custom styles for this template -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<style>
body{
	display:flex;
  	align-items:center;
}
</style>

<body>

    <div class="container" align="center" style="width:100%"> <!-- container -->
    	<h3 class="popup-title">[40자 감상평 작성]</h3>
    	<div class="col-sm-11" style="display:inline-block ;margin-left:4.1666%; margin-right:4.1666%;">
	    	<div class="row row-review mb_10" align="center">
       			<div class="row-menu">
					<span class="popup-menu">제목</span>
					<input id="search-input" name="search" placeholder="영화 검색" class="form-control input-lg popup-content" type="text" style="width:60%">
					<button class="btn btn-lg btn-search" onclick="search()">검색</button>
				</div>
       		</div>
       		<div class="row row-review mb_10" align="center">
       			<div class="row-menu">
					<span class="popup-menu">평점</span>
       				<!-- 별점 -->
        			<a class="review_grade popup-content" style="height:32px">
        				<div class="starRev">
  							<span class="starR-left on" value="0.5">별1_왼쪽</span>
   							<span class="starR-right" value="1.0">별1_오른쪽</span>
   							<span class="starR-left" value="1.5">별2_왼쪽</span>
   							<span class="starR-right" value="2.0">별2_오른쪽</span>
   							<span class="starR-left" value="2.5">별3_왼쪽</span>
   							<span class="starR-right" value="3.0">별3_오른쪽</span>
  							<span class="starR-left" value="3.5">별4_왼쪽</span>
  							<span class="starR-right" value="4.0">별4_오른쪽</span>
  							<span class="starR-left" value="4.5">별5_왼쪽</span>
  							<span class="starR-right" value="5.0">별5_오른쪽</span>
  						</div>
  						<em id="review_grade" class="emph_grade" style="font-size:18px">7.1</em>
						<span class="txt_grade" style="margin-left:5px;margin-right:5px;">/</span>
						<span class="txt_grade">10</span>
					</a>
				</div>
       		</div>
	    	<div class="row row-review mb_10" align="center">
       			<div class="row-menu">
	       			<span class="popup-menu">내용</span>
       				<textarea id="review-content" class="popup-content" maxlength="40" placeholder="40자 감상평을 작성해주세요"></textarea>
       				<span id="review-counter">0</span>
       			</div>
       		</div>
       		<button id="btn-review_write" class="btn btn-primary btn-lg" style="width:20%;margin-top:15px;">작성</button>
       	</div>
    </div>
    
    <!-- Bootstrap core JavaScript -->
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>
    
</body>
</html>
