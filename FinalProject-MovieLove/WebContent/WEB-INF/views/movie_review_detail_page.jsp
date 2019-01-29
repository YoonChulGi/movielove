<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	String movie_img="images/poster.jpg";
	//String movie_img="http://placehold.it/180x240";
	String sessionId = (String)session.getAttribute("memId");
	System.out.println("sessionId: "+sessionId);
%>


<!DOCTYPE html>
<html lang="en">

  <head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="//t1.daumcdn.net/movie/cssjs/1543973809/common/new_utils.js"></script>
	<script src="//t1.daumcdn.net/movie/cssjs/1543973809/iscroll5/iscroll.js"></script>
	<script src="//t1.daumcdn.net/movie/cssjs/1543973809/cookie/jquery.cookie.js"></script>
	<script>
	window.onload = function () {
		var maxHeight = $("em.desc_movie").css("max-height");
		$("em.desc_movie").addClass("desc_more");
		var curHeight = $("em.desc_movie").css("height");
		$("em.desc_movie").removeClass("desc_more");
		
		maxHeight = parseInt(maxHeight.replace("px", ""));
		curHeight = parseInt(curHeight.replace("px", ""));
		
		if(maxHeight >= curHeight) {
			$("a.link_more").hide();
		} else {
			$("a.link_more").show();
		}
	}
	//더보기 버튼 핸들링
	function setDescMoreButton() {
		if(isClickMoreButton) {
			return false;
		}
		var maxHeight = $("em.desc_movie").css("max-height");
		$("em.desc_movie").addClass("desc_more");
		var curHeight = $("em.desc_movie").css("height");
		$("em.desc_movie").removeClass("desc_more");
		
		maxHeight = parseInt(maxHeight.replace("px", ""));
		curHeight = parseInt(curHeight.replace("px", ""));
		
		if(maxHeight >= curHeight) {
			$("a.link_more").hide();
		} else {
			$("a.link_more").show();
		}
	}
	//접기 버튼 핸들링
	function setDescHideButton() {
		if(isClickHideButton) {
			return false;
		}
		var maxHeight = $("em.desc_movie").css("max-height");
		$("em.desc_movie").addClass("desc_more");
		var curHeight = $("em.desc_movie").css("height");
		$("em.desc_movie").removeClass("desc_more");
		
		maxHeight = parseInt(maxHeight.replace("px", ""));
		curHeight = parseInt(curHeight.replace("px", ""));
		
		if(maxHeight >= curHeight) {
			$("a.link_more").hide();
		} else {
			$("a.link_more").show();
		}
	}
	// 줄거리 더보기 버튼
	function plotMoreView() {
		$("em.desc_movie").addClass("desc_more");
		$("a.link_more").hide();
		$("a.link_hide").show();
		isClickMoreButton = true;
		movietools.tiara.send("moviedb", "info summary");
	}
	// 줄거리 접기 버튼
	function plotHideView() {
		$("em.desc_movie").removeClass("desc_more");
		$("a.link_hide").hide();
		$("a.link_more").show();
		isClickMoreButton = true;
		movietools.tiara.send("moviedb", "info summary");
	}
	</script>
	
	<script> var session_id = '<%=sessionId%>'; </script>
	<script type="text/javascript">
	var popupX = (window.screen.width/2) - (750/2);
	var popupY = (window.screen.height/2) - (450/2);
	
	function openReviewWrite(){
    	if(session_id == "null") {
			alert("로그인 후 작성하실 수 있습니다.");
			window.location.href='login.do';
		} else {
    		window.open('review_write_popup.do?movieTitle='+'${movieInfo.getMOVIE_TITLE()}', '40자평 작성', 'toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=850,height=500,left='+popupX+',top='+popupY);
		}
	}
	</script>
	
	<!-- 감상평 메뉴 스크립트 -->
	<script>
	$(document).ready(function(){
	$('.sorting_list li').click(function(){
	  	$(this).parent().children('li').removeClass('on');
	  	$(this).addClass('on');
	  	return false;
		});
	});
	</script>
	
  </head>
  
  <body class="movie_review_detail">
  
    <!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <!-- Page Content -->
    <div class="container">
    	<div class="main_detail">
			<div class="detail_summarize">
				<span class="thumb_summary  #info #poster">
					<a href="#" class="area_poster" target="_blank">
						<img src="${movieInfo.getMOVIE_IMG()}" class="img_summary" alt="말모이 포스터" onload="noImageOnLoad($(this));$(this).parent().find('.link_scale').show();">
					</a>
				</span>
				<div class="movie_summary">
					<div class="subject_movie">
						<strong class="movie_title">${movieInfo.getMOVIE_TITLE()}</strong>
						<span class="movie_title_en" style="font-size:16px">${movieInfo.getMOVIE_TITLE_ENGLISH()}</span>
						<span class="txt_origin"></span><!-- 2016-04-12 추가 -->
						<span class="review_grade" style="width:200px">
							<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:${avgRatingPer}%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
							<em class="emph_grade" style="font-size:18px; font-style:normal">
							<c:if test="${avgRatingPer == 0}">0.00</c:if>
							<c:if test="${avgRatingPer != 0}">${avgRating}</c:if>
							</em>
						</span>
					</div>
					<dl class="list_movie list_main">
						<dt class="screen_out">장르|나라</dt>
						<dd class="type_ellipsis">
							<span>${movieInfo.getMOVIE_GENRE()}</span>
							<span class="split_line" style="margin:2px 5px 0 5px"></span>
							<span>${movieInfo.getMOVIE_COUNTRY()}</span>
						</dd>
						<dt class="screen_out">상영시간ㅣ개봉 | 관람이용가</dt>																								</dd>
						<dd class="type_ellipsis">
							<span>${movieInfo.getMOVIE_YEAR()}</span>
							<span class="split_line" style="margin:2px 5px 0 5px"></span>
							<span>${movieInfo.getMOVIE_RUNTIME()}</span>
							<span class="split_line" style="margin:2px 5px 0 5px"></span>
							<span>${movieInfo.getMOVIE_AGE()}</span>
						</dd>
						<dt class="screen_out">감독</dt>
						<dd class="type_ellipsis">(감독) 
							<span>${movieInfo.getMOVIE_DIRECTOR()}</span>
						</dd>
						<dt class="screen_out">주연</dt>
						<dd class="type_ellipsis">(출연)
							<span>${movieInfo.getMOVIE_ACTORS()}</span>
						</dd>
						<dt class="screen_out">줄거리</dt>
						<dd class="type_ellipsis">(줄거리)
							<em class="desc_movie" style="margin:0;width:636px;font-style:normal;">${movieInfo.getMOVIE_CONTENTS()}</em>
							<a href="javascript:;" class="link_more" onclick="plotMoreView(); return false;" 
								id="descMoreButton" style="display:none">더 보기</a>
							<a href="javascript:;" class="link_hide" onclick="plotHideView(); return false;"
								id="descHideButton" style="display:none">접기</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
        
		<ul class="movie_review_list">
			<h2 style="float:left">40자 평</h2>
			<button class="btn btn-lg btn-primary" onclick="openReviewWrite()" style="float:right; background-color:#337ab7; font-size:16px">40자평 남기기</button>
			
			<div id="orderCheckbox" class="top_behavior" style="margin-top:48px">
				<ul class="sorting_list">
					<li class="on"><a href="#" onclick="parent.clickcr(this, 'ara.bysym', '', '', event); dislplayOrder('sympathyScore');">호감순</a></li>
					<li><a href="#" onclick="parent.clickcr(this, 'ara.byrct', '', '', event); dislplayOrder('newest');">최신순</a></li>
					<li><a href="#" onclick="parent.clickcr(this, 'ara.high', '', '', event); dislplayOrder('highest');">평점 높은 순</a></li>
				</ul>
			</div>
				
			<div class="score_result">
				<ul>
	        		<c:if test="${reviewList.size() == 0}">
	        		<li>
		        		<div class="review_none_div">
			        		<span class="review_none">등록된 40자평이 없습니다.</span>
		        		</div>
					</li>
					</c:if>
					<c:forEach items="${reviewList}" var="review" varStatus="status">
					<li>
						<span class="review_grade" style="width:150px">
							<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:${review.REVIEW_RATING}0%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
							<em class="emph_grade" style="font-size:15.5px">${review.REVIEW_RATING}</em>
						</span>
						<div class="score_reple">
							<p>${review.REVIEW_CONTENTS} </p>
							<dl>
								<dt>
									<em>
										<a href="#" onclick="javascript:showPointListByNid(14910863, 'after');parent.clickcr(this, 'ara.uid', '', '', event); return false;" target="_top">
											<span>${review.REVIEW_WRITER}</span>
										</a>
									</em>
									<em style="background:none">${review.REVIEW_DATE}</em>
								</dt>
							</dl>
						</div>
						<div class="btn_area">
							<a class="_sympathyButton" href="#" onclick="parent.clickcr(this, 'ara.sym', '', '', event);"></a><strong><span class="sympathy_14910863 count">${review.REVIEW_SYMPATHY}</span></strong>
							<a class="_notSympathyButton" href="#" onclick="parent.clickcr(this, 'ara.opp', '', '', event);"></a><strong><span class="notSympathy_14910863 count v2">401</span></strong>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</ul>
		
      	<!-- Pagination -->
      	<div class="bottom-number mt_20" align="center">
      		<ul class="pagination justify-content-center">
	        	<li class="page-item">
          		<a class="page-link" href="#" aria-label="Previous">
	           		<span aria-hidden="true">&laquo;</span>
            		<span class="sr-only">Previous</span>
          		</a>
        		</li>
        		<%for(int i=1; i<=5; i++){ %>
        		<li class="page-item">
          			<a class="page-link" href="#"><%=i %></a>
        		</li>
        		<%} %>
        		<li class="page-item">
          		<a class="page-link" href="#" aria-label="Next">
	            	<span aria-hidden="true">&raquo;</span>
            		<span class="sr-only">Next</span>
          		</a>
        		</li>
      		</ul>
      	</div>
    </div>
    <!-- /.container -->
        
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER                       END  ===== -->


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>

  </body>

</html>
