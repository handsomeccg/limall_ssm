package com.zyf.limall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonArray;
import com.zyf.limall.pojo.Category;
import com.zyf.limall.pojo.Property;
import com.zyf.limall.service.PropertyService;
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
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import net.sf.json.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class PropertyController {
    @Autowired
    PropertyService propertyService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_property_list")
    public String list(int cid,Model model,Page page){
        /*Gson gson = new Gson();*/
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Property> cs = propertyService.list(cid);
        Category category = categoryService.get(cid);
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs",cs);
        model.addAttribute("category",category);
        model.addAttribute("page",page);
        return "admin/listProperty";

        /*String jsonStr = gson.toJson(cs);
        JsonParser parser = new JsonParser();
        JsonArray jsonArray = parser.parse(jsonStr).getAsJsonArray();

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("total",total);
        jsonObject.add("cs",jsonArray);

        String finalString = gson.toJson(jsonObject);
        JSONObject jSONObject = JSONObject.fromObject(finalString);
        return jSONObject;*/
    }
    @RequestMapping("admin_property_add")
    public String add(Property p){
        propertyService.add(p);
        return "redirect:admin_property_list?cid="+p.getCid();
    }
    @RequestMapping("admin_property_delete")
    public String delete(int id) throws IOException{
        int cid = propertyService.get(id).getCid();
        propertyService.delete(id);
        return "redirect:admin_property_list?cid="+cid;
    }
    @RequestMapping("admin_property_edit")
    public String edit(int id,Model model) throws IOException{
        Property p = propertyService.get(id);
        Category c = categoryService.get(p.getCid());
        model.addAttribute("p",p);
        model.addAttribute("c",c);
        return "admin/editProperty";
    }
    @RequestMapping("admin_property_update")
    public String update(Property p){
        propertyService.update(p);

        return "redirect:/admin_property_list?cid="+p.getCid();
    }

}
