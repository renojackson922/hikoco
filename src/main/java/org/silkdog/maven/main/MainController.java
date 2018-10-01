package org.silkdog.maven.main;

import org.silkdog.maven.hikoco.item.dao.ItemDAO;
import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@CrossOrigin(origins = "*")
public class MainController {
    /** ********** HIKOCO ********** */
    @Autowired
    private ItemDAO itemDAO;
    /*  @Repository 일관성 확인할 것 */

    /* ======================================================== */
    /* ======================= 메인 페이지 ======================= */
    /* ======================================================== */

    @RequestMapping("/")
    public String main(HttpServletRequest req, Model model) {
        specialOffer1(req, model);
        specialOffer2(req, model);
        return "main";
    }

    public void specialOffer1(HttpServletRequest req, Model model) {
        List<HashMap> ilistVega = itemDAO.search("vega");
        System.out.println("특별전 프로모션1 테스트: " + ilistVega);
        req.setAttribute("ilistVega", ilistVega);
        model.addAttribute("cntVega", ilistVega);
    }

    public void specialOffer2(HttpServletRequest req, Model model) {
        List<HashMap> ilistRyzen = itemDAO.search("라이젠");
        System.out.println("특별전 프로모션2 테스트: " + ilistRyzen);
        req.setAttribute("ilistRyzen", ilistRyzen);
        model.addAttribute("cntRyzen", ilistRyzen);
    }

    @RequestMapping("/juso")
    public String juso(){
        return "juso/Sample";
    }

    @RequestMapping("/jusoPopup")
    public String jusoPopup(){
        return "juso/jusoPopup";
    }




    /** ********** Simpleboard ********** */
    private final BoardDAO boardDAO;


    @Autowired
    public MainController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

//    @RequestMapping("/board")
//    public String index(Model model) throws NullPointerException{
//        final int PAGINATION = 0;
//        final int LIMIT = 10;
//        HashMap<String, Object> hashMap = new HashMap<>();
//        hashMap.put("PAGINATION", PAGINATION);
//        hashMap.put("LIMIT", LIMIT);
//        List<BoardVO> boardVOList = boardDAO.getList(hashMap);
//        model.addAttribute("boardVOList", boardVOList);
//        return "board";
//    }

    @RequestMapping("/board")
    public String indexNoCategory(){
// ResponseBody 를 통해 ~~로 인해 리다이렉트 되었습니다. 등의 메시지 보낼 것.
        return "redirect:/board/c1";
    }

    @RequestMapping("/board/c{category}")
    public String indexByCategory(@PathVariable("category") int category){
//        final int PAGINATION = 0;
//        final int LIMIT = 10;
////        final int categoryParam = Integer.parseInt(req.getParameter("category"));
//        HashMap<String, Object> hashMap = new HashMap<>();
//        hashMap.put("category", category);
//        hashMap.put("PAGINATION", PAGINATION);
//        hashMap.put("LIMIT", LIMIT);
//        List<BoardVO> boardVOList = boardDAO.getListByCategory(hashMap);
//        model.addAttribute("boardVOList", boardVOList);
//        model.addAttribute("category", category);
//
//
//
//        int pagination = boardDAO.pageNumByCategory(category);
//        System.out.println(pagination);
//
//        int pageCnt = (int)(Math.floor(pagination / 10)) + 1;
//
//        System.out.println(pageCnt);
//
//        model.addAttribute("pageCnt", pageCnt);
        return "redirect:/board/c{category}/p1";
    }

    @RequestMapping(value="/board/c{category}/p{page}", method= RequestMethod.GET)
    public String indexPagination(@PathVariable("page") int page,
                                  @PathVariable("category") int category,
                                  Model model){

        /** 페이지가 0일 경우 1로 리다이렉트(forward?)*/
        if(page == 0){
            return "redirect:/board/c{category}/p1";
        }

        final int PAGINATION = 10 * (page - 1); // 페이지 번호; 하나를 빼야함
        final int LIMIT = 10; // 한번에 표시할 게시물의 수

        /** pagination 을 나누는 기준은 5 */
        int a;
        if(page % 5 == 0){
            a = (int)(Math.floor(page / 5));
        }else{
            a = (int)(Math.floor(page / 5)) + 1;
        }
        model.addAttribute("a", a);
        System.out.println("페이지를 나누는 단위 수: " + a);

        int b = boardDAO.pageNumByCategory(category);
        int pageCnt = (int)(Math.floor(b / 10)) + 1;
        System.out.println("총 페이지 수: " + pageCnt);
        model.addAttribute("pageCnt", pageCnt);

        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("category", category);
        hashMap.put("PAGINATION", PAGINATION);
        hashMap.put("LIMIT", LIMIT);
        List<BoardVO> boardVOList = boardDAO.getListByCategory(hashMap);
        model.addAttribute("boardVOList", boardVOList);
        model.addAttribute("category", category);
        model.addAttribute("currentPage", page);
        return "simpleboard/board";
    }




}
