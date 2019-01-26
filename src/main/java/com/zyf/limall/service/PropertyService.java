package com.zyf.limall.service;

import com.zyf.limall.pojo.Property;
import java.util.List;
import com.zyf.limall.util.Page;

public interface PropertyService {
    List<Property> list(int cid);

    void add(Property property);
    void delete(int id);

    Property get(int id);
    void update(Property property);
}