package org.silkdog.maven.hikoco.mycart.dao;

import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;

import java.util.HashMap;
import java.util.List;

public interface MyCartDAO {
    int addToMyCart(MyCartVO myCartVO);
    void updateMyCart(HashMap<String, Object> hashMap);
    int checkCartListByUserInfo(HashMap<String, Object> hashMap);
    List<MyCartVO> myCartList(int memId);
}
