<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" lang="ja">
<link rel="stylesheet" href="./stock/css/top.css">
<title>テンプレ作成</title>
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
		<div class="loginForm">
			<form method="post" action="<%=request.getContextPath()%>/test"
				class="loginInput">
				User ID <input type="text" name="userID"><br> Password<input
					type="password"> <input type="submit" value="Log in">
			</form>
		</div>
	</div>

	</nav>

	<header id="heading">
	<div class="container text-center">
		<h1>Super Nintendo Rocks</h1>
		<h4>But this is just a sample demo layout, don't get too excited!</h4>

		<p>
			<a href="index.html" class="btn btn-large btn-inverse">Check out
				our features</a>
		</p>
	</div>
	</header>

	<div align="center">
		<h3>購入処理に成功しました</h3>
		<br>
		<form action="<%=request.getContextPath() %>/showinfo" method="post">
			<input type="subbmit" value="トップへ戻る">
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