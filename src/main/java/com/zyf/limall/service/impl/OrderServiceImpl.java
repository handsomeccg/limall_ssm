package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.OrderMapper;
import com.zyf.limall.pojo.Order;
import com.zyf.limall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.zyf.limall.util.Page;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Override
    public List<Order> list(){
        return orderMapper.list();
    }

    @Override
    public List<Order> listByUid(int uid){
        return orderMapper.listByUid(uid);
    }
    @Override
    public void add(Order order){
        orderMapper.add(order);
    }
    @Override
    public void delete(int id){
        orderMapper.delete(id);
    }
    @Override
    public Order get(int id){
        return orderMapper.get(id);
    }
    @Override
    public void update(Order order){
        orderMapper.update(order);
    }


}