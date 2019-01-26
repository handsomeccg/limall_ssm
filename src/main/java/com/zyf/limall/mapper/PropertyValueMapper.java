package com.zyf.limall.mapper;

import com.zyf.limall.pojo.PropertyValue;
import com.zyf.limall.pojo.PropertyValueExample;
import java.util.List;

public interface PropertyValueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PropertyValue record);

    int insertSelective(PropertyValue record);

    List<PropertyValue> selectByExample(PropertyValueExample example);

    PropertyValue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PropertyValue record);

    int updateByPrimaryKey(PropertyValue record);

    List<PropertyValue> list(int pid);

    /*List<PropertyValue> listbypid(int pid);*/
    void add(PropertyValue propertyValue);
    void delete(int id);

    PropertyValue get(int id);
    void update(PropertyValue propertyValue);
}