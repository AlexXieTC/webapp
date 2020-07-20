<%@ page
	import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.*,news.* "
	contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					end="${fn:length(newsList)>=6?6:fn:length(newsList)}" var="number">
					<%
						int number = (int) pageContext.findAttribute("number");
					%>
					<c:choose>
						<c:when test="${(number%6)==5}">
							<article class="card bg-primary">
								<%=NewsParameter.category(newsList.get(number).getStockCode())%>
								<h3>
									<form name="form_name${number}" method="POST"
										action="<%=request.getContextPath()%>/article">
										<input type="hidden" name="news_number" value="${number}">
										<a href="<%=request.getContextPath()%>/article">
											${newsList[number].newsDate}${newsList[number].title}</a>
								</h3>
								<p>${fn:substring(newsList[number].text,0,100)}...
									<a href="javascript:form_name${number}.submit()"
										class="btn btn-primary">Read More</a>
								</p>
								</form>
								<img
									src="<%=request.getContextPath()%>/stock/img/news/<%=NewsParameter.getImageName(newsList.get(number).getStockCode())%>"
									alt="">
							</article>
						</c:when>
						<c:when test="${(number%2)==0}">
							<article class="card">
								<div>
									<img
										src="<%=request.getContextPath()%>/stock/img/news/<%=NewsParameter.getImageName(newsList.get(number).getStockCode())%>"
										alt="">
									<%=NewsParameter.category(newsList.get(number).getStockCode())%>

									<h3>
										<form name="form_name${number}" method="POST"
											action="<%=request.getContextPath()%>/article">
											<input type="hidden" name="news_number" value="${number}">
											<a href="<%=request.getContextPath()%>/article">
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
								<%=NewsParameter.category(newsList.get(number).getStockCode())%>
								<h3>
									<form name="form_name${number}" method="POST"
										action="<%=request.getContextPath()%>/article">
										<input type="hidden" name="news_number" value="${number}">
										<a href="javascript:form_name${number}.submit()">${newsList[number].newsDate}${newsList[number].title}</a>
								</h3>
								<p>${fn:substring(newsList[number].text,0,100)}...
									<a href="javascript:form_name${number}.submit()"
										class="btn btn-primary">Read More</a>
								</p>
								</form>
								<img
									src="<%=request.getContextPath()%>/stock/img/news/<%=NewsParameter.getImageName(newsList.get(number).getStockCode())%>"
									alt="">
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
