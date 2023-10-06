package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Hospital;
import util.MybatisSqlSessionFactory;

public class HospitalDaoImpl implements HospitalDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public Hospital selectHospital(String hemail) throws Exception {
		return sqlSession.selectOne("mapper.hospital.selectHospital", hemail);
	}

	@Override
	public void insertHospital(Hospital hospital) throws Exception {
		sqlSession.insert("mapper.member.insertHospital", hospital);
		sqlSession.commit();
	}

}
