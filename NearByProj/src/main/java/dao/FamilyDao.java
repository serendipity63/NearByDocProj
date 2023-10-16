package dao;

import dto.Family;

public interface FamilyDao {
	Family selectFamily(String name) throws Exception;
}
