package org.silkdog.maven.hikoco.mycart.dao;

import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;

public interface MyCartDAO {
    int addToMyCart(MyCartVO myCartVO);
    MyCartVO checkCartListByUserInfo(int memId, int itemId);
}
