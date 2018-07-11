<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8" />
<title>bootstrap select2</title>


<style>
.d{width:150px;float:left;margin:10px;}
</style>
<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/icheck/icheck.js"></script>
<link rel="stylesheet" href="${ctx}/js/icheck/skins/all.css" type="text/css"/>
<script>
$(document).ready(function(){
  $('input.a').each(function(){
		    var self = $(this),
		      label = self.next(),
		      label_text = label.text();

		    label.remove();
		    self.iCheck({
		      checkboxClass: 'icheckbox_line-red',
		      radioClass: 'iradio_line-red',
		      insert: '<div class="icheck_line-icon"></div>' + label_text
		    });
  });
  
  
  $('input.b').iCheck({
	    checkboxClass: 'icheckbox_flat-blue',
	    radioClass: 'iradio_flat-blue'
  });
  
  
  //选中事件
  $('input.a,input.b').on('ifChecked', function(event){
	  console.log(event);
	  alert(event.target.value + "|" + event.target.id + "|" + event.type + ' callback');
  });
  //取消选中事件
  $('input.a,input.b').on('ifUnchecked', function(event){
	  alert(event.target.value + "|" +event.target.id + "|" + event.type + ' callback');
  });
  
  
  



});

function getSelected(){
	$("input[name='iCheck_a']").each(function(){
		var str = "";
		if($(this).get(0).checked){
			str += (","+$(this).val());
		}
		alert(str);
		return str;
	})
}

function selected(){
	$("#xx2").iCheck('check');
}

function ck(){
	$('#xx').iCheck('check');
}
function unck(){
	$('#xx').iCheck('uncheck');
}

function disable(){
	$('#xx').iCheck('disable');
}

function enable(){
	$('#xx').iCheck('enable');
}
</script>
</head>
<body style="padding: 0px; margin: 0px;">

<div class="d">
<input class="a" id="xx" value="on" type="checkbox">
<label>Checkbox 1</label>
</div>
<div class="d">
<input class="a" type="checkbox" value="off" checked="checked">
<label>Checkbox 2</label>
</div>



<div style="clear:both;"></div>
<input type="button" onclick="ck()" value="checkbox1 选中"/>
<input type="button" onclick="unck()" value="checkbox2 取消选中"/>

<input type="button" onclick="disable()" value="checkbox1 disable"/>
<input type="button" onclick="enable()" value="checkbox2 enable"/>
<hr/>
<div style="clear:both;"></div>
<div class="d">
	<input class="a" type="radio" name="iCheck">
	<label>Radio button 1</label>
</div>
<div class="d">
	<input class="a" type="radio" name="iCheck" checked>
	<label>Radio button 2</label>
</div>

<div style="clear:both;"></div>

<div class="d">
	<input class="b" type="radio" id="xx1" name="iCheck_a" value="value-1">
	<label>Radio button 1</label>
</div>
<div class="d">
	<input class="b" type="radio" id="xx2" name="iCheck_a" value="value-2">
	<label>Radio button 2</label>
</div>
<input type="button" value="获取选择数据" onclick="getSelected()"/>

<input type="button" value="获取选择数据" onclick="selected()"/>
</body>
</html>