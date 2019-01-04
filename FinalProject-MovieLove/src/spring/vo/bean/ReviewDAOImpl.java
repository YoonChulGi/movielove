package spring.vo.bean;

import spring.vo.bean.ReviewVO;
import spring.vo.bean.ReviewDAO;
import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDAOImpl implements ReviewDAO{
	
	private SqlSessionTemplate sqlSession = null;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertArticle(ReviewVO vo) throws Exception {
		sqlSession.insert("review.insertReview", vo);
		
		System.out.println("영화 제목: "+vo.getReview_mvname());
		System.out.println("리뷰 내용: "+vo.getReview_contents());
		System.out.println("평점: "+vo.getReview_rating());
		System.out.println("작성자: "+vo.getReview_writer());
		System.out.println("작성날짜: "+vo.getReview_date());
	}
}