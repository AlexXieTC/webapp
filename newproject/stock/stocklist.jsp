<%@ page import="java.sql.*, database.DBAccess"
    contentType="text/html; charset=euc-jp" %>
<%
// ����: �ǡ����١����˥�����������

// MyDBAccess �Υ��󥹥��󥹤���������
DBAccess db = new DBAccess();

// �ǡ����١����ؤΥ�������
db.open();

// ���С������
ResultSet rs = db.getResultSet("select * from price");

// ���С�����ɽ���ѤΥơ��֥�
String tableHTML = "<table border=1>";
tableHTML += "<tr bgcolor=\"000080\"><td><font color=\"white\">����������</font></td>"
    + "<td><font color=\"white\">����</font></td>"
    + "<td><font color=\"white\">����</font></td>"
    + "<td><font color=\"white\">����</font></td>"
    + "<td><font color=\"white\">�����</font></td>";

// �������줿�Ʒ�̤��Ф��Ƥν���
while(rs.next()) {

    int stockcode = rs.getInt("stock_code");
    Date date = rs.getDate("date");
    int openprice = rs.getInt("open_price");
    int closeprice = rs.getInt("closing_price");
    int volume = rs.getInt("volume");

//    // ʸ�������ɤ� EUC_JP ����Unicode ���Ѵ�
//    japan_name = new String(name.getBytes("8859_1"), "EUC_JP");
//    kana = new String(kana.getBytes("8859_1"), "EUC_JP");

    // �ơ��֥���HTML�����
    tableHTML += "<tr><td align=\"right\">" + stockcode + "</td>"
              + "<td>" + date + "</td><td>" + openprice + "</td>"
              + "<td>" + closeprice + "</td>"
              +"<td>" + volume + "</td></tr>";
}

tableHTML += "</table>";

// �ǡ����١����ؤΥ��ͥ��������Ĥ���
db.close();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>�ǡ����١����ؤΥ�������</title></head>
<body>
<p>-- �ǡ����١����ؤΥ������� --</p>
<p>
<b>��������</b><br>
<%= tableHTML %>
</p>
</body>
</html>