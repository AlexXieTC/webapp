<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.*,news.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>


<%@ include file="../stocklistheader.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Lato|Staatliches" rel="stylesheet">

<body>

	<section id="article">
      <div class="container">
          <div class="page-container">
              <article class="card">
                  <img src="<%=request.getContextPath()%>/stock/img/ent1.jpg" alt="Entertainment">

                  <% List<News> newsList = (List<News>)request.getAttribute("newsList");

						SimpleDateFormat sdf1 = new SimpleDateFormat("MM月dd日");

						int newsNumber = 0;
						if(request.getAttribute("news_number")!=null)newsNumber=(int)(request.getAttribute("news_number"));
						News nbean0=newsList.get(newsNumber);%>


                  <h1 class="l-heading"><%=nbean0.getTitle()%></h1>
                  <div class="meta">
                      <small>
                          <i class="fas fa-user"></i> Written By Nikke Quick News
                      </small>
                      <%=NewsParameter.category(nbean0.getStockCode()) %>
                  </div>

                  <p><%=nbean0.getText() %></p>
              </article>

              <aside id="categories" class="card">
                    <h2> Categories</h2>
                    <ul>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> フィンテック</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> 経済・金融</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> 技術</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> 政治</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> 時事</a></li>
                    </ul>
                </aside>
                  <aside class="card bg-secondary">
                  <h2>Join Our Club</h2>
                 <p>Providing valuable Japanese financial information services
				as a member of Nikkei, Japan's largest business media。</p>
                  <a href="#" class="btn btn-dark">Join Now</a>
              </aside>
          </div>
      </div>
  </section>


	<%@ include file="../stocklistfooter.jsp" %>
</body>
</html>