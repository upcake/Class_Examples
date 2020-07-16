package common;

public class PageVO {
	private int pageList = 10; //페이지당 목록수
	private int blockPage = 10; //블럭당 페이지수
	private int totalList; //총목록수
	private int totalPage; //총페이지수
	//157 페이지 = 총목록수/페이지당 목록수 + 나머지가 있으면+1
	private int totalBlock; //총블럭수
	//16 블럭 = 총페이지수/블럭당 페이지수 + 나머지가 있으면+1
	private int curPage; //현재페이지번호
	private int beginList, endList; //현재페이지의 시작/끝 목록번호
	private int beginPage, endPage; //현재블럭의 시작/끝 페이지번호
	
	public int getPageList() {
		return pageList;
	}
	public void setPageList(int pageList) {
		this.pageList = pageList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getTotalList() {
		return totalList;
	}
	public void setTotalList(int totalList) {
		this.totalList = totalList;
		
		//총페이지수=총목록수/페이지당보여질목록수
		//576/10 --> 57 ..6 -> 58페이지
		totalPage = totalList / pageList;
		if( totalList % pageList >0 ) ++totalPage;
		
		//총블럭수=총페이지수/블럭당보여질페이지수
		//58/10 --> 5..8 -> 6블럭
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage > 0 ) ++totalBlock;
		
		//시작/끝 목록번호
		//끝목록번호: 576, 566, 556, 
		endList = totalList - (curPage-1) * pageList;
		//시작목록번호: 567, 557, 547, 
		//= 끝목록번호 - (페이지당보여질목록수-1) 
		beginList = endList - (pageList-1);
		
		//현재 블럭번호 
		curBlock = curPage / blockPage;
		if( curPage % blockPage > 0 ) ++curBlock;
		//시작/끝 페이지번호
		//끝페이지번호: 10, 20, 30, ...
		endPage = curBlock * blockPage;
		//시작페이지번호 : 1, 11, 21, ...
		beginPage = endPage - (blockPage-1);
		
		//2048건 ▶ 1페이지 : 2048 ~ 2039, 1 ~ 10
		//			205페이지 : 8 ~ 1, 51 ~ 58
		//끝 페이지 번호가 총 페이지 번호보다 크면 총 페이지 번호가 끝 페이지 번호이다.
		if(endPage > totalPage) {endPage = totalPage; }
	}
	private int curBlock; //현재블럭번호 
	
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getBeginList() {
		return beginList;
	}
	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}
	public int getEndList() {
		return endList;
	}
	public void setEndList(int endList) {
		this.endList = endList;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}