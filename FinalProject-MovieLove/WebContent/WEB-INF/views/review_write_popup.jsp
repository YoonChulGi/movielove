<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- Custom styles for this template -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<style>  
	body{
		display:flex;
 		align-items:center;
	}
	#ui-id-1 {
	    z-index: 99999;
	    position: absolute;
	    max-height: 175px;
	    overflow-x: hidden;
	    overflow-y: scroll;
	    left: 221px;
	    top: 142px;
	    border-top: 0px;
	    border-left: 1px solid #565656;
	    border-right: 1px solid #565656;
	    border-bottom: 1px solid #565656;
	    background-color: #fff;
	    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,.07);
	    box-shadow: 0px 1px 2px rgba(0,0,0,.07);
	}	
	#ui-id-1 li {
	    display: block;
    	height: 58px;
    	line-height: 38px;
    	font-size: 13px;
    	color: #333;
    	border-top: 1px solid #e8e8e8;
    	text-align: center;
	}
	#ui-id-1 li .link_item {
	    display: block;
	    overflow: hidden;
	    padding: 7px 11px;
	}
	#ui-id-1 li .thumb_g {
	    float: left;
	    width: 30px;
	    height: 40px;
	    background-color: #f4f4f4;
	}
	#ui-id-1 li .cont_item {
	    overflow: hidden;
	    padding-left: 10px;
	    line-height: 21px;
	    vertical-align: middle;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	}
	#ui-id-1 li .tit_item {
	    display: block;
	    text-align: left;
	    overflow: hidden;
	    max-height: 23px;
	    margin-top: -1px;
	    font-weight: normal;
	    font-size: 13px;
	    color: #333;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
	#ui-id-1 li .emph_sgt {
	    color: #4889ff;
	}
	#ui-id-1 li .txt_year {
	    display: block;
	    text-align: left;
	    overflow: hidden;
	    width: 100%;
	    height: 19px;
	    margin-top: -4px;
	    font-size: 13px;
	    color: #9f9f9f;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
</style>

<!--  영화 검색 자동완성 스크립트 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    var movie_info = [
      {
    	  label: "스윙키즈",
    	  year: "2018",
    	  link: "#",
          img_src: "images/poster3.jpg"
      },
      {
    	  label: "범블비",
    	  year: "2018",
    	  link: "#",
          img_src: "images/poster2.jpg"
      },
      {
    	  label: "아쿠아맨",
    	  year: "2018",
    	  link: "#",
          img_src: "images/poster1.jpg"
      },
      {
    	  label: "아쿠아맨1",
    	  year: "2018",
          link: "#",
          img_src: "images/poster1.jpg"
      },
      {
    	  label: "아쿠아맨2",
          year: "2019",
          link: "#",
          img_src: "images/poster1.jpg"
      },
      {
    	  label: "아쿠아맨3",
          year: "2020",
          link: "#",
          img_src: "images/poster1.jpg"
      }
    ];
 
    $( "#search-movie" ).autocomplete({
      minLength: 1,
      source: movie_info,
      success: function (result) {
    	    response($.map(movie_info.slice (0,3), function(item) {
    	    return {
    	    value: item.label
    	    };
    	    }));
      },
      focus: function( event, ui ) {
        //$( "#search-movie" ).val( ui.item.label );
        //return false;
      },
      select: function( event, ui ) {
        $( "#search-movie" ).val( ui.item.label );
        return false;
      }
    })
    .autocomplete( "instance" )._renderItem = function( ul, item ) {
      return $( "<li id='movie_list_li'>" )
        .append("<div class='link_item'> <span class='thumb_g'> <img src='"+item.img_src+"' width='30' height='40' class='thumb_img'></span> <div class='cont_item'> <strong class='tit_item'> <span class='emph_sgt'>"+item.label+"</span></strong> <span class='txt_year'>"+item.year+"</span></div></div>")
      	.append("</li>")
        .appendTo( ul );
    };
  } );
</script>

<!-- 별점 주기 스크립트 -->
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

<!-- 글자수 제한 스크립트 -->
<script>
$(function() {
	$('#review-content').keyup(function (e){
		var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        if(content.length < 41){
        	$('#review-counter').html(content.length + '/40자');
        }
    });
    $('#review-content').keyup();
});
</script>
</head>

<body>
    <div class="container" align="center" style="width:100%"> <!-- container -->
    	<h3 class="popup-title">[40자평 작성]</h3>
    	<div class="col-sm-11" style="display:inline-block ;margin-left:4.1666%; margin-right:4.1666%;">
	    	<div class="row row-review mb_10" align="center">
       			<div class="row-menu">
					<span class="popup-menu">제목</span>
        			<div class="popup-content">
						<fieldset>
							<input id="search-movie" name="search" placeholder="영화 검색" class="form-control input-lg popup-content" type="text" style="width:100%">
						</fieldset>
						<div class="pcsgt_layer">
							<div class="cate_pcsgt" id="movie_suggest_pc">
								<ul id="movie_suggest_list_pc" class="list_pcsgt">	
								</ul>
							</div>
							<a href="/search/main?searchText=%EC%95%84%EC%BF%A0%EC%95%84%EB%A7%A8&amp;returnUrl=https%3A%2F%2Fmovie.daum.net%2Fmoviedb%2Fmain%3FmovieId%3D94484" class="link_pcsgt #gnb #search #result">검색결과 전체보기<span class="ico_popcorn ico_arr"></span></a>
						</div>
					</div>
				</div>
			</div>
       		<div class="row row-review mb_10" align="center">
       			<div class="row-menu">
					<span class="popup-menu">평점</span>
       				<!-- 별점 -->
        			<a class="review_grade popup-content" style="height:32px">
        				<div class="starRev">
  							<span class="starR-left on" value="1">별1_왼쪽</span>
   							<span class="starR-right" value="2">별1_오른쪽</span>
   							<span class="starR-left" value="3">별2_왼쪽</span>
   							<span class="starR-right" value="4">별2_오른쪽</span>
   							<span class="starR-left" value="5">별3_왼쪽</span>
   							<span class="starR-right" value="6">별3_오른쪽</span>
  							<span class="starR-left" value="7">별4_왼쪽</span>
  							<span class="starR-right" value="8">별4_오른쪽</span>
  							<span class="starR-left" value="9">별5_왼쪽</span>
  							<span class="starR-right" value="10">별5_오른쪽</span>
  						</div>
  						<em id="review_grade" class="emph_grade" style="font-size:18px">1</em>
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
       		<button id="btn-review_write" class="btn btn-primary btn-lg">작성</button>
       	</div>
    </div>
    
    <!-- Bootstrap core JavaScript -->
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>
    
</body>
</html>