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
  <title>日付更新確認</title>

<%@ include file="../stocklistheader.jsp" %>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/purchase.css">
 </head>
    <div id="main-content">
		<div align="center">
		<h3>${(empty alertMessage)? "次の日に進みます":"最終結果に進みます"}。よろしいですか？</h3>
		<h4 style="margin:20px 0;color:#fff;background-color:#000">前の日付には戻れません</h5>

			<form action="<%= request.getContextPath() %>/renewdate " method="post">
				<input type="submit" name="button" class="btn btn-primary"style="cursor:pointer" value
				=${(empty alertMessage)? "次の日に進む":"最終結果に進む"}>
				<input type="submit" name ="button" class="btn btn-default" style="cursor:pointer" value="戻る">
				<input type ="hidden" name = "sellNumber" value="${sellNumber }">
			</form>
		</div>
    </div><!-- @end #main-content -->

	<%@ include file="../footer/subfooter.jsp" %>
</body>
</html>