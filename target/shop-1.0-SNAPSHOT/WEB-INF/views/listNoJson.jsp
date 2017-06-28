<%--
  Created by IntelliJ IDEA.
  User: Mr Xu
  Date: 2017/6/23
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>

    <%--web路径问题--%>
    <%--不以/开始的是相对路径，找资源，以当前资源的路径为基准--%>
    <%--以/开始的相对路径，找资源，以服务器的路径为标准，需要加项目名--%>
    <%--<%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>--%>
    <script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../resources/js/bootstrap.min.js"></script>
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
                                    <%--搭建显示页面--%>
    <div class="container">
            <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
            <%--按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
            <%--表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empID}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
            <%--显示分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前${pageInfo.getPageNum()}页，
                一共${pageInfo.getPages()}页，
                一共${pageInfo.getTotal()}条记录
            </div>
            <%--分页条--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="Pagination">

                        <li>
                            <%--如果不是第一页，首页按钮点击则会跳到首页--%>
                            <a href="/?start=1" aria-label="First">首页</a>
                        </li>

                        <li>
                            <%--如果不是第一页，那么向左翻页便可以点击--%>
                            <c:if test="${pageInfo.getPageNum()>1}">
                                <a href="/?start=${pageInfo.getPageNum()-1}" aria-label="Previews">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </c:if>
                        </li>

                        <%--遍历当前应该显示的页面--%>
                        <c:forEach items="${pageInfo.getNavigatepageNums()}" var="pages">
                            <%--如果当前页面正好是遍历时的页面，那么Li的显示变为active，并且无法点击--%>
                            <c:if test="${pages==pageInfo.getPageNum()}">
                                <li class="active"><a href="#">${pages}</a></li>
                            </c:if>
                            <%--如果当前页面不是遍历时的页面，点击按钮则会跳到当前页--%>
                            <c:if test="${pages!=pageInfo.pageNum}">
                                <li><a href="/?start=${pages}">${pages}</a></li>
                            </c:if>
                        </c:forEach>

                        <li>
                            <%--如果当前页小于总页数，那么点击下一页导航箭头则会跳到下一个一页面--%>
                            <c:if test="${pageInfo.getPageNum()<pageInfo.getPages()}">
                                <a href="/?start=${pageInfo.getPageNum()+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </c:if>
                        </li>

                        <li>
                            <%--如果不是最后一页，那么点击按钮则会跳到最后一页--%>
                            <a href="/?start=${pageInfo.getPages()}" aria-label="First">末页</a>
                        </li>

                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
