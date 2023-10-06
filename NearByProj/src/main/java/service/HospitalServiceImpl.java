package service;

import dao.HospitalDao;
import dao.HospitalDaoImpl;
import dto.Hospital;

public class HospitalServiceImpl implements HospitalService {
	private HospitalDao hospitalDao;

	public HospitalServiceImpl() {
		hospitalDao = new HospitalDaoImpl();

	}

	@Override
	public Hospital login(String hemail, String hpassword) throws Exception {
		Hospital hospital = hospitalDao.selectHospital(hemail);
		if (hospital == null)
			throw new Exception("이메일틀림");
		if (hospital.getHpassword().equals(hpassword) == false)
			throw new Exception("비밀번호 오류");
		return hospital;
	}

	@Override
	public void Hospitaljoin(Hospital hospital) throws Exception {
		Hospital shospital = hospitalDao.selectHospital(hospital.getHemail());
		if (shospital != null)
			throw new Exception("이메일 중복오류");
		hospitalDao.insertHospital(hospital);

	}

}
