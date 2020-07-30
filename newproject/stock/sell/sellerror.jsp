
<%@ page
	import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
	contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ page import="bean.*"%>
<%@ page import="java.sql.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>売却エラー</title>
<link rel="stylesheet" href="./stock/css/top.css">
<%@ include file="../stocklistheader.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/stock/css/purchase.css">


<%-- ここから本文 --%>


<div id="main-content">
	<div align="center">

		<c:if test="${(empty sell_error)}">
			<h3>株を所持していません。</h3>
			<h4 style="margin-top: 20px;">所持数を確認してください。</h4>
		</c:if>
		<c:if test="${!(empty sell_error)}">
			<h3>売却処理に失敗しました。</h3>
			<h4 style="margin-top: 20px;">もう一度やり直してください</h4>
		</c:if>

		<br> <br> <a href="<%=request.getContextPath()%>/showinfo"
			class="btn btn-primary">戻る</a>

	</div>
</div>
<!-- @end #main-content -->


<%@ include file="../footer/subfooter.jsp"%>
</body>
</html>