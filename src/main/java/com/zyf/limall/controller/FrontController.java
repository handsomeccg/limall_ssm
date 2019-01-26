package com.zyf.limall.controller;

import com.zyf.limall.mapper.*;
import com.zyf.limall.pojo.*;
import com.zyf.limall.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("")
public class FrontController {
    @Autowired
    CategoryService categoryService;

    @Autowired
    PropertyService propertyService;

    @Autowired
    PropertyValueService propertyValueService;

    @Autowired
    ProductService productService;
    @Autowired
    ProductMapper productMapper;

    @Autowired
    OrderItemService orderItemService;
    @Autowired
    OrderitemMapper orderitemMapper;

    @Autowired
    OrderService orderService;
    @Autowired
    OrderMapper orderMapper;

    @Autowired
    UserService userService;
    @Autowired
    UserMapper userMapper;

    @Autowired
    ReviewService reviewService;
    @Autowired
    ReviewMapper reviewMapper;

    @RequestMapping("login")
    public String login(){
        return "loginPage";
    }
    @RequestMapping("register")
    public String register(){
        return "registerPage";
    }
    @RequestMapping("registersuccess")
    public String registersuccess(User user){
        userService.add(user);
        return "loginPage";
    }
    @RequestMapping("loginsuccess")
    public String loginsuccess(User user, Model model, HttpSession session){
        User user1 = userMapper.findUserByName(user.getName());
        UserExample example = new UserExample();
        example.or().andNameEqualTo(user.getName()).andPasswordEqualTo(user.getPassword());
        List<User> result = userMapper.selectByExample(example);
        if (result.isEmpty()){
            model.addAttribute("msg", "账号密码错误,请重新输入");
            return "loginPage";
        }
        session.setAttribute("user",user1);
        return "redirect:home";
    }
    @RequestMapping("checklogin")
    @ResponseBody
    public String checklogin(HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user!=null)
            return "success";
        return "false";
    }

    @RequestMapping("home")
    public String home(Model model){
        List<Category> categories = categoryService.list();
        productService.fill(categories);
        productService.fillByRow(categories);

        List<Product> products = productService.listAll();

        model.addAttribute("categories",categories);
        model.addAttribute("products",products);
        return "index";
    }

    @RequestMapping("showproduct")
    public String showproduct(Model model,int product_id){
        Product products = productService.get(product_id);
        List<PropertyValue> propertyValues = propertyValueService.listbypid(product_id);
        List<Review> reviews = reviewService.listByPid(product_id);
        productService.setReviewCount(products);
        model.addAttribute("reviews",reviews);
        model.addAttribute("products",products);
        model.addAttribute("propertyValues",propertyValues);
        return "product";
    }

    @RequestMapping("showbuy")
    public String showshop(Integer number,Integer product_id,HttpSession session){
        /*Product products = productService.get(product_id);*/
        User user = (User) session.getAttribute("user");
        Orderitem orderItem = new Orderitem();
        orderItem.setPid(product_id);
        orderItem.setNumber(number);
        orderItem.setUid(user.getId());
        orderItemService.add(orderItem);
        return "redirect:buy?orderItemId="+orderItem.getId();
    }
    @RequestMapping("buy")
    public String buy(String[] orderItemId,Model model,HttpSession session){
        List<Orderitem> orderItems = new ArrayList<>();
        float total = 0;

        for (String strId : orderItemId){
            int id = Integer.parseInt(strId);
            Orderitem oi = orderItemService.getById(id);
            total += oi.getProduct().getPromotePrice() * oi.getNumber();
            orderItems.add(oi);
        }
        session.setAttribute("orderItems",orderItems);
        model.addAttribute("total",total);

        return "buyPage";
    }
    @RequestMapping("createorder")
    public String createorder(Order order, Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setStatus(OrderService.waitPay);
        order.setUid(user.getId());
        orderService.add(order);
        /*Order order1 =*/
        List<Orderitem> orderitems = (List<Orderitem>) session.getAttribute("orderItems");
        for (Orderitem orderitem: orderitems){
            orderitem.setOid(order.getId());
            orderitemMapper.updateByPrimaryKey(orderitem);
        }

        return "redirect:payPage?oid=" +order.getId()+ "&total="+order.getTotal();
    }
    @RequestMapping("payPage")
    public String payPage(int oid,float total,Model model){
        model.addAttribute("oid",oid);
        model.addAttribute("total",total);
        return "payPage";
    }
    @RequestMapping("payed")
    public String payed(int oid,float total,Model model){
        Order order = orderService.get(oid);
        order.setStatus(OrderService.waitDelivery);
        order.setPayDate(new Date());
        orderService.update(order);
        model.addAttribute("order",order);
        model.addAttribute("total",total);
        return "payed";
    }
    @RequestMapping("addcart")
    @ResponseBody
    public String addcart(int product_id,int number,HttpSession session,Model model){
        Product product = productService.get(product_id);
        User user = (User)session.getAttribute("user");
        boolean found = false;

        List<Orderitem> ois = orderItemService.listByUid(user.getId());
        for (Orderitem oi : ois) {
            if (oi.getProduct().getId().intValue() == product.getId().intValue()){
                if (oi.getOid()!=null){break;}
                oi.setNumber(oi.getNumber() + number);
                orderitemMapper.updateByPrimaryKey(oi);
                found = true;
                break;
            }
        }
        if (!found){
            Orderitem oi = new Orderitem();
            oi.setUid(user.getId());
            oi.setNumber(number);
            oi.setPid(product_id);
            orderitemMapper.insertSelective(oi);
        }

        return "success";
    }

    @RequestMapping("cart")
    public String cart(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Orderitem> orderitems = orderItemService.listForCart(user.getId());
        model.addAttribute("orderItems",orderitems);
        return "cart";
    }
    @RequestMapping("deleteOrderItem")
    public String deleteOrderItem(HttpSession session, Integer orderItemId) {
        /*User user = (User) session.getAttribute("user");
        if (null == user)
            return "fail";*/
        orderItemService.delete(orderItemId);
        return "redirect:cart";
    }
    @RequestMapping("bought")
    public String bought(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.listByUid(user.getId());
        orderItemService.fill(orders);
        model.addAttribute("orders",orders);
        return "bought";
    }
    @RequestMapping("confirmPay")
    public String confirmPay(int oid,Model model){
        Order order = orderService.get(oid);
        orderItemService.fill(order);
        model.addAttribute("order",order);
        return "confirmPay";
    }
    @RequestMapping("orderConfirmed")
    public String confirmed(int oid){
        Order order = orderService.get(oid);
        order.setConfirmDate(new Date());
        order.setStatus(OrderService.waitReview);
        orderService.update(order);
        return "confirmedPage";
    }
    @RequestMapping("review")
    public String review(int oid,int pid,Model model){
        Order order = orderService.get(oid);
        orderItemService.fill(order);
        Product product = productService.get(pid);
        OrderitemExample example = new OrderitemExample();
        example.or().andOidEqualTo(oid).andPidEqualTo(pid);
        Orderitem orderitem = orderitemMapper.selectByExample(example).get(0);
        model.addAttribute("order",order);
        model.addAttribute("product",product);
        model.addAttribute("orderitem",orderitem);
        return "reviewPage";
    }
    @RequestMapping("reviewCommit")
    public String reviewCommit(int oid,int pid,int oi_id,String content,HttpSession session){
        User user = (User) session.getAttribute("user");
        Order order = orderService.get(oid);
        Orderitem orderitem = orderItemService.getById(oi_id);
        orderitem.setReview(1);
        orderItemService.update(orderitem);
        orderItemService.fill(order);
        List<Orderitem> orderitems = order.getOrderItems();
        int number=0;
        for (Orderitem orderitem1:orderitems){
            if ("1".equals(orderitem1.getReview()))
            number++;
        }
        if (orderitems.size()==number){
            order.setStatus(OrderService.finish);
            orderService.update(order);
        }
        Review review = new Review();
        review.setContent(content);
        review.setPid(pid);
        review.setCreateDate(new Date());
        review.setUid(user.getId());
        reviewMapper.insert(review);
        return "redirect:bought";
    }
    @RequestMapping("searchResult")
    public String searchResult(String keyword,Model model){
        List<Product> products = productMapper.listKeyword(keyword);
        model.addAttribute("products",products);
        return "searchResult";
    }
    @RequestMapping("deleteOrder")
    public String deleteOrder(int oid){
        orderitemMapper.deleteByOid(oid);
        orderMapper.delete(oid);
        return "redirect:bought";
    }
}
