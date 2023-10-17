package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Hospital;
import util.MybatisSqlSessionFactory;

public class HospitalDaoImpl implements HospitalDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public Hospital selectHospital(String comnum) throws Exception {
		return sqlSession.selectOne("mapper.hospital.selectHospital", comnum);
	}

	@Override
	public void insertHospital(Hospital hospital) throws Exception {
		sqlSession.insert("mapper.hospital.insertHospital", hospital);
		sqlSession.commit();

	}

	@Override
	public void updateHospital(Hospital hospital) throws Exception {
		sqlSession.update("mapper.hospital.updateHospital", hospital);
		sqlSession.commit();
	}

	@Override
	public List<Hospital> selectHospitalList(String department) throws Exception {

		return sqlSession.selectList("mapper.hospital.selectHospitalList",department);
	}
	
	@Override
	public void updateGrade(Map<String, String> param) throws Exception {
		sqlSession.update("mapper.hospital.updateGrade", param);
		sqlSession.commit();
		
	}
}
