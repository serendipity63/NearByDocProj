package dao;

import java.util.List;
import java.util.Map;

public interface ReviewDao {
	List<Map<String, Object>> reviewListByHos(String comnum) throws Exception;
	
	// 나의 리뷰 리스트  
	List<Map<String, Object>> myReviewListByid(String pidnum) throws Exception;
}
