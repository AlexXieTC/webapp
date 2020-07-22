<%@ page import="java.sql.*"
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
<head>
    <title>QUICK証券</title>
    <link rel="stylesheet" type="text/css" href="./css/form.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
    <div id="back">
        <canvas id="canvas" class="canvas-back"></canvas>
        <div class="backRight">
        </div>
        <div class="backLeft">
        </div>
      </div>

      <div id="slideBox">
        <div class="topLayer">
          <div class="left">
            <div class="content">
              <h2>Sign Up</h2>
              <form id="form-signup" method="post" >
                <div class="form-element form-stack">
                  <label for="email" class="form-label">Email</label>
                  <input id="email" type="email" name="email">
                </div>
                <div class="form-element form-stack">
                  <label for="username-signup" class="form-label">Username</label>
                  <input id="username-signup" type="text" name="username">
                </div>
                <div class="form-element form-stack">
                  <label for="password-signup" class="form-label">Password</label>
                  <input id="password-signup" type="password" name="password">
                </div>
                <div class="form-element form-checkbox">
                  <input id="confirm-terms" type="checkbox" name="confirm" value="yes" class="checkbox">
                  <label for="confirm-terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
                </div>
                <!-- <div class="form-element form-submit">
                  <button id="signUp" class="signup" type="submit" name="signup">Sign up</button>
                  <button id="goLeft" class="signup off">Log In</button>
                </div> -->
              </form>
            </div>
          </div>

          <%--ここから新規登録ページ--%>
          <div class="right">
            <div class="content">
              <h2>Sign Up</h2>
              <form action="<%=request.getContextPath()%>/signup" method="Post">
              <form id="form-login" method="post" onsubmit="return false;">

                <div class="form-element form-stack">
                  <label for="userID-login" class="form-label">User ID</label>
                  <input id="userID-login" type="text" name="userID" maxlength='20' pattern="^[0-9A-Za-z]+$">
                </div>
                <div class="form-element form-stack">
                  <label for="password-login" class="form-label">Password</label>
                  <input id="password-login" type="password" name="password" maxlength='20'>
                </div>
                <div class="form-element form-submit">
                  <button id="logIn" class="login" type="submit" name="login">Sign Up</button>
                  <!-- <button id="goRight" class="login off" name="signup">Sign Up</button> -->
                </div>
              </form>
              </form>
              <br>
              <a href="<%=request.getContextPath() %>/index.jsp">トップページに戻る</a>
            </div>
          </div>
        </div>
      </div>

      <!--

      Remixed from "Sliding Login Form" Codepen by
      C-Rodg (github.com/C-Rodg)
      https://codepen.io/crodg/pen/yNKxej

      Remixed from "Paper.js - Animated Shapes Header" Codepen by
      Connor Hubeny (@cooper_hu)
      https://codepen.io/cooper_hu/pen/ybxoev

      Custom Checkbox based on the blog post by
      Mik Ted (@inserthtml):
      https://www.inserthtml.com/2012/06/custom-form-radio-checkbox/

      HTML5 Form Validation based on the blog post by
      Thoriq Firdaus (@tfirdaus):
      https://webdesign.tutsplus.com/tutorials/
      html5-form-validation-with-the-pattern-attribute--cms-25145

      -->
</body>
</html>