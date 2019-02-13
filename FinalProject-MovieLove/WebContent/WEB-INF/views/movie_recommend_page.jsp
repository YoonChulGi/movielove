<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String movie_title = "영화 제목";
	String movie_rate = "10.3%";
	String movie_date = "2018.12.31 개봉";
	String movie_img = "images/poster.jpg";
	//String movie_img="http://placehold.it/236x340";
	String sel1 = "", sel2 = "", sel3 = "";
	String sel = request.getParameter("sel");

	if (sel != null) {
		if (sel.equals("1")) {
			sel1 = "on";
		} else if (sel.equals("2")) {
			sel2 = "on";
		} else if (sel.equals("3")) {
			sel3 = "on";
		}
	} else {
		sel1 = "on";
	}
%>

<!DOCTYPE html>
<html lang="en">

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
	.dropdown-menu{
		display:none;
	}
	.dropdown:hover ul.dropdown-menu{
		display:block;
	}
	#ui-id-1 {
	    z-index: 99999;
	    position: absolute;
	    max-width: 220px;
	    max-height: 175px;
	    overflow-x: hidden;
	    overflow-y: hidden;
	    left: 1301px;
	    top: 232px;
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
		// 리스트 생성
		var movieList = new Array();
	
		<c:forEach items="${movieList}" var="movie">
			// 객체 생성
			var data = new Object();
        	data.label = '${movie.MOVIE_TITLE}';
			data.year = '${movie.MOVIE_YEAR}';
        	data.img_src = '${movie.MOVIE_IMG}';
        	data.id = '${movie.MOVIE_ID}';
        	console.log("data.label: "+data.label);
          	
        	// 리스트에 생성된 객체 삽입
	    	movieList.push(data);
		</c:forEach>
	    
	    // String 형태로 변환
	    var jsonData = JSON.stringify(movieList);
	    var jsonArray = JSON.parse(jsonData);
	    $('#search-menu').focus(function(){
    		$( "#search-menu" ).autocomplete( "enable" );
    	});
	 
	    $( "#search-menu" ).autocomplete({
      	minLength: 1,
      	max: 3,
      	source: jsonArray,
      	success: function (result) {
    	    	response($.map(jsonArray.slice (0,3), function(item) {
    	    	return {
    	    	value: item.label
    	    	};
    	    	}));
      	},
      	focus: function( event, ui ) {
        	return false;
      	},
      	select: function( event, ui ) {
			location.href='movie_detail_page.do?id='+ui.item.id;
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

</head>

<body>

	<!-- =====  HEADER START  ===== -->
	<jsp:include page="menu.jsp" flush="false" />
	<!-- =====  HEADER END  ===== -->

	<!-- Page Content -->

	<div id="myCarousel" class="carousel slide col-lg-12 col-md-6 col-sm-6"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
		</ol>


		<div class="row justify-content-end">

			<div class="carousel-inner" align="center">

				<div class="item active">
					<table>
						<tbody>


							<tr>

								<%
									if (session.getAttribute("memId") != null) {
								%>
								<h2 class="card-title" style="padding-bottom: 50px;">
									"<%=session.getAttribute("memId")%>
									" 님의 취향저격 베스트 영화
								</h2>
								<%
									} else {
								%>
								<h2 class="card-title" style="padding-bottom: 50px;">"이번달
									추천영화"</h2>
								<%
									}
								%>

								<%
									if (session.getAttribute("memId") != null) {
								%>
								<c:forEach var="gen" items="${genre}" varStatus="status" begin="1" end="5">
									<td class="officetd"><h2 class="rank"></h2> <a href="#"><img src="${gen}" alt=""></a></td>
								</c:forEach>
								<%
									} else {
								%>

								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/358ea40235e240fea2f0b6ec7ef93c431543201035934"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/4eeebce90dc441cdb208d11e27e356421544513634869"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/f4d3fea1a1004a44873cca0dac2d8ccf1542956549688"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/ce3cd6a875284e8b96414ef3696756a11544772388211"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/10073f4c7fab4a07a23589f8fbd4254d1541739643225"
										alt=""></a></td>
								<%
									}
								%>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="item">
					<table>
						<tbody>


							<tr>

								<%
									if (session.getAttribute("memId") != null) {
								%>
								<h2 class="card-title" style="padding-bottom: 50px;">
									"<%=session.getAttribute("memId")%>
									" 님의 취향저격 베스트 영화
								</h2>
								<%
									} else {
								%>
								<h2 class="card-title" style="padding-bottom: 50px;">"이번달
									추천영화"</h2>
								<%
									}
								%>
								<%
									if (session.getAttribute("memId") != null) {
								%>
								<c:forEach var="gen" items="${genre}" varStatus="status"
									begin="6" end="10">
									<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
											src="${gen}" alt=""></a></td>
								</c:forEach>
								<%
									} else {
								%>


								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/7f80906597164fe6b6504b3602946f631542963091970"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/f4d3fea1a1004a44873cca0dac2d8ccf1542956549688"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/25c7261d1e424fe59b68b7ef115b35d11542780702098"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/fa5991f792db40bdb93de11542c0502c1543986203103"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/eb9834885f7747d78e132b66c0cf46a21541478705054"
										alt=""></a></td>
								<%
									}
								%>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Left and right controls -->










	<div class="container">
		<div class="row">
			<nav class="navbar-collapse collapse">
				<div class="dropdown">
					<a id="show1" class="btn pull-left col-lg-1 col-sm-6 col-md-4"
						href="movie_recommend_page.do?sel=1">전체</a>
					<a id="show2" class="btn pull-left col-lg-1 col-sm-6 col-md-4"
						href="movie_recommend_page.do?sel=2">국내</a>
					<a id="show3" class="btn pull-left col-lg-1 col-sm-6 col-md-4"
						href="movie_recommend_page.do?sel=3">해외</a>

				</div>




				<div class="dropdown">

					<button class="btn dropdown-toggle col-lg-3 col-sm-6 col-md-4"
						data-toggle="dropdown">
						장르 <b class="caret"></b>
					</button>
					<ul class="dropdown-menu col-lg-3 col-sm-6 col-md-4" style="top:346.5px; left:287px;">
						<li><a class="show4" href="movie_recommend_page.do?sel=4">액션/SF</a></li>
						<li><a class="show5" href="movie_recommend_page.do?sel=5">멜로/드라마</a></li>
						<li><a class="show6" href="movie_recommend_page.do?sel=6">코미디</a></li>
						<li><a class="show7" href="movie_recommend_page.do?sel=7">공포/스릴러</a></li>
					</ul>
				</div>
				<div class="dropdown">

					<button class="btn dropdown-toggle col-lg-3 col-sm-6 col-md-4"
						data-toggle="dropdown">
						연령별 <b class="caret"></b>
					</button>
					<ul class="dropdown-menu col-lg-3 col-sm-6 col-md-4" style="top:346.5px; left:575px;">
						<li><a class="show8" href="movie_recommend_page.do?sel=8">전체이용가</a></li>
						<li><a class="show9" href="movie_recommend_page.do?sel=9">12세이용가</a></li>
						<li><a class="show10" href="movie_recommend_page.do?sel=10">15세이용가</a></li>
						<li><a class="show11" href="movie_recommend_page.do?sel=11">청소년관람불가</a></li>
						
					</ul>
				</div>
				<div class="dropdown">

					<button class="btn dropdown-toggle col-lg-3 col-sm-6 col-md-4"
						data-toggle="dropdown">
						연도별 <b class="caret"></b>
					</button>
					<ul class="dropdown-menu col-lg-3 col-sm-6 col-md-4" style="top:346.5px; left:862.5px;">
						<li><a class="show14" href="movie_recommend_page.do?sel=12">1970년대</a></li>
						<li><a class="show15" href="movie_recommend_page.do?sel=13">1980년대</a></li>
						<li><a class="show16" href="movie_recommend_page.do?sel=14">1990년대</a></li>
						<li><a class="show17" href="movie_recommend_page.do?sel=15">2000년대</a></li>
						<li><a class="show18" href="movie_recommend_page.do?sel=16">2010년대</a></li>

					</ul>
				</div>
			</nav>
		</div>
	

	</div>

	<script>
		var sel = ${sel};
		
		if (sel == '1') {
			document.getElementById("show1").classList.add('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '2') {
			document.getElementById("show2").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '3') {
			document.getElementById("show3").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '4') {
			document.getElementById("show4").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '5') {
			document.getElementById("show5").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '6') {
			document.getElementById("show6").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '7') {
			document.getElementById("show7").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '8') {
			document.getElementById("show8").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '9') {
			document.getElementById("show9").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '10') {
			document.getElementById("show10").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '11') {
			document.getElementById("show11").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '12') {
			document.getElementById("show12").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '13') {
			document.getElementById("show13").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '14') {
			document.getElementById("show14").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '15') {
			document.getElementById("show15").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show16").classList.remove('on');

		} else if (sel == '16') {
			document.getElementById("show16").classList.add('on');
			document.getElementById("show1").classList.remove('on');
			document.getElementById("show2").classList.remove('on');
			document.getElementById("show3").classList.remove('on');
			document.getElementById("show4").classList.remove('on');
			document.getElementById("show5").classList.remove('on');
			document.getElementById("show6").classList.remove('on');
			document.getElementById("show7").classList.remove('on');
			document.getElementById("show8").classList.remove('on');
			document.getElementById("show9").classList.remove('on');
			document.getElementById("show10").classList.remove('on');
			document.getElementById("show11").classList.remove('on');
			document.getElementById("show12").classList.remove('on');
			document.getElementById("show13").classList.remove('on');
			document.getElementById("show14").classList.remove('on');
			document.getElementById("show15").classList.remove('on');
	
	
	</script>


	<div class="container">	
		<div class="search_option_area col-lg-9 col-md-6 col-sm-3 col-xs-2">		
				<c:forEach var="list" items="${list}" varStatus="status" >
					<div class="post col-lg-9 col-md-6 col-sm-3 col-xs-2" style="width: 880px; text-align: center; padding-top: 15px; padding-bottom: 15px;">
				    	<div class="row">
					    	<div class="movie_name col-lg-12 col-md-6 col-sm-2 col-xs-2">
				      			<div class="all movie" style="float:left;" >
					      			<a href="movie_detail_page.do?id=${list.MOVIE_ID}" style="display:inline-block; width:40px;font-weight: bold; ">${list.NUM}</a>			
									<a href="movie_detail_page.do?id=${list.MOVIE_ID}" style="display:inline-block; width:220px;">${list.MOVIE_TITLE }</a> 
									<a href="movie_detail_page.do?id=${list.MOVIE_ID}">
										<img class="card" src="${list.MOVIE_IMG}" alt="" style="width:12%; height:12%; ">
									</a>
									<a class="card-text" style="display:inline-block; width:260px; font-weight: bold; padding-right:40px; padding-left:70px;">${list.MOVIE_YEAR} 개봉</a>
									<a class="movie_rate" href="${list.MOVIE_ID}" style="font-weight:bold;"> 평점 ${list.MOVIE_RATE}</a>
									<div class="bg_star star_grade" style="float: left;">
										<div class="bg_star inner_star" style="width: ${list.MOVIE_RATE};"></div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</c:forEach>
		</div>
	</div>
						
	




	<div class="bottom-number mt_20" align="center">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">«</span> <span
					class="sr-only">Previous</span>
			</a></li>

			<li class="page-item"><a class="page-link" href="#">1</a></li>

			<li class="page-item"><a class="page-link" href="#">2</a></li>

			<li class="page-item"><a class="page-link" href="#">3</a></li>

			<li class="page-item"><a class="page-link" href="#">4</a></li>

			<li class="page-item"><a class="page-link" href="#">5</a></li>

			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">»</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>
	</div>


	<!-- /.container -->

	<!-- =====  FOOTER START  ===== -->
	<jsp:include page="footer.jsp" flush="false" />
	<!-- =====  FOOTER END  ===== -->


	<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>

</body>

</html>
