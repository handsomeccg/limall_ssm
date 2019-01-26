package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.PropertyValueMapper;
import com.zyf.limall.pojo.PropertyValue;
import com.zyf.limall.pojo.PropertyValueExample;
import com.zyf.limall.service.PropertyValueService;
import com.zyf.limall.pojo.Property;
import com.zyf.limall.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.zyf.limall.util.Page;

@Service
public class PropertyValueServiceImpl implements PropertyValueService {
    @Autowired
    PropertyValueMapper propertyValueMapper;
    @Autowired
    PropertyService propertyService;

    @Override
    public List<PropertyValue> list(int pid){
        return propertyValueMapper.list(pid);
    }


    public List<PropertyValue> listbypid(int pid){
        PropertyValueExample example = new PropertyValueExample();
        example.or().andPidEqualTo(pid);
        List<PropertyValue> propertyValues = propertyValueMapper.selectByExample(example);
        for (PropertyValue propertyValue : propertyValues) {
            Property property = propertyService.get(propertyValue.getPtid());
            propertyValue.setProperty(property);
        }
        return propertyValues;
    }

    @Override
    public void add(PropertyValue propertyValue){
        propertyValueMapper.add(propertyValue);
    }
    @Override
    public void delete(int id){
        propertyValueMapper.delete(id);
    }
    @Override
    public PropertyValue get(int id){
        return propertyValueMapper.get(id);
    }
    @Override
    public void update(PropertyValue propertyValue){
        propertyValueMapper.update(propertyValue);
    }
}