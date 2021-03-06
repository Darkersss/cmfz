package com.baizhi.service.impl;

import com.baizhi.dao.MenuDao;
import com.baizhi.entity.Menu;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2018/11/27/027.
 */
@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuDao menuDao;

    @Override
    public List<Menu> getAll() {
        List<Menu> list = menuDao.getAll();
        return list;
    }
}
