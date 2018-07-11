<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8" />
<title>bootstrap form validation</title>


<style>
/** 自定义错误图标位置 **/
.ick.has-feedback .form-control-feedback {
    top: -10px;
    left: 200px;
}

</style>
<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/js/formvalidation/js/formValidation.min.js"></script>
<script  src="${ctx}/js/formvalidation/js/framework/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/js/formvalidation/js/language/zh_CN.js"></script>
<link rel="stylesheet" href="${ctx}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${ctx}/js/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/js/formvalidation/css/formValidation.min.css" type="text/css"/>
	
	
<!--  icheck resource -->
<script src="${ctx}/js/icheck/icheck.js"></script>
<link rel="stylesheet" href="${ctx}/js/icheck/skins/all.css" type="text/css"/>

<script>
$(function(){
	$('input.b').iCheck({
	    checkboxClass: 'icheckbox_flat-blue',
	    radioClass: 'iradio_flat-blue'
	});
})
</script>
</head>
<body style="padding: 0px; margin: 0px;">
	<div class="col-sm-8 col-sm-offset-2">
		<div class="page-header">
			<h2>Tooltip container</h2>
		</div>
		<form id="defaultForm" method="post" class="form-horizontal"
			action="target.php">
			
			<div class="row">
				<div class="form-group   col-sm-4">
					<label class="col-sm-2 control-label">First name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="firstName" name="firstName"
							placeholder="First name" data-container="body"/>
					</div>
				</div>
				<div class="form-group  col-sm-4">
					<label class="col-sm-2 control-label">Last name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="lastName"
							placeholder="Last name" data-container="body"/>
					</div>
				</div>
				<div class="form-group col-sm-4">
					<label class="col-sm-2 control-label">age</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="age"
							placeholder="age" data-container="body"/>
					</div>
				</div>
			</div>
			
			<div class="form-group" id="xxx">
				<label class="col-sm-3 control-label">sex</label>
				<div class="col-sm-4">
					<input type="text" class="form-control input-sm" name="sex"
						placeholder="sex" data-container="body"/>
				</div>
			</div>
			
			<div class="form-group" id="ccc">
				<label class="col-sm-3 control-label">hidden 利用hidden验证其他输入框内容</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="ccc1" name="ccc1"
							placeholder="ccc1" data-container="body"/>
					<input type="hidden"  class="form-control input-sm" name="hid"
						 data-container="body"/>
						
				</div>
			</div>
			
			<div class="form-group"  id="ddd">
				<label class="col-sm-3 control-label">sex</label>
				<div class="col-sm-4">
					<select id="selectO" class="form-control" name="selectO"><option value="">请选择</option><option value="1">已选择</option></select>
				</div>
				<div class="col-sm-4">
				<button type="button" id="CheckSingle"   class="btn btn-primary" >单个输入内容验证</button>
				</div>
			</div>
			
			
			<div class="form-group ">
				<label class="col-sm-2 control-label">Number</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="number" name="number"
						placeholder="输入整数" data-container="body"/>
				</div>
				<div class="col-sm-2">
					<button type="button"  class="btn btn-primary" id="changeAndValidate">JS改变值并进行验证(先输入正确的值后再点击此按钮)</button>
				</div>
			</div>
			
			
			<div class="form-group ick" >
					<input class="b" type="radio" name="iCheck_a" value="a">
					Radio button 1
					<input class="b" type="radio" name="iCheck_a" value="b">
					Radio button 2
			</div>
			
			
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<button type="button" id="submitButton" class="btn btn-primary">Validate</button>
				</div>
			</div>
			
			
			
			

		</form>
	</div>
	<div class="col-sm-2">
	<span style="font-weight:bold;">注意：进入页面先点击提交后，错误信息正常显示，然后修改值后tooltip的错误信息不能显示了，这个是bug，在v0.8.2版本进行修复
	</div>
	<script type="text/javascript">
	 
	 //自定义验证方式
	 FormValidation.Validator.ckSex = {
		        /**
		         * @param {FormValidation.Base} validator The validator plugin instance
		         * @param {jQuery} $field The jQuery object represents the field element
		         * @param {Object} options The validator options
		         * @returns {Boolean}
		         */
		        validate: function(validator, $field, options) {
		            // You can get the field value
		            // var value = $field.val();
		            //
		            // Perform validating
		            // ...
		            //
		            // return true if the field value is valid
		            // otherwise return false
		            
		            //alert($field.val());
		            if($field.val() != 1 && $field.val()!=0){
		            	return false;
		            }
		            return true;
		        }
		    };
	 	
	 
	 	
	 
		$(document).ready(function() {
			
		    var validationTool = $('#defaultForm').formValidation({
		        err: {
		            container: ''
		           //container: 'popover'
		        },
		//        trigger: 'blur',
		        icon: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        locale:"zh_CN", //国际化
		        fields: {
		        	 sex : {
		            	row:'#xxx',//变红色字体的范围容器
		            	validators: {
		            		notEmpty: {
			                	message: 'The first name is required'
			                },
		            		ckSex:{
		                		message: 'please 1 or 0'
		                	}
		                }
		            },
		            selectO : {
		            	row:'#ddd',//变红色字体的范围容器
		            	validators: {
		            		notEmpty: {
			                	message: 'The first name is required'
			                }
		                }
		            },
		            hid : {
		            	row:'#ccc',//变红色字体的范围容器
		            	excluded: false, //这句必须写，否则加载hidden域中  错误信息是不显示的!!!!
		            	validators: {
			                callback: {
		                        message: 'first必须填写1',
		                        callback: function(value, validator) {
		                        	if($("#ccc1").val() == '1'){
		                        		return true;
		                        	}else{
		                        		return false;
		                        	}
		                        }
		                    },
		                }
		            },
		            
		            
		            firstName: {
		            	row:'.form-group',//变红色字体的范围容器
		                validators: {
		                    stringLength: {
		                        min: 4,
		                        message: 'aaa'
		                    },
		                    notEmpty: {
		                        message: 'The first name is required'
		                    },
		                    regexp: {
		                        enabled: true,
		                        regexp: /^[a-z]+$/i,
		                        message: 'The first name must consist of a-z, A-Z characters only'
		                    }
		                }
		            },
		            lastName: {
		            	row:'.form-group',//变红色字体的范围容器
		                validators: {
		                    stringLength: {
		                        min: 4
		                    },
		                    notEmpty: {
		                        message: 'The first name is required'
		                    },
		                    regexp: {
		                        enabled: true,
		                        regexp: /^[a-z]+$/i,
		                        message: 'The first name must consist of a-z, A-Z characters only'
		                    }
		                }
		            },
		            number:{
		            	validators: {
		                	row:'.form-group',//变红色字体的范围容器
		                	notEmpty: {
		                        message: 'The first name is required'
		                    },
		                    numeric:{
		                    	 message: '必须填写数字'
		                    }
		                }
		            },
		            age: {
		                validators: {
		                	row:'.form-group',//变红色字体的范围容器
		                	notEmpty: {
		                        message: 'The first name is required'
		                    },
		                	callback: {
		                        message: 'callback  not validate',
		                        callback: function(value, validator) {
		                        	//alert(isNaN(value))
		                           if(value > 20){
		                        	   if (isNaN(value)){
		                        		return false;
		                        	   }
		                        	   return false;
		                           }
		                           return true;
		                        }
		                    },
		                    between:{
		                    	min:10,
		                    	max:30
		                    }
		                }
		            },
		            
		            iCheck_a: {
		            	
		                validators: {
		                	row:".ick",
		                    notEmpty: {
		                        message: '必须选择一个啊'
		                    }
		                }
		            }

		            
		        }
		    });
		    
		    
		    $("#submitButton").click(function(){
		    	validationTool.data("formValidation").validate();
		    	var validateResult = validationTool.data("formValidation").isValid();
		    	alert("验证：" + validateResult);
		    	//document.getElementById("defaultForm").submit();
		    })
		    
		    
		    $("#CheckSingle").click(function(){
		    	validationTool.data("formValidation").validateField("selectO");
		    	var validateResult = validationTool.data("formValidation").isValidField("selectO");
		    	alert("验证：" + validateResult);
		    })
		    
		    $("#changeAndValidate").click(function(){
		    	$("#number").val('25S');
		    	validationTool.data("formValidation").revalidateField("number");
		    	var validateResult = validationTool.data("formValidation").isValidField("number");
		    	alert("验证：" + validateResult);
		    })
		    
		    
		    
		    validationTool.data("formValidation").revalidateField("planProcess");
			var validateResult = validationTool.data("formValidation").isValidField("planProcess");
			
			
			
			
			$("#ccc1").keyup(function(){
				validationTool.data("formValidation").revalidateField("hid");
		    	var validateResult = validationTool.data("formValidation").isValidField("hid");
		    	//alert("验证：" + validateResult);
			});
			
		});
		
		
	</script>
</body>
</html>