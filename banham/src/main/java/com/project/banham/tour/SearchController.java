package com.project.banham.tour;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private TourController tourController;

	@RequestMapping("/getsearch_area")
	@ResponseBody
	public SearchDTO[] getSearchAreaData() throws Exception {
		
		int areaTotalCount = searchService.fetchAreaTotalCount();
		
		SearchDTO[] areaDTO = new SearchDTO[areaTotalCount+1];
		areaDTO = searchService.fetchAreaData(areaTotalCount);
		
	    return areaDTO;
	}
	
	@RequestMapping("/getsearch_sigungu")
	@ResponseBody
	public SearchDTO[] getSearchSigunguData(@RequestParam	 String selectedValue) throws Exception {
		
		int selVaule = Integer.parseInt(selectedValue);
		int sigunguTotalCount = searchService.fetchSigunguTotalCount(selVaule);
		
		SearchDTO[] sigunguDTO = new SearchDTO[sigunguTotalCount+1];
		sigunguDTO = searchService.fetchSigunguData(selVaule, sigunguTotalCount);
		
	    return sigunguDTO;
	}
	
	@RequestMapping("/getsearch")
	@ResponseBody
	public TourDTO[] getSearchData() throws Exception {
		
		TourDTO[] tourDTO = tourController.tourDTO;
		
	    return tourDTO;
	}
}