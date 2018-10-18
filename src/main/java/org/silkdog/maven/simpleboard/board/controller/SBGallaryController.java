package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.SBBoardDAO;
import org.silkdog.maven.simpleboard.board.dao.SBCategoryDAO;
import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.silkdog.maven.simpleboard.board.service.SBLoginService;
import org.silkdog.maven.simpleboard.board.vo.SBBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@CrossOrigin("*")
//@SessionAttributes("session")
@RequestMapping("/board/gallary/c{c}/p{p}")
public class SBGallaryController {
    @Autowired
    private SBBoardDAO SBBoardDAO;
    @Autowired
    private SBMemberDAO SBMemberDAO;
    @Autowired
    private SBCategoryDAO SBCategoryDAO;
    @Autowired
    @Qualifier("SBLoginServiceImpl")
    private SBLoginService sbLoginService;

    private int category;
    private int page;

    public static final String GALLARY_URL = "simpleboard/framework/gallaryFW";


    @GetMapping
    public String gallaryGET(@PathVariable("c") int category,
                             @PathVariable("p") int page,
                             HttpServletRequest req,
                             HttpSession httpSession,
                             Model model){

//        this.page = page;
//        this.category = category;


        if(req.getParameter("loginResult") == null){

        }else{
            model.addAttribute("loginResult", req.getParameter("loginResult"));
        }

        // 로그인 여부에 따라 세션 가져오기
        sbLoginService.checkSession(httpSession, model);

        // 각 카테고리의 게시물 수 model 에 넣기
        model.addAttribute("getAllCategoryList", SBCategoryDAO.getAllCategoryList());

        // 카테고리 내 게시물 수 model 에 넣기
        model.addAttribute("getListCountByCategory", SBBoardDAO.getListCountByCategory(category));
        return doIndex(page, category, model);

//        model.addAttribute("category", category);
//        model.addAttribute("page", page);
    }

    /** 게시판 인덱싱, 페이지네이션 */
    public String doIndex(int page, int category, Model model){
        /** 한 페이지에 표시할 최대 게시물의 수 */
        int foo = 12;

        /** 페이지가 0일 경우 1로 리다이렉트(forward?)
         *  page == '페이지 번호'
         * */
        if(page == 0){
            return "redirect:/board/c{category}/p1";
        }

        final int PAGINATION = foo * (page - 1); // 페이지 번호; 하나를 빼야함
        final int LIMIT = foo; // 한번에 표시할 게시물의 수

        /** pagination 을 나누는 기준은 5 */
        int pageSplice;
        if(page % 5 == 0){
            pageSplice = (int)(Math.floor(page / 5));
        }else{
            pageSplice = (int)(Math.floor(page / 5)) + 1;
        }
        model.addAttribute("pageSplice", pageSplice);
        System.out.println("페이지를 나누는 단위 수: " + pageSplice);

        /** 공지만큼 빼는 로직을 작성해야함!!! -> isannounce = 0 을 추가해서 조치완료. */
        int b = SBBoardDAO.pageNumByCategory(category);
        int pageCnt;
        if(b % 12 == 0){
            pageCnt = (int)(Math.floor(b / foo));
        }else{
            pageCnt = (int)(Math.floor(b / foo)) + 1;
        }
        System.out.println("총 페이지 수: " + pageCnt);
        model.addAttribute("pageCnt", pageCnt);

        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("category", category);
        hashMap.put("PAGINATION", PAGINATION);
        hashMap.put("LIMIT", LIMIT);

        List<SBBoardVO> SBBoardVOAnnouceList = SBBoardDAO.getAnnounceListByCategory(category);
        model.addAttribute("bVAL", SBBoardVOAnnouceList);

        List<SBBoardVO> SBBoardVOList = SBBoardDAO.getListByCategory(hashMap);
        model.addAttribute("boardVOList", SBBoardVOList);

        model.addAttribute("category", category);
        model.addAttribute("currentPage", page);
        return GALLARY_URL;
    }
}
