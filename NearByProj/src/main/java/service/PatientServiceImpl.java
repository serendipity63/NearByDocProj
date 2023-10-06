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

		return null;
	}

	@Override
	public void patientjoin(Patient patient) throws Exception {
		// TODO Auto-generated method stub

	}

}
