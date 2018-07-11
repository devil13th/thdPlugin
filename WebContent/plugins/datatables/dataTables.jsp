<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery dataTables</title>


<style>
</style>


<link rel="stylesheet" href="${ctx}/js/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${ctx}/js/datatables/css/dataTables.bootstrap.css" type="text/css">

<script src="${ctx}/js/datatables/js/jquery.js"></script>
<script src="${ctx}/js/datatables/js/jquery.dataTables.js"></script>
<script src="${ctx}/js/datatables/js/dataTables.bootstrap.js"></script>

<script>
var table;

//数组形式添加
/*
var dataSet = [
               [ "Tiger Nixon", "System Architect", "Edinburgh", "5421", "2011/04/25", "$320,800" ],
               [ "Garrett Winters", "Accountant", "Tokyo", "8422", "2011/07/25", "$170,750" ],
               [ "Ashton Cox", "Junior Technical Author", "San Francisco", "1562", "2009/01/12", "$86,000" ],
            
               [ "Gavin Cortez", "Team Leader", "San Francisco", "2860", "2008/10/26", "$235,500" ],
               [ "Martena Mccray", "Post-Sales support", "Edinburgh", "8240", "2011/03/09", "$324,050" ],
               [ "Unity Butler", "Marketing Designer", "San Francisco", "5384", "2009/12/09", "$85,675" ]
           ];

 */    
 //对象方式添加
 var dataSet = [
                {id:1,name:1},
                {id:2,name:2},
                {id:3,name:3},
                {id:4,name:4},
                {id:5,name:5},
            ];
           
           
$(document).ready(function() {
	table = $('#example').DataTable( {
   		data: dataSet,
   	    //是否开启本地分页
		paging:false, 
		//数组形式添加
   		/*columns: [
   			{ title: "Name",name:'name',defaultContent:"" },
   			{ title: "Position",name:'position',defaultContent:"" },
   			{ title: "Office",name:'office',defaultContent:"" },
   			{ title: "Extn.",name:'extn',defaultContent:"" },
   			{ title: "Start date" ,name:'startDate',defaultContent:""},
   			{ title: "Salary" ,name:'salary',defaultContent:""}
   		]*/
   	 //对象方式添加
   		columns: [
   	   			{ title: "id",name:'id',data:'id',defaultContent:"" },
   	   			{ title: "name",name:'name',data:'name',defaultContent:"" }
   	   		]
   	} );
	
	
	$('#example tbody').on('click', 'tr', function () {
		var data = table.row(this).data();
		alert( JSON.stringify(data));
		$(this).toggleClass('selected');
		//alert( 'You clicked on '+data.name+'\'s row' );
		//alert(this.innerHTML);
		//alert($(this).html());
	} );
	
	
});
		
function addRow(){
	//数组形式添加
	/*table.row.add(
			[ 'Fiona White', 32, 'Edinburgh' ]
	).draw();*/
	
	 //对象方式添加
	table.row.add(
			{
				id:10,
				name:10
			}
	).draw();
}

</script>
</head>
<body style="padding:0px;margin:0px; ">
	  
<div style="width:100%;overflow:hidden;">
<table id="example" class="table display" width="100%"></table>
</div>
<input type="button" value="test" onclick="addRow()"/>
</body>
</html>