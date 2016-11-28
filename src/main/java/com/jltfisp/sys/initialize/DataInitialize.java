/*******************************************************************************
 * Copyright (c) 2016 by LiuFa. All rights reserved
 ******************************************************************************/

package com.jltfisp.sys.initialize;

import com.jltfisp.login.entity.JltfispUser;
import com.jltfisp.redis.RedisService;
import com.jltfisp.web.user.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

/**
 * Created by LiuFa on 2016/9/5.
 * cn.lfdevelopment.www.sys.ApplicationInitialize
 * DevelopmentApp
 * 数据初始化
 */
@Component
public class DataInitialize implements ApplicationListener<ContextRefreshedEvent> {
    private static Logger _logger = Logger.getLogger(DataInitialize.class);

    @Autowired
    private RedisService<Serializable, Object> redisService;
    @Autowired
    private UserService userService;
    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        //root application context
        if (contextRefreshedEvent.getApplicationContext().getParent() == null) {
            try {
                cacheEmailAndName();
            } catch (Exception e) {
                _logger.error("初始化缓存失败.....",e);
            }
        }
    }


    /**
     * @author LiuFa
     * @description  缓存用户数据
     * 为了注册时实时验证邮箱和公司名称是否已经存在
     */
    private void cacheEmailAndName(){
        List<JltfispUser> list = userService.getAllUserEmailAndName();
        redisService.putKV("allUser",list);
    }
}