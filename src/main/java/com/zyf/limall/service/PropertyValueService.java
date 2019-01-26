package com.zyf.limall.service;

import com.zyf.limall.pojo.PropertyValue;
import java.util.List;
import com.zyf.limall.util.Page;

public interface PropertyValueService {
    List<PropertyValue> list(int pid);

    List<PropertyValue> listbypid(int pid);
    void add(PropertyValue propertyValue);
    void delete(int id);

    PropertyValue get(int id);
    void update(PropertyValue propertyValue);
}