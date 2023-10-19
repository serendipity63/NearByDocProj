package service;

import java.util.List;
import java.util.Map;

import dto.Hospital;
import dto.Reservation;

public interface ReservationService {
	
	List<Map<String, Object>> showReservation(String pidnum)throws Exception;
	Map<String,Object> detailRes(Map<String, Object> param) throws Exception;
	
	
	Map<String,Object> reservationListByPage(Integer page)throws Exception;
	Map<String,Object> hrecordSearch (String type,String keyword,Integer page) throws Exception;
	
	List<String> timelist(Hospital hospital, String date) throws Exception;
	void insertReservation(Reservation reservation) throws Exception;
	public Map<String,Object> selectAllResBycomnum(String comnum,Integer page) throws Exception;
}
