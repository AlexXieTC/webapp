<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>


<%
	User user=(User)session.getAttribute("user");
%>



	<meta charset="Shift_JIS" lang="ja">

	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/top.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/highlight.js.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/swiper.min.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/style.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample02.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/newspage.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/mobile.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/table1.css">




	 <script src="<%=request.getContextPath()%>/stock/js/highlight.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/highlightjs-line-numbers.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/swiper.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/script.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/table1.js"></script>
</head>


<body>
 <nav id="main-nav">
      <div class="container">
        <img src="<%=request.getContextPath()%>/stock/img/quicklogo.jpeg" alt="QUICK" class="logo">
        <ul class="navlinks">
          <li><a href="<%=request.getContextPath()%>/showinfo">Homepage</a></li>
          <li><a href="<%=request.getContextPath()%>/status">User Status</a></li>
          <li><a href="<%=request.getContextPath()%>/news">News</a></li>
          <li><a href="index.html">The Team</a></li>
          <li><a class="current" href="<%=request.getContextPath()%>/renewconfirmation">renewDate</a></li>
        </ul>

        <div class ="AfterloginForm">
		<form action="<%=request.getContextPath()%>/logout" method="Post">

				ユーザーID：<%=user.getId() %>
				日付：<%=user.getSimulationDate() %>
			    所持金：<%=user.getMoney() %>円
          		<input  type="submit" value="Log out">
          		<%--　メモ onclick="location.href='<%=request.getContextPath() %>/signup'"--%>
		</form>
        </div>
      </div>
    </nav>

	    <header id="showcase">
        <div class="container">
            <div class="showcase-container">
                <div class="showcase-content">
                    <div class="category category-sports">
                        フィンテック
                    </div>
                    <h1> QUICK証券</h1>
                    <h4>But this is just a sample demo layout, don't get too excited!</h4>
                    <a href="#" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
    </header>
<!--     <header id="heading">
      <div class="container text-center">
        <h1>QUICK証券</h1>
        <br><br><br><br><br><br><br><br>
        <h4>But this is just a sample demo layout, don't get too excited!</h4>

      </div>
    </header> -->