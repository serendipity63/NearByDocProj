package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Patient;
import util.MybatisSqlSessionFactory;

public class PatientDaoImpl implements PatientDao {

	SqlSession sqlSession= MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public Patient selectPatient(String pemail) throws Exception {
		return sqlSession.selectOne("mapper.patient.selectPatient",pemail);
	}

	@Override
	public void insertPatient(Patient patient) throws Exception {
		sqlSession.insert("mapper.patient.insertPatient",patient);
		sqlSession.commit();

	}

	@Override
	public List<Patient> selectPatientList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.patient.selectPatientList",row);
	}

	@Override
	public Integer selectPatientCount() throws Exception {
		return sqlSession.update("mapper.patient.selectPatientCount");
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

	@Override

	public void updatePatient(Patient patient) throws Exception {
		
		System.out.println("Dao ----------------");
		System.out.println(patient.getPname());
		System.out.println(patient.getPtel());
		System.out.println(patient.getPemail());
		System.out.println(patient.getPpassword());
		System.out.println(patient.getProadaddress());
		System.out.println(patient.getPidnum());
		
		
		sqlSession.update("mapper.patient.updatePatient", patient);
		sqlSession.commit();
		
	}

	@Override
	public void deletePatient(String pidnum) throws Exception {
		System.out.println("Impl : " +pidnum);
		sqlSession.update("mapper.patient.deletePatient",pidnum);
		sqlSession.commit();
	}
	
	
	@Override
	public Patient selectPatientByname(String pname) throws Exception {
		return sqlSession.selectOne("mapper.patient.selectPatientByname",pname);
	}


	@Override
	public List<Map<String, Object>> selecetMyFamily(String pidnum) throws Exception {
		
		return sqlSession.selectList("mapper.patient.selecetMyFamily",pidnum);
	}

	@Override
	public void addFamily(Patient patient) throws Exception {
		sqlSession.insert("mapper.patient.addFamily",patient);
		sqlSession.commit();
		
	}

	@Override
	public void deleteFamily(String pname) throws Exception {
		sqlSession.delete("mapper.patient.deleteFamily",pname);
		sqlSession.commit();
		
	}

	@Override
	public void famInfoUpdate(Patient patient) throws Exception {
		System.out.println("DaoImpl -----------");
		System.out.println("pname : " + patient.getPname());
		System.out.println("ptel : " + patient.getPtel());
		System.out.println("Proadaddress : " + patient.getProadaddress());
		System.out.println("pidnum : " + patient.getPidnum());
		
		sqlSession.update("mapper.patient.famInfoUpdate",patient);
		sqlSession.commit();
		
	}

	
	@Override
	public List<Patient> patientListBypidnum(String pidnum) throws Exception {
		return sqlSession.selectList("mapper.patient.patientListBypidnum", pidnum);
	}

}
