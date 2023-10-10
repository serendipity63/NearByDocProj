package service;

import dao.PatientDao;
import dao.PatientDaoImpl;
import dto.Patient;

public class PatientServiceImpl implements PatientService {
	private PatientDao patientDao;

	public PatientServiceImpl() {
		patientDao = new PatientDaoImpl();
	}

	@Override
	public Patient login(String pemail, String ppassword) throws Exception {
		Patient patient = patientDao.selectPatient(pemail);
		if (patient == null)
			throw new Exception("이메일틀림");
		if (patient.getPpassword().equals(ppassword) == false)
			throw new Exception("비밀번호 오류");

		return patient;
	}

	@Override
	public void patientjoin(Patient patient) throws Exception {
		Patient spatient = patientDao.selectPatient(patient.getPemail());
		if (spatient != null)
			throw new Exception("이메일 중복오류");
		patientDao.insertPatient(patient);
	}

	@Override
	public String pemailcheck(String pemail) throws Exception {
		Patient patient = patientDao.selectPatient(pemail);
		if (patient == null)
			return "notexist";

		return "exist";
	}

}
