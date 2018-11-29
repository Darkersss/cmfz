package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2018/11/28/028.
 */
@Controller
@RequestMapping("banner")
public class BannerController {
    @Autowired
    BannerService bannerService;

    @RequestMapping("getAll")
    public @ResponseBody
    List<Banner> getAll(int page, int rows) {
        List<Banner> list = bannerService.getAll(page, rows);
        return list;
    }

    @RequestMapping("update")
    public void update(Banner banner) {
        bannerService.update(banner);
    }

    @RequestMapping("delete")
    public @ResponseBody
    Boolean delete(int id) {
        return bannerService.delete(id);
    }

    @RequestMapping("insert")
    public void insert(Banner banner, MultipartFile urll, HttpServletRequest request) {

        bannerService.insert(banner, urll, request);
    }
}
