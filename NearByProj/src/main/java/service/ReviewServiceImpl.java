package service;

import java.util.List;
import java.util.Map;

import dao.ReviewDao;
import dao.ReviewDaoImpl;

public class ReviewServiceImpl implements ReviewService {
	private ReviewDao reviewDao;
	public ReviewServiceImpl() {
		reviewDao= new ReviewDaoImpl();
	}
	@Override
	public List<Map<String, Object>> reviewListByHos(String comnum) throws Exception {
		return reviewDao.reviewListByHos(comnum);
	}
}
