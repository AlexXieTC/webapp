<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<%@ page import="java.sql.Date" %>
<%--テスト用に各リクエストスコープの埋め込み --%>
<%


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <link rel="stylesheet" href="./stock/css/top.css">
  <title>購入確認</title>
<%@ include file="../stocklistheader.jsp" %>

    <div id="main-content">
		<div align="center">
		<h3 style="margin-top:20px;">以下の内容で${price.stockName }の株式を売却します</h3>
			<form action ="<%=request.getContextPath() %>/sell" method= "post">
			<table style="width:500px;margin-left:160px">
				<tr>
					<th>株式価格</th>
					<td>${price.openPrice}円</td>
				</tr>
				<tr>
					<th>売却株数</th>
					<td>${requestScope.sellNumber}</td>
				</tr>
								<tr>
					<th>売却金額</th>
					<td>${sellNumber*price.openPrice}円</td>
				</tr>
				<tr>
					<th>購入後の所持金</th>
					<td>${user.money+(sellNumber*price.openPrice)}円</td>
				</tr>

			</table>

				<input type="submit" name="button" class="btn btn-primary" style="cursor:pointer" value="売却する">
				<input type="submit" name ="button" class="btn btn-default" style="cursor:pointer" value="修正する">
				<input type ="hidden" name = "sellNumber" value="${sellNumber }">
			</form>
		</div>
    </div><!-- @end #main-content -->



<%@ include file="../stocklistfooter.jsp" %>
</body>
</html>