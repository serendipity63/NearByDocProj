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
	public void addFam(Family family) throws Exception {
		familyDao.addFamily(family);
		
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
