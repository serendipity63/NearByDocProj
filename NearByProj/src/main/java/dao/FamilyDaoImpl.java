package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Family;
import util.MybatisSqlSessionFactory;

public class FamilyDaoImpl implements FamilyDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public Family selectFamily(String name) throws Exception {
		return sqlSession.selectOne("mapper.family.selectFamily", name);
	}
}
