package com.yedam.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
public class APIExamTranslateNMT {

 public static void main(String[] args) {
     String clientId = "49NbxUBaBvccXUl80HV_";//애플리케이션 클라이언트 아이디값";
     String clientSecret = "N9ZJRgGXtt";//애플리케이션 클라이언트 시크릿값";
     int display = 5;
     try {
         String text = URLEncoder.encode("게이트","utf-8");
         System.out.println(text);
         String apiURL = "https://openapi.naver.com/v1/search/movie?query="+text+"&display="+display+"&";
         URL url = new URL(apiURL);
         HttpURLConnection con = (HttpURLConnection)url.openConnection();
         con.setRequestMethod("GET");
         con.setRequestProperty("X-Naver-Client-Id", clientId);
         con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
         
         int responseCode = con.getResponseCode();
         BufferedReader br;
         if(responseCode==200) { // 정상 호출
             br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else {  // 에러 발생
             br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
         }
         String inputLine;
         StringBuffer response = new StringBuffer();
         while ((inputLine = br.readLine()) != null) {
             response.append(inputLine);
         }
         br.close();
         System.out.println(response.toString());
         String str=response.toString();
         HashMap<String, Object> rs = new ObjectMapper().readValue(response.toString(), HashMap.class) ;
         if(rs.get("items")!=null||rs.get("items")!="") {
	         List<HashMap<String,Object>> list =(List<HashMap<String, Object>>) rs.get("items");
	         String images=(String) list.get(0).get("image");
	         System.out.println(list.get(0).get("image")); 
	         }
         
     } catch (Exception e) {
         System.out.println(e);
     }
 }
}