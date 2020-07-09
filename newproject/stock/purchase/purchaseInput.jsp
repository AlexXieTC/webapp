
<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <title>購入フォーム</title>
  <link rel="stylesheet" href="./stock/css/top.css">
  <%@ include file="../stocklistheader.jsp" %>


<%-- ここから本文 --%>


    <div id="main-content">
		<div align="center">
		<h3>${price.stockName}の株式を購入します</h3>
			<form action ="<%=request.getContextPath() %>/purchaseConfirmation" method= "post">
			<table>
				<tr>
					<th>株式価格</th>
					<td>${price.openPrice}円</td>
				</tr>
				<tr>
					<th>購入株数</th>
					<td>
					<input type="number" name ="purchaseNumber" value="${(empty purchaseNumber)? 100:purchaseNumber }" min="100" step="100" max="${user.money/price.openPrice }"/>株
					</td>
				</tr>
			</table>
			<input type="submit" name ="buttuon" value="購入確認">
				<input type="submit" name="button" value="キャンセル">
			</form>
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