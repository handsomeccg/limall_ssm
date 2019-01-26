package com.zyf.limall.mapper;

import com.zyf.limall.pojo.Property;
import java.util.List;

public interface PropertyMapper {
    List<Property> list(int cid);

    void add(Property property);
    void delete(int id);

    Property get(int id);
    void update(Property property);
}
