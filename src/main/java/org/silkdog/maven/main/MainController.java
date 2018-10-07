package org.silkdog.maven.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@CrossOrigin(origins = "*")
public class MainController {
    @RequestMapping("/")
    public String main() {
        return "main_selection";
    }
}
