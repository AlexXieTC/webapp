<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.*" %>
<%@ page import="java.sql.Date" %>
<%--テスト用に各リクエストスコープの埋め込み --%>
<%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" lang="ja">
  <link rel="stylesheet" href="./stock/css/top.css">
  <title>購入フォーム</title>
</head>


<body>
    <nav id="navigation">
      <div class="container">
        <ul class="navlinks">
          <li><a href="index.html">Homepage</a></li>
          <li><a href="index.html">About Us</a></li>
          <li><a href="index.html">Projects</a></li>
          <li><a href="index.html">The Team</a></li>
          <li><a href="index.html">Contacts</a></li>
        </ul>

      </div>

    </nav>

    <header id="heading">
      <div class="container text-center">
        <h1>Super Nintendo Rocks</h1>
        <h4>But this is just a sample demo layout, don't get too excited!</h4>

        <p><a href="index.html" class="btn btn-large btn-inverse">Check out our features</a></p>
      </div>
    </header>

    <div id="main-content">
		<div align="center">
		<h3>${stock.stockName}の株式を購入します</h3>
			<form action ="<%=request.getContextPath() %>/purchaseConfirmation" method= "post">
			<table>
				<tr>
					<th>株式価格</th>
					<td>${price.openPrice}円</td>
				</tr>
				<tr>
					<th>購入株数</th>
					<td>
					<input type="number" name ="parchaseNumber" value="${(empty purchaseNumber)? 100:purchaseNumber }" min="100" step="100" max="${user.money/price.openPrice }"/>株
					</td>
				</tr>
			</table>
			<input type="hidden" name="stock" value=${stock}>
			<input type="hidden" name="price" value=${price}>
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