package test;


import java.util.Map;
import java.util.Map.Entry;

import entity.User;
import utils.DataBaseUtil;

public class Testmain {

	public static void main(String[] args) {
//		String sql = "insert into user_test(username,password,phone,email,sex) values(?,?,?,?,?)";
//		DataBaseUtil.update(sql, "喵喵喵","4654984","18162351469","145267894@qq.com",1);
		
		String sql = "insert into user_test(username,password) values(?,?)";
		//System.out.println(DataBaseUtil.queryForMap(sql,"1"));
		
		User user = new User();
		Map<String, Object> map = DataBaseUtil.queryForMap(sql, "1");
		for(String key:map.keySet()){
			if(key.equals("username")){
				user.setUsername((String)map.get(key));
			}
			if(key.equals("password")){
				user.setPassword((String)map.get(key));
			}
			if(key.equals("phone")){
				user.setPhone((String)map.get(key));
			}
			if(key.equals("email")){
				user.setEmail((String)map.get(key));
			}
			if(key.equals("sex")){
				user.setSex((int)map.get(key));
			}
			if(key.equals("uid")){
				user.setUid((int)map.get(key));
			}
		}
		
	}
}