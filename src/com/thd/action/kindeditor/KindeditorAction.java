package com.thd.action.kindeditor;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thd.action.PubAction;
import com.thd.util.MyFile;

public class KindeditorAction extends PubAction {
	//内容
	private String  content;
	//图片文件
	private File imgFile;
	//图片名称
	private String imgFileFileName;
	
	

	/**
	 * 网页编辑器
	 * url:http://127.0.0.1:8080/thdPlugin/kindeditor/kindeditor!kindeditor.do
	 * @return
	 */
	public String kindeditor(){
		try{
			this.getLog().info("kindeditor...");
			this.setForwardPage("/plugins/kindeditor/kindeditor.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * 图片上传
	 * url:http://127.0.0.1:8080/thdPlugin/kindeditor/kindeditor!upload.do
	 */
	public String upload(){
		try{
			this.getLog().info("upload...");
			String str = "";
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
			//String nameTmp = System.currentTimeMillis();
			String fileName = new Date().getTime() + MyFile.getFix(imgFileFileName);
			MyFile.copy(imgFile, new File(savePath+fileName));
			
			
			Map obj = new HashMap();
			obj.put("error", 0);
			obj.put("url", saveURL+ fileName);
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.create();
			
			str += gson.toJson(obj);
			System.out.println(str);
			this.getRequest().put("msg",str);
			System.out.println("上传完成");
		}catch(Exception e){
			this.getLog().error("严重错误:" + e.getMessage());
			e.printStackTrace();
			String str = "";
			Map obj = new HashMap();
			obj.put("error", 1);
			obj.put("url", e.getMessage());
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.create();
			str += gson.toJson(obj);
			System.out.println(str);
			this.getRequest().put("msg",str);
		}
		return "ajax";
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
