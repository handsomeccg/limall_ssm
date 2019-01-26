package com.zyf.limall.service;

import com.zyf.limall.pojo.Orderitem;
import com.zyf.limall.pojo.Order;
import java.util.List;
import com.zyf.limall.util.Page;

public interface OrderItemService {
    List<Orderitem> list(int cid);

    void add(Orderitem orderItem);
    void delete(int id);
    void deleteByOid(int oid);

    Orderitem getById(Integer id);
    void update(Orderitem orderItem);

    List<Orderitem> listByUid(int uid);
    List<Orderitem> listForCart(Integer user_id);

    /**
     * 为List<Order>填充订单项
     *
     * @param orders
     */
    void fill(List<Order> orders);

    /**
     * 为Order填充订单项
     *
     * @param o
     */
    void fill(Order o);
}