package com.zyf.limall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyf.limall.pojo.Category;
import com.zyf.limall.pojo.User;
import com.zyf.limall.service.UserService;
import com.zyf.limall.service.CategoryService;
import com.zyf.limall.util.Page;
import com.zyf.limall.util.UploadedImageFile;
import com.zyf.limall.util.ImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_user_list")
    public String list(Model model,Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<User> cs = userService.list();
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs",cs);

        model.addAttribute("page",page);
        return "admin/listUser";
    }
    @RequestMapping("admin_user_add")
    public String add(User p){
        userService.add(p);
        return "login";
    }
    @RequestMapping("admin_user_delete")
    public String delete(int id) throws IOException{

        userService.delete(id);
        return "redirect:admin_user_list";
    }
    @RequestMapping("admin_user_edit")
    public String edit(int id,Model model) throws IOException{
        User p = userService.get(id);

        model.addAttribute("p",p);

        return "admin/editUser";
    }
    @RequestMapping("admin_user_update")
    public String update(User p){
        userService.update(p);

        return "redirect:/admin_user_list";
    }
    @RequestMapping("checkname")
    @ResponseBody
    public String checkname(String name){
        User user = userService.findUserByName(name);
        if(user!=null) {
            return "{\"msg\":\"false\"}";
        }
        return "{\"msg\":\"true\"}";
    }

}
