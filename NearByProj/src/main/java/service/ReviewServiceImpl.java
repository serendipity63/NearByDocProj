package service;

import java.util.List;
import java.util.Map;

import dao.ReviewDao;

public class ReviewServiceImpl implements ReviewService {
	private ReviewDao ReviewDao;
	@Override
	public List<Map<String, Object>> reviewListByHos(String comnum) throws Exception {
		return ReviewDao.reviewListByHos(comnum);
	}
}
