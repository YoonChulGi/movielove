<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address_normal').value = "["+data.zonecode+"] " + roadAddr + extraRoadAddr;
            }
        }).open();
    }
</script>

<!DOCTYPE html>
<html lang="kr">

  <head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
  </head>
  
  <body class="register">
  
    <!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <!-- Page Content -->
    <div class="container">
          <!-- contact  -->
          <div class="row">
            <div class="col-md-7 col-md-offset-3">
              <div class="panel-login panel mt_10 mb_30">
                <div class="panel-heading">
                  <div class="row mb_20">
                    <div class="col-xs-6">
                      <a href="#" class="active" id="login-form-link" style="font-size:20px;">회원가입</a>
                    </div>
                  </div>
                  <hr>
                </div>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <form id="login-form" action="registerPro.do" method="post">
                      	<div>아이디</div>
                        <div class="form-group">
                          <div class="row">
                          	<div class="col-sm-9 col-lg-9 col-xs-9 col-md-9" style="padding-left:0;"><input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="아이디" value=""></div> 
                          	<div class="col-sm-3 col-lg-3 col-xs-3 col-md-3" style="padding-right:0;"><input type="button" value="중복 확인" class="form-control btn" style="height:48px;" id="confirmBtn"></div>
                          	<script>
                          		var idck = 0;
                          		$(function(){
                          			$("#confirmBtn").click(function(){
                          				var username = $("#username").val();
                          				if(username==''){
                          					alert('아이디를 입력해주세요');
                          					return;
                          				}
                          				$.ajax({
                          					async : true,
                          					type : 'POST',
                          					data : username,
                          					url : "idcheck.do",
                          					
                          					success : function(data) {
                          						var cnt = parseInt(data);
                          						if(cnt > 0) {
                          							alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                          							idck = 0;
                          							$("#username").focus();
                          						} else {
                          							alert("사용가능한 아이디입니다. ");
                          							idck = 1;
                          						}
                          					},
                          					error : function(error) {
                          						alert("error : " + error);
                          						console.dir(error);
                          					}
                          				});
                          			});
                          			
                          			$("#username").change(function(){
                          				idck = 0;
                          			});
                          			
                          			$("#register-submit").click(function(){
                          				var username = $("#username").val();
                          				var pw = $("#password").val();
                          				var pw_confirm = $("#password-confirm").val();
                          				var birth_year = $("#birth_year").val();
                          				var birth_month = $("#birth_month").val();
                          				var birth_day = $("#birth_day").val();
                          				var address_normal = $("#address_normal").val();
                          				var address_detail = $("#address_detail").val();
                          				
                          				if(username=="") {
                          					alert("아이디를 입력하세요");
                          					$("#username").focus();
                          					return; 
                          				} else if(idck!=1){
                          					alert("아이디 중복확인을 해주세요");
                          					$("#confirmBtn").focus();
                          					return;
                          				} else if(pw=="") {
                          					alert("비밀번호를 입력하세요");
                          					$("#password").focus();
                          					return;
                          				} else if(pw_confirm=="") {
                          					alert("비밀번호 확인칸을 입력해주세요");
                          					$("#password-confirm").focus();
                          					return; 
                          				} else if(birth_year==""){
                          					alert("생년월일을 확인해주세요");
                          					$("#birth_year").focus();
                          					return;
                          				} else if(birth_month==""){
                          					alert("생년월일을 확인해주세요");
                          					$("#birth_month").focus();
                          					return;
                          				}  else if(birth_day==""){
                          					$("#birth_day").focus();
                          					alert("생년월일을 확인해주세요");
                          					return;
                          				} else if(pw!=pw_confirm) {
                          					alert('비밀번호를 확인해주세요');
                          					$("#password").val() = '';
                          					$("#password-confirm").val() = '';
                          					$("#password").focus();
                          					return; 
                          				} else if(address_normal==''){
                          					 alert("주소를 확인해주세요");
                          					 $("#address_normal").focus();
                          					 return;
                          				} else if(address_detail==''){
                          					alert("주소를 확인해주세요");
                         					 $("#address_detail").focus();
                         					 return;
                          				} else {
                          					alert("submit");
                          					alert($("#address_normal").val());
                          					$("#login-form").submit();
                          				}
                          				
                          			});
                          			
                          		});
                          	</script>
                          </div>
                        </div>
                      	<div>비밀번호</div>
                        <div class="form-group">
                          <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="비밀번호">
                        </div>
                      	<div>비밀번호 확인</div>
                        <div class="form-group">
                          <input type="password" name="password-confirm" id="password-confirm" tabindex="3" class="form-control" placeholder="비밀번호 확인">
                        </div>
                      	<div>생년월일</div>
                        <div class="form-group">
                    		<td>
                    		<script type="text/javascript">
                         		var today = new Date();
                         		var toyear = parseInt(today.getFullYear());
                         		var start = toyear;
                         		var end = toyear - 100;
		
                         		document.write("<select id=birth_year> ");
                         		document.write("<option value='' selected>");
                         		for (i=start;i>=end;i--) document.write("<option>"+i);
                         			document.write("</select>년  ");
		
                         			document.write("<select id=birth_month>");
                         			document.write("<option value='' selected>");
                         			for (i=1;i<=12;i++) document.write("<option>"+i);
                         			document.write("</select>월  ");
				
                         			document.write("<select id=birth_day>");
                         			document.write("<option value='' selected>");
                         			for (i=1;i<=31;i++) document.write("<option>"+i);
                         			document.write("</select>일");
                         	</script>
                         	<input type="hidden" name="year" id="year"/>
                         	<input type="hidden" name="month" id="month"/>
                         	<input type="hidden" name="day" id="day"/>
                         	<script>
								$("#birth_year").change(function(){
									alert('year');
									$("#year").val($("#birth_year").val());
	                         	});
	                         	$("#birth_month").change(function(){
	                         		alert('month');
	                         		$("#month").val($("#birth_month").val());
	                         	});
	                         	$("#birth_day").change(function(){
	                         		alert('day');
	                         		$("#day").val($("#birth_day").val());
	                         	});
                         	</script>
                    		</td>
                        </div>
                        <div>성별</div>
                        <div class="form-group">
                          <input type="radio" name="gender" value="MALE" checked>남
                          <input type="radio" name="gender" value="FEMALE">여
                        </div>
                        <div class="form-group">
                      		<div class="mb_5">주소 
                          		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn" style="padding:5px;"><br>
                        	</div>
                        	<div class="form-group">
                          		<input type="text" name="address_normal" id="address_normal" tabindex="4" class="form-control" placeholder="기본 주소" readonly onclick="execDaumPostcode()">
                        	</div>
                        	<div class="form-group" style="height:50px;">
                          		<input type="text" name="address_detail" id="address_detail" tabindex="5" class="form-control" placeholder="상세 주소">
                        	</div>
                        </div>
                      	<div>관심있는 영화 장르 (중복 선택 가능)</div>
                        <div class="register_checkbox form-group text-left">
                          <input type="checkbox" tabindex="6" name="genre1" id="reg_checkbox_action" class="register_checkbox" style="margin-left:2px"> 액션/SF  
                          <input type="checkbox" tabindex="6" name="genre2" id="reg_checkbox_melo" class="register_checkbox"> 멜로/드라마  
                          <input type="checkbox" tabindex="6" name="genre3" id="reg_checkbox_comedy" class="register_checkbox"> 코미디  <br/>
                          <input type="checkbox" tabindex="6" name="genre4" id="reg_checkbox_horror" class="register_checkbox" style="margin-left:2px"> 공포/스릴러  
                          <input type="checkbox" tabindex="6" name="genre5" id="reg_checkbox_ani" class="register_checkbox"> 애니메이션  
                          <input type="checkbox" tabindex="6" name="genre6" id="reg_checkbox_etc" class="register_checkbox"> 기타
                        </div>
                        <div class="form-group">
                          <div class="row">
                            <div>
                              <input type="button" name="register-submit" id="register-submit" value="회원가입" tabindex="7" class="form-control btn btn-register">
                            </div>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
    </div>
    <!-- /.container -->
        
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER END  ===== -->


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
