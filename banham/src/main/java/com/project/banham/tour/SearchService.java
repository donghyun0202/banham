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
public class SearchService {
	
	// 지역코드 area totalCount API
	public int fetchAreaTotalCount() throws Exception {
		 
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/areaCode1");
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
	
	// 지역코드 area API
	public SearchDTO[] fetchAreaData(int areaTotalCount) throws Exception {
		
		SearchDTO[] areaDTO = new SearchDTO[areaTotalCount+1];
    	for(int i=0; i<areaTotalCount+1; i++) {
    		areaDTO[i] = new SearchDTO();
    	}
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/areaCode1");
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + areaTotalCount);
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
        JSONArray items = jsonResponse.getJSONObject("response")
                                      .getJSONObject("body")
                                      .getJSONObject("items")
                                      .getJSONArray("item");
        
        areaDTO[0].setAreaCode(0);
        areaDTO[0].setAreaName("지역명");
        
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            areaDTO[i+1].setAreaCode(Integer.parseInt(item.getString("code")));
            areaDTO[i+1].setAreaName(item.getString("name"));
        }
	    
	    return areaDTO;
	}
		
	// 지역코드 sigungu totalCount API
	public int fetchSigunguTotalCount(int selVaule) throws Exception {
		 
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/areaCode1");
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("banham", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + selVaule);
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
	
	// 지역코드 sigungu API
	public SearchDTO[] fetchSigunguData(int selVaule, int sigunguTotalCount) throws Exception {
		
		SearchDTO[] sigunguDTO = new SearchDTO[sigunguTotalCount+1];
    	for(int i=0; i<sigunguTotalCount+1; i++) {
    		sigunguDTO[i] = new SearchDTO();
    	}
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/areaCode1");
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + sigunguTotalCount);
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("banham", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + selVaule);
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
		
	    JSONObject jsonResponse2 = new JSONObject(sb.toString());
        JSONArray items = jsonResponse2.getJSONObject("response")
                                       .getJSONObject("body")
                                       .getJSONObject("items")
                                       .getJSONArray("item");
        
        sigunguDTO[0].setSigunguCode(0);
        sigunguDTO[0].setSigunguName("상세지역");
        
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            sigunguDTO[i+1].setSigunguCode(Integer.parseInt(item.getString("code")));
            sigunguDTO[i+1].setSigunguName(item.getString("name"));
        }
	    
	    return sigunguDTO;
	}
}

