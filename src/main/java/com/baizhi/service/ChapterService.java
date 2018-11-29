package com.baizhi.service;

import com.baizhi.entity.Chapter;

import java.util.List;

/**
 * Created by Administrator on 2018/11/29/029.
 */
public interface ChapterService {
    List<Chapter> getAll(int page, int rows);
}
