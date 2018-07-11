<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../pub/TagLib.jsp"%>
<!DOCTYPE html>
<!-- release v4.3.6, copyright 2014 - 2017 Kartik Visweswaran -->
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <title>Krajee JQuery Plugins - &copy; Kartik</title>


<link rel="stylesheet" href="${ctx}/js/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link href="${ctx}/js/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
<script src="${ctx}/js/bootstrap-fileinput/js/locales/fr.js" type="text/javascript"></script>
<script src="${ctx}/js/bootstrap-fileinput/js/locales/es.js" type="text/javascript"></script>
<script src="${ctx}/js/bootstrap/js/bootstrap.min.js"></script>

       </head>
    <body>
         
           <form action="" method="post">
                <div class="form-group">
                    <input id="file-1" type="file" name="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
                </div>
                <input type="submit" value="提交"/>
                <div id="fileList">
                </div>
            </form>
            
    </body>
<script>
	$("#file-1").fileinput({
	    uploadUrl: '${ctx}/bootstrap/bootstrap!fileinputSubmit.do', // you must set a valid URL here else you will get an error
	    allowedFileExtensions : ['jpg', 'png','gif','txt','doc','docx'],
	    overwriteInitial: false,
	    maxFileSize: 1000,
	    maxFilesNum: 10,
	    uploadExtraData:{id:1,name:"myname"},
	    //allowedFileTypes: ['image', 'video', 'flash'],
	    slugCallback: function(filename) {
	        return filename.replace('(', '_').replace(']', '_');
	    }
	});
	
	$('#file-1').on('fileerror', function(event, data, msg) {
	   console.log(data.id);
	   console.log(data.index);
	   console.log(data.file);
	   console.log(data.reader);
	   console.log(data.files);
	   // get message
	   alert(msg);
	});
	
	$('#file-1').on('change', function(event) {
		console.log("change");
	});
	
	$('#file-1').on('fileselect', function(event, numFiles, label) {
		console.log("fileselect");
	});
	
	$('#file-1').on('fileclear', function(event) {
		console.log("fileclear");
	});
	
	$('#file-1').on('filecleared', function(event) {
		console.log("filecleared");
	});
	
	$('#file-1').on('fileloaded', function(event, file, previewId, index, reader) {
		console.log("fileloaded");
	});
	
	$('#file-1').on('fileuploaded', function(event, data, previewId, index) {
	    var form = data.form, files = data.files, extra = data.extra,
	        response = data.response, reader = data.reader;
	    console.log(data);
	    console.log(data.response);
	    console.log('File uploaded triggered:' + response);
	    $("#fileList").append($("<div>文件提交成功  id:" + data.response.fileId + "   |  name:" + data.response.fileName+ "</div>"))
	});

</script>
</html>