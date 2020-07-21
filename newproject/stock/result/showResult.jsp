<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>シミュレーション終了</title>
 <%@ include file="../stocklistheader.jsp" %>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/status.css">
	<section>

	<div class="wrapper">
        <!--for demo wrap-->
        <h1 style="color:#4fc5ea;background-color:#000;">Ranking Page</h1>
        <table class="rtable rtable--flip" width="100%">
		  <thead>
		    <tr>
		      <th style="height:53px; width:100px">総資産</th>
		      <th style="height:54px; width:100px">${(empty predict_rank)? "":"予測"}順位</th>
		    </tr>
		  </thead>

			<%
				user=(User)session.getAttribute("user");
			%>

           <form action="<%=request.getContextPath()%>/logout" method="Post">
			 <tbody bgcolor="#fff" >
				<tr>
				<td style="height:53px; width:500px">${totalAsset}円 </td>
				<td style="height:54px; width:500px">${rank+predict_rank}位 </td>

	          </tbody>
			</form>
		</table>

		<table class="rtable" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0;display:table">

          	<thead>
              <tr>
                <th>ユーザー名</th>
                <th>総資産</th>
                <th>更新日</th>
                <th>順位</th>
              </tr>
            </thead>


            <%List<Score> scoreList = (List<Score>)request.getAttribute("scoreList");
            	SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
            for(Score sbean:scoreList){
			%>

		 <tbody>
			<tr bgcolor="#fff">
			<td><%=sbean.getUserID() %> </td>
            <td><%=sbean.getTotalAsset() %>   </td>
            <td><%=sdf.format(sbean.getDate()) %> </td>
            <td><%=sbean.getRank() %> </td>
            </tr>
			<%
            }
			%>
            </tbody>
          </table>

		</div>
	</section>


<%@ include file="../stocklistfooter.jsp" %>
</body>
</html>