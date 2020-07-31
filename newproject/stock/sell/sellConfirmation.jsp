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
  <title>売却確認</title>
<%@ include file="../stocklistheader.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/purchase.css">

    <div id="main-content">
		<div align="center">
		<h3>以下の内容で${price.stockName }の株式を売却します</h3>
		<br>
			<form action ="<%=request.getContextPath() %>/sell" method= "post">
			<table>
				<tr>
					<th>株式価格</th>
					<td>${price.openPrice}円</td>
				</tr>
				<tr>
					<th>売却株数</th>
					<td>${sellNumber}</td>
				</tr>
								<tr>
					<th>売却金額</th>
					<td>${sellNumber*price.openPrice}円</td>
				</tr>
				<tr>
					<th>売却後の所持金</th>
					<td>${user.money+(sellNumber*price.openPrice)}円</td>
				</tr>

			</table>
			<br>

				<input type="submit" name="button" class="btn btn-primary" style="cursor:pointer" value="売却する">
				<input type="submit" name ="button" class="btn btn-default" style="cursor:pointer" value="修正する">
				<input type ="hidden" name = "sellNumber" value="${sellNumber }">
			</form>
		</div>

    </div><!-- @end #main-content -->

<%@ include file="../footer/subfooter.jsp" %>
</body>
</html>