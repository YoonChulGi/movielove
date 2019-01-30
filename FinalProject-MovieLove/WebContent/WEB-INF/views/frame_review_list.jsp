<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="kr">

  <head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="//t1.daumcdn.net/movie/cssjs/1543973809/common/new_utils.js"></script>
	<script src="//t1.daumcdn.net/movie/cssjs/1543973809/iscroll5/iscroll.js"></script>
	<script src="//t1.daumcdn.net/movie/cssjs/1543973809/cookie/jquery.cookie.js"></script>
    
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	$(document).ready(function(){
		$(function(){
	  		$('WEB_INF/views/movie_review_datil_page.jsp #frame_review').attr('height', ${listHeight});			
		});
	});
	</script>
	
	<script>
	$(document).ready(function(){
		<!-- 하단 페이지 번호 스크립트 -->
		$('.page-item').click(function(){
			var pageNum = $(this).children('a').html();
			var btn = $(this).children('a').children('.sr-only').html();
			
			console.log("menu: "+${menu});
			console.log("pageNum: "+pageNum);
			console.log("btn: "+btn);
			
			/***
			if(btn == 'Previous'){
				for(int i=0;i<5;i++){
					if(pageNum > '${maxPage}'){ pageNum--; }
				}
			} else if(btn == 'Next'){
				for(int i=0;i<5;i++){
					if(pageNum < '${maxPage}'){ pageNum++; }
				}
			}
			***/
			
		  	$(this).parent().children('li').removeClass('on');
	  		$(this).addClass('on');
			
			location.href = 'frame_review_list.do?movieId='+'${movieInfo.getMOVIE_ID()}'+'&menu='+'${menu}'+'&page='+pageNum;
				       	
	        //var offset = $("#review_list").offset();
	        //$('html, body').animate({scrollTop : offset.top}, 300);
			
	  		return false;
		});
	});
	</script>
    
  </head>
  
  <body>
  	<div class="score_result" id="review_list">
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
					<a class="_notSympathyButton" href="#" onclick="parent.clickcr(this, 'ara.opp', '', '', event);"></a><strong><span class="notSympathy_14910863 count v2">${review.REVIEW_NOTSYMPATHY}</span></strong>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	
	<!-- Pagination -->
	<div class="bottom-number" align="center" id="bottom-number">
		<ul class="pagination justify-content-center">
			<c:if test="${maxPage > 5}">
	        <li class="page-item">
          		<a class="page-link" href="#" aria-label="Previous">
		           	<span aria-hidden="true">&laquo;</span>
            		<span class="sr-only">Previous</span>
            		<input class="hidden-menu" type="hidden" value="${menu}">	
            	</a>
       		</li>
       		</c:if>
       		
       		<c:forEach begin="1" end="${maxPage}" varStatus="status">
       		<li class="page-item">
	          	<a class="page-link" href="#">${status.count}</a>
            		<input class="hidden-menu" type="hidden" value="${menu}">
        	</li>
			</c:forEach>
			
			<c:if test="${maxPage > 5}">
        	<li class="page-item">
          		<a class="page-link" href="#" aria-label="Next">
	            	<span aria-hidden="true">&raquo;</span>
            		<span class="sr-only">Next</span>
            		<input class="hidden-menu" type="hidden" value="${menu}">          		
            	</a>
        	</li>
       		</c:if>
   		</ul>
   	</div>


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>

  </body>

</html>
