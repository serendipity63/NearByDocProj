package service;

import dao.HospitalDao;
import dao.HospitalDaoImpl;
import dto.Hospital;

public class HospitalServiceImpl implements HospitalService {
	private HospitalDao hospitalDao;
	
	public HospitalServiceImpl() {
		hospitalDao= new HospitalDaoImpl();
	}
	@Override
	public void HospitalModify(Hospital hospital) throws Exception {
		
		
	}

}
