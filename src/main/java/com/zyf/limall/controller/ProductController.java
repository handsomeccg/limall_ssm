package com.zyf.limall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyf.limall.pojo.Category;
import com.zyf.limall.pojo.Product;
import com.zyf.limall.service.ProductService;
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
public class ProductController {
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_product_list")
    public String list(int cid,Model model,Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> cs = productService.list(cid);
        Category category = categoryService.get(cid);
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs",cs);
        model.addAttribute("category",category);
        model.addAttribute("page",page);
        return "admin/listProduct";
    }
    @RequestMapping("admin_product_add")
    public String add(Product p){
        productService.add(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }
    @RequestMapping("admin_product_delete")
    public String delete(int id) throws IOException{
        int cid = productService.get(id).getCid();
        productService.delete(id);
        return "redirect:admin_product_list?cid="+cid;
    }
    @RequestMapping("admin_product_edit")
    public String edit(int id,Model model) throws IOException{
        Product p = productService.get(id);
        Category c = categoryService.get(p.getCid());
        model.addAttribute("p",p);
        model.addAttribute("c",c);
        return "admin/editProduct";
    }
    @RequestMapping("admin_product_update")
    public String update(Product p){
        productService.update(p);

        return "redirect:/admin_product_list?cid="+p.getCid();
    }

}
