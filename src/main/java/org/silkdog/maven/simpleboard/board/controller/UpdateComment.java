package org.silkdog.maven.simpleboard.board.controller;

import org.silkdog.maven.simpleboard.board.dao.CommentDAO;
import org.silkdog.maven.simpleboard.board.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;

@Controller
@RequestMapping("/board/updateComment")
public class UpdateComment {
    @Autowired
    private CommentDAO commentDAO;

    @PostMapping
    public String updateCommentPOST(
                                    @RequestParam("pw") String pw,
                                    @RequestParam("category") int category,
                                    @RequestParam("boardId") int boardId,
                                    @RequestParam("dataId") int dataId,
                                    @RequestParam("detail") String detail){

        CommentVO commentVO = commentDAO.getOneCommentById(dataId);
        if(commentVO.getPw().equals(pw) && pw.equals(commentVO.getPw())){
            System.out.println("비번 맞음!");
            Date date = new Date();
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());

            /**  Spring 이나 javascript 의 replace, regex 는 모듈화 하기 */
            String detailConverted = conversion(detail);

            HashMap<String, Object> hashMap = new HashMap<>();
            hashMap.put("detail", detailConverted);
            hashMap.put("lastEditedDate", sqlDate);
            hashMap.put("lastEditedIp", "192.168.35.121");
            hashMap.put("dataId", dataId);
            commentDAO.updateComment(hashMap);
        }

        return "redirect:/board/c" + category + "/r" + boardId;
    }

    /** 중복되므로 서비스에서 처리! */
    public String conversion(String str){
//        str = str.replaceAll("<","&lt;");
//        str = str.replaceAll(">","&gt;");
//        str = str.replaceAll("\"","&quot;");
        str = str.replaceAll("'","&#39;");
//        str = str.replaceAll("(\r\n|\n)","<br />");
        return str;
    }
}
