package com.project.banham.diary;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mydiaryVO")
public class MyDiaryVO {
	public String diary_id;
	public String diary_title;
	public String diary_writer;
	public String diary_overview;
	public String diary_date_create;
	public String diary_location;
}
