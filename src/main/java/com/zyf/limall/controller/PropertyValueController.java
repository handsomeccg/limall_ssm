package com.zyf.limall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyf.limall.pojo.Category;
import com.zyf.limall.pojo.Product;
import com.zyf.limall.pojo.Property;
import com.zyf.limall.pojo.PropertyValue;
import com.zyf.limall.service.ProductService;
import com.zyf.limall.service.PropertyService;
import com.zyf.limall.service.PropertyValueService;
import com.zyf.limall.service.CategoryService;
import com.zyf.limall.util.Page;
import com.zyf.limall.util.UploadedImageFile;
import com.zyf.limall.util.ImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class PropertyValueController {
    @Autowired
    PropertyValueService propertyValueService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    PropertyService propertyService;

    @Autowired
    ProductService productService;

    @RequestMapping("admin_propertyValue_list")
    public String list(int pid,int cid,Model model,Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<PropertyValue> cs = propertyValueService.list(pid);
        Product product = productService.get(pid);
        List<Property> ps = propertyService.list(cid);
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs",cs);
        model.addAttribute("product",product);
        model.addAttribute("ps",ps);
        model.addAttribute("page",page);
        return "admin/listPropertyValue";
    }
    @RequestMapping("admin_propertyValue_add")
    public String add(PropertyValue p){
        int pid = p.getPid();
        int cid = productService.get(pid).getCid();
        propertyValueService.add(p);
        return "redirect:admin_propertyValue_list?pid=" +pid+ "&cid=" +cid;
    }
    @RequestMapping("admin_propertyValue_delete")
    public String delete(int id) throws IOException{
        int pid = propertyValueService.get(id).getPid();
        int cid = productService.get(pid).getCid();
        propertyValueService.delete(id);
        return "redirect:admin_propertyValue_list?pid=" +pid+ "&cid=" +cid;
    }
    @RequestMapping("admin_propertyValue_edit")
    public String edit(int pid,Model model) throws IOException{
        PropertyValue propertyValue = propertyValueService.get(pid);
        Product product = productService.get(propertyValue.getPid());
        model.addAttribute("propertyValue",propertyValue);
        model.addAttribute("product",product);
        return "admin/editPropertyValue";
    }
    @RequestMapping("admin_propertyValue_update")
    public String update(PropertyValue p){
        int pid = p.getPid();
        int cid = productService.get(pid).getCid();
        propertyValueService.update(p);
        return "redirect:/admin_propertyValue_list?pid="+pid+ "&cid=" +cid;
    }

}
