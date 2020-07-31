<%@ page
	import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
	contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	User user = (User) session.getAttribute("user");
	if (user == null)
		user = new User();
%>

<head>
	<title>QUICK証券</title>
	<meta charset="Shift_JIS" lang="ja">

	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" defer></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/lettering.js/0.6.1/jquery.lettering.min.js" defer></script>
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.1.5/angular.min.js"></script>
     <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.6.0.js" type="text/javascript"></script>
     <script src="https://m-e-conroy.github.io/angular-dialog-service/javascripts/dialogs.min.js" type="text/javascript"></script>

	 <script src="<%=request.getContextPath()%>/stock/js/highlight.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/highlightjs-line-numbers.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/swiper.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/script.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/table1.js"></script>

     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
     <link href="https://fonts.googleapis.com/css?family=Lato|Staatliches" rel="stylesheet">


	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/top.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/highlight.js.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/swiper.min.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/style.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample02.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/newspage.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/mobile.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/table1.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/anime1.css">

	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/colorChange.css">


</head>

<body>

	<nav id="main-nav">

		<div class="container">
			<img src="<%=request.getContextPath()%>/stock/img/quicklogo2.jpeg"
				alt="QUICK" class="logo">
			<ul class="navlinks">
				<li style="margin: 0px 30px;"><a
					href="<%=request.getContextPath()%>/showinfo">Homepage</a></li>
				<li style="margin: 0px 30px;"><a
					href="<%=request.getContextPath()%>/status">User Status</a></li>
				<li style="margin: 0px 30px;"><a
					href="<%=request.getContextPath()%>/news">News</a></li>
				<li style="margin: 0px 30px;"><a
					href="<%=request.getContextPath()%>/stock/team/about.jsp">The
						Team</a></li>
				<li style="margin: 0px 30px;"><a
					href="<%=request.getContextPath()%>/showresult">Ranking</a></li>
				<li style="margin: 0px 30px;"><a class="current"
					href="<%=request.getContextPath()%>/renewconfirmation">renewDate</a></li>
			</ul>

			<div class="AfterloginForm">

				<form action="<%=request.getContextPath()%>/logout" method="Post">
					<p style="background-color: #EDF7FF;">
					<c:if test="${!(empty user)}">
							<i class="fas fa-user"></i>
                          ユーザーID：<%=user.getId()%>
				日付：<%=user.getSimulationDate()%>
			    所持金：<%=user.getMoney()%>円
				</c:if>

						<input type="submit" class="btn btn-outline-primary bth-sm"
							value="Log out">

					</p>
					<h2 style="margin-top: 1.5em; margin-left: 4.8em;">${(empty alertMessage)? "":alertMessage}</h2>


					<%--　メモ onclick="location.href='<%=request.getContextPath() %>/signup'"--%>
				</form>
			</div>
		</div>
	</nav>
	<!-- アニメション -->
	<!-- 	  <div class="scene">
        <div class="wrap">
            <div class="wall wall-right"></div>
            <div class="wall wall-left"></div>
            <div class="wall wall-top"></div>
            <div class="wall wall-bottom"></div>
            <div class="wall wall-back"></div>
        </div> -->
	</div>
	<!-- アニメション -->
	<header id="showcase">
		<div class="container">
			<div class="showcase-container">
				<div class="showcase-content">
					<h1>QUICK証券</h1>
					<h4 style="margin-top: 80px; color: #1aa6d3">＿Our Knowledge,
						Your Value.</h4>
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