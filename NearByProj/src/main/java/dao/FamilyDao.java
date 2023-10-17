package dao;


import java.util.List;
import java.util.Map;

import dto.Family;

public interface FamilyDao {
	
	//가족 구성원 추가
	public void addFamily(Family family) throws Exception;
	//가족 구성원 조회
	public List<Map<String, Object>> selecetMyFamily(String pidnum) throws Exception; 
  
  Family selectFamily(String name) throws Exception;
  	public List<Family> selectFamilyList(String pidnum) throws Exception;
}
