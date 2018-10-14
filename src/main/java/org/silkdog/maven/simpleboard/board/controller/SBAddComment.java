package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.service.SBCommentService;
import org.silkdog.maven.simpleboard.board.vo.SBCommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@CrossOrigin("*")
@RequestMapping("/board/addComment")
public class SBAddComment {
    @Autowired
    private SBCommentService SBCommentService;

    public static String makeUrl(HttpServletRequest req){
        return req.getRequestURL().toString() + "?" + req.getQueryString();
    }
    /**
     * When failed due to restrcition of commentation rule,
     * load lastly written id, detail to the form
     * */
    @GetMapping
    public String addCommentGET(){
        return "";
    }

    @PostMapping
//    public String addCommentPOST(@ModelAttribute("commentVO") CommentVO commentVO){
    /** Temporarily coded, 'MUST BE constructed with ModelAttribute!!!' */
    public String addCommentPOST(HttpServletRequest req,
                                 @RequestParam("id") String id,
                                 @RequestParam("pw") String pw,
                                 @RequestParam("category") int category,
                                 @RequestParam("boardId") int boardId,
                                 @RequestParam("pwConfirm") String pwConfirm,
                                 @RequestParam("detail") String detail){

        SBCommentVO SBCommentVO = new SBCommentVO();
        if(SBCommentVO.isPasswordSame(pw, pwConfirm)){
            log("비번은 맞았으나 아직 아무것도 안할거임!");
            SBCommentVO.setId(id);
            SBCommentVO.setPw(pw);
            SBCommentVO.setBoardId(boardId);
            SBCommentVO.setDetail(detail);
            SBCommentService.putInfoBeforeInsert(SBCommentVO);
        }else{
            log("비번이 틀림");
            return "redirect:/board/c" + category + "/r" + boardId;
        }
        return "redirect:/board/c" + category + "/r" + boardId;
    }

    public void log(String text){
        System.out.println("[로그]:" + text);
    }
}
