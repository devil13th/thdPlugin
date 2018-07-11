<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8" />
<title>bootstrap select2</title>


<style>
</style>
<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${ctx}/js/select2/css/select2.min.css" type="text/css">

<script src="${ctx}/js/select2/js/select2.min.js"></script>
<script src="${ctx}/js/select2/js/i18n/zh-CN.js"></script>


<script>
var test01;
var test02;
var test03;

$(document).ready(function() {
	  test01 = $("#test01").select2({
		  //默认文本,placeholder才可以使用allowClear 否则JS报错
		  placeholder: 'Select an option',
		  allowClear: true
		  
	  });
	  
	  
	  var data = [
	              { id: 0, text: 'enhancement' }, 
	              { id: 1, text: 'bug' }, 
	              { id: 2, text: 'duplicate' }, 
	              { id: 3, text: 'invalid' }, 
	              { id: 4, text: 'wontfix' }];
	  
	  test02 = $("#test02").select2({
		  data: data,
		  //默认文本,placeholder才可以使用allowClear 否则JS报错
		  placeholder: 'Select an option',
		  allowClear: true,
		  //最多可选择多少个
		  maximumSelectionLength: 2,
		  //去掉搜索框
		  minimumResultsForSearch: -1
	  })
	  
	  
	  test03 = $("#test03").select2({
		  //国际化
          language:'zh-CN',
		  ajax: {
		    url: "${ctx}/bootstrap/bootstrap!select2GetData.do",
		    dataType: 'json',
		    type : 'post',//防止中文传到后台乱码
		    delay: 250,
		    data: function (params) {
		      return {
		        q: params.term, // search term
		        page: params.page
		      };
		   },
		    processResults: function (data, params) {
		      // parse the results into the format expected by Select2
		      // since we are using custom formatting functions we do not need to
		      // alter the remote JSON data, except to indicate that infinite
		      // scrolling can be used
		      params.page = params.page || 1;
			  //alert(data.data);
		      return {
		        results: data.data,
		        //是否出最末端的分页，当滚到最下方后自动在此查询下一页内容的控制
		        pagination: {
		          more:  ((data.currentPage * data.pageSize) < data.recordsTotal)
		        }
		      };
		    },
		    cache: false
		  },
		  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
		  // 至少输入几个字符后开始检索
		  minimumInputLength: 2,
		  //下拉选中显示的内容
		  templateResult: function (data) {
		   // if (data.id === '') { // adjust for custom placeholder values
		   //     return 'Custom styled placeholder text';
		   //   }
				//如果使用ajax获取select的下拉数据  需要设置初始值必须data使用id和text属性!!!否则选不上!!!!!!!!!
				return data.text + "|" + data.email + "|" + data.sex;//可以返回HTML字符串 也可以返回DOM对象  也可以返回Jquery对象
		    }, // omitted for brevity, see the source of this page
		    //点击显示内容后显示的选择后的内容
		  templateSelection:  function (data) {
			   // if (data.id === '') { // adjust for custom placeholder values
			   //     return 'Custom styled placeholder text';
			   //   }
			   //如果使用ajax获取select的下拉数据  需要设置初始值必须data使用id和text属性!!!
			      return "--" + data.text + "--";
			    } // omitted for brevity, see the source of this page
			    
			   
		});
	  
	  
	  
	  $("#test04").select2({
		  data: data
	  })
	   $("#test06").select2({
	  })
	  
	  function showEvt(evt){
		  console.log(evt);
		  var div = $("<div></div>");
		  div.text("event:" + evt.type);
		  $("#evtDiv").append(div);
	  }
	 
	  
	  $('#test04').on('change', function (evt) {
		  showEvt(evt);
		  alert($(this).val() + "|" + $("option:selected",$(this)).html());
		  
	  });
	  
	  $('#test04').on('select2:close', function (evt) {
		  showEvt(evt);
	  });
	  $('#test04').on('select2:closing', function (evt) {
		  showEvt(evt);
	  });
	  $('#test04').on('select2:open', function (evt) {
		  showEvt(evt);
	  });
	  $('#test04').on('select2:opening', function (evt) {
		  showEvt(evt);
	  });
	  $('#test04').on('select2:select', function (evt) {
		  showEvt(evt);
	  });
	  $('#test04').on('select2:selecting', function (evt) {
		  showEvt(evt);
	  });
	  $('#test04').on('select2:unselect', function (evt) {
		  showEvt(evt);
	  });
	  $('#test04').on('select2:unselecting', function (evt) {
		  showEvt(evt);
	  });
	  
	  
	  
	  $("#test05").select2({
		  data: data
	  })
	  
	});
function addOpt(){
	//
	//alert(1)
	  $('#test05').select2({
		  insertTag: function (data, tag) {
		    // Insert the tag at the end of the results
		    data.push(tag);
		  }
	  });
}

function getValue3(){
	alert(test03.val());
}

function setValue2(){
	 test02.val(["0", "1"]).trigger("change");
}
function setValue1(){
	 test01.val("CA").trigger("change");
}
function getValue2(){
	 alert(test02.val());
}
function setValue3(){
	//如果使用ajax获取select的下拉数据  需要设置初始值必须data使用id和text属性!!!且必须加上<option value="" >请选择</option>  否则清空的时候会报错!!
	$('#test03').html('<option value="3" selected="selected">33</option><option value="4" selected="selected">44</option>').trigger("change");
}

function setValue6(){
	$('#test06').html('<option value="3" >世界你好121</option><option value="4" >世界你好122</option>').trigger("change");
}
	
    
</script>
</head>
<body style="padding: 0px; margin: 0px;">
静态分组：
	<select id="test01" style="width: 30%" class="input-sm">
		<optgroup label="Alaskan/Hawaiian Time Zone">
			<option value="AK">Alaska</option>
			<option value="HI">Hawaii</option>
		</optgroup>
		<optgroup label="Pacific Time Zone">
			<option value="CA">California</option>
			<option value="NV">Nevada</option>
			<option value="OR" selected="selected">Oregon</option>
			<option value="WA">Washington</option>
		</optgroup>
		<optgroup label="Mountain Time Zone">
			<option value="AZ">Arizona</option>
			<option value="CO">Colorado</option>
			<option value="ID">Idaho</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NM">New Mexico</option>
			<option value="ND">North Dakota</option>
			<option value="UT">Utah</option>
			<option value="WY">Wyoming</option>
		</optgroup>
		<optgroup label="Central Time Zone">
			<option value="AL">Alabama</option>
			<option value="AR">Arkansas</option>
			<option value="IL">Illinois</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="OK">Oklahoma</option>
			<option value="SD">South Dakota</option>
			<option value="TX">Texas</option>
			<option value="TN">Tennessee</option>
			<option value="WI">Wisconsin</option>
		</optgroup>
		<optgroup label="Eastern Time Zone">
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="IN">Indiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="OH">Ohio</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WV">West Virginia</option>
		</optgroup>
	</select>
<input type="button" value="设置值" onclick="setValue1()"/>
	<br />
	<br /><hr />
	数据源为JS数组(多选)：
	<select id="test02" style="width: 30%"  multiple="multiple"></select>
	<input type="button" value="设置值" onclick="setValue2()"/>
	<input type="button" value="获取值" onclick="getValue2()"/>
	<br /><br />
	<hr />
	国际化、
	ajax获取数据(滚动到最后会分页)：//<br/><span style="color:red;font-weight:bold;">如果使用ajax获取select的下拉数据  需要设置初始值必须data使用id和text属性!!!否则选不上!!</span><br/>
	<span style="color:red;font-weight:bold;">IE中如果使用可多选的Select2，加载页面后Select2默认已打开的状态，则去掉allowClear属性即可,且必须加上&lt;option value=&quot;&quot; &gt;请选择&lt;/option&gt;  否则清空的时候会报错!!</span><br/>
	
	<span style="color:red;font-weight:bold;">如果select中已有值(有option选项)会触发templateSelection,option中的值其实是text属性 value是id属性</span><br/>
	<select id="test03" style="width: 30%" class="select2"  multiple="multiple">
		<option value="1" selected="selected">1</option>
		<option value="2" selected="selected">2</option>
	</select>
	<input type="button" value="获取值" onclick="getValue3()"/>
	<input type="button" value="设置值" onclick="setValue3()"/>
	<br />
	<br /><hr />
	事件：
	<select id="test04" style="width: 30%"></select>
	<div id="evtDiv"></div>
	<br />
	<br />
	<select id="test05" style="width: 30%"></select>
	<input type="button" value="添加选项" onclick="addOpt()"/>




<br/><br/>
<select id="test06" style="width: 30%"><option value="1">1</option><option value="2">2</option></select>
<input type="button" value="JS设置选项" onclick="setValue6()"/>
</body>
</html>