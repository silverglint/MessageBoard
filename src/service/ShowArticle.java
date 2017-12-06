package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import entity.Article;
import utils.DataBaseUtil;

public class ShowArticle {
	
	
	public ShowArticle(){
		
	}
	
	public Article selectArticle(String id){
		String sql = "select name,content,createTime,lastUpdate,user_id,classify_id from article_copy where uid=?";
		Map<String, Object> map = DataBaseUtil.queryForMap(sql, id);
		Article article = new Article();
		for(String key:map.keySet()){
			if(key.equals("name")){
				article.setName((String)map.get(key));
			}
			if(key.equals("content")){
				article.setContent((String)map.get(key));
			}
			if(key.equals("user_id")){
				String username = (String)DataBaseUtil.queryForMap("select username from user_test where uid=?", map.get(key)).get("username");
				article.setUser_id(username);
			}
			if(key.equals("classify_id")){
				String classify_id = (String)DataBaseUtil.queryForMap("select name from classify where uid=?", map.get(key)).get("name");
				article.setClassify_id(classify_id);
			}
			if(key.equals("createTime")){
				article.setCreateTime((Date)map.get(key));
			}
			if(key.equals("lastUpdate")){
				article.setLastUpdate((Date)map.get(key));
			}
		}
		
		return article;
	}
	
	
	public List<Article> showArticle(Object classify_id,Object start,Object end){
		String sql = "select uid,header,name,user_id,description,createTime,lastUpdate from article_copy where classify_id = ? and deleted = 0 order by lastUpdate desc limit ?,?";
		List<Map<String, Object>> list = DataBaseUtil.queryForList(sql, classify_id,start,end);
		List<Article> articles = new ArrayList<Article>();
		for(Map<String, Object> map:list){
			Article article = new Article();
			for(String key:map.keySet()){
				if(key.equals("uid")){
					article.setUid(String.valueOf(map.get(key)));
				}
				if(key.equals("header")){
					article.setHeader((String)map.get(key));
				}
				if(key.equals("name")){
					article.setName((String)map.get(key));
				}
				if(key.equals("user_id")){
					String username = (String)DataBaseUtil.queryForMap("select username from user_test where uid=?", map.get(key)).get("username");
					article.setUser_id(username);
				}
				if(key.equals("description")){
					article.setDescription((String)map.get(key));
				}
			}
			articles.add(article);
		}
		return articles;
	}
}
