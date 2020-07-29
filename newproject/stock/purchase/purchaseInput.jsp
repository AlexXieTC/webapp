
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
    <div id="footer-id">
		<div align="center">

		<h3 >${price.stockName}の株式を購入します</h3>
		<br>
			<form action ="<%=request.getContextPath() %>/purchaseConfirmation" method= "post">
			<table>
				<tr>
					<th>株式価格</th>
					<td>${price.openPrice}円</td>
				</tr>
				<tr>
					<th>所持株数</th>
					<td>${(empty asset)? 0:asset.number}株</td>
				</tr>
				<c:if test="${((stock_average!=0)&&!(empty stock_average))}">
					<tr>
					<th>所持平均株価</th>
						<td name="num">${stock_average}円</td>
					</tr>
				</c:if>
				<tr>
					<th>購入株数</th>
					<td>
					<input type="number" name ="purchaseNumber" value="${(empty purchaseNumber)? 100:purchaseNumber }" min="100" step="100" max="${user.money/price.openPrice }"/>株
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" name ="buttuon" class="btn btn-primary" style="cursor:pointer" value="購入確認">
				<input type="submit" name="button" class="btn btn-default" style="cursor:pointer"value="キャンセル">
			</form>
		</div>
		</div>
    </div><!-- @end #main-content -->



	<%@ include file="../footer/subfooter.jsp" %>

    </div>
</body>
</html>