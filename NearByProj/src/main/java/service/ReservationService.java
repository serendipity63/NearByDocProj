package service;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	
	List<Map<String, Object>> showReservation(String pidnum)throws Exception;

}
