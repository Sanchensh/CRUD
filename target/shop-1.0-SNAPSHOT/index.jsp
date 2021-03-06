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
    <script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
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
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info"></div>
        <%--分页条--%>
        <div class="col-md-6" id="page_nav"></div>
    </div>
</div>
<script type="text/javascript">
    //1、页面加载完成后，直接发送一个ajax请求，要到分页数据
    $(function () {
        //首页
        toPage(1);
    });
    //发送ajax请求
    function toPage(start) {
        $.ajax({
            url: "emps",
            data: "start="+start,
            type: "get",
            success: function (result) {
                //console.log(result);
                //请求成功后 1、解析员工信息 2、显示分页数据
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }
    
    function build_emps_table(result) {
        //构建之前，要清空信息
        $("#emps_table tbody").empty();

        var emps = result.map.pageInfo.list;
        $.each(emps, function (index, item) {
            var empIdTd = $("<td></td>").append(item.empID);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender);
            var empEmailTd = $("<td></td>").append(item.email);
            var empDeptTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var btnTD = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);

            $("<tr></tr>")
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDeptTd)
                .append(btnTD)
                .appendTo("#emps_table tbody");

        });
    }
    //解析分页信息
    function build_page_info(result) {
        $("#page_info").empty();
        $("#page_info").append("当前是第"+ result.map.pageInfo.pageNum+"页，一共"+
            result.map.pageInfo.pages +"页，一共"+result.map.pageInfo.total+"条数据");
    }

    //解析分页条,点击事件
    function build_page_nav(result) {
        //每次请求之前，将数据清空
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var previosPageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        //跳到第一页
        firstPageLi.click(function () {
            toPage(1);
        });
        //点击向左翻页
        if(result.map.pageInfo.hasPreviousPage==true){
            previosPageLi.click(function () {
                toPage(result.map.pageInfo.pageNum-1);
            });
        }
        //设置样式
        if(result.map.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disable");
            previosPageLi.addClass("disable");
        }


        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        //如果有下一页，点击则有效
        if(result.map.pageInfo.hasNextPage==true){
            nextPageLi.click(function () {
                toPage(result.map.pageInfo.pageNum+1);
            });
        }
        //点击跳到最后一页
        lastPageLi.click(function () {
            toPage(result.map.pageInfo.pages);
        });
        //设置样式
        if(result.map.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disable");
            lastPageLi.addClass("disable");
        }

        //添加首页和前一页
        ul.append(firstPageLi).append(previosPageLi);
        //遍历给ul添加页码提示
        $.each(result.map.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.map.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item)
            })
            ul.append(numLi);
        });

        //添加下一页和末页
        ul.append(nextPageLi).append(lastPageLi);
        //把ul加入到nav
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }
</script>
</body>
</html>
