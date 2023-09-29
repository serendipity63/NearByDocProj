//mybatis-config 에서 설정한후 여기서 최종 클래스 완료
package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisSqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
			String resource="resource/mybatis-config.xml";  
			InputStream inputStream=Resources.getResourceAsStream(resource);      //경로를 삽입스트림
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);	//스트림을 빌드
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}
