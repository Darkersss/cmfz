package com.baizhi.service.impl;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/11/27/027.
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    @Override
    public Map login(Admin admin, HttpSession session) {
        HashMap<Object, Object> map = new HashMap<>();
        Admin admin1 = adminDao.login(admin);
        if (admin1 != null) {
            map.put("true", true);
            map.put("admin", admin1);
            session.setAttribute("name", admin1.getName());
            return map;
        }
        map.put("true", false);
        return map;
    }
}
