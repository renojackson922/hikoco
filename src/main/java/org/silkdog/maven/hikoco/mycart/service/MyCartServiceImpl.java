package org.silkdog.maven.hikoco.mycart.service;

import org.silkdog.maven.hikoco.mycart.dao.MyCartDAO;
import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;

@Service
public class MyCartServiceImpl implements MyCartService {
    @Autowired
    private MyCartDAO myCartDAO;

    /** 장바구니에 추가하기 */
    @Override
    public void addToMyCart(int memId, int itemId, int cartCount, String cartIp) {
        Date date = new Date();
        MyCartVO myCartVO = new MyCartVO(memId, itemId, cartCount, new Timestamp(date.getTime()), cartIp);

        myCartDAO.addToMyCart(myCartVO);
    }

    /** 장바구니 수량 변경하기 */
    @Override
    public void updateMyCart(int memId, int itemId, int itemAmount, String currentIp) {
        Date date = new Date();

        /**
         *  해쉬맵 작업은 서비스에서 해야함. 수정필요!
         * */
        HashMap<String, Object> map = new HashMap<>();

        map.put("mem_id", memId);
        map.put("item_id", itemId);
        map.put("cart_count", itemAmount);
        map.put("cart_datetime", new Timestamp(date.getTime()));
        map.put("cart_ip", currentIp);

        myCartDAO.updateMyCart(map);
    }
}
