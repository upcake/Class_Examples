package com.hanul.study;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	//기존 JDBC 모델에서는 Connection(DB 연결)을 먼저 만들었지만,
	//myBatis 경우 SqlSessionFactory 객체를 먼저 생성
	private static SqlSessionFactory sqlMapper;
	//스태틱 블록(초기화 블록) : 가장 먼저, 단 한번만 실행 되는 블록
	static {
		String resource = "com/hanul/mybatis/SqlMapConfig.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!!!");
		}
	} //static
} //class