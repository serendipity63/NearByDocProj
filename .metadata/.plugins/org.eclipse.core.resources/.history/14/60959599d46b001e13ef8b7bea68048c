package service;

import java.util.List;
import java.util.Map;

import dto.Hospital;
import dto.Reservation;

public interface ReservationService {
	
	List<Map<String, Object>> showReservation(String pidnum)throws Exception;
	Map<String,Object> reservationListByPage(Integer page)throws Exception;
	Map<String,Object> hrecordSearch (String type,String keyword,Integer page) throws Exception;
	
	List<String> timelist(Hospital hospital) throws Exception;
	void insertReservation(Reservation reservation) throws Exception;
}
