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

import javax.servlet.http.HttpServletRequest;
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
    public String indexByCategory(@PathVariable("category") int category,
                                  HttpServletRequest req,
                                  Model model){
        final int PAGINATION = 0;
        final int LIMIT = 10;
//        final int categoryParam = Integer.parseInt(req.getParameter("category"));
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("category", category);
        hashMap.put("PAGINATION", PAGINATION);
        hashMap.put("LIMIT", LIMIT);
        List<BoardVO> boardVOList = boardDAO.getListByCategory(hashMap);
        model.addAttribute("boardVOList", boardVOList);
        model.addAttribute("category", category);
        return "simpleboard/board";
    }

    @RequestMapping("/board/c{category}/p{page}")
    public String indexPagination(@PathVariable("page") int page,
                                  @PathVariable("category") int category,
                                  Model model){
        final int PAGINATION = 10 * page;
        final int LIMIT = 10;
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("PAGINATION", PAGINATION);
        hashMap.put("LIMIT", LIMIT);
        List<BoardVO> boardVOList = boardDAO.getList(hashMap);
        model.addAttribute("boardVOList", boardVOList);
        return "simpleboard/board";
    }


}
