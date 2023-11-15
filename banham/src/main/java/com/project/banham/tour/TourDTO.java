package com.project.banham.tour;

public class TourDTO {
	private int contentId;		//콘텐츠id
	private int contentTypeId;	//관광타입코드번호(검색)
	private String title;		//장소명
	private String address;		//주소
	private String image1;		//이미지1
	private String image2;		//이미지2
	private int areaCode;		//지역코드번호(검색)
	private int sigunguCode;	//시군구코드번호(검색)
	
	
	public int getContentId() {
		return contentId;
	}
	
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	
	public int getContentTypeId() {
		return contentTypeId;
	}
	
	public void setContentTypeId(int contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getImage1() {
		return image1;
	}
	
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	
	public String getImage2() {
		return image2;
	}
	
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	
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
}