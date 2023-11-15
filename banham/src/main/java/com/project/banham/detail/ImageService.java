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
public class ImageService {

   //이미지 api
   public ImageDTO[] fetchImageData(int contentId) throws Exception {
      
       ImageDTO[] imageDTO = new ImageDTO[10];
       for(int i=0; i<10; i++) {
          imageDTO[i] = new ImageDTO();
       }
      
      StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailImage1");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=HAo3CWAmHBWpBv45WwdYyDsnR8eBMelmUZUuJEQzD5vDE2a5KxoWV%2FspWAXiS8pK28iMZ9gJcu8vAo8lcwMqhQ%3D%3D");
        urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("banham", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "=" + contentId);
        urlBuilder.append("&" + URLEncoder.encode("imageYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("subImageYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
  
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
       
       for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            imageDTO[i].setImageName(item.getString("imgname"));
            imageDTO[i].setImageAddress(item.getString("originimgurl"));
            
            System.out.println(imageDTO[i].getImageAddress());
            System.out.println(imageDTO[i].getImageName());
        }
       
        return imageDTO;
    }
}