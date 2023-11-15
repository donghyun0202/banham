package com.project.banham.tour;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TourController {

	@Autowired
	private TourService tourService;
	
	public TourDTO[] tourDTO = null;
	
	@RequestMapping("/getdata")
    @ResponseBody
    public TourDTO[] getData() throws Exception {
		
		tourDTO = tourService.fetchTourData();
		
	    return tourDTO;
    }
}