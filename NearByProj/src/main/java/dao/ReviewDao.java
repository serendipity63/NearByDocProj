package dao;

import java.util.List;
import java.util.Map;

import dto.Review;

public interface ReviewDao {
	List<Map<String, Object>> reviewListByHos(String comnum) throws Exception;

	
	// 나의 리뷰 리스트  
	List<Map<String, Object>> myReviewListByid(String pidnum) throws Exception;

	void insertReview(Review review) throws Exception;
	Map<String,Object> selectLastReview(String comnum) throws Exception;
	void deleteReview(Integer id) throws Exception;

}
