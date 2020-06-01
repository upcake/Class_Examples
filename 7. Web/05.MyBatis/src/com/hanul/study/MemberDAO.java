package com.hanul.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
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
	
	//회원 가입
	public int memberInsert(MemberDTO dto) {
		//SqlSessionFactory(sqlMapper)에서 session 활성화
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("memberInsert", dto); //insert SQL insert 쿼리 : memberMapper.xml
		session.commit();	//커밋
		session.close();	//session 비활성화
		return succ;
	} //memberInsert()
	
	//전체 회원 검색
	public List<MemberDTO> memberSearchAll() {
		SqlSession session = sqlMapper.openSession();
		//myBatis에서는 ArrayList가 아닌 List를 사용한다
		List<MemberDTO> list = null;
		//파라미터에 식별자 이름을 적는다. 
		list = session.selectList("memberSearchAll");
		session.close();
		return list;
	} //memberSearchAll()
	
	//회원 삭제
	public int memberDelete(String id) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.delete("memberDelete", id);
		session.commit();
		session.close();
		return succ;
	} //memberDelete()
	
	//ID 검색
	public MemberDTO getById(String id) {
		SqlSession session = sqlMapper.openSession();
		MemberDTO dto = null;
		//정보를 하나만 받을 때는 selectOne 사용
		dto = session.selectOne("getById", id);
		session.close();
		return dto;
	} //getById()
	
	//회원 정보 수정
	public int memberUpdate(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.update("memberUpdate", dto);
		session.commit();
		session.close();
		return succ;
	} //memberUpdate()
	
	//조건 검색
	public List<MemberDTO> memberSearch(String part, String searchData) {
		SqlSession session = sqlMapper.openSession();
		SearchDTO dto = new SearchDTO();
		dto.setPart(part);
		dto.setSearchData("%" + searchData + "%");	// LIKE절에 사용하기 때문에 앞뒤에 %%를 붙여준다.
		List<MemberDTO> list = null;
		list = session.selectList("memberSearch", dto);
		session.close();
		return list;
	}//memberSearch()
} //class