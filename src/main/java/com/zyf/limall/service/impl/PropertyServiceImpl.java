package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.PropertyMapper;
import com.zyf.limall.pojo.Property;
import com.zyf.limall.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.zyf.limall.util.Page;

@Service
public class PropertyServiceImpl implements PropertyService {
    @Autowired
    PropertyMapper propertyMapper;
    @Override
    public List<Property> list(int cid){
        return propertyMapper.list(cid);
    }

    @Override
    public void add(Property property){
        propertyMapper.add(property);
    }
    @Override
    public void delete(int id){
        propertyMapper.delete(id);
    }
    @Override
    public Property get(int id){
        return propertyMapper.get(id);
    }
    @Override
    public void update(Property property){
        propertyMapper.update(property);
    }
}
