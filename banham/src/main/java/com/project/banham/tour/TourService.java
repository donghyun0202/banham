package com.project.banham.tour;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class TourService {

	public int countContentId = 0;
	
	// CID totalCount API
	public int fetchTourCountCID() throws Exception {
		 
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailPetTour1");
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("banham", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
	    int result = jsonResponse.getJSONObject("response")
							     .getJSONObject("body")
							     .getInt("totalCount");
	    
	    return result;
	}
	
	//공통정보조회 API
    public TourDTO[] fetchTourData() throws Exception {
    	
    	/* countContentId = fetchTourCountCID();
    	
    	TourDTO[] tourDTO = new TourDTO[countContentId];
    	for(int i=0; i<countContentId; i++) {
    		tourDTO[i] = new TourDTO();
    	} */
    	
    	TourDTO[] tourDTO = new TourDTO[20];
    	for(int i=0; i<20; i++) {
    		tourDTO[i] = new TourDTO();
    	}
    	//int pageNo = (countContentId/100)+1;
    	
    	//반려동물 동반 여행 정보 CID API
    	//for(int i=0; i<pageNo; i++) {
    	for(int i=0; i<2; i++) {
    		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailPetTour1");
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
	        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + (i+1));
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("BanHam", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        BufferedReader rd;
	        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
	        
	        for (int j = 0; j < items.length(); j++) {
	            JSONObject item = items.getJSONObject(j);
	            tourDTO[i*10+j].setContentId(Integer.parseInt(item.getString("contentid")));
	            
	            System.out.println("Received data for tourDTO[" + (i * 10 + j) + "]: " + tourDTO[i * 10 + j].getContentId());
	        }
	       
    	}
    	
    	//공통정보조회 상세정보 API
    	//for(int k=0; k<countContentId; k++) {
    	for(int k=0; k<20; k++) {
    		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailCommon1");
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
            urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("banham", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "=" + tourDTO[k].getContentId());
            urlBuilder.append("&" + URLEncoder.encode("defaultYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("firstImageYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("areacodeYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("addrinfoYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
      
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
        	
        	tourDTO[k].setTitle(item.getString("title"));
        	tourDTO[k].setAddress(item.getString("addr1")+item.getString("addr2"));
        	tourDTO[k].setImage1(item.getString("firstimage"));
        	tourDTO[k].setImage2(item.getString("firstimage2"));
        	tourDTO[k].setAreaCode(Integer.parseInt(item.getString("areacode")));
        	tourDTO[k].setSigunguCode(Integer.parseInt(item.getString("sigungucode")));
        	tourDTO[k].setContentTypeId(Integer.parseInt(item.getString("contenttypeid")));
        	
        	System.out.println("Received data for tourDTO[" + k + "]: " + tourDTO[k].getTitle());
    	}
    	
        return tourDTO;
    }
}