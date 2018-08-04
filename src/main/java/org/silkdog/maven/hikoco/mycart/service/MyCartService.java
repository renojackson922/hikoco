package org.silkdog.maven.hikoco.mycart.service;

public interface MyCartService {
    /** 장바구니에 추가하기 */
    void addToMyCart(int memId, int itemId, int cartCount, String cartIp);
    /** 장바구니 상품 갯수 변경하기 */
    void updateMyCart(int memId, int itemId, int cartCount, String cartIp);
}
