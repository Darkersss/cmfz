package com.baizhi.entity;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

/**
 * Created by Administrator on 2018/11/27/027.
 */
@Data
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private int id;
    private String name;
    private String password;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
