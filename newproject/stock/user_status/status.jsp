<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>


<%@ include file="../stocklistheader.jsp" %>

  <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/status.css">

<body>

<section>
	<div class="wrapper">
        <!--for demo wrap-->
        <h1>Status Page</h1>
        <table class="rtable rtable--flip" width="50%">
		  <thead>
		    <tr>
		      <th style="height:32px">ユーザーID</th>
		      <th style="height:33px">口座残高</th>

		    </tr>
		  </thead>

			<%
				user=(User)session.getAttribute("user");
			%>

           <form action="<%=request.getContextPath()%>/logout" method="Post">
			 <tbody bgcolor="#fff" >
				<tr>
				<td><%=user.getId() %>
				<td><%=user.getMoney() %>円 </td>

	          </tbody>
			</form>
		</table>

          <table class="rtable" cellpadding="0" cellspacing="0" border="0"  style="margin:10px 0" width="100%" >

          	<thead>
              <tr>
                <th>銘柄コード</th>
                <th>銘柄名</th>
                <th>所持数</th>
                <th>株資産</th>
                <th>日付</th>
              </tr>
            </thead>


            <%List<History> historyList = (List<History>)request.getAttribute("historyList");
            	SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
            for(History hbean:historyList){
			%>

		 <tbody>
			<tr bgcolor="#fff">
			<td><%=hbean.getStockCode() %> </td>
            <td><%=hbean.getStockName() %>   </td>
            <td><%=hbean.getNumber() %> </td>
            <td><%=hbean.getNumber()*hbean.getClosingPrice() %> </td>
            <td><%=sdf.format(hbean.getSimulationDate()) %> </td>

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