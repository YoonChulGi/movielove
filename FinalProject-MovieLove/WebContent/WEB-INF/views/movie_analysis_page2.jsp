<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
	<!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawSexChart1);
    function drawSexChart1() {
        var data = google.visualization.arrayToDataTable([
          ['남녀','성비'],
          ['남자',${M1}],
          ['여자',${F1}]
        ]);

        var options = {
          //title: '관람객 성비',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('sexchart1'));
        chart.draw(data, options);
      }
    google.charts.setOnLoadCallback(drawAgeChart1);
    function drawAgeChart1() {
        var data = google.visualization.arrayToDataTable([
          ['연령대별 관람객','ageArr1[]'],
          ['10세 미만',${ageArr1[0]}],
          ['10대',${ageArr1[1]}],
          ['20대',${ageArr1[2]}],
          ['30대',${ageArr1[3]}],
          ['40대',${ageArr1[4]}],
          ['50대',${ageArr1[5]}],
          ['60대 이상',${ageArr1[5]}]
        ]);

        var options = {
          //title: '',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('agechart1'));
        chart.draw(data, options);
      }
    
    
    // 22222222222
    google.charts.setOnLoadCallback(drawSexChart2);
    function drawSexChart2() {
        var data = google.visualization.arrayToDataTable([
          ['남녀','성비'],
          ['남자',${M2}],
          ['여자',${F2}]
        ]);

        var options = {
          //title: '관람객 성비',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('sexchart2'));
        chart.draw(data, options);
      }
    google.charts.setOnLoadCallback(drawAgeChart2);
    function drawAgeChart2() {
        var data = google.visualization.arrayToDataTable([
          ['연령대별 관람객','ageArr2[]'],
          ['10세 미만',${ageArr2[0]}],
          ['10대',${ageArr2[1]}],
          ['20대',${ageArr2[2]}],
          ['30대',${ageArr2[3]}],
          ['40대',${ageArr2[4]}],
          ['50대',${ageArr2[5]}],
          ['60대 이상',${ageArr2[5]}]
        ]);

        var options = {
          //title: '',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('agechart2'));
        chart.draw(data, options);
      }
    </script>
    <div class="container"> <!-- container -->
    	<div class="row">
    		
    		<div class="col-sm-6 col-xs-6 col-md-6 col-lg-6">
	    		<h1>${mvo1.getMOVIE_TITLE() }</h1>
	    		<img alt="${mvo1.getMOVIE_TITLE() }" src='${mvo1.getMOVIE_STEELCUT().split("#")[0] }'>
	    		<h3>연령별</h3>
    			<div id="agechart1" style="width:565px;height:387.3px;" align="center"></div>
    			<h3>성비</h3>
    			<div id="sexchart1" style="width:565px;height:387.3px;" align="center"></div>
    			<h3>원형 그래푸</h3>
    			<img alt="원형 그래프" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png" />
    			<h2>워드 클라우드</h2>
    			<img alt="워드 클라우드" src="${mvo1.getMOVIE_WDCL() }" />
    			<h2>막대 그래프</h2>
    			<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV8uSTuwhiQQ7Hl20YJqrA1rKO3wYQvVipgBO5PhzRttFhc2Uxw">
    		</div>
    		
    		<div class="col-sm-6 col-xs-6 col-md-6 col-lg-6">
	    		<h1>${mvo2.getMOVIE_TITLE() }</h1>
	    		<img alt="${mvo2.getMOVIE_TITLE() }" src='${mvo2.getMOVIE_STEELCUT().split("#")[0] }'>
	    		<h3>연령별</h3>
    			<div id="agechart2" style="width:565px;height:387.3px;" align="center"></div>
    			<h3>성비</h3>
    			<div id="sexchart2" style="width:565px;height:387.3px;" align="center"></div>
    			<h3>원형 그래푸</h3>
    			<img alt="원형 그래프" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png" />
    			<h2>워드 클라우드</h2>
    			<img alt="워드 클라우드" src="${mvo2.getMOVIE_WDCL() }" />
    			<h2>막대 그래프</h2>
    			<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV8uSTuwhiQQ7Hl20YJqrA1rKO3wYQvVipgBO5PhzRttFhc2Uxw">
    		</div>
    		
    		
    	</div>
    </div>
    
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER END  ===== -->
    
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
