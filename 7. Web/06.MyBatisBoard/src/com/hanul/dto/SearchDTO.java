package com.hanul.dto;

import java.io.Serializable;

public class SearchDTO implements Serializable {
	private String part, searchData;
	
	public SearchDTO() {}

	public SearchDTO(String part, String searchData) {
		super();
		this.part = part;
		this.searchData = searchData;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	
	
}
