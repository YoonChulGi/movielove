<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
  </head>
  
  <body>
  
    <!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <!-- Page Content -->
    <div class="container">
          <!-- contact  -->
          <div class="row">
            <div class="col-md-6 col-md-offset-3">
              <div class="panel-login panel mt_80 mb_80">
                <div class="panel-heading">
                  <div class="row mb_20">
                    <div class="col-xs-6">
                      <a href="#" class="active" id="login-form-link" style="font-size:20px;">로그인</a>
                    </div>
                  </div>
                  <hr>
                </div>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <form id="login-form" action="#" method="post">
                        <div class="form-group">
                          <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="아이디" value="">
                        </div>
                        <div class="form-group">
                          <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="비밀번호">
                        </div>
                        <div class="form-group text-left">
                          <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                          <label for="remember">자동 로그인</label>
                        </div>
                        <div class="form-group">
                          <div class="row">
                            <div">
                              <input type="submit" name="login-submit" id="login-submit" value="로그인" tabindex="4" class="form-control btn btn-login">
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="login-menu text-center">
                                <a href="register.do" tabindex="5" class="register">회원가입</a>  |  
                                <a href="#" tabindex="5" class="forgot-id">아이디 찾기</a>  |  
                                <a href="#" tabindex="5" class="forgot-password">비밀번호 찾기</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="mb_10 text-center">소셜 로그인</div>
                        <div class="form-group" align="center">
                        	<a href="#"><img src="images/logo/logo_naver.png" style="margin-right:10px;"></a>
                        	<a href="#"><img src="images/logo/logo_facebook.png" style="margin-left:10px; margin-right:10px;"></a>
                        	<a href="#"><img src="images/logo/logo_google.png" style="margin-left:10px;"></a>
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
