package com.baizhi.service;

import com.baizhi.entity.Admin;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by Administrator on 2018/11/27/027.
 */
public interface AdminService {
    public Map login(Admin admin, HttpSession session);
}
