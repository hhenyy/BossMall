package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.MasterMemberDao;
import boss.model.Member;

@Service
public class MasterMemberService {

	@Autowired
	private MasterMemberDao dao;

	public Member selectOne(String id) {
		return dao.selectOne(id);
	}

	public int total() {
		return dao.total();
	}

	public List<Member> list(PagePgm pp) {
		return dao.list(pp);
	}

	public int update(Member member) {
		return dao.update(member);
	}

	// 상품 전체 삭제('Y') 업데이트
	public int deleteMember(List<String> midList) {

		return dao.deleteMember(midList);
	}

}
