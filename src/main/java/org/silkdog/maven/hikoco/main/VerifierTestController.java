package org.silkdog.maven.hikoco.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
public class VerifierTestController {
    @RequestMapping(value = "/verifier", method = RequestMethod.GET)
    public String verifier(){
        return "test/recaptcha_test";
    }

    @RequestMapping(value="/verifier", method= RequestMethod.POST)
    public String verifierPro(@RequestParam("g-recaptcha-response") String gresp) throws IOException {
        String secretKey = "6Lcwn2IUAAAAACJpgd8PkeqPyBTp8k_ExE932Ijg";
        String url ="https://www.google.com/recaptcha/api/siteverify";

        boolean verify = VerifyRecaptcha.verify(gresp);
        System.out.println(verify);
//
//        String result = "";
//
//        try{
//            URL object = new URL(url);
//
//            HttpURLConnection conn = (HttpURLConnection) object.openConnection();
//
//            conn.setDoOutput(true);
//            conn.setDoInput(true);
//            conn.setRequestProperty("Content-Type", "application/json");
//            conn.setRequestProperty("Accept", "*/*");
//            conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
//            conn.setRequestMethod("POST");
//
//            JSONObject data = new JSONObject();
//            data.put("secret", "6Lcwn2IUAAAAACJpgd8PkeqPyBTp8k_ExE932Ijg");
//            data.put("response", gresp);
//
//            OutputStreamWriter wr= new OutputStreamWriter(conn.getOutputStream());
//
//            wr.write(data.toString());
//            wr.flush();
//
//            result = conn.getResponseMessage();
//            System.out.println(result);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        return "main";
    }
}
