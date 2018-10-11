package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;

@Controller
public class SimpleboardMainController {

    @Autowired
    private BoardDAO boardDAO;
    private int category;
    private int page;

    @Autowired
    public SimpleboardMainController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    /** 자유게시판으로 리다이렉트 */
    @RequestMapping(value={"/board", "/board/"})
    public String indexNoCategory(){
        // ResponseBody 를 통해 ~~로 인해 리다이렉트 되었습니다. 등의 메시지 보낼 것.
        return "redirect:/board/c1";
    }

    /** 해당 카테고리의 첫번째 페이지로 리다이렉트 */
    @RequestMapping("/board/c{category}")
    public String indexByCategory(@PathVariable("category") int category){
        this.category = category;
        return "redirect:/board/c{category}/p1";
    }

    /**
     * 전체보기 게시판 처리
     * 중고장터나 신고게시판 등은 제외할 것!
     * */
    @RequestMapping(value={"/board/c0", "/board/c0/", "/board/c0/p{page}", "/board/c0/p{page}/"})
    public String showAllList(@PathVariable("page") int page){
        this.page = page;
        return "redirect:/board/c{category}/p1";
    }

    /**
     * 게시판 처리하기
     * */
    @RequestMapping(value="/board/c{category}/p{page}", method= RequestMethod.GET)
    public String indexPagination(@PathVariable("page") int page,
                                  @PathVariable("category") int category,
                                  Model model){
        this.page = page;
        this.category = category;
        // 카테고리 내 게시물 수 model 에 넣기
        model.addAttribute("getListCountByCategory", boardDAO.getListCountByCategory(category));
        return doIndex(page, category, model);
    }

    /** 게시판 인덱싱, 페이지네이션 */
    public String doIndex(int page, int category, Model model){
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
        return "simpleboard/newBoard";
    }
}
