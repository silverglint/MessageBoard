package test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class TestProperties {
	public static void main(String[] args) {
		InputStream inputStream = TestProperties.class.getClassLoader().getResourceAsStream("jdbc.properties");
		Properties p = new Properties();
		try {
			p.load(inputStream);
			System.out.println(p.getProperty("db.username"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
