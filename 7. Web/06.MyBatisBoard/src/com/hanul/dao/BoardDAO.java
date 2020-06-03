package com.hanul.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanul.dto.BoardDTO;

public class BoardDAO {
	//①SqlSessionFactory 설정
	private static SqlSessionFactory sqlMapper;
	static {
		String resource = "com/hanul/mybatis/SqlMapConfig.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception");
		}
	} //static
	
	//전체 목록 검색
	public List<BoardDTO> boardSearchAll() {
		SqlSession session = sqlMapper.openSession();
		List<BoardDTO> list = null;
		list = session.selectList("boardSearchAll");
		session.close();
		return list;
	} //boardSearchAll()
	
	//작성한 글 등록
	public int boardInsert(BoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		//alert 창을 사용할 경우에는 succ를 return 해야한다.
		//PrintWriter 이용한 script 코드로 구현한 후 처리
		int succ = 0;
		succ = session.insert("boardInsert", dto);
		session.commit();
		session.close();
		return succ;
	} //boardInsert()
	
	//글 번호로 글 검색
	public BoardDTO boardDetail(String b_num) {
		SqlSession session = sqlMapper.openSession();
		BoardDTO dto = null;
		dto = session.selectOne("boardDetail", b_num); //출력될 결과가 하나기 때문에 selectOne을 사용, 여러 개일 경우엔 selectList
		session.close();
		return dto;
	}
} //class