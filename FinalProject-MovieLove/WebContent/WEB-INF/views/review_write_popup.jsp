<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="spring.vo.bean.MovieVO" %>
<%@ page import="java.util.List" %>

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
	    left: 228px;
	    top: 144px;
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

  var isClicked = false;

  $( function() {
	// 리스트 생성
	var movieList = new Array();

	<c:forEach items="${movieList}" var="movie">
		// 객체 생성
		var data = new Object();
        data.label = '${movie.MOVIE_TITLE}';
		data.year = '${movie.MOVIE_YEAR}';
        data.img_src = '${movie.MOVIE_IMG}';
        data.id = '${movie.MOVIE_ID}';
          
        // 리스트에 생성된 객체 삽입
	    movieList.push(data);
	</c:forEach>
    
    // String 형태로 변환
    var jsonData = JSON.stringify(movieList);
    var jsonArray = JSON.parse(jsonData);
    $('#search-movie').focus(function(){
    	$( "#search-movie" ).autocomplete( "enable" );
    });
 
    $( "#search-movie" ).autocomplete({
      minLength: 1,
      source: jsonArray,
      success: function (result) {
    	    response($.map(jsonArray.slice (0,3), function(item) {
    	    return {
    	    value: item.label
    	    };
    	    }));
      },
      focus: function( event, ui ) {
        $( "#search-movie" ).val( ui.item.label );
        return false;
      },
      select: function( event, ui ) {
        $( "#search-movie" ).val( ui.item.label );
        $( "#search-movie" ).autocomplete( "disable" );
        isClicked = true;
        return false;
      }
    })
    .autocomplete( "instance" )._renderItem = function( ul, item ) {
      return $( "<li id='movie_list_li' class='ui-menu-item' tabindex='-1'>" )
        .append("<div class='link_item'> <span class='thumb_g'> <img src='"+item.img_src+"' width='30' height='40' class='thumb_img'></span> <div class='cont_item'> <strong class='tit_item'> <span class='emph_sgt'>"+item.label+"</span></strong> <span class='txt_year'>"+item.year+"</span></div></div>")
      	.append("</li>")
        .appendTo(ul);
    };
  } );
</script>

<!-- 40자평 작성 버튼 이벤트 스크립트 -->
<script>
  function review_write_click() {
	    //영화 자동완성 검색을 클릭했는지 여부
		if(isClicked){
			if($("#review_contents").val() ==''){
				alert('내용을 입력해주세요.');
				return;
			} else{
				document.getElementById('review_wirte_form').submit();
			}
		} else{
			//40자평 상세페이지에서 작성 버튼 누를 경우 (영화검색 안함)
			if('${movieTitle}' == null){
				alert("먼저 영화를 검색한 후 눌러주세요.");
			} else{
				document.getElementById('review_wirte_form').submit();
			}
			alert("먼저 영화를 검색한 후 눌러주세요.");
			return;
		}
	}
</script>

<!-- 별점 주기 스크립트 -->
<script>
var grade = 0.5;
$(document).ready(function(){
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  $("#review_rating").html($(this).attr('value'));
	  return false;
	});
});
</script>

<!-- 글자수 제한 스크립트 -->
<script>
$(function() {
	$('#review_contents').keyup(function (e){
		var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        if(content.length < 41){
        	$('#review-counter').html(content.length + '/40자');
        }
    });
    $('#review_contents').keyup();
});
</script>

</head>


<body class="review_write_popup">
    <div class="container" align="center" style="width:100%"> <!-- container -->
    	<h3 class="popup-title">[40자평 작성]</h3>
    	<form action="review_writePro.do" method="get" id="review_wirte_form">
    	<div class="col-sm-11" style="display:inline-block ;margin-left:4.1666%; margin-right:4.1666%;">
	    	<div class="row row-review mb_10" align="center">
       			<div class="row-menu">
					<span class="popup-menu">제목</span>
        			<div class="popup-content">
        				<c:if test="${movieTitle == null}">
						<fieldset>
							<input id="search-movie" name="review_title" placeholder="영화 검색" class="form-control input-lg popup-content" type="text" style="width:100%">
							<i class="fa fa-search" style="position:absolute;right:0;margin-top:12px;margin-right:10px;"></i>
						</fieldset>
						</c:if>
						<c:if test="${movieTitle != null}">
							<span class="popup_mvtitle" align="left">${movieTitle}</span>
							<input id="search-movie" name="review_title" type="hidden" value="${movieTitle}">
						</c:if>
						<div class="pcsgt_layer">
							<div class="cate_pcsgt" id="movie_suggest_pc">
								<ul id="ul-id-1" class="list_pcsgt ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" tabindex="0" style="display:none"></ul>
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
  							<span name="starR" class="starR-left on" value="1">별1_왼쪽</span>
   							<span name="starR" class="starR-right" value="2">별1_오른쪽</span>
   							<span name="starR" class="starR-left" value="3">별2_왼쪽</span>
   							<span name="starR" class="starR-right" value="4">별2_오른쪽</span>
   							<span name="starR" class="starR-left" value="5">별3_왼쪽</span>
   							<span name="starR" class="starR-right" value="6">별3_오른쪽</span>
  							<span name="starR" class="starR-left" value="7">별4_왼쪽</span>
  							<span name="starR" class="starR-right" value="8">별4_오른쪽</span>
  							<span name="starR" class="starR-left" value="9">별5_왼쪽</span>
  							<span name="starR" class="starR-right" value="10">별5_오른쪽</span>
  						</div>
  						<em id="review_rating" class="emph_grade" style="font-size:18px">1</em>
  						<input name="review_rating" type="hidden" value="1" id="review_rating_hidden"/>
  						<script type="text/javascript">
  							$(function(){
  								$("span[name=starR]").click(function(){
  									$("#review_rating_hidden").val($("#review_rating").html());
  								});
  							});
  						</script>
  						
						<span class="txt_grade" style="margin-left:5px;margin-right:5px;">/</span>
						<span class="txt_grade">10</span>
					</a>
				</div>
       		</div>
	    	<div class="row row-review mb_10" align="center">
       			<div class="row-menu">
	       			<span class="popup-menu">내용</span>
       				<textarea id="review_contents" name="review_contents" class="popup-content" maxlength="40" placeholder="40자 감상평을 작성해주세요"></textarea>
       				<span id="review-counter">0</span>
       			</div>
       		</div>
       		<input name="review_writer" type="hidden" value="<%=session.getAttribute("memId")%>"/>
       		<button id="btn-review_write" class="btn btn-primary btn-lg" onclick="review_write_click()" type="button">작성</button>
       	</div>
       	</form>
    </div>
    
    <!-- Bootstrap core JavaScript -->
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>
    
</body>
</html>