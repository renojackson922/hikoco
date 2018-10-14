package org.silkdog.maven.simpleboard.board.service;

import org.silkdog.maven.simpleboard.board.vo.SBMemberVO;
import org.springframework.stereotype.Service;

@Service
public interface SBSignupService {
    void addAddtionalInfo(SBMemberVO sbMemberVO);
}
