package com.zyf.limall.service;

import com.zyf.limall.pojo.Productimage;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductImageService {

    List<Productimage> list(int pid);
}
