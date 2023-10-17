package dao;

import java.util.List;
import java.util.Map;

import dto.Hospital;
import dto.Reservation;

public interface ReservationDao {
	
	List<Map<String, Object>> selectMyReservation(String pidnum)throws Exception;
	String checkFamily(Object pidnum) throws Exception;
	Map<String, Object> selectDetailReservation(Map<String, Object> param);
	
	
	Integer cntMyReservation(String pidnum)throws Exception;
	List<Reservation>selectTodayReservation(Integer row) throws Exception;
	Integer selectReservationCount() throws Exception;
	Reservation selectReservation(Integer num) throws Exception;
	
	Integer searchHRecordCount(Map<String,Object>param) throws Exception;
	List<Reservation> searchHRecordList(Map<String,Object>param) throws Exception;
	
	void insertReservation(Reservation reservation) throws Exception;

	List<String> resTimeList(Map<String,String> param) throws Exception;

}
