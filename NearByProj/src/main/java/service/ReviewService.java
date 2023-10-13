package service;

import java.util.List;
import java.util.Map;

import dto.Review;

public interface ReviewService {
	List<Map<String, Object>> reviewListByHos(String comnum) throws Exception;
	void insertReview(Review review) throws Exception;
	Map<String,Object> selectLastReview(String comnum) throws Exception;
}
