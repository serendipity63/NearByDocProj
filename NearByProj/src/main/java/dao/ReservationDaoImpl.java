package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Reservation;
import util.MybatisSqlSessionFactory;

public class ReservationDaoImpl implements ReservationDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<Map<String, Object>> selectMyReservation(String pidnum) throws Exception {
		System.out.println("Dao : " + pidnum);
		return sqlSession.selectList("mapper.reservation.selectMyReservation", pidnum);
		 
	}
	
	
	@Override
	public String findById(Integer id) throws Exception {
		return sqlSession.selectOne("mapper.reservation.findById", id);
	}
	
	@Override
	public Map<String, Object> selectMyDetailReservation(Integer id,String pidnum) {
		System.out.println("Enter Dao---------------");
		System.out.println(id);
		System.out.println(pidnum);
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pidnum", pidnum);
		
		System.out.println("Go xml---------------");
		System.out.println(map.get("id"));
		System.out.println(map.get("pidnum"));
		
		return sqlSession.selectOne("mapper.reservation.selectMyDetailReservation",map);
	}

	@Override
	public void statusUpdate(Reservation res) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.reservation.statusUpdate",res);
		sqlSession.commit();
	}
	
	@Override
	public void commentUpdate(Reservation res) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.reservation.commentUpdate",res);
		sqlSession.commit();
	}
	
	
	@Override
	public Integer cntMyReservation(String pidnum) throws Exception {
		return sqlSession.selectOne("mapper.reservation.cntMyReservation", pidnum);
	}
	//오늘의 예약 내역
	@Override
	public List<Map<String,Object>> selectTodayReservationList(Map<String,Object> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.selectTodayReservationList",param);
	}

	@Override
	public Integer selectTodayResCount(String comnum) throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectTodayResCount",comnum);
	}
	// 진료 기록 조회
	@Override
	public Integer searchHRecordCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.reservation.searchHRecordCount",param);
	}

	@Override
	public List<Reservation> searchHRecordList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.searchHRecordList",param);
	}
	@Override
	public void insertReservation(Reservation reservation) throws Exception {
		sqlSession.insert("mapper.reservation.insertReservation",reservation);
		sqlSession.commit();
	}

	
	@Override
	public List<String> resTimeList(Map<String, String> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.searchResTimeList",param);
	}

	
	@Override
	public List<Reservation> selectAllResBycomnum(String comnum) throws Exception {
		return sqlSession.selectList("mapper.reservation.selectAllResBycomnum",comnum);
	}
	
	   //전체 예약 조회
	 @Override
	   public Integer searchAllResCount(Map<String, Object> param) throws Exception {

	         return sqlSession.selectOne("mapper.reservation.searchAllResCount",param);
	   }
	   
	   @Override
	   public List<HashMap<String,String>> searchAllResList(Map<String, Object> param) throws Exception {

	         return sqlSession.selectList("mapper.reservation.searchAllResList",param);
	   }
	   @Override
	   public Integer selectResCount(String comnum) throws Exception {
	      return sqlSession.selectOne("mapper.reservation.selectResCount",comnum);
	   }
	   @Override
	   public List<Map<String, Object>> selectResList(Map<String,Object> param) throws Exception {
	      return sqlSession.selectList("mapper.reservation.selectResList", param);
	   }



	//예약 환자 정보
	@Override
	public Integer selectAllReservationCount(Map<String,Object> param) throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectAllReservationCount", param);
	}


	@Override
	public List<Map<String, Object>> selectAllReservationList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.selectAllReservationList",param);
	}


	@Override
	public Integer searchReservationCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.reservation.searchReservationCount",param);
	}


	@Override
	public List<Map<String, Object>> searchReservationList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.searchReservationList",param);
	}


	@Override
	public List<Object> selectResByName(String pname) throws Exception {
		
		return sqlSession.selectList("mapper.reservation.selectResByName", pname);
	}


	@Override
	public void updateStatusCuzQuit(Integer id) throws Exception {
		sqlSession.update("mapper.reservation.updateStatusCuzQuit",id);
		sqlSession.commit();
		
	}


	@Override
	public List<Integer> selectIdByName(String pname) throws Exception {
		
		return sqlSession.selectList("mapper.reservation.selectIdByName", pname);
	}

	@Override
	public List<String> resListByPidnum(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.resListByPidnum", param);
	}

	@Override
	public void updateDoccommentById(Map<String, Object> param) throws Exception {
		sqlSession.update("mapper.reservation.updateDoccommentById",param);
		sqlSession.commit();
	}
	
	@Override
	public String selectCurTime() throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectCurTime");
	}
	
	@Override
	public String selectToday() throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectToday");
	}

}
