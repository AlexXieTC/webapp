<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./stock/css/top.css">
<title>売却処理完了</title>
 <%@ include file="../stocklistheader.jsp" %>


	<div align="center">
		<h3>売却処理に成功しました</h3>
		<br>
		<form action="<%=request.getContextPath() %>/showinfo" method="post">
			<input type="submit" value="トップへ戻る">
		</form>
	</div>


	<div id="footer">
		<div class="container">
			<p>
				Simple layout design for <a href="http://blog.teamtreehouse.com/">Treehouse
					Blog</a>.
			</p>
			<p>Feel free to download and use these codes for any basic
				template layout.</p>
			<p>
				<small>Website code structured with <a
					href="https://twitter.github.io/bootstrap/">Twitter Bootstrap</a>.
					Background image credits to <a
					href="http://www.flickr.com/photos/fjolnir/2342246699/">Fjölnir
						Ásgeirsson</a>. Sample content via <a href="http://bluthipsum.com/">Bluth
						Ipsum</a>.
				</small>
			</p>
		</div>
	</div>
</body>
</html>