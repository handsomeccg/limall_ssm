package com.zyf.limall.mapper;

import com.zyf.limall.pojo.Category;
import java.util.List;
public interface CategoryMapper {
    List<Category> list();

    void add(Category category);
    void delete(int id);

    Category get(int id);
    void update(Category category);
}
