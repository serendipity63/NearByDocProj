package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Patient;
import dto.Review;
import util.MybatisSqlSessionFactory;

public class ReviewDaoImpl implements ReviewDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
@Override
public List<Map<String, Object>> reviewListByHos(String comnum) throws Exception {
	return sqlSession.selectList("mapper.review.reviewListByHos",comnum);
}


// 나의 리뷰 리스트
@Override
public List<Map<String, Object>> myReviewListByid(String pidnum) throws Exception {
	return sqlSession.selectList("mapper.review.myReviewListByid",pidnum);
}

@Override
public void insertReview(Review review) throws Exception {
	sqlSession.insert("mapper.review.insertReview",review);
	sqlSession.update("mapper.review.updateReviewCnt",review);
	sqlSession.commit();
}
@Override
public Map<String,Object> selectLastReview(String comnum) throws Exception {
	
	return sqlSession.selectOne("mapper.review.selectLastReview",comnum);

}


@Override
public void deleteReview(Integer id) throws Exception {
	sqlSession.delete("mapper.review.deleteReview", id);
	sqlSession.commit();
	
}

}
