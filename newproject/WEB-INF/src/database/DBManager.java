package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import resultmapping.ResultSetBeanMapping;


public class DBManager{
	public static void main(String[] args) {
		System.out.println();
	}
	//接続するデータベース名
	private static final String DB="webapp";
	//各ユーザのパスワード
	private static final String  PASS ="kanazawa24ki";

	public static Connection getConnection() throws SQLException{
		try {
			Class.forName("org.postgresql.Driver");
			Connection con=DriverManager.getConnection(
			"jdbc:postgresql://localhost:5432/"+DB,
			"postgres",PASS);
			return con;
		}catch(ClassNotFoundException e) {
			throw new SQLException(e);
		}
	}



	public static int simpleUpdate(String sql) throws SQLException{

		Connection con =null;
		Statement smt=null;
		try {
			con=getConnection();
			smt=con.createStatement();
			return smt.executeUpdate(sql);
		}finally {
			if(smt != null) {
				try {
				smt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	//複数の更新処理を挟む場合のようなsql実行処理
	public static boolean complexUpdate(List<String> sqls) throws SQLException{

		Connection con =null;
		Statement smt=null;
		int result;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			smt=con.createStatement();

			for(String sql:sqls) {
				result = smt.executeUpdate(sql);

				if(result <=0) {
					con.rollback();
					return false;
				}
			}

			con.commit();
			return true;


		}finally {
			if(smt != null) {
				try {
				smt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}


	public static <T> List<T> findAll(String sql, ResultSetBeanMapping<T> mapping)
		throws SQLException{

		Connection con = null;
		Statement smt = null;

		try {
			con=getConnection();
			smt=con.createStatement();
			ResultSet rs=smt.executeQuery(sql);

			List<T> list=new ArrayList<T>();
			while (rs.next()) {
				T bean=mapping.createFromResultSet(rs);
				list.add(bean);
			}
			return list;
		}finally {
			if(smt != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}


}