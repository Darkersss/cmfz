package com.baizhi.service;

import com.baizhi.entity.Banner;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/11/28/028.
 */
public interface BannerService {
    public List<Banner> getAll(int page, int rows);

    public void update(Banner banner);

    Boolean delete(int id);

    void insert(Banner banner, MultipartFile urll, HttpServletRequest request);
}
