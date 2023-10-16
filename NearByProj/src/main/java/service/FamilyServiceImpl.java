package service;

import dao.FamilyDao;
import dto.Family;

public class FamilyServiceImpl implements FamilyService {
	private FamilyDao familyDao;
	@Override
	public Family selectFamily(String name) throws Exception {
		return familyDao.selectFamily(name);
	}
}
