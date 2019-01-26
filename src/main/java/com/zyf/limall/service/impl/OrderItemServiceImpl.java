package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.OrderitemMapper;
import com.zyf.limall.pojo.Order;
import com.zyf.limall.pojo.Orderitem;
import com.zyf.limall.pojo.OrderitemExample;
import com.zyf.limall.pojo.Product;
import com.zyf.limall.service.OrderItemService;
import com.zyf.limall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.zyf.limall.util.Page;

@Service
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    OrderitemMapper orderItemMapper;
    @Autowired
    ProductService productService;

    @Override
    public List<Orderitem> list(int cid){
        return orderItemMapper.list(cid);
    }

    @Override
    public void add(Orderitem orderItem){
        orderItemMapper.add(orderItem);
    }
    @Override
    public void delete(int id){
        orderItemMapper.delete(id);
    }

    @Override
    public void update(Orderitem orderItem){
        orderItemMapper.update(orderItem);
    }

    @Override
    public void deleteByOid(int oid){
        orderItemMapper.deleteByOid(oid);
    }


    @Override
    public Orderitem getById(Integer id){
        Orderitem orderitem = orderItemMapper.selectByPrimaryKey(id);
        Product product = productService.get(orderitem.getPid());
        orderitem.setProduct(product);
        return orderitem;
    }

    @Override
    public List<Orderitem> listByUid(int uid){
        OrderitemExample example = new OrderitemExample();
        example.or().andUidEqualTo(uid);
        List<Orderitem> orderitems = orderItemMapper.selectByExample(example);
        for (Orderitem orderitem : orderitems){
            Product product = productService.get(orderitem.getPid());
            orderitem.setProduct(product);
        }
        /*setProduct(result);*/
        return orderitems;
    }

    @Override
    public List<Orderitem> listForCart(Integer user_id) {
        OrderitemExample example = new OrderitemExample();
        example.or().andUidEqualTo(user_id).andOidIsNull();
        List<Orderitem> result = orderItemMapper.selectByExample(example);
        for (Orderitem orderitem : result){
            Product product = productService.get(orderitem.getPid());
            orderitem.setProduct(product);
        }
        /*setProduct(result);*/
        return result;
    }

    public void setProduct(List<Orderitem> ois) {
        for (Orderitem oi : ois) {
            setProduct(oi);
        }
    }
    private void setProduct(Orderitem oi) {
        Product p = productService.get(oi.getPid());
        oi.setProduct(p);
    }

    @Override
    public void fill(List<Order> orders){
        for (Order o : orders){
            fill(o);
        }
    }

    @Override
    public void fill(Order order){
        OrderitemExample example = new OrderitemExample();
        example.or().andOidEqualTo(order.getId());
        example.setOrderByClause("id desc");
        List<Orderitem> orderitems = orderItemMapper.selectByExample(example);
        /*for (Orderitem orderitem : orderitems){
            Product product = productService.get(orderitem.getPid());
            orderitem.setProduct(product);
        }*/
        setProduct(orderitems);

        float total = 0;
        int totalNumber = 0;
        for (Orderitem oi : orderitems) {
            total += oi.getNumber() * oi.getProduct().getPromotePrice();
            totalNumber += oi.getNumber();
        }
        order.setTotal(total);
        order.setTotalNumber(totalNumber);
        order.setOrderItems(orderitems);
    }
}