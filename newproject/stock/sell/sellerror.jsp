
<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <title>売却エラー</title>
  <link rel="stylesheet" href="./stock/css/top.css">
  <%@ include file="../stocklistheader.jsp" %>


<%-- ここから本文 --%>


    <div id="main-content">
		<div align="center">
		<h3 style="margin-top:20px;">株を所持していません。</h3>

		<br><br>
<a href="<%=request.getContextPath() %>/showinfo" class="btn btn-primary">戻る</a>

		</div>
    </div><!-- @end #main-content -->


    <div id="footer">
      <div class="container">
        <p>QUICKは、世界中から株式、債券、為替、コモディティ、デリバティブ、
        企業情報など膨大なデー タやニュースを集め、金融・資本市場に関わる皆さまの意思決定をサポートするために独自の分析・評価で価値を付加する企業です。</p>
		<p>プロフェッショナルから個人の方まで幅広いシーンに、 QUICKならではの価値ある金融情報サービスをお届けします。</p>

      </div>
    </div>
</body>
</html>