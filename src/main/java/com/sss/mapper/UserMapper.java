package com.sss.mapper;


import com.sss.users.course;
import com.sss.users.ct;
import com.sss.users.user;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    //与mapper.xml的id同名，
    List<user> selectAllT();

    List<user> selectTByName(@Param("name")String name);

    user selectTByAccount(@Param("account")String account);

    void deleteT(@Param("account")String account);

    void updateT(user u);

    void addT(user u);

    void updatePassword(@Param("account")String account,@Param("newPassword")String newPassword);

    List<course> selectAllC();

    void addC(course c);

    void deleteC(@Param("name")String name);

    void updateC(course c);

    void updateCToT(@Param("Cname")String Cname,@Param("Tname")String Tname,@Param("account")String account);

    List<ct> selectAllCT();

    void addCT(@Param("name")String name,@Param("teacher")String teacher,@Param("sex")String sex,@Param("account")String account);

    void deleteCT(@Param("name")String name,@Param("account")String account);

    void deleteACT(@Param("name")String name);
}
