package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.UserMapper;
import com.zyf.limall.pojo.User;
import com.zyf.limall.pojo.UserExample;
import com.zyf.limall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.zyf.limall.util.Page;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> list(){
        return userMapper.list();
    }

    @Override
    public void add(User user){
        userMapper.add(user);
    }
    @Override
    public void delete(int id){
        userMapper.delete(id);
    }
    @Override
    public User get(int id){
        return userMapper.get(id);
    }
    @Override
    public void update(User user){
        userMapper.update(user);
    }
    @Override
    public boolean isExist(String name) {
        UserExample example =new UserExample();
        example.or().andNameEqualTo(name);
        List<User> result= userMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;
    }
    @Override
    public User findUserByName(String name) { return userMapper.findUserByName(name);}
}
