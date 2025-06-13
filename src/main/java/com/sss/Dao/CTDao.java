package com.sss.Dao;

import com.sss.mapper.UserMapper;
import com.sss.users.course;
import com.sss.users.ct;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class CTDao {

    public static List<ct> getCT(){
        String resource = "mybatis-config.xml";
        List<ct> list ;
        try {
            /*1、加载mybatis的核心配置文件，获取SqlSessionFactory*/
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

            /*2、获取SqlSession*//*false 关闭自动提交——开启事务，需手动关闭事务*/
            SqlSession sqlSession = sqlSessionFactory.openSession(false);

            /*        *//*3、执行sql*//*
            list = sqlSession.selectList("sss.selectAll");*/
            /*3.1获取UserMapper接口的代理对象*/
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            list = userMapper.selectAllCT();

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static void addCt(String name,String teacher,String sex,String account){
        String resource = "mybatis-config.xml";
        try {
            /*1、加载mybatis的核心配置文件，获取SqlSessionFactory*/
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

            /*2、获取SqlSession*//*false 关闭自动提交——开启事务，需手动关闭事务*/
            SqlSession sqlSession = sqlSessionFactory.openSession(false);

            /*        *//*3、执行sql*//*
            list = sqlSession.selectList("sss.selectAll");*/
            /*3.1获取UserMapper接口的代理对象*/
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            userMapper.addCT(name,teacher,sex,account);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteCT(String name,String account){
        String resource = "mybatis-config.xml";
        try {
            /*1、加载mybatis的核心配置文件，获取SqlSessionFactory*/
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

            /*2、获取SqlSession*//*false 关闭自动提交——开启事务，需手动关闭事务*/
            SqlSession sqlSession = sqlSessionFactory.openSession(false);

            /*        *//*3、执行sql*//*
            list = sqlSession.selectList("sss.selectAll");*/
            /*3.1获取UserMapper接口的代理对象*/
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            userMapper.deleteCT(name,account);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteAct(String name){
        String resource = "mybatis-config.xml";
        try {
            /*1、加载mybatis的核心配置文件，获取SqlSessionFactory*/
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

            /*2、获取SqlSession*//*false 关闭自动提交——开启事务，需手动关闭事务*/
            SqlSession sqlSession = sqlSessionFactory.openSession(false);

            /*        *//*3、执行sql*//*
            list = sqlSession.selectList("sss.selectAll");*/
            /*3.1获取UserMapper接口的代理对象*/
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            userMapper.deleteACT(name);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }



}
