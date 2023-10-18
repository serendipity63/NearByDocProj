package dao;

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
	public Map<String, Object> selectMyDetailReservation(Map<String, Object> param) {
		return sqlSession.selectOne("mapper.reservation.selectMyDetailReservation", param);
	}
	
	@Override
	public Map<String, Object> selectFamDetailReservation(Map<String, Object> param) {
		return sqlSession.selectOne("mapper.reservation.selectFamDetailReservation", param);
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
	public List<Map<String,Object>> selectTodayReservation(Integer row) throws Exception {
		return sqlSession.selectList("mapper.reservation.selectTodayReservation",row);
	}

	@Override
	public Integer selectReservationCount() throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectReservationCount");
	}

	@Override
	public Reservation selectReservation(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectReservation",num);
	}

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
	
	@Override
	public Integer selectResCount(String comnum) throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectResCount",comnum);
	}
	
	@Override
	public Integer searchAllResCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.reservation.searchAllResCount",param);
	}
	
	@Override
	public List<Reservation> searchAllResList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.searchAllResList",param);
	}


	//예약 환자 정보
	@Override
	public Integer selectAllReservationCount() throws Exception {
		return sqlSession.selectOne("mapper.reservation.selectAllReservationCount");
	}


	@Override
	public List<Map<String, Object>> selectAllReservationList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.reservation.selectAllReservationList",row);
	}


	@Override
	public Integer searchReservationCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.reservation.searchReservationCount",param);
	}


	@Override
	public List<Map<String, Object>> searchReservationList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.reservation.searchReservationList",param);
	}

	

	

}
