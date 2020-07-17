<%@ page
	import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
	contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>


<%@ include file="../stocklistheader.jsp"%>


<body>


	<!-- Home Articles -->
	<section id="home-articles" class="py-2">
		<div class="container">

			<h2 style="color: #4fc5ea; background-color: #000;">QUICK NEWS</h2>
			<br>

			<%
				List<News> newsList = (List<News>) request.getAttribute("newsList");

				SimpleDateFormat sdf1 = new SimpleDateFormat("MM月dd日");
				News nbean0 = newsList.get(0);
			%>

			<div class="articles-container">
				<article class="card">
					<img
						src="<%=request.getContextPath()%>/stock/img/news/car/car01.jpg"
						alt="">
					<div>
						<div class="category category-ent">経済・金融</div>
						<h3>
							<a href="<%=request.getContextPath()%>/article"><%=sdf1.format(nbean0.getNewsDate())%><%=nbean0.getTitle()%></a>
						</h3>
						<p><%=nbean0.getText().substring(0, 100)%>...<a
								href="<%=request.getContextPath()%>/article"
								class="btn btn-primary">Read More</a>
						</p>
					</div>
				</article>
				<%
					News nbean1 = newsList.get(1);
				%>
				<article class="card bg-dark">
					<div class="category category-sports">フィンテック</div>
					<h3>
						<a href="article.html"><%=sdf1.format(nbean1.getNewsDate())%><%=nbean1.getTitle()%></a>
					</h3>
					<p><%=nbean1.getText().substring(0, 100)%>...<a href="#"
							class="btn btn-primary">Read More</a>
					</p>
					<img src="<%=request.getContextPath()%>/stock/img/news/sup02.jpg"
						alt="">
				</article>
				<%
					News nbean2 = newsList.get(2);
				%>
				<article class="card">
					<img
						src="<%=request.getContextPath()%>/stock/img/news/car/car03.jpg"
						alt="">
					<div class="category category-tech">技術</div>
					<h3>
						<a href="article.html"><%=sdf1.format(nbean2.getNewsDate())%><%=nbean2.getTitle()%></a>
					</h3>
					<p><%=nbean2.getText().substring(0, 100)%>...<a href="#"
							class="btn btn-primary">Read More</a>
					</p>
				</article>
				<%
					News nbean3 = newsList.get(3);
				%>
				<article class="card">
					<div class="category category-sports">フィンテック</div>
					<h3>
						"C:/Users/qcq1725/Desktop/sky01.jpg" <a href="article.html"><%=sdf1.format(nbean3.getNewsDate())%><%=nbean3.getTitle()%></a>
					</h3>
					<p><%=nbean3.getText().substring(0, 100)%>...<a href="#"
							class="btn btn-primary">Read More</a>
					</p>
					<img src="<%=request.getContextPath()%>/stock/img/news/sky01.jpg"
						alt="sports">
				</article>
				<%
					News nbean4 = newsList.get(4);
				%>
				<article class="card">
					<img src="<%=request.getContextPath()%>/stock/img/news/com/com03.jpg"
						alt="">
					<div class="category category-tech">技術</div>
					<h3>
						<a href="article.html"><%=sdf1.format(nbean4.getNewsDate())%><%=nbean4.getTitle()%></a>
					</h3>
					<p><%=nbean4.getText().substring(0, 100)%>...<a href="#"
							class="btn btn-primary">Read More</a>
					</p>
				</article>
				<%
					News nbean5 = newsList.get(5);
				%>
				<article class="card bg-primary">
					<div class="category category-sports">フィンテック</div>
					<h3>
						<a href="article.html"><%=sdf1.format(nbean5.getNewsDate())%><%=nbean5.getTitle()%></a>
					</h3>
					<p><%=nbean5.getText().substring(0, 100)%>...<a href="#"
							class="btn btn-primary">Read More</a>
					</p>
					<img
						src="<%=request.getContextPath()%>/stock/img/news/del01.jpg"
						alt="">
				</article>
				<%
					News nbean6 = newsList.get(6);
				%>
				<article class="card">
					<div>
						<div class="category category-ent">経済・金融</div>
						<h3>
							<a href="article.html"><%=sdf1.format(nbean6.getNewsDate())%><%=nbean6.getTitle()%></a>
						</h3>
						<p><%=nbean6.getText().substring(0, 100)%>...<a href="#"
								class="btn btn-primary">Read More</a>
						</p>
					</div>
					<img src="<%=request.getContextPath()%>/stock/img/ent2.jpg" alt="">
				</article>

			</div>
		</div>

	</section>

	<%@ include file="../stocklistfooter.jsp"%>
</body>
</html>
