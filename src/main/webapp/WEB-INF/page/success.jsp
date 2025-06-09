<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="java.util.List" %>

<%@ page import="com.sss.mapper.UserMapper" %>
<%@ page import="com.sss.users.user" %>
<%@ page import="com.sss.sql.SqlServer" %><%--
  Created by IntelliJ IDEA.
  User: swt
  Date: 2025/6/7
  Time: 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%
/*    *//*1、加载mybatis的核心配置文件，获取SqlSessionFactory*//*
    String resource = "mybatis-config.xml";
    InputStream inputStream = Resources.getResourceAsStream(resource);
    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

    *//*2、获取SqlSession*//*
    List<user> list;
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {

*//*        *//**//*3、执行sql*//**//*
        list = sqlSession.selectList("sss.selectAll");*//*
        *//*3.1获取UserMapper接口的代理对象*//*
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        list = userMapper.selectAll();
        *//*4、释放资源*//*
    }*/


    List<user> list = SqlServer.getT();

%>

<table>
    <thead>
        <tr>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>账号</th>
            <th>密码</th>
            <th>职位</th>
            <th>详情</th>
        </tr>


    </thead>
    <tbody>

        <%
            for (user T: list) {

                %>
                    <tr>
                        <td><%=T.getName()%></td>
                        <td><%=T.getAge()%></td>
                        <td><%=T.getSex()%></td>
                        <td><%=T.getAccount()%></td>
                        <td><%=T.getPassword()%></td>
                        <td><%=T.getDer()%></td>
                        <td><%=T.getDers()%></td>
                    </tr>
                <%


            }
        %>


    </tr>



    </tbody>
</table>




</body>
</html>
