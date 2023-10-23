package service;

import java.util.List;
import java.util.Map;

import dto.Hospital;
import dto.Patient;
import dto.Reservation;

public interface ReservationService {
	
	List<Map<String, Object>> showReservation(String pidnum)throws Exception;
	Map<String,Object> detailRes(Integer id) throws Exception;

	void resUpdate(Reservation res) throws Exception;
	void updateComment(Reservation res) throws Exception;
	

	/* 예약 환자 정보*/
	Map<String,Object> patientResListSearch(String type,String keyword,Integer page, String comnum) throws Exception;
	/*오늘의 예약 */
	Map<String,Object> todayResListByPage(Integer page, String comnum)throws Exception;
	
	
	public Map<String,Object> selectAllResBycomnum(String comnum,Integer page) throws Exception;
	
	Map<String,Object> hrecordSearch (String type,String keyword,Integer page) throws Exception;
	
	List<String> timelist(Hospital hospital, String date) throws Exception;
	void insertReservation(Reservation reservation) throws Exception;
	
	Map<String,Object> resAllSearch(String type, String keyword, Integer page, String sdate, String edate, String comnum) throws Exception;
	Map<String,Object> resListByPage(String comnum,Integer page) throws Exception;
	List<String> resListByPidnum(String pidnum,String comnum) throws Exception;
	void updateDoccommentById(String id, String doccomment) throws Exception;
}
