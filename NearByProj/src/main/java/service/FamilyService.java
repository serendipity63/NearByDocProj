package service;

import java.util.List;
import java.util.Map;

import dto.Family;

public interface FamilyService {
	
	public void addFam (Family family) throws Exception;	
	public List<Map<String, Object>> famList(String pidnum) throws Exception; 

}
