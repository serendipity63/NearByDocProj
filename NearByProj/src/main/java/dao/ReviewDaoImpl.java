package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class ReviewDaoImpl implements ReviewDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
@Override
public List<Map<String, Object>> reviewListByHos(String comnum) throws Exception {
	return sqlSession.selectList("mapper.review.reviewListByHos");
}
}
