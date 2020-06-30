package resultmapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.News;

public class NewsMapping implements ResultSetBeanMapping<News>{

	@Override
	public News createFromResultSet(ResultSet rs) throws SQLException {
		// TODO 自動生成されたメソッド・スタブ
		News news = new News();
		news.setTitle(rs.getString("news_title"));
		news.setText(rs.getString("news_text"));
		news.setNewsDate(rs.getDate("date"));
		news.setStockCode(rs.getInt("stock_code"));
		return news;
	}

}
