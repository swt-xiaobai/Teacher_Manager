package com.sss.mapper;


import com.sss.users.course;
import com.sss.users.user;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    //与mapper.xml的id同名，
    List<user> selectAllT();

    void updateT(user u);

    void addT(user u);

    void updatePassword(String account,String newPassword);

    List<course> selectAllC();
}
