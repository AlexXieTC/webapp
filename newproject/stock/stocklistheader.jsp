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

	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
     <link href="https://fonts.googleapis.com/css?family=Lato|Staatliches" rel="stylesheet">




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
          <li style="margin:0px 30px;"><a href="<%=request.getContextPath()%>/showinfo">Homepage</a></li>
          <li style="margin:0px 30px;"><a href="<%=request.getContextPath()%>/status">User Status</a></li>
          <li style="margin:0px 30px;"><a href="<%=request.getContextPath()%>/news">News</a></li>
          <li style="margin:0px 30px;"><a href="<%=request.getContextPath()%>/stock/team/about.jsp">The Team</a></li>
          <li style="margin:0px 30px;"><a class="current" href="<%=request.getContextPath()%>/renewconfirmation">renewDate</a></li>
        </ul>

        <div class ="AfterloginForm">
		<form action="<%=request.getContextPath()%>/logout" method="Post">
				<p style="background-color:#EDF7FF;">
                     <i class="fas fa-user"></i>
                          ユーザーID：<%=user.getId() %>
				日付：<%=user.getSimulationDate() %>
			    所持金：<%=user.getMoney() %>円

			    <input  type="submit" value="Log out">
                 </p>


          		<%--　メモ onclick="location.href='<%=request.getContextPath() %>/signup'"--%>
		</form>
        </div>
      </div>
    </nav>

	    <header id="showcase">
        <div class="container">
            <div class="showcase-container">
                <div class="showcase-content">
                    <h1> QUICK証券</h1>
                  <!--   <h4>But this is just a sample demo layout, don't get too excited!</h4> -->
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