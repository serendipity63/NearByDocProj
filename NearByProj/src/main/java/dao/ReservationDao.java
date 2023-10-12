package dao;

import java.util.List;
import java.util.Map;

public interface ReservationDao {
	
	List<Map<String, Object>> selectMyReservation(String pidnum)throws Exception;
	Integer cntMyReservation(String pidnum)throws Exception;

}
