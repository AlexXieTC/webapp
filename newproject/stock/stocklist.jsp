<<<<<<< HEAD
<%@ page import="java.sql.*, database.*, java.util.*, bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>

<%-- <%
=======
<%@ page import="java.sql.*, database.DBAccess"
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%
>>>>>>> 1347692dd5f2ceb091cfbf65fc5f78e4f63dac77
// 内容: データベースにアクセスする

// MyDBAccess のインスタンスを生成する
DBAccess db = new DBAccess();

// データベースへのアクセス
db.open();

// メンバーを取得
ResultSet rs = db.getResultSet("select * from price where date = now()::date");

// メンバー一覧表示用のテーブル
String tableHTML = "<table border=1>";
tableHTML += "<tr bgcolor=\"000080\"><td><font color=\"white\">銘柄コード</font></td>"
    + "<td><font color=\"white\">日付</font></td>"
    + "<td><font color=\"white\">始値</font></td>"
    + "<td><font color=\"white\">終値</font></td>"
    + "<td><font color=\"white\">出来高</font></td>";

// 取得された各結果に対しての処理
while(rs.next()) {

    int stockcode = rs.getInt("stock_code");
    Date date = rs.getDate("date");
    int openprice = rs.getInt("open_price");
    int closeprice = rs.getInt("closing_price");
    int volume = rs.getInt("volume");

//    // 文字コードを EUC_JP からUnicode へ変換
//    japan_name = new String(name.getBytes("8859_1"), "EUC_JP");
//    kana = new String(kana.getBytes("8859_1"), "EUC_JP");

    // テーブル用HTMLを作成
    tableHTML += "<tr><td align=\"right\">" + stockcode + "</td>"
              + "<td>" + date + "</td><td>" + openprice + "</td>"
              + "<td>" + closeprice + "</td>"
              +"<td>" + volume + "</td></tr>";
}

tableHTML += "</table>";

rs = db.getResultSet("select * from news where date = now()::date");
String pHTML="<p>";
while(rs.next()) {

    int stockcode = rs.getInt("stock_code");
    Date date = rs.getDate("date");
    String title=rs.getString("news_title");

    pHTML+="<"+stockcode+">"+"["+title+"]"+date;

}

pHTML+="</p>";


// データベースへのコネクションを閉じる
db.close();

<<<<<<< HEAD
%> --%>



=======
%>
>>>>>>> 1347692dd5f2ceb091cfbf65fc5f78e4f63dac77
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title>QUICK証券</title>

	<meta charset="Shift_JIS" lang="ja">
 	<link rel="stylesheet" href="./css/top.css">
	<link rel="stylesheet" href="./css/highlight.js.css">
	 <link rel="stylesheet" href="./css/swiper.min.css">
	 <link rel="stylesheet" href="./css/style.css">
	 <link rel="stylesheet" href="./css/sample.css">
	 <link rel="stylesheet" href="./css/sample02.css">

	 <script src="./js/highlight.js"></script>
	 <script src="./js/highlightjs-line-numbers.min.js"></script>
	 <script src="./js/swiper.min.js"></script>
	 <script src="./js/script.js"></script>

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
      </div>
    </nav>

    <header id="heading">
      <div class="container text-center">
        <h1>QUICK証券</h1>
        <h4>But this is just a sample demo layout, don't get too excited!</h4>

        <p><a href="index.html" class="btn btn-large btn-inverse">Check out our features</a></p>
      </div>
    </header>

	<div class="l-wrapper">



	  <div class="c-container">
	    <div class="sample sample02">
	      <div class="swiper-container">
	        <div class="swiper-wrapper">
	          <div class="swiper-slide">
	            <div class="sample02-inner">
<<<<<<< HEAD
					<% List<News> newsList = (List<News>)request.getAttribute("newsList");
						News nbean0=newsList.get(0);%>


					<p> <%=nbean0.getStockCode()%><%=nbean0.getNewsDate()%><%=nbean0.getTitle()%></p>
	            </div>
	          </div>

=======
					<%= pHTML %>

	            </div>
	          </div>


>>>>>>> 1347692dd5f2ceb091cfbf65fc5f78e4f63dac77
	        </div>

	        <div class="swiper-button-prev">
	          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 27 44">
	            <path class="c-arrow c-arrow-prev" d="M0,22L22,0l2.1,2.1L4.2,22l19.9,19.9L22,44L0,22L0,22L0,22z" />
<<<<<<< HEAD
					<%
						News nbean1=newsList.get(1);%>
					<p> <%=nbean1.getStockCode()%><%=nbean1.getNewsDate()%><%=nbean1.getTitle()%></p>
=======
>>>>>>> 1347692dd5f2ceb091cfbf65fc5f78e4f63dac77
	          </svg>
	        </div>
	        <div class="swiper-button-next">
	          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 27 44">
	            <path class="c-arrow c-arrow-next" d="M27,22L27,22L5,44l-2.1-2.1L22.8,22L2.9,2.1L5,0L27,22L27,22z" />
<<<<<<< HEAD
					<%
						News nbean2=newsList.get(2);%>
					<p> <%=nbean2.getStockCode()%><%=nbean2.getNewsDate()%><%=nbean2.getTitle()%></p>
=======
>>>>>>> 1347692dd5f2ceb091cfbf65fc5f78e4f63dac77
	          </svg>
	        </div>

	        <div class="swiper-pagination"></div>
	      </div>
	    </div><!-- .sample -->



	  </div><!-- .c-container -->
	</div><!-- .l-wrapper -->

    <div id="main-content">
      <div class="container">
         <div class="row">
           <div class="span4">
             <h2>Our Products</h2>
             <p>Oh…yeah…the guy in the…the $4,000 suit is holding the elevator for a guy who doesn't make that in three months. Come on! Speaking of settling, how's Ann? He's a regular Freddie Wilson, that one.</p>
             <p class="text-center"><a class="btn" href="index.html">Read more</a></p>
           </div>

           <div class="span4">
             <h2>We Love You! <small>so much</small></h2>
             <p>I mean, it's one banana, Michael. What could it cost, ten dollars? It's sort of like going from prime rib to… I don't know… weird brother of prime rib. I hear the jury's still out on science. <strong>Check out banner, Michael!</strong></p>
             <p class="text-center"><a class="btn btn-primary" href="index.html">Primary button</a></p>
           </div>

           <div class="span4">
             <h2>Headline Here</h2>
             <p>Obviously this blue part here is the land. Let the great experiment begin! But I'm the oldest. The matriarch if you will. She's always got to wedge herself in the middle of us so that she can control everything. Yeah. Mom's awesome. Maybe we should call her?</p>
             <p class="text-center"><a class="btn" href="index.html">Read more</a></p>
           </div>
        </div><!-- @end .row -->

        <hr>

<<<<<<< HEAD
<%-- 			<%= tableHTML %> --%>
=======
			<%= tableHTML %>
>>>>>>> 1347692dd5f2ceb091cfbf65fc5f78e4f63dac77


        <h2>SNES in Dribbble Shots</h2>
        <div class="alert alert-info">
          <strong>Note:</strong> Each shot is linked to the original source.
        </div>

        <div class="row-fluid">
          <ul class="thumbnails">
            <li class="span4">
              <a href="http://dribbble.com/shots/39065-snes-controller" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/Q4bxBmd.png" alt="snes controller dribbble shot">
              </a>
            </li>
            <li class="span4">
              <a href="http://dribbble.com/shots/525128-Micons-Series-2-SNES" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/uQLkghZ.png" alt="minicon series2 snes console">
              </a>
            </li>
            <li class="span4">
              <a href="http://dribbble.com/shots/633186-The-Game" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/vLg6MDV.png" alt="snes video game cartridge shot">
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <div class="row-fluid">
          <ul class="thumbnails">
            <li class="span6">
              <a href="http://dribbble.com/shots/758735-Oh-Oh-Please-Amaze-Me-Detail-IV" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/SS8Kiln.png" alt="dribbble shots super nintendo">
              </a>
            </li>
            <li class="span6">
              <a href="http://dribbble.com/shots/436565-Jaku-Console-Wars" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/y3M2d7p.png" align="dribbble console wars super nintendo design">
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <hr>
      </div><!-- @end .container -->
    </div><!-- @end #main-content -->



    <div id="footer">
      <div class="container">
        <p>Simple layout design for <a href="http://blog.teamtreehouse.com/">Treehouse Blog</a>.</p>
        <p>Feel free to download and use these codes for any basic template layout.</p>
        <p><small>Website code structured with <a href="https://twitter.github.io/bootstrap/">Twitter Bootstrap</a>. Background image credits to <a href="http://www.flickr.com/photos/fjolnir/2342246699/">Fjölnir Ásgeirsson</a>. Sample content via <a href="http://bluthipsum.com/">Bluth Ipsum</a>.</small></p>
      </div>
    </div>


</p>
</body>
</html>