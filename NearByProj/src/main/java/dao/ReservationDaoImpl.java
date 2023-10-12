package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class ReservationDaoImpl implements ReservationDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<Map<String, Object>> selectMyReservation(String pidnum) throws Exception {
		System.out.println("Dao : " + pidnum);
		return sqlSession.selectList("mapper.reservation.selectMyReservation", pidnum);
		 
	}

	@Override
	public Integer cntMyReservation(String pidnum) throws Exception {
		return sqlSession.selectOne("mapper.reservation.cntMyReservation", pidnum);
	}


}
