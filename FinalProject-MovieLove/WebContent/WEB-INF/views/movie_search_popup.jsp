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
	    overflow-y: hidden;
	    left: 170px;
	    top: 201px;
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
        //$( "#search-movie" ).val( ui.item.label );
        return false;
      },
      select: function( event, ui ) {
        $( "#search-movie" ).val( ui.item.label );
        $( "#search-movie" ).autocomplete( "disable");
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

</head>

<body>
	
    
    <div class="container" align="center" style="width:100%"> <!-- container -->
    	<div class="row">
    		<h3>비교하고 싶은 영화를 검색해주세요♥</h3>
	    	<div class="review-search">
	    		<ul>
	    			<li><input id="search-movie" name="search" placeholder="영화 검색" class="form-control input-lg" autocomplete="off" type="text" style="padding-top:0px;padding-bottom:0px;"></li>
	           		<li><button class="btn btn-lg btn-search" onclick="search()">검색</button></li>
	            </ul>
       		</div>
    	</div>
    	<script type="text/javascript">
    		function search(){
    			var id1 = "${id1}";
    			opener.location.href="movie_analysis_page2.do?id1="+id1+"&id2="+document.getElementById("search-movie").value;
    			self.close();
    		}
    	</script>
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    </div>
    
    <!-- Bootstrap core JavaScript -->
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>
    
</body>
</html>
