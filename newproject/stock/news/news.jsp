<%@ page
	import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
	contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../stocklistheader.jsp"%>


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
			%>

			<div class="articles-container">

				<c:forEach begin="0"
					end="${fn:length(newsList)>=10?10:fn:length(newsList)}"
					var="number">
					<%int number =(int)pageContext.findAttribute("number"); %>
					<c:choose>
						<c:when test="${(number%6)==5}">
							<article class="card bg-primary">
								<div class="category category-sports">フィンテック</div>
								<h3>
									<form name="form_name${number}" method="POST"
											action="<%=request.getContextPath()%>/article">
											<input type="hidden" name="user_name" value="名前"> <a
												href="<%=request.getContextPath()%>/article">
												${newsList[number].newsDate}${newsList[number].title}</a>
									</h3>
									<p>${fn:substring(newsList[number].text,0,100)}...
										<a href="javascript:form_name${number}.submit()"
											class="btn btn-primary">Read More</a>
									</p>
									</form>
							</article>
						</c:when>
						<c:when test="${(number%2)==0}">
							<article class="card">
								<img src="<%=request.getContextPath()%>/stock/img/ent1.jpg"
									alt="">
								<div>
									<div class="category category-ent">経済・金融</div>
									<h3>
										<form name="form_name${number}" method="POST"
											action="<%=request.getContextPath()%>/article">
											<input type="hidden" name="user_name" value="名前"> <a
												href="<%=request.getContextPath()%>/article">
												${newsList[number].newsDate}${newsList[number].title}</a>
									</h3>
									<p>${fn:substring(newsList[number].text,0,100)}...
										<a href="javascript:form_name${number}.submit()"
											class="btn btn-primary">Read More</a>
									</p>
									</form>
								</div>
							</article>
						</c:when>
						<c:when test="${(number%2)==1}">

							<article class="card bg-dark">
								<div class="category category-sports">フィンテック</div>
								<h3>
									<form name="form_name${number}" method="POST"
										action="<%=request.getContextPath()%>/article">
										<a href="javascript:form_name${number}.submit()">${newsList[number].newsDate}${newsList[number].title}</a>
								</h3>
								<p>${fn:substring(newsList[number].text,0,100)}...
									<a href="javascript:form_name${number}.submit()"
										class="btn btn-primary">Read More</a>
								</p>
								</form>
							</article>
						</c:when>
					</c:choose>
				</c:forEach>



			</div>
		</div>

	</section>

	<%@ include file="../stocklistfooter.jsp"%>
</body>
</html>
