package test;

import org.junit.Test;

import utils.DataBaseUtil;

public class TestArticle {
	
	@Test
	public void createArticle(){
		String sql = "insert into article_copy(header,name,content,	description,user_id,classify_id) values(?,?,?,?,?,?);";
		String header = "唐诗";
		String name = "床前明月光";
		String content = "我sdfsdfwefwqdsdf历程balabala我的java学习历程balabala";
		String description = "小学必备";
		String user_id = "2";
		String classify_id = "2";
		DataBaseUtil.update(sql, header,name,content,description,user_id,classify_id);
	}
	
	
}
