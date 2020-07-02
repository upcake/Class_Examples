package customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//어노테이션은 클래스를 객체로 생성하는 역할을 해줌
//@Component는 다용도, 특정역할이 있으면 역할군에 맞는 어노테이션을 사용한다.
@Repository	//저장소 역할을 하는 클래스를 객체로 만들때 사용
public class CustomDAO implements CustomerService {
	@Autowired private SqlSession sql;	
	//SqlSession : PreparedStatement와 표현 방법이 다를뿐 같은 기능을 한다.
	//Autowired : 메모리에 올려둔 주소들이 자동으로 연결 됨

	@Override
	public void customer_insert(CustomerVO vo) {
		sql.insert("customer.mapper.insert", vo);
	}

	@Override
	public List<CustomerVO> customer_list() {
		//customer.mapper라는 맵퍼에서 id가 list인 곳을 찾는다
		return sql.selectList("customer.mapper.list");
	}

	@Override
	public CustomerVO customer_detail(int id) {
		return sql.selectOne("customer.mapper.detail", id);
	}

	@Override
	public void customer_update(CustomerVO vo) {
		sql.update("customer.mapper.update", vo);
	}

	@Override
	public void customer_delete(int id) {
		sql.delete("customer.mapper.delete", id);
	}
}