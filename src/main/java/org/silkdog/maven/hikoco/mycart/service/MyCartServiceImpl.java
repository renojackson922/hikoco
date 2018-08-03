package org.silkdog.maven.hikoco.mycart.service;

import org.silkdog.maven.hikoco.mycart.dao.MyCartDAO;
import org.silkdog.maven.hikoco.mycart.vo.MyCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;

@Service
public class MyCartServiceImpl implements MyCartService {
    @Autowired
    private MyCartDAO myCartDAO;

    @Override
    public void addToMyCart(int memId, int itemId, int itemAmount, String currentIp){
        Date date = new Date();
        MyCartVO myCartVO = new MyCartVO(memId, itemId, itemAmount, new Timestamp(date.getTime()), currentIp);
        myCartDAO.addToMyCart(myCartVO);
    }

    @Override
    public void addToMyCartAlterAmount(int memId, int itemId, int itemAmount, String currentIp) {
        Date date = new Date();

    }
}
