package org.silkdog.maven.hikoco.member.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SignupController extends HttpServlet {

    public class GetterSetter {
        private String secret;
        private String gresp;

        public String getSecret() {
            return secret;
        }

        public void setSecret(String secret) {
            this.secret = secret;
        }

        public String getGresp() {
            return gresp;
        }

        public void setGresp(String gresp) {
            this.gresp = gresp;
        }
    }

    GetterSetter gs = new GetterSetter();

    /* ======================================================== */
    /* ====================== 회원가입 페이지 ===================== */
    /* ======================================================== */

    @RequestMapping(value = "/signup_new", method = RequestMethod.GET)
    public String signupNew() {
        return "/signup_new";
    }

    @RequestMapping(value="/signup_new", method=RequestMethod.POST)
    public int signupPro(HttpServletRequest req, HttpServletResponse resp, Model model, @RequestParam("g-recaptcha-response") String gresp){
        System.out.println("Recaptcha response: " + gresp);

        gs.setSecret("6Lcwn2IUAAAAACJpgd8PkeqPyBTp8k_ExE932Ijg");
        gs.setGresp(gresp);

        return 0;
    }

//    public final class Verifier {
//        @RequestMapping(value = "https://www.google.com/recaptcha/api/siteverify",
//                params = {"secret": "6Lcwn2IUAAAAACJpgd8PkeqPyBTp8k_ExE932Ijg" , "response": }
//                , method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
//        public void googleVerify() {
//            System.out.println(gs.getSecret());
//            System.out.println(gs.getGresp());
//        }
//    }
}
