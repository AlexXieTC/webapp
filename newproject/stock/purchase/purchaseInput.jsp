
<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <title>購入フォーム</title>
  <%@ include file="../stocklistheader.jsp" %>
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/purchase.css">


<%-- ここから本文 --%>


    <div id="main-content">
		<div align="center">
		<h3 style="margin-top:20px;">${price.stockName}の株式を購入します</h3>
			<form action ="<%=request.getContextPath() %>/purchaseConfirmation" method= "post">
			<table style="width:500px">
				<tr>
					<th>株式価格</th>
					<td>${price.openPrice}円</td>
				</tr>
				<tr>
					<th>購入株数</th>
					<td>
					<input type="number" name ="purchaseNumber" value="${(empty purchaseNumber)? 100:purchaseNumber }" min="100" step="100" max="${user.money/price.openPrice }"/>株
					</td>
				</tr>
			</table>
			<input type="submit" name ="buttuon" class="btn btn-primary" style="cursor:pointer" value="購入確認">
				<input type="submit" name="button" class="btn btn-default" style="cursor:pointer"value="キャンセル">
			</form>
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