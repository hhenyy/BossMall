package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.MasterNoticeDao;
import boss.model.MasterNotice;

@Service
public class MasterNoticeService {
	
	@Autowired
	MasterNoticeDao dao;

	public int totalCount() {

		return dao.totalCount();
	}

	public List<MasterNotice> noticeList(PagePgm page) {

		return dao.noticeList(page);
	}

	public int noticeInsert(MasterNotice notice) {

		return dao.noticeInsert(notice);
	}

	public void noticeDelete(int mnId) {

		dao.noticeDelete(mnId);
	}

	public void updateMnReadCount(int i) {

		dao.updateMnReadCount(i);
	}

	public MasterNotice selectOne(int mnId) {

		return dao.selectOne(mnId);
	}

	public void masterNoticeUpdate(MasterNotice mn) {

		dao.masterNoticeUpdate(mn);
	}

	public int noticeCount(String keyword) {

		return dao.noticeCount(keyword);
	}

	public List<MasterNotice> noticeSearchList(PagePgm pp) {

		return dao.noticeSearchList(pp);
	}

	public int noticeMax() {

		return dao.noticeMax();
	}

	public MasterNotice selectMove(int rnum) {
		
		return dao.selectMove(rnum);
	}

	
 
}
