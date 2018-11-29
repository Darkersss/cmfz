﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="../js/jquery.edatagrid.js"></script>
    <script src="../js/echarts.min.js"></script>
    <script src="../js/china.js"></script>
    <link rel="stylesheet" type="text/css" href="../themes/icon.css">

    <script type="text/javascript">
        <!--菜单处理-->
        $(function () {
            $.ajax({
                /*发出请求*/
                url: "${pageContext.request.contextPath}/menu/getAll",
                /*提交请求方式*/
                type: "post",
                success: function (data) {
                    $.each(data, function (index, first) {
                        var a = "";
                        $.each(first.menus, function (index, second) {
                            a += "<div style='text-align: center'><a href='#' class='easyui-linkbutton' data-options=\"iconCls:'icon-search',plain:true\" onclick=\"addTabs('" + second.title + "','" + second.url + "','" + second.iconCls + "')\">" + second.title + "</a></div>";
                        })
                        $('#aa').accordion('add', {
                            title: first.title,
                            content: a,
                            iconCls: first.iconCls,
                            selected: false
                        });
                    })
                }
            })
        })
        function addTabs(title, url, iconCls) {
            /*exists表明指定的面板是否存在，'which'参数可以是选项卡面板的标题或索引*/
            var flag = $("#tt").tabs("exists", title);
            if (flag) {
                /*选择一个选项卡面板，'which'参数可以是选项卡面板的标题或者索引。*/
                $("#tt").tabs("select", title);
            } else {
                /*添加一个新选项卡面板*/
                $('#tt').tabs('add', {
                    /*选项卡标题文本*/
                    title: title,
                    /*设置为true选项卡会被选中*/
                    selected: true,
                    /*定义一个图标显示到选项卡面板标题中*/
                    iconCls: iconCls,
                    /*从trl加载远程数据到数据卡面板中*/
                    href: "${pageContext.request.contextPath}/" + url,
                    /*设置为true时选项卡会有一个关闭按钮,点击会关闭对话框*/
                    closable: true
                });
            }
        }
    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:#5C160C">
    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px">
        持名法州后台管理系统
    </div>
    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">
        欢迎您:<%=session.getAttribute("name") %>
        &nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a>
    </div>
</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体">&copy;百知教育 htf@zparkhr.com.cn</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true">
    </div>
</div>
<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',closable:true"
             style="background-image:url(image/2.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>
</div>
</body>
</html>