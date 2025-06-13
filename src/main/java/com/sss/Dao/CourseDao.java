package com.sss.Dao;

import com.sss.mapper.UserMapper;
import com.sss.users.course;
import com.sss.users.user;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;


public class CourseDao {

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

    public static void updateC(String name,String time,String teacher,String classtime,String account){
        course c = new course();
        c.setName(name);
        c.setTeacher(teacher);
        c.setTime(time);
        c.setClassTime(Integer.valueOf(classtime));
        c.setTaccount(account);
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
            userMapper.updateC(c);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteC(String name){
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
            userMapper.deleteT(name);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        CTDao.deleteAct(name);


    }

    public static void addC(String name,String time,String teacher,String classtime,String account){
        course c = new course();
        c.setName(name);
        c.setTeacher(teacher);
        c.setTime(time);
        c.setClassTime(Integer.valueOf(classtime));
        c.setTaccount(account);
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
            userMapper.addC(c);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    public static void CaddT(String Cname,String Tname,String account){
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
            userMapper.updateCToT(Cname,Tname,account);

            /*提交事务*/
            sqlSession.commit();
            /*4、释放资源*/
            sqlSession.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
