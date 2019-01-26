package com.zyf.limall.controller;

import java.io.File;
import java.util.*;


import com.zyf.limall.mapper.ProductimageMapper;
import com.zyf.limall.pojo.Product;
import com.zyf.limall.pojo.Productimage;
import com.zyf.limall.service.ProductImageService;
import com.zyf.limall.service.ProductService;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ProductImageController {

    @Autowired
    ProductService productService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    ProductimageMapper productimageMapper;

    @RequestMapping("admin_listimage")
    public String listimage(Integer pid, Model model){
        List<Productimage> productimages = productImageService.list(pid);
        model.addAttribute("productimages",productimages);
        Product product = productService.get(pid);
        model.addAttribute("product",product);
        return "admin/listProductImage";
    }

    @RequestMapping("admin_deleteimage")
    public String delete(int id,int pid,HttpServletRequest request){
        String filePath = request.getSession().getServletContext()
                .getRealPath("img/product/" + pid);
        String fileName = id + ".jpg";
        new File(filePath, fileName).delete();

        return "redirect:admin_listimage?pid="+pid;
    }

    @RequestMapping(value = "admin_updateimage")
    public String update(HttpServletRequest request, int id, int pid, MultipartFile img){
        String filePath = request.getSession().getServletContext().getRealPath("img/product/"+pid);
        String fileName = (id % 5 == 0 ? 5 : id % 5) + ".jpg";
        File uploadimg = new File(filePath,fileName);
        if (!uploadimg.exists()){
            uploadimg.mkdirs();
        }

        try{
            img.transferTo(uploadimg);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:admin_listimage?pid="+pid;
    }
}
