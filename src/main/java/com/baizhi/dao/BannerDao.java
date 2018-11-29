package com.baizhi.dao;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/11/28/028.
 */
public interface BannerDao {
    public List<Banner> getAll();

    public void update(Banner banner);

    void delete(int id);

    void insert(Banner banner);
}
