package com.sss.mapper;

import com.sss.POJO.Teacher;

import java.util.List;

public interface UserMapper {

    //与mapper.xml的id同名，
    List<Teacher> selectAll();

}
