package spring.vo.bean;

public class RankingVO {
	private String RANK;     //박스오피스 순위
	private String TITLE;    //영화 제목
	private String AUDICNT;  //관객수
	private String AUDIACC;  //누적 관객수
	private String RATE;     //예매율
	private String DATE;     //기준 날짜
	
	public String getRANK() {
		return RANK;
	}
	public void setRANK(String rANK) {
		RANK = rANK;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getAUDICNT() {
		return AUDICNT;
	}
	public void setAUDICNT(String aUDICNT) {
		AUDICNT = aUDICNT;
	}
	public String getAUDIACC() {
		return AUDIACC;
	}
	public void setAUDIACC(String aUDIACC) {
		AUDIACC = aUDIACC;
	}
	public String getRATE() {
		return RATE;
	}
	public void setRATE(String rATE) {
		RATE = rATE;
	}
	public String getDATE() {
		return DATE;
	}
	public void setDATE(String dATE) {
		DATE = dATE;
	}
	
}
