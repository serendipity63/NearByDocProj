package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.ReviewDao;
import dao.ReviewDaoImpl;
import dto.Hospital;
import dto.Review;

public class ReviewServiceImpl implements ReviewService {
	private ReviewDao reviewDao;
	public ReviewServiceImpl() {
		reviewDao= new ReviewDaoImpl();
	}
	@Override
	public List<Map<String, Object>> reviewListByHos(String comnum) throws Exception {
		return reviewDao.reviewListByHos(comnum);
	}
	@Override

	public List<Map<String, Object>> myReviews(String pidnum) throws Exception {
		return reviewDao.myReviewListByid(pidnum);
	}

	public void insertReview(Review review) throws Exception {
		reviewDao.insertReview(review);
	}
	@Override
	public Map<String,Object> selectLastReview(String comnum) throws Exception {
		return reviewDao.selectLastReview(comnum);
	}
	@Override
	public void reviewDelete(Integer id) throws Exception {
		reviewDao.deleteReview(id);
		
	}
}

