
<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>


<%--
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
--%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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

	 <script src="<%=request.getContextPath()%>/stock/js/highlight.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/highlightjs-line-numbers.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/swiper.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/script.js"></script>



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

		<div class ="AfterloginForm">
		<form action="<%=request.getContextPath()%>/logout" method="Post">
				ユーザーID：
				日付：
				所持金：1000000 円
          		<input  type="submit" onclick="location.href='<%=request.getContextPath() %>/signup'" value="Log out">
		</form>
        </div>

      </div>
    </nav>



    <header id="heading">
      <div class="container text-center">
        <h1>QUICK証券</h1>
        <h4>But this is just a sample demo layout, don't get too excited!</h4>

        <p><a href="index.html" class="btn btn-large btn-inverse">Check out our features</a></p>
      </div>
    </header>


<h2>参考サイト</h2>
        <div class="alert alert-info">
          <strong>Note:</strong>投資初心者向けの参考サイトを掲載しています。
        </div>

        <div class="row-fluid">
          <ul class="thumbnails">
            <li class="span4">
              <a href="https://www.nikkei.com/" class="thumbnail" target="_blank">
              <img src="./stock/img/nikkeilogo.jpg" alt="日本経済新聞">
              </a>
            </li>
            <li class="span4">
              <a href="https://moneyworld.jp/" class="thumbnail" target="_blank">
              <img src="./stock/img/moneyworld01.png" alt="QUICK Money World">
              </a>
            </li>


            <li class="span4">
              <a href="https://froggy.smbcnikko.co.jp/" class="thumbnail" target="_blank">
              <img src="./stock/img/froggy.jpg" alt="日興フロッギー">
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <div class="row-fluid">
          <ul class="thumbnails">
           <li class="span4">
              <a href="https://www.nomura.co.jp/hajimete/" class="thumbnail" target="_blank">
              <img src="./stock/img/nomuralogo02.png" alt="野村証券">
              </a>
            </li>
            <li class="span4">
              <a href="https://www.daiwa.jp/ja/dd/beginner/" class="thumbnail" target="_blank">
              <img src="./stock/img/daiwalogo01.jpg" alt="大和証券">
              </a>
            </li>


            <li class="span4">
              <a href="https://minkabu.jp/beginner/" class="thumbnail" target="_blank">
              <img src="./stock/img/minkabulogo01.png" alt="みんかぶ">

             <!--   align="dribbble console wars super nintendo design-->
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <hr>
      </div><!-- @end .container -->
    </div><!-- @end #main-content -->



</body>
</html>