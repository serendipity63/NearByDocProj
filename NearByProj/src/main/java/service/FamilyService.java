package service;

import dto.Family;

public interface FamilyService {
	Family selectFamily(String name) throws Exception;
}
