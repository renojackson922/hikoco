package org.silkdog.maven.hikoco.main;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.URL;

import static org.springframework.http.HttpHeaders.USER_AGENT;

public class VerifyRecaptcha {
    public static final String secretKey = "6Lcwn2IUAAAAACJpgd8PkeqPyBTp8k_ExE932Ijg";
    public static final String url ="https://www.google.com/recaptcha/api/siteverify";

    public static boolean verify(String gresp) throws IOException {
        if(gresp == null || "".equals(gresp)){
            return false;
        }

        try{
            URL obj = new URL(url);
            HttpsURLConnection conn = (HttpsURLConnection)obj.openConnection();

            // Add Request Header
            conn.setRequestMethod("POST");
            conn.setRequestProperty("User-Agent", USER_AGENT);

            String postParams = "secret=" + secretKey + "&response=" + gresp;

            // Send Post Request
            conn.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();

            int responseCode = conn.getResponseCode();
            System.out.println("\nSending 'POST' request to URL : " + url);
            System.out.println("Post parameters : " + postParams);
            System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // print result
            System.out.println(response.toString());

            //parse JSON response and return 'success' value
            JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();

            return jsonObject.getBoolean("success");
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
