<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="kr">

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
    
  </head>
  
  <body>
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
					<a class="_notSympathyButton" href="#" onclick="parent.clickcr(this, 'ara.opp', '', '', event);"></a><strong><span class="notSympathy_14910863 count v2">${review.REVIEW_NOTSYMPATHY}</span></strong>
				</div>
			</li>
			</c:forEach>
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
