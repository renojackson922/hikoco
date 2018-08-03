package org.silkdog.maven.hikoco.mycart.service;

public interface MyCartService {
    void addToMyCart(int memId, int itemId, int itemAmount, String currentIp);
    void addToMyCartAlterAmount(int memId, int itemId, int itemAmount, String currentIp);

}
