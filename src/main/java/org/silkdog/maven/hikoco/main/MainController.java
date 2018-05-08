package org.silkdog.maven.hikoco.main;

import org.silkdog.maven.hikoco.member.dao.MemberDAO;
import org.silkdog.maven.hikoco.member.dto.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class MainController{
    @Autowired
    private MemberDAO memberDAO;

    @RequestMapping("/hello.do")
    public String main(Model model){
        List<MemberDTO> mlist = memberDAO.select();
        model.addAttribute("greeting","안녕하세요?");
        model.addAttribute("select", mlist);
        return "hello";
    }
//    @Override
//    public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception{
//        List<MemberDTO> mlist = memberDAO.select();
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("hello");
//        mav.addObject("select", mlist);
//        return mav;
//    }
}
