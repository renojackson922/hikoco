package org.silkdog.maven.hikoco.member.controller;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.service.SignupService;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class SignupController extends HttpServlet {
    @Autowired
    private MemberDAO memberDAO;


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

    @RequestMapping(value="/isduplicated", method= RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> isIdDuplicated(@RequestBody String userid){
//        int count = 0;
//        Map<Object, Object> map = new HashMap<>();
//
//        count =
        return null;
    }

    @RequestMapping(value = "/signup_new", method = RequestMethod.GET)
    public String signupNew() {
        return "/signup_new";
    }

    @RequestMapping(value="/signup_new", method=RequestMethod.POST)
    public String signupNewPro(HttpServletRequest req, HttpServletResponse resp, Model model,
                            @RequestParam("g-recaptcha-response") String gresp,
                            @RequestParam HashMap<String, Object> map) {

        System.out.println("Parameter: " + map);

//        Set<Map.Entry<String, Object>> set = map.entrySet();
//        Iterator<Map.Entry<String, Object>> it;
//        it = set.iterator();

        int result = memberDAO.insert(map);

        return "redirect:/";
    }


}
