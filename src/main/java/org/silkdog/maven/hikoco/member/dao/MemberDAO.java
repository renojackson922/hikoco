package org.silkdog.maven.hikoco.member.dao;

import org.silkdog.maven.hikoco.member.vo.MemberMinifiedVO;
import org.silkdog.maven.hikoco.member.vo.MemberVO;
import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
    MemberVO select();
    int login(String id, String pw);
    int insert(MemberVO memberVO);
    void saveProfileImage(HashMap<String, Object> map);
    HashMap<String, Object> getByteImage(int id);
    int isUseridExists(String userid);
    int isNicknameExists(String nickname);
    int isPhoneExists(String phone);
    MemberMinifiedVO getMemberByUserid(String userid);
    MemberVO getFullMemberByUserid(String userid);
    MemberVO getFullMemberById(int id);
    List<MemberVO> memberList();
    List<MemberVO> recentMemberList();

//    ArrayList<Integer> getByteImageIdx();
//    ProfileImageVO getByteImageById(int id);
}
