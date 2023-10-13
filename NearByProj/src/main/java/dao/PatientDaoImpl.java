package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Patient;
import util.MybatisSqlSessionFactory;

public class PatientDaoImpl implements PatientDao {

	SqlSession sqlSession= MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public Patient selectPatient(String pidnum) throws Exception {
		return sqlSession.selectOne("mapper.patient.selectPatient",pidnum);
	}

	@Override
	public void insertPatient(Patient patient) throws Exception {
		sqlSession.insert("mapper.patient.insertPatient",patient);
		sqlSession.commit();

	}

	@Override
	public List<Patient> selectPatientList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.patient.selectPatientList,row");
	}

	@Override
	public Integer selectPatientCount() throws Exception {
		return sqlSession.selectOne("mapper.patient.selectPatientCount");
	}

	@Override
	public List<Patient> searchPatientList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.patient.searchPatientList",param);
	}

	@Override
	public Integer searchPatientCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.patient.searchPatientCount",param);
	}

	@Override
	public Patient selectPatientByPidnum(String pidnum) throws Exception {
		return sqlSession.selectOne("mapper.patient.selectPatientByPidnum",pidnum);
	}

}
