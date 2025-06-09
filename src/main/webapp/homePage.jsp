<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">

<!-- 内部CSS样式（仅修改非top部分） -->
<style>
/* 数据展示区域样式 */
.data-container {
    max-width: 800px;
    margin: 30px auto;
    background: #ffffff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.data-item {
    padding: 15px 0;
    border-bottom: 1px solid #f0f0f0;
}

.data-item:last-child {
    border-bottom: none;
}

.data-label {
    font-size: 1.1rem;
    color: #555;
    display: inline-block;
    width: 120px;
    font-weight: 500;
}

.data-value {
    font-size: 1.1rem;
    color: #333;
    margin-left: 20px;
}

.data-value a {
    color: #3498db;
    text-decoration: none;
    margin-left: 10px;
    transition: color 0.3s;
}

.data-value a:hover {
    color: #2980b9;
    text-decoration: underline;
}

/* 响应式适配 */
@media (max-width: 768px) {
    .data-container {
        padding: 20px;
        margin: 20px 3%;
    }
    
    .data-label,
    .data-value {
        font-size: 1rem;
        width: 100%;
        display: block;
        margin-left: 0;
        padding: 5px 0;
    }
}
</style>

</head>
<body class="pagein">

<!-- 保留原始top部分（未修改任何样式） -->
<div class="top">
    <span class="daohang">
        <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
        <a href="homePage.jsp" style="text-decoration:none"><i class="fas fa-smile" /></i>我的信息</a>
        <a href="T_course.jsp" style="text-decoration:none"><i class="fas fa-book" ></i>授课查询</a>
        <a href="index.jsp" style="text-decoration:none"><i class="fas fa-user-circle" ></i><%=session.getAttribute("user")%>:退出</a>
    </span>
</div>

<!-- 数据展示区域（应用新样式） -->
<div class="data-container">
    <div class="data-item">
        <span class="data-label">姓名:</span>
        <span class="data-value"><%=session.getAttribute("user") %></span>
    </div>
    
    <div class="data-item">
        <span class="data-label">年龄:</span>
        <span class="data-value"><%=session.getAttribute("age") %></span>
    </div>
    
    <div class="data-item">
        <span class="data-label">性别:</span>
        <span class="data-value"><%=session.getAttribute("sex") %></span>
    </div>
    
    <div class="data-item">
        <span class="data-label">账号:</span>
        <span class="data-value"><%=session.getAttribute("account") %></span>
    </div>
    
    <div class="data-item">
        <span class="data-label">密码:</span>
        <span class="data-value">
            <%=session.getAttribute("password") %> 
            <a href="Cp.jsp?account=<%=session.getAttribute("account") %>&error= " >修改密码</a>
        </span>
    </div>
    
    <div class="data-item">
        <span class="data-label">职位:</span>
        <span class="data-value"><%=session.getAttribute("der") %></span>
    </div>
    
    <div class="data-item">
        <span class="data-label">详情:</span>
        <span class="data-value"><%=session.getAttribute("ders") %></span>
    </div>
</div>

</body>
</html>