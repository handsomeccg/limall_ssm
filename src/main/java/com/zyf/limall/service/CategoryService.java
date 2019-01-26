package com.zyf.limall.service;

import com.zyf.limall.pojo.Category;
import java.util.List;
import com.zyf.limall.util.Page;

public interface CategoryService {
    List<Category> list();

    void add(Category category);
    void delete(int id);

    Category get(int id);
    void update(Category category);
}
