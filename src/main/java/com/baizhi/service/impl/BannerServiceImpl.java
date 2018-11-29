package com.baizhi.service.impl;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2018/11/28/028.
 */
@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    BannerDao bannerDao;

    @Override
    public List<Banner> getAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<Banner> list = bannerDao.getAll();
        return list;
    }

    @Override
    public void update(Banner banner) {
        bannerDao.update(banner);
    }

    @Override
    public Boolean delete(int id) {
        try {
            bannerDao.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public void insert(Banner banner, MultipartFile urll, HttpServletRequest request) {//        文件上传三部完成 1.获取web容器要存放文件的位置 2.给文件起一个新名字(UUID) 3.上传
//        获取此项目的web容器(tomcat)
        String path = request.getSession().getServletContext().getRealPath("/");
//        获取文件储存位置
        File file = new File(path + "/upload");
//          如果没有此文件则创建一个
        if (!file.exists()) {
            file.mkdir();
        }
//        System.out.println(path);
//        System.out.println(url);
//        给文件起一个新名字
        String filename = urll.getOriginalFilename();
//      System.out.println(filename);
//        获取一个UUID串
        String s = UUID.randomUUID().toString();
//        获取文件后缀名 " . "后面的
        String extension = FilenameUtils.getExtension(filename);
//        拼接一个新名字
        String url = s + "." + extension;
//      3.文件上传
        try {
            urll.transferTo(new File(file, url));
        } catch (IOException e) {
            e.printStackTrace();
        }
        banner.setUrl(url);
        bannerDao.insert(banner);


    }

}
