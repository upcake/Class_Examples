package com.hanul.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanul.dto.BoardDTO;
import com.hanul.dto.SearchDTO;

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
		//PrintWriter 이용한 script 코드로 구현한 후 페이지 전환 처리
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
	} //boardDetail()
	
	//조회수 증가
	public void boardCount(String b_num) {
		SqlSession session = sqlMapper.openSession();
		session.update("boardCount", b_num);
		session.commit();
		session.close();
	} //boardCount()
	
	//글 삭제
	public void boardDelete(String b_num) {
		SqlSession session = sqlMapper.openSession();
		//alert 창을 사용하지 않을 경우에는 succ가 필요없다.
		//ActionForward를 이용한 페이지 전환
		session.delete("boardDelete", b_num);
		session.commit();
		session.close();
	} //boardDelte()
	
	//글 수정
	public void boardUpdate(BoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		session.update("boardUpdate", dto);
		session.commit();
		session.close();
	}//boardUpdate()
	
	//조건 검색
	public List<BoardDTO> boardSearch(SearchDTO dto) {
		SqlSession session = sqlMapper.openSession();
		//검색 결과가 아예 없을수도 있고 정확히 몇개인지 모르니 List로 받는다.
		List<BoardDTO> list = null;
		list = session.selectList("boardSearch", dto);
		session.close();
		return list;
	} //boardSearch()
} //class