package dao;

import java.util.List;
import java.util.Map;

import dto.Reservation;

public interface ReservationDao {
	
	List<Map<String, Object>> selectMyReservation(String pidnum)throws Exception;
	Integer cntMyReservation(String pidnum)throws Exception;
	List<Reservation>selectTodayReservation(Integer row) throws Exception;
	Integer selectReservationCount() throws Exception;
	Reservation selectReservation(Integer num) throws Exception;
	
	Integer searchHRecordCount(Map<String,Object>param) throws Exception;
	List<Reservation> searchHRecordList(Map<String,Object>param) throws Exception;
}
