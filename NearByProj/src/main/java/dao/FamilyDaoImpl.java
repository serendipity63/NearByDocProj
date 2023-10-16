package dao;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class FamilyDaoImpl implements FamilyDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
}
