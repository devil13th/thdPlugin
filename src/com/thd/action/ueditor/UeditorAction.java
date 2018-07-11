package com.thd.action.ueditor;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.thd.action.PubAction;
import com.thd.util.MyFile;

public class UeditorAction extends PubAction {
	//附件
	private File imgFile;
	//附件名称
	private String imgFileFileName;
	//html内容
	private String content;
		
	//选择树节点例子
	public String ueditor(){
		try{
			this.setForwardPage("/plugins/ueditor/ueditor.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//上传图片
	public String uploadFile(){
		try{
			this.getLog().info("uploadFile...");
			if(imgFile != null){
				HttpServletRequest req = this.getReq();
				String saveURL = req.getContextPath() + "/attached/image/";
				String savePath = req.getSession().getServletContext().getRealPath("/") + "/attached/image/";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String ymd = sdf.format(new Date());
				savePath += (ymd+ "/");
				saveURL += (ymd+ "/");
				File uploadDir = new File(savePath);
				if(!uploadDir.exists()){
					uploadDir.mkdirs();
				}
				
				System.out.println(savePath);
				String fileName = new Date().getTime() +"-img";
				try{
					MyFile.copy(imgFile, new File(savePath+fileName));
				}catch(Exception e){
					
				}
				
				
				String imgUrl = req.getContextPath()+ "/attached/image/" + ymd+"/" + fileName;
				
				String str = "{\"state\":\"SUCCESS\",\"url\":\"" + imgUrl + "\",\"title\":\"" + this.getImgFileFileName() + "\",\"original\":\"" + this.getImgFileFileName() + "\"}";
				
				
				System.out.println(str);
				this.getRequest().put("msg",str);
				System.out.println("上传完成");
			}else{
				this.setMsg("{\"state\":\"SUCCESS\",\"url\":\"aaa.jpg\",\"title\":\"xxx\",\"original\":\"xxx\"}");
			}
		}catch(Exception e){
			e.printStackTrace();
			this.getRequest().put("msg","");
		}
		return "ajax";
	}
	
	
	//选择树节点例子
	public String editorSubmit(){
		try{
			this.getLog().info("editorSubmit...");
			System.out.println(this.content);
			this.setForwardPage("/plugins/ueditor/editorSubmit.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public File getImgFile() {
		return imgFile;
	}


	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}


	public String getImgFileFileName() {
		return imgFileFileName;
	}


	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}
	
	
}
