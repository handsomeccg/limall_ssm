package com.zyf.limall.mapper;

import com.zyf.limall.pojo.Review;
import com.zyf.limall.pojo.ReviewExample;
import java.util.List;

public interface ReviewMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Review record);

    int insertSelective(Review record);

    List<Review> selectByExample(ReviewExample example);

    Review selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Review record);

    int updateByPrimaryKey(Review record);

    List<Review> listByPid(int pid);
}