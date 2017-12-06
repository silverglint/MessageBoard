package utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class DataBaseUtil {
	private static String username;
	private static String password;
	private static String dataBaseName;
	static{
		config("jdbc.properties");
	}
	//获取properties内部属性
	public static void config(String str){
		InputStream inputStream = DataBaseUtil.class.getClassLoader().getResourceAsStream(str);
		Properties p = new Properties();
		
		try {
			p.load(inputStream);
			username = p.getProperty("db.username");
			password = p.getProperty("db.password");
			dataBaseName = p.getProperty("db.dataBaseName");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//建立数据库连接
	public static Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dataBaseName+"?useUnicode=true&characterEncoding=utf8",username,password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	//关闭连接
	public static void closeConnection(Connection connection,PreparedStatement preparedStatement,ResultSet rs){
		try {
			if(rs!=null){
				rs.close();
			}
			if (preparedStatement!=null) {
				preparedStatement.close();
			}
			if (connection!=null) {
				connection.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//更新数据
	public static void update(String sql,Object...objects){
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				preparedStatement.setObject(i+1, objects[i]);
			}
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(connection, preparedStatement, null);
		}
	}
	//查询多行
	public static List<Map<String, Object>> queryForList(String sql,Object...objects){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for(int i=0;i<objects.length;i++){
				preparedStatement.setObject(i+1, objects[i]);
			}
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ResultSetMetaData resultSetMetaData = rs.getMetaData();
				int count = resultSetMetaData.getColumnCount();//获取总共数据行数
				Map<String, Object> map = new HashMap<String,Object>();
				//获取一行的所有键值对（列名，数据）
				for(int i=0;i<count;i++){
					map.put(resultSetMetaData.getColumnName(i+1), rs.getObject(resultSetMetaData.getColumnName(i+1)));
				}
				result.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(connection, preparedStatement, rs);
		}
		return result;
	}
	//查询单行
	public static Map<String, Object> queryForMap(String sql,Object...objects){
		List<Map<String, Object>> result = queryForList(sql, objects);
		if(result.size()!=1){
			return null;
		}
		return result.get(0);
	}
	//查询一项
	public static Object queryForSelect(String sql){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		Object last = "";
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if(rs.next()){
				last = rs.getObject(1);
			}
			System.out.println(last);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(connection, preparedStatement, rs);
		}
		return last;
	}
	//查询并存储为对象
//	public static Object queryForObject(String sql,Class clazz,Object...objects){
//		Map<String, Object> map = queryForMap(sql, objects);
//		for (String key : map.keySet()) {
//			
//		}
//		
//		return null;
//	}
	 
}
