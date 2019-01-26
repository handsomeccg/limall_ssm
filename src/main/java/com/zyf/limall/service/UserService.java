package com.zyf.limall.service;

import com.zyf.limall.pojo.User;
import java.util.List;
import com.zyf.limall.util.Page;

public interface UserService {
    List<User> list();

    void add(User user);
    void delete(int id);

    User get(int id);
    void update(User user);

    boolean isExist(String name);
    User findUserByName(String name);
}