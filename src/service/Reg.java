package service;

import utils.DataBaseUtil;

public class Reg {
	public void reg(String username,String password){
		String sql = "insert into user_test(username,password) values(?,?)";
		DataBaseUtil.update(sql, username,password);
	}
}
