package com.zyf.limall.service;

import com.zyf.limall.pojo.Review;
import java.util.*;

public interface ReviewService {
    List<Review> listByPid(int pid);
    int getCount(int pid);
}
