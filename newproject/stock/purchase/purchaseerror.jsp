
<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <title>購入エラー</title>
  <link rel="stylesheet" href="./stock/css/top.css">
  <%@ include file="../stocklistheader.jsp" %>


<%-- ここから本文 --%>


    <div id="main-content">
		<div align="center">
		<h3>購入することが出来ません。</h3>
		<h4>所持金を確認してください。</h4>


		<br><br>
<a href="<%=request.getContextPath() %>/showinfo">戻る</a>

		</div>
    </div><!-- @end #main-content -->



    <div id="footer">
      <div class="container">
        <p>Simple layout design for <a href="http://blog.teamtreehouse.com/">Treehouse Blog</a>.</p>
        <p>Feel free to download and use these codes for any basic template layout.</p>
        <p><small>Website code structured with <a href="https://twitter.github.io/bootstrap/">Twitter Bootstrap</a>. Background image credits to <a href="http://www.flickr.com/photos/fjolnir/2342246699/">Fjölnir Ásgeirsson</a>. Sample content via <a href="http://bluthipsum.com/">Bluth Ipsum</a>.</small></p>
      </div>
    </div>
</body>
</html>