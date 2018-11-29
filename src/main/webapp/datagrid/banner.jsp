<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var toolbar = [{
        iconCls: 'icon-edit',
        text: "添加",
        handler: function () {
            $('#dd').dialog("open");
        }
    }, '-', {
        iconCls: 'icon-help',
        text: "修改",
        handler: function () {

//          getSelections none 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。
//                  判断用户是否选中行
            var row = $("#dg").edatagrid("getSelected");
            if (row == null) {
                alert("请选中某一个行数据")
            }
//          getRowIndex row 返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。
            var index = $("#dg").edatagrid("getRowIndex", row);
//          editRow index 编辑指定行。
            $("#dg").edatagrid("editRow", index);


        }
    }, '-', {
        iconCls: 'icon-remove',
        text: "删除",
        handler: function () {
            var row = $("#dg").edatagrid("getSelected");
            if (row == null) {
                alert("请选中某一个行数据")
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/banner/delete",
                    data: {
                        id: row.id
                    },
                    success: function (data) {
                        if (data) {
//                                    reload param 重载行。等同于'load'方法，但是它将保持在当前页。
                            $("#dg").datagrid("reload")
                        } else {
                            alert("删除失败哦")
                        }
                    }
                })
            }
        }
    }, '-', {
        iconCls: 'icon-save',
        text: "保存",
        handler: function () {
            $("#dg").edatagrid("saveRow")
        }
    }];
    $(function () {
        $('#dg').edatagrid({
            url: "${pageContext.request.contextPath}/banner/getAll",
            updateUrl: "${pageContext.request.contextPath}/banner/update",
            type: "get",
            columns: [[
                {field: 'title', title: '标题', width: 100},
                {
                    field: 'status', title: '状态', width: 100, editor: {
                    type: "text",
                    options: {
                        required: true
                    }
                }
                },
                {field: 'desc', title: '描述', width: 100, align: 'right'},
                {field: 'createDate', title: '创建时间', width: 100, align: 'right'}
            ]],
            view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/upload/' + rowData.url + '" style="height:800px;"></td>' +
                    '</tr></table>';
            },
            pagination: true,
            pageSize: 3,
            pageList: [3, 5, 10, 20, 50],
            fit: true,
            fitColumns: true,
            striped: true,
            toolbar: toolbar,
        });
    })
    function submit() {
        $("#ff").form("submit", {
            url: "${pageContext.request.contextPath}/banner/insert",
        })
        $('#dd').dialog('close');
        $("#dg").datagrid("reload");
    }

</script>

<table id="dg"></table>
<div id="dd" class="easyui-dialog" title="添加" style="width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[{
				text:'保存',
				handler:function(){
                    submit();
				}
			},{
				text:'关闭',
				handler:function(){
				    $('#dd').dialog('close');
				}
			}]">
    <form id="ff" method="post" enctype="multipart/form-data">
        <div>
            <label for="title">名字:</label>
            <input id="title" class="easyui-validatebox" type="text" name="title" data-options="required:true"/>
        </div>
        <div>
            <label for="desc">描述:</label>
            <input id="desc" class="easyui-validatebox" type="text" name="desc" data-options="required:true"/>
        </div>
        <label for="urll">图片:</label>
        <input id="urll" class="easyui-filebox" name="urll" style="width:300px">
        <select id="status" class="easyui-combobox" name="status" style="width:200px;">
            <option value="y">展示</option>
            <option value="n">不展示</option>
        </select>
    </form>
</div>
