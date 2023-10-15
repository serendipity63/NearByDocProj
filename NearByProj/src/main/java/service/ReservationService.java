package service;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	
	List<Map<String, Object>> showReservation(String pidnum)throws Exception;
	Map<String,Object> reservationListByPage(Integer page)throws Exception;
	Map<String,Object> hrecordSearch (String type,String keyword,Integer page) throws Exception;
	
}
