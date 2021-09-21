package com.web.domain;
public class Board {
	private int idx;
	private String title;
	private String contents;
	private String image;
	private int pageUnit;

	public Board() {
		
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Board(int idx, String title, String contents, String image) {
		super();
		this.idx = idx;
		this.title = title;
		this.contents = contents;
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "{ " + idx + " , " + title + " , " + contents + "  ,"+ image +"}";
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	
	
	
}
