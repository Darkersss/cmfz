package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/11/27/027.
 */
@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping("login")
    public @ResponseBody
    Map login(Admin admin, HttpSession session, String enCode) {
        Map map = new HashMap();
        String code = (String) session.getAttribute("vrifyCode");
        if (enCode.equals(code)) {
            map = adminService.login(admin, session);
            return map;
        }
        map.put("true", false);
        return map;
    }
}
