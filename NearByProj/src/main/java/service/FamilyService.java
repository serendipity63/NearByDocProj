package service;


import java.util.List;
import java.util.Map;

import dto.Family;

public interface FamilyService {
	
	public String addFam (Family family, String pidnum) throws Exception;	
	public List<Map<String, Object>> famList(String pidnum) throws Exception; 
  Family selectFamily(String name) throws Exception;
  	public List<Family> familylist(String pidnum) throws Exception;
}
