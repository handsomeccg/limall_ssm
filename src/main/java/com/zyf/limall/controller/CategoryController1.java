package com.zyf.limall.controller;

import java.util.List;
import java.util.ArrayList;
import com.zyf.limall.pojo.Category;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequestMapping("")
public class CategoryController1 {
    @ResponseBody
    @RequestMapping("submitCategory")
    public String submitCategory(@RequestBody Category category){
        System.out.println("ssm接收到浏览器提交的json，并转换为Category对象："+category);
        return "ok";
    }

    @ResponseBody
    @RequestMapping("/getOneCategory")
    public String getOneCategory(){
        Category c = new Category();
        c.setId(100);
        c.setName("第100个分类");
        JSONObject json = new JSONObject();
        json.put("category",JSONObject.toJSON(c));
        return json.toJSONString();
    }
    @ResponseBody
    @RequestMapping("/getManyCategory")
    public String getManyCategory() {
        List<Category> cs = new ArrayList<>();
        for(int i=0;i<10;i++){
            Category c = new Category();
            c.setId(i);
            c.setName("分类名称："+i);
            cs.add(c);
        }
        return JSONObject.toJSON(cs).toString();
    }
}
