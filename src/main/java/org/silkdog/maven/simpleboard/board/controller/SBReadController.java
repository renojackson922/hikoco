package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.SBBoardDAO;
import org.silkdog.maven.simpleboard.board.dao.SBCommentDAO;
import org.silkdog.maven.simpleboard.board.dao.SBMemberDAO;
import org.silkdog.maven.simpleboard.board.service.SBBoardService;
import org.silkdog.maven.simpleboard.board.service.SBLoginService;
import org.silkdog.maven.simpleboard.board.vo.SBBoardVO;
import org.silkdog.maven.simpleboard.board.vo.SBCommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@CrossOrigin("*")
//@SessionAttributes("session")
@RequestMapping("/board/c{category}/r{id}")
public class SBReadController {
    @Autowired
    private SBMemberDAO SBMemberDAO;
    @Autowired
    private SBBoardDAO SBBoardDAO;
    @Autowired
    private SBCommentDAO SBCommentDAO;
    @Autowired
    @Qualifier("SBBoardServiceImpl")
    private SBBoardService sbBoardService;
    @Autowired
    @Qualifier("SBLoginServiceImpl")
    private SBLoginService sbLoginService;

    private static String READ_ARTICLE = "/simpleboard/newReadArticle";

    @GetMapping
    public String detail(@PathVariable("category") int category,
                         @PathVariable("id") int id,
                         HttpSession httpSession,
                         Model model) throws UnsupportedEncodingException {

        sbLoginService.checkSession(httpSession, model);

        SBBoardVO SBBoardVO = SBBoardDAO.detailById(id);
        /** DB가 EUC-KR 이라서, UTF-8로 변환하는 작업 필요. (예. 일본어 표시) */
        SBBoardVO.setDetail(new String((SBBoardVO.getDetail()).getBytes("8859_1"), StandardCharsets.UTF_8));
        model.addAttribute("boardVO", SBBoardVO);
        model.addAttribute("category", category);

        /** 조회수 늘리기, 일단 클릭마다 하나씩 오르지만, 세션이나 쿠키로 구분지어 조회수 주작 막을 계획 */
        sbBoardService.addHit(id);

        /** COMMENT 불러오기, 원래 MEDIUMBLOB 이었는데 데이터형으로 불러오려고 해서 임시로 varchar(4000)로 지정 */
        List<SBCommentVO> SBCommentVOList = SBCommentDAO.getCommentListByBoardId(id);
        int commentCnt = SBCommentDAO.getCommentCountByBoardId(id);
        model.addAttribute("commentVOList", SBCommentVOList);
        model.addAttribute("commentCnt", commentCnt);

        return READ_ARTICLE;
    }

    /*
    @PostMapping
    public String detailPro(){
        return "";
    }
    */
}
