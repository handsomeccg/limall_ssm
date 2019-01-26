package com.zyf.limall.mapper;

import com.zyf.limall.pojo.Orderitem;
import com.zyf.limall.pojo.OrderitemExample;
import java.util.List;

public interface OrderitemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orderitem record);

    int insertSelective(Orderitem record);

    List<Orderitem> selectByExample(OrderitemExample example);

    Orderitem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orderitem record);

    int updateByPrimaryKey(Orderitem record);

    List<Orderitem> list(int cid);

    void add(Orderitem orderItem);
    void delete(int id);
    void deleteByOid(int oid);

    Orderitem getById(Integer id);
    void update(Orderitem orderItem);

}