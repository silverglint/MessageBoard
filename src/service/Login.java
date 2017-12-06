package service;

import java.util.Map;

import entity.User;
import utils.DataBaseUtil;

public class Login {
	
	String sql = "select * from user_test where username=?";
	
	public User getUser(String username){
		User user = new User();
		Map<String, Object> map = DataBaseUtil.queryForMap(sql, username);
		if(map==null){
			return null;
		}
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
			if(key.equals("uid")){
				user.setUid((int)map.get(key));
			}
		}
		return user;
		
	}
}
