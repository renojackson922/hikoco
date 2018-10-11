package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.dao.CommentDAO;
import org.silkdog.maven.simpleboard.board.service.BoardService;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.silkdog.maven.simpleboard.board.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.List;

@CrossOrigin
@Controller
//@RequestMapping("/board")
@RequestMapping("/board/c{category}/r{id}")
public class ReadController {
    private final BoardDAO boardDAO;
    private final CommentDAO commentDAO;
    private final BoardService boardService;

    private static String READ_ARTICLE = "/simpleboard/newReadArticle";

    @Autowired
    public ReadController(BoardDAO boardDAO, CommentDAO commentDAO, BoardService boardService) {
        this.boardDAO = boardDAO;
        this.commentDAO = commentDAO;
        this.boardService = boardService;
    }

    @GetMapping
    public String detail(@PathVariable("category") int category,
                         @PathVariable("id") int id,
                         Model model) throws UnsupportedEncodingException {
        BoardVO boardVO = boardDAO.detailById(id);
        /** DB가 EUC-KR 이라서, UTF-8로 변환하는 작업 필요. (예. 일본어 표시) */
        boardVO.setDetail(new String((boardVO.getDetail()).getBytes("8859_1"), StandardCharsets.UTF_8));
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("category", category);

        /** 조회수 늘리기, 일단 클릭마다 하나씩 오르지만, 세션이나 쿠키로 구분지어 조회수 주작 막을 계획 */
        boardService.addHit(id);

        /** COMMENT 불러오기, 원래 MEDIUMBLOB 이었는데 데이터형으로 불러오려고 해서 임시로 varchar(4000)로 지정 */
        List<CommentVO> commentVOList = commentDAO.getCommentListByBoardId(id);
        int commentCnt = commentDAO.getCommentCountByBoardId(id);
        model.addAttribute("commentVOList", commentVOList);
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
