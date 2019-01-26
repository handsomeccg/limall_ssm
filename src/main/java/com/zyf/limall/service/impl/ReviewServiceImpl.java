package com.zyf.limall.service.impl;

import com.zyf.limall.mapper.ReviewMapper;
import com.zyf.limall.mapper.UserMapper;
import com.zyf.limall.pojo.Review;
import com.zyf.limall.pojo.ReviewExample;
import com.zyf.limall.pojo.User;
import com.zyf.limall.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    ReviewMapper reviewMapper;
    @Autowired
    UserMapper userMapper;

    @Override
    public List<Review> listByPid(int pid){
        /*ReviewExample example = new ReviewExample();
        example.or().andPidEqualTo(pid);*/
        List<Review> reviews = reviewMapper.listByPid(pid);
        setUser(reviews);
        return reviews;
    }
    public void setUser(List<Review> reviews){
        for(Review review: reviews){
            setUser(review);
        }
    }
    public void setUser(Review review){
        int uid = review.getUid();
        User user = userMapper.selectByPrimaryKey(uid);
        review.setUser(user);
    }
    @Override
    public int getCount(int pid){
        return listByPid(pid).size();
    }
}
