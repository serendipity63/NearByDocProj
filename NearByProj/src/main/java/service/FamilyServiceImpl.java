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
}
