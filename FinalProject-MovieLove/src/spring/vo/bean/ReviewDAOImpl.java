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
		
		System.out.println("영화 제목: "+vo.getREVIEW_TITLE());
		System.out.println("리뷰 내용: "+vo.getREVIEW_CONTENTS());
		System.out.println("평점: "+vo.getREVIEW_RATING());
		System.out.println("작성자: "+vo.getREVIEW_WRITER());
		System.out.println("작성날짜: "+vo.getREVIEW_DATE());
	}
}