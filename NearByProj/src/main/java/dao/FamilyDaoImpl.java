package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Family;
import util.MybatisSqlSessionFactory;

public class FamilyDaoImpl implements FamilyDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();


	@Override
	public void addFamily(Family family) throws Exception {
		sqlSession.insert("mapper.family.addFamily",family);
		sqlSession.commit();
		
	}

	@Override
	public List<Map<String, Object>> selecetMyFamily(String pidnum) throws Exception {
		return sqlSession.selectList("mapper.family.selecetMyFamily",pidnum);
  }

	@Override
	public Family selectFamily(String name) throws Exception {
		return sqlSession.selectOne("mapper.family.selectFamily", name);

	}
	
	@Override
	public List<Family> selectFamilyList(String pidnum) throws Exception {
		return sqlSession.selectList("mapper.family.selectFamilyList",pidnum);
	}
}
