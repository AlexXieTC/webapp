<%@ page import="java.sql.*, database.DBAccess"
    contentType="text/html; charset=euc-jp" %>
<%
// 内容: データベースにアクセスする

// MyDBAccess のインスタンスを生成する
DBAccess db = new DBAccess();

// データベースへのアクセス
db.open();

// メンバーを取得
ResultSet rs = db.getResultSet("select * from price");

// メンバー一覧表示用のテーブル
String tableHTML = "<table border=1>";
tableHTML += "<tr bgcolor=\"000080\"><td><font color=\"white\">銘柄コード</font></td>"
    + "<td><font color=\"white\">日付</font></td>"
    + "<td><font color=\"white\">始値</font></td>"
    + "<td><font color=\"white\">終値</font></td>"
    + "<td><font color=\"white\">出来高</font></td>";

// 取得された各結果に対しての処理
while(rs.next()) {

    int stockcode = rs.getInt("stock_code");
    Date date = rs.getDate("date");
    int openprice = rs.getInt("open_price");
    int closeprice = rs.getInt("closing_price");
    int volume = rs.getInt("volume");

//    // 文字コードを EUC_JP からUnicode へ変換
//    japan_name = new String(name.getBytes("8859_1"), "EUC_JP");
//    kana = new String(kana.getBytes("8859_1"), "EUC_JP");

    // テーブル用HTMLを作成
    tableHTML += "<tr><td align=\"right\">" + stockcode + "</td>"
              + "<td>" + date + "</td><td>" + openprice + "</td>"
              + "<td>" + closeprice + "</td>"
              +"<td>" + volume + "</td></tr>";
}

tableHTML += "</table>";

// データベースへのコネクションを閉じる
db.close();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>データベースへのアクセス</title></head>
<body>
<p>-- データベースへのアクセス --</p>
<p>
<b>銘柄一覧</b><br>
<%= tableHTML %>
</p>
</body>
</html>