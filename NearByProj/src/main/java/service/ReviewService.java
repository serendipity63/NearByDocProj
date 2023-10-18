package service;

import java.util.List;
import java.util.Map;

import dto.Review;

public interface ReviewService {
	List<Map<String, Object>> reviewListByHos(String comnum) throws Exception;

	
	// 나의 리뷰 리스트
	List<Map<String, Object>> myReviews(String pidnum) throws Exception;
	void reviewDelete(Integer id) throws Exception;

	void insertReview(Review review) throws Exception;
	Map<String,Object> selectLastReview(String comnum) throws Exception;

}
