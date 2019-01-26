package com.zyf.limall.mapper;

import com.zyf.limall.pojo.Order;
import com.zyf.limall.pojo.OrderExample;
import java.util.List;

public interface OrderMapper {
    List<Order> list();
    List<Order> listByUid(int uid);
    void add(Order order);
    void delete(int id);

    Order get(int id);
    void update(Order order);
}