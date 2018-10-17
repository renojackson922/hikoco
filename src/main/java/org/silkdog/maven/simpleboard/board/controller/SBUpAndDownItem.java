package org.silkdog.maven.simpleboard.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/uadi?kind=${kind}&ud=${ud}&no=${no}")
public class SBUpAndDownItem {
    @PostMapping
    public String UpAndDownItemPOST(@PathVariable("kind") String kind,
                                    @PathVariable("ud") String id,
                                    @PathVariable("no") int no){

        return "";
    }
}