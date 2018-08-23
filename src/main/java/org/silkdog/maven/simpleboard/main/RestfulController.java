package org.silkdog.maven.simpleboard.main;

import org.silkdog.maven.simpleboard.board.dao.BoardDAO;
import org.silkdog.maven.simpleboard.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class RestfulController {
    private final BoardDAO boardDAO;

    @Autowired
    public RestfulController(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @RequestMapping(value="/restfulBoard", method= RequestMethod.GET)
//    @ResponseBody
    public Map getBoardList(@RequestParam("data") int data) throws UnsupportedEncodingException {
//        List<BoardVO> list = boardDAO.getAllList();

        BoardVO boardVO = boardDAO.detailById(data);

        boardVO.setDetail(new String((boardVO.getDetail()).getBytes("8859_1"), StandardCharsets.UTF_8));

        Map result = new HashMap();
        result.put("result", Boolean.TRUE);
        result.put("data", boardVO);

        return result;
    }
}
