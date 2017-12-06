package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import entity.Discuss;
import utils.DataBaseUtil;

public class ShowDiscuss {
	
	//新增评论
	public void addDiscuss(String user_id,String article_id,String content){
		String sql = "insert into discuss(user_id,article_id,content) values(?,?,?);";
		DataBaseUtil.update(sql, user_id,article_id,content);
	}
	
	//查出评论
	public List<Discuss> showDiscuss(String article_id){
		String sql = "select * from discuss where article_id=?";
		List<Map<String, Object>> list = DataBaseUtil.queryForList(sql,article_id);
		List<Discuss> discusses = new ArrayList<Discuss>();
		for(Map<String, Object> map:list){
			Discuss discuss = new Discuss();
			for(String key:map.keySet()){
				if(key.equals("user_id")){
					String username = (String)DataBaseUtil.queryForMap("select username from user_test where uid=?", map.get(key)).get("username");
					discuss.setUser_id(username);
				}
				if(key.equals("article_id")){
					discuss.setArticle_id((String)map.get(key));
				}
				if(key.equals("createTime")){
					discuss.setCreateTime((Date)map.get(key));
				}
				if(key.equals("agree")){
					discuss.setAgree((Long)map.get(key));
				}
				if(key.equals("disagree")){
					discuss.setDisagree((Long)map.get(key));
				}
				if(key.equals("content")){
					discuss.setContent((String)map.get(key));
				}
			}
			discusses.add(discuss);
		}
		return discusses;
	}
}
