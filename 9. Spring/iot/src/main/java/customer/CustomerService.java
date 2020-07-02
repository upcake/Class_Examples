package customer;

import java.util.List;

public interface CustomerService {
	//CRUD(Create/Read/Update/Delete)
	//인터페이스이므로 기본적으로 abstract 속성이 붙어서 추상 메서드가 된다.
	//고객 정보 삽입 저장
	void customer_insert(CustomerVO vo);
		
	//목록 조회
	List<CustomerVO> customer_list();
	
	//상세(1건) 조회
	CustomerVO customer_detail(int id);
	
	//고객 정보 변경 저장
	void customer_update(CustomerVO vo);
	
	//고객 정보 삭제
	void customer_delete(int id);
}