package com.duant.rcpy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.duant.rcpy.domain.User;
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int replaceUser(User user);
    
    int insert(User user);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}