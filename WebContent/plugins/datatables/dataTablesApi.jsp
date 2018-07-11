<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery dataTables</title>



<link rel="stylesheet" href="${ctx}/js/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${ctx}/js/datatables/css/dataTables.bootstrap.css" type="text/css">
<!--  <link rel="stylesheet" href="${ctx}/js/datatables/css/jquery.dataTables.css" type="text/css"> -->
<script src="${ctx}/js/datatables/js/jquery.js"></script>
<script src="${ctx}/js/datatables/js/jquery.dataTables.js"></script>
<script src="${ctx}/js/datatables/js/dataTables.bootstrap.js"></script>
<style>

/* 点击变颜色 用于bootstrap样式的datatable */
table.table tbody tr.selected{background:red !important;}
div.dataTables_wrapper{width:500px;}

/* 第一列的加号图片  */
td.details-control {
    background: url('${ctx}/plugins/datatables/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('${ctx}/plugins/datatables/details_close.png') no-repeat center center;
}
</style>
<script>
function formToJson(objArray,data){
	for(var i = 0 , j = objArray.length ; i < j ;i++){
		var obj = objArray[i];
		data[obj.name] = obj.value;
	}
	return data;
}
function sexFormatter ( data, type, full, meta ) {
    return data+"人";
}
var jqtable ;
var table;
$(document).ready(function() {
	  //jqtable =  $('#example').DataTable( {
	table =  $('#example').DataTable( {
			
		
			/*
			dom属性	字母含义
			
			l - Length changing
			f - Filtering input
			t - The Table!
			i - Information
			p - Pagination
			r - pRocessing
			< and > - div elements
			<"#id" and > - div with an id
			<"class" and > - div with a class
			<"#id.class" and > - div with an id and class
			
			例如
			<"wrapper"flipt>
			表示
			<div class="wrapper">
			    { filter } - 搜索
			    { length } - 每页长度
			    { info } - 总条目数，当前多少页信息
			    { paging } - 分页信息
			    { table } - 表格
			</div>
		
			再例如
			<lf<t>ip>
			表示
			<div>
			    { length }
			    { filter }
			    <div>
			        { table }
			    </div>
			    { info }
			    { paging }
			</div>
			*/
			//dom:"<f<t>ipl>",
			dom:"<'row'<'col-sm-12'tr>><'col-sm-8'p><'col-sm-2'l><'col-sm-2'i>",
			//datables 默认的dom属性
			//dom:"<'row'<'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
			
			//国际化
			language: {
				//url: "${ctx}/plugins/datatables/zh_CN.txt"
				url: "${ctx}/plugins/datatables/en_US.txt"
		    },
			
			//分页数量
			lengthMenu: [[11, 25, 50, -1], [11, 25, 50, "All"]],
			//是否排序
		    ordering:  true,
		    //设置水平滚动 (必须设置样式 div.dataTables_wrapper{width:...px;})
		    scrollX:true,
		    //设置垂直滚动
		    scrollY:"500px",
	        scrollCollapse: true,
	        //是否自适应宽度
		    //autoWidth:true,
	        //默认排序
	        order: [[1, 'asc'],[2, 'desc']],
		    //分页样式
		    pagingType:"simple",
		    //是否打开左下角信息
		    info:true,
		    //指定行的ID属性
		    rowId:"id",
		    //是否允许用户改变表格每页显示的记录数
		    lengthChange:true,
		    //是否开启本地分页
		   //paging:false,
		    //bLengthChange: true, //开关，是否显示一个每页长度的选择条（需要分页器支持）
		    //是否显示处理状态(排序的时候，数据很多耗费时间长的话，也会显示这个)
		    processing:true,
		    //开发服务端模式  服务端模式下如：过滤、分页、排序的处理都放在服务器端进行，否则都在客户端进行
		    serverSide:true,
		    //是否支持当前数据查询
		    searching: false, 
		    //数据ajax请求
		    ajax: {
		    	//后台获取数据地址
		        url:"${ctx}/datatables/datatables!dataTablesApiGetData.do",
		        //请求类型
		        type: "POST",
		        data:function(d){
		           //d这个参数已经加入了分页和排序内容，可在下面内容重新格式化该参数以便后台容易接收
		           
		           //设置查询参数
	            	var jsonData = $("#theForm").serializeArray();
	            	d = formToJson(jsonData,d);
	            	
	            	
		         	//设置排序信息
	       		    var columns = d.columns[d.order[0].column].data;
	       		    var dir = d.order[0].dir;
	            	d.orderColumn = columns;
	            	d.dir = dir;
                    return d;
                },
		        //错误处理
		        error:ajaxErrHandler
		      },
		    
			//每列对应json数据属性  一定要加入上defaultContent:""配置处理返回的JSON某属性为空的情况
	        columns: [
	            {
    	             className:      'details-control',
    	             orderable:      false,
    	             data:           null,
    	             defaultContent: ''
	     	    },
				{name:"id",data:"id",orderable : "false",
				    fnCreatedCell: function (nTd, sData, oData, iRow, iCol) {
				        $(nTd).html("<input type='checkbox' name='checkList' id='ck_" + sData + "' value='" + sData + "'/>");
				    }},
	            {name:"name",data: "name",defaultContent:"" },
	            {name:"sexval", data: "sexval" ,defaultContent:"",render:sexFormatter},
	            {name:"bir", data: "bir" ,defaultContent:"" },
	            {name:"mail",data: "mail"  ,defaultContent:""},
	            {name:"tel",data: "tel" ,defaultContent:"" }
	           
	        ],
			//自定义的列
			columnDefs: [
		                 {
		                     targets: 7,
		                     render: function(data, type, row) {
									var id = row.id;
									return "<i class='fa fa-pencil l-fa edit-btn' onclick=\"edit('"+id+"')\" style='cursor: pointer' id=\'" + id + "\' >编辑</i>"
										
							}
		                 },
		                 {
		                     targets:8,
		                     render: function(data, type, row) {
									var id = row.id;
									return  "<i class='fa fa-trash-o m-fa del-btn' style='cursor: pointer' onclick=\"del('"+id+"')\" id=\'" + id + "\'>删除</i>";
							}
		                 }
		 	 ]
		 
	    } );
		
	
		function ajaxErrHandler( xhr, textStatus, error){
			alert('获取数据失败');
		}
	
	
	
		//table = jqtable.api();
		$('#example tbody').on('click', 'tr', function () {
			//this为tr DOM对象
			var data = table.row(this).data();
			
			
			//获取id(),表格定义时必须要指定 rowId选项,
			var id = table.row( this ).id();
			
			//注意：点击变色必须加入jquery.dataTables.css
			printInfo("点击一行" ,"[id:" + id + "]: <br/>数据："+ JSON.stringify(data));
			
			
			
			//alert( 'You clicked on '+data.name+'\'s row' );
			//alert(this.innerHTML);
			//alert($(this).html());
			
			
			//单选，多选  必须加入jquery.dataTables.css才可以看出来变色效果
			//多选
			//$(this).toggleClass('selected');
			
			//单选
			if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	            table.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
		} );
		
		$('#example tbody').on('click', 'td', function () {
			var data = table.row(this).data();
			//printInfo("点击一行" , JSON.stringify(data));
			//alert( 'You clicked on '+data.name +'\'s row' );
			//alert(this.innerHTML);
			//alert($(this).html());
		} );
		
		
		
		//点击加号后在点击行下面展示附加内容
		// Add event listener for opening and closing details
	    $('#example tbody').on('click', 'td.details-control', function () {
	        var tr = $(this).closest('tr');
	        var row = table.row( tr );
	 
	        if ( row.child.isShown() ) {
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	        }
	        else {
	            // Open this row
	            row.child( formatAdditional(row.data()) ).show();
	            tr.addClass('shown');
	        }
	    } );
	    /* Formatting function for row details - modify as you need */
	    function formatAdditional ( d ) {
	        // `d` is the original data object for the row
	        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
	            '<tr>'+
	                '<td>Full name:</td>'+
	                '<td>'+d.name+'</td>'+
	            '</tr>'+
	            '<tr>'+
	                '<td>Extension number:</td>'+
	                '<td>'+d.sexval+'</td>'+
	            '</tr>'+
	            '<tr>'+
	                '<td>Extra info:</td>'+
	                '<td>And any further details here (images etc)...</td>'+
	            '</tr>'+
	        '</table>';
	    }
		
		
		
	} );
	
	//刷新
	function reloadTable(){
		
			/*	
			table.ajax.reload api:
			参数：
			Name:	callback	
			Type:function  Yes - default:null
			Optional: Function which is executed when the data as been reloaded and the table fully redrawn. The function is given a single parameter - the JSON data returned by the server, and expects no return.
			
			Name:	resetPaging	 是否重置分页(从第一页查询)
			Type:boolean Yes - default:true
			Optional:Reset (default action or true) or hold the current paging position (false). A full re-sort and re-filter is performed when this method is called, which is why the pagination reset is the default action.
			*/
		table.ajax.reload(null,false);
	}
	
	function search(){
		table.ajax.reload();
	}


	function test(){
		//alert(table)
		//alert(table.ajax.params());
		// 获取表格数据
		var data = table.data();
		alert(data);
		//获取ajax url
		alert(table.ajax.url());
		//获取参数
		var params = table.ajax.params();
		alert(params);
		//获取排序内容
		var orders = table.order();
		alert(orders);
	}
	
	
	function del(id){
		alert("删除" + id);
	}
	function edit(id){
		alert("编辑" + id );
	}

	//获取数据
	function getDataTablesDatas(){
		var data = table.data();
		var dataArray = [];
		for(var i = 0 , j = data.length ; i < j ; i++){
			dataArray.push( JSON.stringify(data[i]));
		}
		printInfo("获取表格数据" , "总计["+data.length+"]条记录<br/>" + dataArray);
	}
	
	function getSelected(){
		var data = table.rows('.selected').data();
		var dataArray = [];
		for(var i = 0 , j = data.length ; i < j ; i++){
			dataArray.push( JSON.stringify(data[i]));
		}
		printInfo("获取选中(变色 .selected)数据" , "总计已选择["+data.length+"]条记录<br/>" + dataArray);
	}
	
	function selectRow(){
		//根据序号查找
		var data = table.row(0).data();
		printInfo("根据序号查找" ,JSON.stringify(data));
		
		//根据ID查询    注:根据ID查询,ID的值是根据datatables中配置的rowId属性,在数据中查询该属性的值，该值会加入到tr的id属性中
		var data2 = table.row("#402881e846e139fa0146e13ca9730002").data();
		printInfo("根据ID查找" ,JSON.stringify(data2));
	}

	//日志输出
	function printInfo(tit,str){
		$("#editInfo").html(new Date() + "<br/>" +"<b>" + tit + ":</b>" + str + "<hr/>"+$("#editInfo").html()); 
	}
	
	//勾选所有
	function checkAll(){
		$("#example tbody input[type=checkbox]").each(function(){
			//printInfo("xx" ,$(this)[0].checked);
			$(this)[0].checked="checked";
			//alert($(this).val())
		})
	}
	
	//取消勾选所有
	function uncheckAll(){
		$("#example tbody input[type=checkbox]").each(function(){
			//$(this).removeAttr("checked",false);
			$(this)[0].checked=false;
		})
	}
	
	//获取勾选的数据
	function getChecked(){
		var checkedDatas = [];		
		$("#example tbody input[type=checkbox]").each(function(){
			if($(this)[0].checked){
				var data2 = table.row($(this)[0].val).data();
				checkedDatas.push(data2);
			}
		})
		printInfo("勾选的数据" ,JSON.stringify(checkedDatas));
	}
	//勾选中某行
	function checkRow(idStr){
		var ids  = idStr.split(",");
		for(var i = 0 , j = ids.length ; i < j ; i++){
			var id = ids[i];
			if($.trim(id) != ''){
				$("#ck_"+id)[0].checked = "checked";
			}
		}
		
		
		//document.getElementById("ck_" + id).checked = "checked";
		//alert(document.getElementById("ck_402881e846e139fa0146e13ca9730002").value)
	}
	
	function changeStyle(styleStr){
		$("#example").toggleClass(styleStr);
	}
	
	function addARow(){
	    table.row.add( {
	    			"id":"11",
	    			"name":"张三",
	    			"sex":0,
	    			"sexval":"女",
	    			"bir":"2016-09-06",
	    			"status":"1"
	    			}).draw( false );
	}
	
	
</script>
</head>
<body style="padding:0px;margin:0px; ">


<div class="panel panel-default">
 <div class="panel-heading">用户信息管理</div>
 <div class="panel-body">
 	<form class="form-horizontal" id="theForm" action="" method="post" > 
	  <div class="form-group row">
	    <label for="inputPassword3" class="col-sm-2 control-label text-right">姓名</label>
	    <div class="col-sm-4">
	      	<input type="text" class="form-control" id="name" name="name"  placeholder="英文名称">
	    </div>
	    <label for="inputPassword3" class="col-sm-2 control-label text-right">性别</label>
	    <div class="col-sm-4">
	      	<input type="text" class="form-control" id="sex" name="sex" value="" placeholder="中文名称"/>
	    </div>
	  </div>
	  <div class="form-group row" >
	    <label for="inputPassword3" class="col-sm-2 control-label text-right">电话</label>
	    <div class="col-sm-4">
	      	<input type="text" class="form-control" id="tel" name="tel" value=""  placeholder="Code"/>
	    </div>
	    <label for="inputEmail3" class="col-sm-2 control-label text-right">账号（邮箱）</label>
	    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mail" name="mail" />
		</div>
	  </div>
	  
	   <div class=" text-center" >
		  <button type="button" class="btn btn-success btn-primary" onclick="search();">查询</button> 
		  <button type="button" class="btn btn-warning btn-primary">清空</button> 
	  </div>
	  
  </form>
 </div>
</div>


<input type="button" value="test" onclick="test()"/>
<input type="button" value="获取表格所有数据" onclick="getDataTablesDatas()"/>(必须加入jquery.dataTables.css才可以看出来)
<input type="button" value="获取选中数据(点击变色的行)" onclick="getSelected()"/>
<input type="button" value="选中API" onclick="selectRow()"/>
<input type="button" value="重新加载当前页数据 reloadTable" onclick="reloadTable()"/>
<input type="button" value="重新加载数据 search" onclick="search()"/>


<input type="button" value="全部勾选" onclick="checkAll()"/>
<input type="button" value="全部取消勾选" onclick="uncheckAll()"/>
<input type="button" value="获取勾选的数据" onclick="getChecked()"/>

<input type="button" value="勾选某行" onclick="checkRow('402881e846e139fa0146e13ca9730002,402881e846e119dc0146e119e218000b')"/>
<br/>
<input type="button" value="边框" onclick="changeStyle('table-bordered')"/>
<input type="button" value="鼠标经过后变色" onclick="changeStyle('table-hover')"/>
<input type="button" value="斑马纹" onclick="changeStyle('table-striped ')"/>
<br/>
<input type="button" value="添加一行(必须设置属性serverSide:false,否则会重新刷新数据)" onclick="addARow()"/>

  

<table id="example" class=" table" cellspacing="0" width="100%">
        <thead>
            <tr>
				<th ></th>
				<th >ID</th>
                <th >Name</th>
                <th >Sex</th>
                <th >Bir</th>
                <th >Mail</th>
                <th >Tel</th>
                <th>Edit</th>
				<th>Delete</th>
            </tr>
        </thead>
		<tfoot>
            <tr>
				<th></th>
				<th>ID</th>
                <th>Name</th>
                <th>Sex</th>
                <th>Bir</th>
                <th>Mail</th>
                <th>Tel</th>
                <th>Edit</th>
				<th>Delete</th>
            </tr>
        </tfoot>
       
    </table>


<div class="panel panel-success">
 <div class="panel-heading" onclick="$('#editInfo').html('')">Log Info</div>
 <div class="panel-body" id="editInfo">

 </div>
 </div>
 
</body>
</html>