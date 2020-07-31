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
	//接続ユーザ名
	private static final String USER ="admin";
	//各ユーザのパスワード

	private static final String  PASS ="adm1";




	public static Connection getConnection() throws SQLException{
		try {
			Class.forName("org.postgresql.Driver");
			Connection con=DriverManager.getConnection(
			"jdbc:postgresql://localhost:5432/"+DB,
			USER,PASS);
			return con;
		}catch(ClassNotFoundException e) {
			throw new SQLException(e);
		}
	}



	public static int simpleUpdate(String sql) throws SQLException{
		int result =0;
		Connection con =null;
		Statement smt=null;
		try {
			con=getConnection();
			smt=con.createStatement();
			result = smt.executeUpdate(sql);
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
		return result;
	}

	//複数の更新処理を挟む場合のようなsql実行処理
	public static boolean complexUpdate(List<String> sqls) throws SQLException{
		boolean isSuccess=false;
		Connection con =null;
		Statement smt=null;
		int result=0;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			smt=con.createStatement();

			for(String sql:sqls) {
				result = smt.executeUpdate(sql);
				if(result ==0) {
					con.rollback();
					break;
				}
			}
			if(result !=0) {
				con.commit();
				isSuccess=true;
			}

		}catch (SQLException e) {
			con.rollback();
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
		return isSuccess;
	}


	public static <T> List<T> findAll(String sql, ResultSetBeanMapping<T> mapping)
		throws SQLException{

		Connection con = null;
		Statement smt = null;
		List<T> list=new ArrayList<T>();
		try {
			con=getConnection();
			smt=con.createStatement();
			ResultSet rs=smt.executeQuery(sql);


			while (rs.next()) {
				T bean=mapping.createFromResultSet(rs);
				list.add(bean);
			}
		}finally {
			if(smt != null) {
				try {
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}


}
