package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.vo.MemberVO;
import java.util.HashMap;

public interface MemberDAO {
    MemberVO select();
    int login(String id, String pw);
    int insert(MemberVO memberVO);
    void saveProfileImage(HashMap<String, Object> map);
    HashMap<String, Object> getByteImage(int id);
    int isUseridExists(String userid);
    int isNicknameExists(String nickname);
    int isPhoneExists(String phone);

//    ArrayList<Integer> getByteImageIdx();
//    ProfileImageVO getByteImageById(int id);
}
