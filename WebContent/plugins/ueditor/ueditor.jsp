<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery datagrid</title>
<!-- 配置文件 -->
   <script type="text/javascript" src="${ctx}/js/ueditor/ueditor.config.js"></script>
   <!-- 编辑器源码文件 -->
   <script type="text/javascript" src="${ctx}/js/ueditor/ueditor.all.js"></script>


<!-- 实例化编辑器 -->
   <script type="text/javascript">
   var ue ;
   function showText(){
	   var str =ue.getContentTxt();
	   alert(str);
	 
   }
   function showHtml(){
	   var html1 = ue.getContent();
	   alert(html1);
   }
   function stHtml(){
	   ue.setContent("hello world", true);
   }
   
  
	
	
   window.onload = function(){
	        ue = UE.getEditor('container',{
	    	serverUrl: "${ctx}/ueditor/ueditor!uploadFile.do",
	       	imageUrlPrefix:"",
	       	imageActionName:'img',
	       	imageFieldName:'imgFile',
	       	imageAllowFiles:[".png", ".jpg", ".jpeg", ".gif", ".bmp"],
	    	
	       	fileActionName: "uploadfile", /* controller里,执行上传视频的action名称 */
	        fileFieldName: "imgFile", /* 提交的文件表单名称 */
	        fileUrlPrefix: "", /* 文件访问路径前缀 */
	        fileMaxSize: 51200000, /* 上传大小限制，单位B，默认50MB */
	        fileAllowFiles: [
	            ".png", ".jpg", ".jpeg", ".gif", ".bmp",
	            ".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
	            ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid",
	            ".rar", ".zip", ".tar", ".gz", ".7z", ".bz2", ".cab", ".iso",
	            ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".pdf", ".txt", ".md", ".xml"
	        ],
	        videoActionName: "uploadvideo", /* 执行上传视频的action名称 */
	        videoFieldName: "imgFile", /* 提交的视频表单名称 */
	        videoMaxSize: 102400000, /* 上传大小限制，单位B，默认100MB */
	        videoAllowFiles: [
	            ".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
	            ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid"], /* 上传视频格式显示 */

	    });
   }
   </script>
   
   
</head>
<body style="padding:0px;margin:0px; ">
	<s:form action="ueditor!editorSubmit.do?action=img" namespace="/ueditor" method="post" target="_blank">
	
 
	
	<textarea name="content" id="container">aaaaaaaaaaaaaaaaaaaa</textarea>
	
	
   <input type="button" value="获取文本" onclick="showText()"/>
   <input type="button" value="获取HTML" onclick="showHtml()"/>
   <input type="button" value="设置HTML" onclick="stHtml()"/>
   <input type="submit" value="提交" />
 </s:form>
 
 
 <s:form action="ueditor!uploadFile" namespace="/ueditor" method="post" enctype="multipart/form-data">
	<input type="file" name="imgFile"/>
	<input type="submit" value="提交" />
</s:form>
</body> 
</html>