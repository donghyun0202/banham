package com.project.banham.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DetailController {
	
	@Autowired
	private DetailService detailService;
	
	@Autowired
	private ImageService imageService;

	
	@RequestMapping("/detail")
	public String yourControllerMethod(Model model, @RequestParam("data") int data) throws Exception {
		
		model.addAttribute("detailCID",data);
		
		DetailDTO detailDTO = new DetailDTO();
		detailDTO = detailService.fetchDetailData(data);
		model.addAttribute("detailDTO", detailDTO);
		
		DetailPetDTO detailPetDTO = new DetailPetDTO();
		detailPetDTO = detailService.fetchDetailPetData(data);
		model.addAttribute("detailPetDTO", detailPetDTO);
		
	    return "tour/detail";
	}
	
	@RequestMapping("/getdetail_image")
	@ResponseBody
	public ImageDTO[] getImageData(@RequestParam int imageCID) throws Exception {
      
		ImageDTO[] imageDTO = new ImageDTO[10];
		imageDTO = imageService.fetchImageData(imageCID);
      
		return imageDTO;
	}

}