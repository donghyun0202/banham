package com.project.banham.tour;

public class SearchDTO {
	private int areaCode;		//지역코드번호
	private int sigunguCode;	//시군구코드번호
	private String areaName;	//지역명
	private String sigunguName;	//시군구명
	
	
	public int getAreaCode() {
		return areaCode;
	}
	
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	
	public int getSigunguCode() {
		return sigunguCode;
	}
	
	public void setSigunguCode(int sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	
	public String getAreaName() {
		return areaName;
	}
	
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	public String getSigunguName() {
		return sigunguName;
	}
	
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	
}
