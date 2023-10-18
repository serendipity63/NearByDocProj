package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Hospital;
import dto.Reservation;

public interface ReservationDao {
	
	List<Map<String, Object>> selectMyReservation(String pidnum)throws Exception;
	String findById(Integer id) throws Exception;
	Map<String, Object> selectMyDetailReservation(Map<String, Object> param);
	Map<String, Object> selectFamDetailReservation(Map<String, Object> param);

	void statusUpdate(Reservation res) throws Exception;
	void commentUpdate(Reservation res) throws Exception;


	Integer cntMyReservation(String pidnum)throws Exception;

	
	/* 예약환자정보 */
	//예약 환자 전체 데이터 수
	Integer selectAllReservationCount()throws Exception;
	//예약 환자 전체 조회
	List<Map<String,Object>> selectAllReservationList(Integer row) throws Exception;
	//예약 환자 조건 검색 데이터 수
	Integer searchReservationCount(Map<String,Object> param ) throws Exception;
	//예약 환자 조건 검색
	List<Map<String,Object>> searchReservationList(Map<String,Object> param)throws Exception;
	
	/*오늘의 예약 내역 */
	List<Reservation>selectTodayReservation(Integer row) throws Exception;
	Integer selectReservationCount() throws Exception;
	Reservation selectReservation(Integer num) throws Exception;
	
	/* 진료기록 */
	Integer searchHRecordCount(Map<String,Object>param) throws Exception;
	List<Reservation> searchHRecordList(Map<String,Object>param) throws Exception;
	void insertReservation(Reservation reservation) throws Exception;

	List<String> resTimeList(Map<String,String> param) throws Exception;
	List<Reservation> selectAllResBycomnum(String comnum) throws Exception;
	Integer selectResCount(String comnum) throws Exception;
	
	Integer searchAllResCount(Map<String,Object> param) throws Exception;
	
	List<Reservation>searchAllResList(Map<String,Object> param) throws Exception;
	
}
