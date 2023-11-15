package com.project.banham.detail;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class DetailService {

	//반려동물 공통정보 API
	public DetailDTO fetchDetailData(int contentId) throws Exception {
		
    	DetailDTO detailDTO = new DetailDTO();
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailCommon1");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("banham", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "=" + contentId);
        urlBuilder.append("&" + URLEncoder.encode("defaultYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("firstImageYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("areacodeYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("mapinfoYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("overviewYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
  
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        JSONObject jsonResponse = new JSONObject(sb.toString());
        JSONArray items = jsonResponse.getJSONObject("response")
                                      .getJSONObject("body")
                                      .getJSONObject("items")
						              .getJSONArray("item");
        
    	JSONObject item = items.getJSONObject(0);
    	
    	detailDTO.setContentId(contentId);
    	detailDTO.setTitle(item.getString("title"));
    	detailDTO.setAddress(item.getString("addr1"));
    	detailDTO.setImage1(item.getString("firstimage"));
    	detailDTO.setImage2(item.getString("firstimage2"));
    	detailDTO.setAreaCode(Integer.parseInt(item.getString("areacode")));
    	detailDTO.setSigunguCode(Integer.parseInt(item.getString("sigungucode")));
    	detailDTO.setContentTypeId(Integer.parseInt(item.getString("contenttypeid")));
    	detailDTO.setMapX(Double.parseDouble(item.getString("mapx")));
    	detailDTO.setMapY(Double.parseDouble(item.getString("mapy")));
    	detailDTO.setOverview(item.getString("overview"));
    	
        return detailDTO;
    }
	
	//반려동물 상세정보 API
	public DetailPetDTO fetchDetailPetData(int contentId) throws Exception {
		
    	DetailPetDTO detailPetDTO = new DetailPetDTO();
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailPetTour1");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("banham", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "=" + contentId);
  
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        JSONObject jsonResponse = new JSONObject(sb.toString());
        JSONArray items = jsonResponse.getJSONObject("response")
                                      .getJSONObject("body")
                                      .getJSONObject("items")
						              .getJSONArray("item");
        
    	JSONObject item = items.getJSONObject(0);
    	
    	detailPetDTO.setContentId(contentId);
    	detailPetDTO.setPetTursmInfo(item.getString("petTursmInfo"));
    	detailPetDTO.setRelaAcdntRiskMtr(item.getString("relaAcdntRiskMtr"));
    	detailPetDTO.setAcmpyTypeCd(item.getString("acmpyTypeCd"));
    	detailPetDTO.setRelaPosesFclty(item.getString("relaPosesFclty"));
    	detailPetDTO.setRelaFrnshPrdlst(item.getString("relaFrnshPrdlst"));
    	detailPetDTO.setEtcAcmpyInfo(item.getString("etcAcmpyInfo"));
    	detailPetDTO.setRelaPurcPrdlst(item.getString("relaPurcPrdlst"));
    	detailPetDTO.setAcmpyPsblCpam(item.getString("acmpyPsblCpam"));
    	detailPetDTO.setRelaRntlPrdlst(item.getString("relaRntlPrdlst"));
    	detailPetDTO.setAcmpyNeedMtr(item.getString("acmpyNeedMtr"));
    	
        return detailPetDTO;
    }
}