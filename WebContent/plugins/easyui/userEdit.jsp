<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery form</title>

<!-- easyui css -->
<link rel="stylesheet" href="${ctx}/js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="${ctx}/js/easyui/themes/icon.css" />

<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>

<!--  easyui js -->

<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script src="${ctx}/js/easyui/locale/easyui-lang-zh_CN.js"></script> 


<script>

//自定义表单的验证规则

$.extend($.fn.validatebox.defaults.rules, {
	    number: {
	        validator: function(value){
       		if(value.substring(value.length-1)=="."){
           		return false;
           	}
	            return !isNaN(value);
	        },
	        message: '必须填写数字'
	    }
	});
	$.extend($.fn.validatebox.defaults.rules, {
	    minLength: {
	        validator: function(value, param){
	            return value.length >= param[0];
	        },
	        message: '请输入至少 {0}个字符.'
	    }
	});
	
	$.extend($.fn.validatebox.defaults.rules,{
	    maxLength: {
	        validator: function(value, param){
	            return value.length <= param[0];
	        },
	        message: '最多输入{0}个字符'
	    }
	});
	$.extend($.fn.validatebox.defaults.rules, {
	    min: {
	        validator: function(value, param){
	            return value >= param[0]; 
	        },
	        message: '请输入大于 {0} 的数字'
	    }
	});
	$.extend($.fn.validatebox.defaults.rules, {
	    max: {
	        validator: function(value, param){
	            return value <= param[0];
	        },
	        message: '请输入小于 {0} 的数字'
	    }
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
	    compare: {
	        validator: function(value, param){
	        	var bv = $("#"+param).numberbox("getValue");
	            return value <= bv;
	        },
	        message: '必须大于a'
	    }
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
	    mustselect: {
	        validator: function(value){
	        	//alert(value);
	            return value !='请选择';
	        },
	        message: '请输入小于 {0} 的数字'
	    }
	});
$.extend($.fn.validatebox.defaults.rules, {
    mustselect: {
        validator: function(value){
        	//alert(value);
            return value !='请选择';
        },
        message: '必须选择'
    }
});




var thdForm;
//提交表单
function submitForm(){
	if(!theForm.form("validate")){
		return false;
	};
	document.getElementById("theForm").submit();
}
//重置表单
function resetForm(){
	theForm.form("reset");
}
//清空表单
function clearForm(){
	theForm.form("clear");
	
}

$(function(){
	$('#userSex').combobox({editable:false,validType:['mustselect']});
	<c:if test="${sysUser.id != null}">
	$('#userSex').combobox("setValue","${sysUser.userSex}");
	</c:if>
	
	theForm = $('#theForm').form({
		ajax:false
	});
})


	
</script>
</head>
<body>
<s:form id="theForm" namespace="/easyUi" action="easyUi!userEditSubmit">
	<div id="hiddenDiv" style="border:1px solid #eee;">
	<input type="text" name="sysUser.id" value="${sysUser.id}" />
	</div>
	
	<table width="500">
		<tr>
			<td align="right" width="100">用户名:</td>
			<td width="300">
				<input 
				type="text" 
				name="sysUser.userName"
				id="userName" 
				class="easyui-textbox" 
				data-options="required:true,validType:['maxLength[5]','minLength[2]']"
				value="${sysUser.userName}" />
			</td>
		</tr>
		<tr>
			<td align="right">性别:</td>
			<td>
				<select 
				id="userSex" 
				name="sysUser.userSex">
				<option value="">请选择</option>
				<option value="1">男</option>
				<option value="0">女</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right">邮箱:</td>
			<td>
				<input 
				type="text" 
				name="sysUser.userMail"
				id="userMail"
				class="easyui-textbox" 
				data-options="required:true,validType:'email'"
				value="${sysUser.userMail}" />
			</td>
		</tr>
		<tr>
			<td align="right">电话:</td>
			<td>
				<input 
				type="text" 
				name="sysUser.userTel"
				id="userTel" 
				class="easyui-textbox" 
				data-options="required:true,validType:['number','length[0,11]']"
				value="${sysUser.userTel}" />
			</td>
		</tr>
		<tr>
			<td align="right">生日:</td>
			<td>
				<input 
				type="text" 
				name="sysUser.userBirthday" 
				id="userBirthday"
				class="easyui-datebox" 
				data-options="required:true,editable:false" 
				value="${sysUser.userBirthday}"/>
			</td>
		</tr>
		<tr>
			<td align="right"></td>
			<td>
				<a 
				href="#" 
				class="easyui-linkbutton" 
				data-options="iconCls:'icon-save'" 
				onclick=" submitForm()">
				保存
				</a>
				
				<a 
				href="#" 
				class="easyui-linkbutton" 
				data-options="iconCls:'icon-clear'"
				onclick="resetForm()">
				重置
				</a>
				
				<a 
				href="#" 
				class="easyui-linkbutton" 
				data-options="iconCls:'icon-clear'"
				onclick="clearForm()">
				清空
				</a>
			</td>
		</tr>
	</table>
	
	
	
			

	
	
	
</s:form>

</body>
</html>