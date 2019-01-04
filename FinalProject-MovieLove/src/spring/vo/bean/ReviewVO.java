package spring.vo.bean;

import java.sql.Timestamp;

public class ReviewVO {
	private String review_mvname;
	private String review_contents;
	private String review_rating;
	private String review_writer;
	private Timestamp review_date;
	
	public String getReview_mvname() {
		return review_mvname;
	}
	public void setReview_mvname(String review_mvname) {
		this.review_mvname = review_mvname;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public String getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(String review_rating) {
		this.review_rating = review_rating;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
}
