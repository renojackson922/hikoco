package org.silkdog.maven.simpleboard.board.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

@Service
public interface SBLoginService {
    void checkSession(HttpSession httpSession, Model model);
    void logout(HttpSession httpSession, SessionStatus sessionStatus, Model model);
}
