package com.sss.sql;


import com.sss.mapper.UserMapper;
import com.sss.users.course;
import com.sss.users.user;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class SqlServer {

    public static List<user> getT(){

        String resource = "mybatis-config.xml";
        List<user> list;
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
            list = userMapper.selectAllT();

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    return list;
    }

    public static void addT(String name,int age,String sex,String der,String ders,String account,String password){
        user u=new user();
        u.setName(name);
        u.setAge(age);
        u.setSex(sex);
        u.setDer(der);
        u.setDers(ders);
        u.setAccount(account);
        u.setPassword(password);
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
            userMapper.addT(u);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateT(String name,int age,String sex,String der,String ders,String account,String password){
        user u=new user();
        u.setName(name);
        u.setAge(age);
        u.setSex(sex);
        u.setDer(der);
        u.setDers(ders);
        u.setAccount(account);
        u.setPassword(password);
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
            userMapper.updateT(u);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void ChangePassword(String account,String password){

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
            userMapper.updatePassword( account, password);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<course> getC(){
        String resource = "mybatis-config.xml";
        List<course> list ;
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
            list = userMapper.selectAllC();

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        return list;



    }






}
