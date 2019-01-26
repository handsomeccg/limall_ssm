package com.zyf.limall.service;

import com.zyf.limall.pojo.Order;
import java.util.List;
import com.zyf.limall.util.Page;

public interface OrderService {
    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";

    List<Order> list();

    List<Order> listByUid(int uid);

    void add(Order order);
    void delete(int id);

    Order get(int id);
    void update(Order order);

}