package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Reservation;

public interface ReservationDao {
	
	List<Map<String, Object>> selectMyReservation(String pidnum)throws Exception;
	String findById(Integer id) throws Exception;
	Map<String, Object> selectMyDetailReservation(Integer id, String pidnum);

	void statusUpdate(Reservation res) throws Exception;
	void commentUpdate(Reservation res) throws Exception;


	Integer cntMyReservation(String pidnum)throws Exception;

	
	/* 예약환자정보 */
	//예약 환자 전체 데이터 수
	Integer selectAllReservationCount(Map<String, Object> param)throws Exception;
	//예약 환자 전체 조회
	List<Map<String,Object>> selectAllReservationList(Map<String, Object> param) throws Exception;
	//예약 환자 조건 검색 데이터 수
	Integer searchReservationCount(Map<String,Object> param ) throws Exception;
	//예약 환자 조건 검색
	List<Map<String,Object>> searchReservationList(Map<String,Object> param)throws Exception;
	
	/*오늘의 예약 내역 */
	List<Map<String,Object>>selectTodayReservationList(Map<String,Object> param) throws Exception;
	Integer selectTodayResCount(String comnum) throws Exception;
	
	
	/* 진료기록 */
	Integer searchHRecordCount(Map<String,Object>param) throws Exception;
	List<Reservation> searchHRecordList(Map<String,Object>param) throws Exception;
	void insertReservation(Reservation reservation) throws Exception;

	List<String> resTimeList(Map<String,String> param) throws Exception;
	List<Reservation> selectAllResBycomnum(String comnum) throws Exception;

	
	Integer searchAllResCount(Map<String,Object> param) throws Exception;
	
	List<HashMap<String,String>> searchAllResList(Map<String,Object> param) throws Exception;
	Integer selectResCount(String comnum) throws Exception;
	List<Map<String,Object>> selectResList(Map<String,Object> param) throws Exception;
	List<Object> selectResByName(String pname) throws Exception;
	void updateStatusCuzQuit(Integer id) throws Exception;
	List<Integer> selectIdByName(String pname) throws Exception;
	List<String> resListByPidnum(Map<String, Object> param) throws Exception;
	void updateDoccommentById(Map<String, Object> param) throws Exception;
	String selectCurTime() throws Exception;
	String selectToday() throws Exception;
}
