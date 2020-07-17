<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/top.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/highlight.js.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/swiper.min.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/style.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample02.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/newspage.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/mobile.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/table1.css">

	 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.1.5/angular.min.js"></script>
     <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.6.0.js" type="text/javascript"></script>
     <script src="https://m-e-conroy.github.io/angular-dialog-service/javascripts/dialogs.min.js" type="text/javascript"></script>

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
          <li style="margin:0px 30px;"><a href="<%=request.getContextPath()%>/showresult">Ranking</a></li>
          <li style="margin:0px 30px;"><a class="current" href="<%=request.getContextPath()%>/renewconfirmation">renewDate</a></li>
        </ul>

      </div>
    </nav>

	   <header id="showcase">
        <div class="container">
            <div class="showcase-container">
                <div class="showcase-content">
                    <h1> QUICK証券</h1>
                   <h4 style="margin-top:80px;color:#1aa6d3">＿Our Knowledge, Your Value.</h4>
                </div>
            </div>
        </div>
    </header>

	<div align="center">
		<h2 style="margin-top:20px;">ログアウトしました</h2>

		<br><br>
		<a href="<%=request.getContextPath() %>/index.jsp"class="btn btn-inverse btn-primary">トップ画面に戻る</a>
	</div>
	    <div id="footer">
      <div class="container">
        <p>QUICKは、世界中から株式、債券、為替、コモディティ、デリバティブ、
        企業情報など膨大なデー タやニュースを集め、金融・資本市場に関わる皆さまの意思決定をサポートするために独自の分析・評価で価値を付加する企業です。</p>
		<p>プロフェッショナルから個人の方まで幅広いシーンに、 QUICKならではの価値ある金融情報サービスをお届けします。</p>

      </div>
    </div>
</body>
</html>