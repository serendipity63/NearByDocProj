package service;

import java.util.List;
import java.util.Map;

import dao.FamilyDao;
import dao.FamilyDaoImpl;
import dto.Family;

public class FamilyServiceImpl implements FamilyService {
	private FamilyDao familyDao;

	
	public FamilyServiceImpl() {
		familyDao = new FamilyDaoImpl();
	}
	

	@Override
	public String addFam(Family family, String pidnum) throws Exception {
		if(!(family.getFidnum().equals(pidnum))) {
			familyDao.addFamily(family);
			return "can"; 
		}
		return "cant";
		
	}


	@Override
	public List<Map<String, Object>> famList(String pidnum) throws Exception {
		return familyDao.selecetMyFamily(pidnum);
  }

	@Override
	public Family selectFamily(String name) throws Exception {
		return familyDao.selectFamily(name);

	}
	
	@Override
	public List<Family> familylist(String pidnum) throws Exception {
		return familyDao.selectFamilyList(pidnum);
	}


	@Override
	public void editFam(String fname) throws Exception {
		familyDao.deleteFamily(fname);
		
	}


	@Override
	public void famUpdate(Family family) throws Exception {
		System.out.println("ServiceImpl -----------");
		System.out.println("fname : " + family.getFname());
		System.out.println("ftel : " + family.getFtel());
		System.out.println("faddress : " + family.getFaddress());
		System.out.println("fidnum : " + family.getFidnum());
		familyDao.famInfoUpdate(family);
		
	}
}
