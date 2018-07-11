<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery datagrid</title>

<!-- easyui css -->
<link rel="stylesheet" href="${ctx}/js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="${ctx}/js/easyui/themes/icon.css" />

<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>

<!--  easyui js -->
<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script src="${ctx}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
 
</script>
</head>
<body class="easyui-layout">
        <div data-options="region:'north',split:true" title="North" style="height:150px"></div>
        <div data-options="region:'south',split:true" title="South" style="height:150px;"></div>
        <div data-options="region:'east',split:true" title="East" style="width:180px;">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true"></ul>
        </div>
        <div data-options="region:'west',split:true" title="West" style="width:100px;">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="Title1" style="padding:10px;">
                    content1
                </div>
                <div title="Title2" data-options="selected:true" style="padding:10px;">
                    content2
                </div>
                <div title="Title3" style="padding:10px">
                    content3
                </div>
            </div>
        </div>
        <div data-options="region:'center',border:false" >
        	<div class="easyui-tabs" data-options="fit:true">
                <div title="About"  style="padding:10px"></div>
                <div title="DataGrid" style="padding:5px">
                    <table class="easyui-datagrid"
                            data-options="url:'datagrid_data1.json',method:'get',singleSelect:true,fit:true,fitColumns:true">
                        <thead>
                            <tr>
                                <th data-options="field:'itemid'" width="80">Item ID</th>
                                <th data-options="field:'productid'" width="100">Product ID</th>
                                <th data-options="field:'listprice',align:'right'" width="80">List Price</th>
                                <th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
                                <th data-options="field:'attr1'" width="150">Attribute</th>
                                <th data-options="field:'status',align:'center'" width="50">Status</th>
                            </tr>
                        </thead>
                    </table>
                </div>
             </div>
        </div>
</body>
</html>