package com.zyf.limall.controller;

import java.util.*;
import com.zyf.limall.pojo.Order;
import com.zyf.limall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;

    @RequestMapping("admin_order_list")
    public String list(Model model){
        List<Order> orders = orderService.list();
        model.addAttribute("orders",orders);
        return "admin/listOrder";
    }
    @RequestMapping("orderDelivery")
    public String orderDelivery(int oid){
        Order order = orderService.get(oid);
        order.setStatus(OrderService.waitConfirm);
        orderService.update(order);
        return "redirect:admin_order_list";
    }
}
