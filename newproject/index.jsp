<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>QUICK証券</title>
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
          <li style="margin:0px 30px;"><a href="#">Homepage</a></li>
          <li style="margin:0px 30px;"><a href="#">User Status</a></li>
          <li style="margin:0px 30px;"><a href="#">News</a></li>
          <li style="margin:0px 30px;"><a href="#">The Team</a></li>
          <li style="margin:0px 30px;"><a class="current" href="#">renewDate</a></li>
        </ul>

	　<div class ="loginForm">
			<form method="post" action="?" class ="loginInput">
				User ID  &nbsp;&nbsp;&nbsp;<input type="text" name="userID" maxlength='20' pattern="^[0-9A-Za-z]+$"><br>
				Password <input type="password" name="pass" maxlength='20'>
				<br>
          		<input type="submit" formaction="<%=request.getContextPath() %>/login" class="btn btn-secondary" style="margin:5px; float:right;" value="Log in">
          		<input type="submit" formaction="<%=request.getContextPath() %>/stock/signup.jsp" class="btn btn-secondary" style="background-color: #64f6a5; color:black;margin:5px;float:right;" value="Sign up">
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

<section id="about">
      <div class="container">


          <div class="page-container">

              <article class="card">
					 <h1 class="l-heading" style="writing-mode:tb-rl;margin:20px;" >About Our Organization</h1>
					 <br>

 				  <p>
					QUICKは、世界中から株式、債券、為替、コモディティ、デリバティブ、企業情報など膨大なデー タやニュースを集め、金融・資本市場に関わる皆さまの意思決定をサポートするために独自の分析・評価で価値を付加する企業です。
					プロフェッショナルから個人の方まで幅広いシーンに、 QUICKならではの価値ある金融情報サービスをお届けします。
 				  </p>
 				  <p>
 				    日本経済新聞社グループの一員として、
					価値ある金融情報サービスを、皆さまへ。
					1971年の創業以来、日本の証券・金融市場を支える情報インフラとしての役割を担うQUICK。
					証券会社や金融機関をはじめ、機関投資家や一般事業会社、個人投資家の方々まで、
					幅広いお客さまの意思決定をサポートすることが私たちの使命です。公正・中立な立場から、付加価値の
					高いグローバルなマーケット情報をお届けしています。
 				  </p>
 				  <br>
 				  <h2>
 				  		身近なQUICK
 				  </h2>
 				  <p>
					   「日経平均株価」をはじめ日本を代表する
						指数の算出や、新聞などをはじめとする
						マスコミへのデータ提供もQUICKの
						仕事です。
 				  </p>
 				   				  <p>
証券会社の店頭など、普段、街中で
目にするデジタルサイネージにも
経済の動きを伝える情報を配信しています。
 				  </p>
 				   				  <p>
皆さまが証券会社・銀行の店頭や
オンライントレードで利用するサービスにも
QUICKの情報が使われています。
 				  </p>
 				  <h3 color="red">日本経済新聞社グループの一員として、
価値ある金融情報サービスを、皆さまへ。</h3>
              </article>

              <aside class="card bg-primary">
                    <h2>Join Our Club</h2>
                    <p>Providing valuable Japanese financial information services
				as a member of Nikkei, Japan's largest business media。</p>
                    <a href="#" class="btn btn-dark">Join Now</a>
                </aside>
          </div>
      </div>
  </section>


<!-- <div class ="loginForm">の変更前-->

       <!--
        <div class ="loginForm">
			<form method="post" action="<%=request.getContextPath() %>/login" class ="loginInput">
				User ID <input type="text" name="userID"><br>
				Password<input type="password" name="pass">
          		<input type="submit" value="Log in">
			</form>
			<div class ="signupForm">
			<form method="post" action="<%=request.getContextPath() %>/signup" class ="signupInput">

          		<input type="submit" value="sign up">
			</form>
        </div>
        -->
   <!--
        <div class ="signupForm">
			<form method="post" action="<%=request.getContextPath() %>/signup" class ="signupInput">

          		<input type="submit" value="sign up">
			</form>
        </div>

-->
<div style=" text-align: center;margin:50px;background-color:#000">
<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQiDALXTQHISyIP77IR2trQ_apDAaX8vf7dKBvh7MkTWUkidTk_SxTEEVK1WEIGY-MzLuaGHpp889i-/embed?start=true&loop=true&delayms=3000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
</div>


 <h2>参考サイト</h2>
        <div class="alert alert-info">
          <strong>Note:</strong>投資初心者向けの参考サイトを掲載しています。
        </div>

        <div class="row-fluid">
          <ul class="thumbnails">
            <li class="span4">
              <a href="https://www.nikkei.com/" class="thumbnail" target="_blank">
              <img src="<%=request.getContextPath()%>/stock/img/nikkeilogo.jpg" alt="日本経済新聞">
              </a>
            </li>
            <li class="span4">
              <a href="https://moneyworld.jp/" class="thumbnail" target="_blank">
              <img src="<%=request.getContextPath()%>/stock/img/moneyworld01.png" alt="QUICK Money World">
              </a>
            </li>


            <li class="span4">
              <a href="https://froggy.smbcnikko.co.jp/" class="thumbnail" target="_blank">
              <img src="<%=request.getContextPath()%>/stock/img/froggy.jpg" alt="日興フロッギー">
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <div class="row-fluid">
          <ul class="thumbnails">
           <li class="span4">
              <a href="https://www.nomura.co.jp/hajimete/" class="thumbnail" target="_blank">
              <img src="<%=request.getContextPath()%>/stock/img/nomuralogo02.png" alt="野村証券">
              </a>
            </li>
            <li class="span4">
              <a href="https://www.daiwa.jp/ja/dd/beginner/" class="thumbnail" target="_blank">
              <img src="<%=request.getContextPath()%>/stock/img/daiwalogo01.jpg" alt="大和証券">
              </a>
            </li>


            <li class="span4">
              <a href="https://minkabu.jp/beginner/" class="thumbnail" target="_blank">
              <img src="<%=request.getContextPath()%>/stock/img/minkabulogo01.png" alt="みんかぶ">

             <!--   align="dribbble console wars super nintendo design-->
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <hr>
      </div><!-- @end .container -->
    </div><!-- @end #main-content -->


      <footer id="main-footer" class="py-2">
            <div class="container footer-container">
              <div>
                <img src="<%=request.getContextPath()%>/stock/img/quick.jpg" alt="QUICK">

              </div>
              <div>
                <h3>Email Newsletter</h3>
                <p> For high-value global market information.</p>
                <form>
                  <input type="email" placeholder="Enter Email...">
                  <input type="submit" value="Subscribe" class="btn btn-primary">
                </form>
              </div>
              <div>
                <h3>Site Links</h3>
                <ul class="list">
                  <li><a href="#">Help & Support</a></li>
                  <li><a href="#">Privacy Policy</a></li>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </div>
              <div>
                <h2>Join Our Team</h2>
                <p>Providing valuable Japanese financial information services
				as a member of Nikkei, Japan's largest business media。</p>
                <a href="#" class="btn btn-secondary">Join Now</a>
              </div>
              <div>
                <p>
                  Copyright &copy; 2020, All Rights Reserved
                </p>
              </div>
            </div>
          </footer>
    </div>
</body>
</html>