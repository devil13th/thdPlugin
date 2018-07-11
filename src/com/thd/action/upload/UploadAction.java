package com.thd.action.upload;

import java.io.File;

import com.thd.action.PubAction;

public class UploadAction extends PubAction {
	private File file;
	private String fileFileName;
	private String fileContentType;
	private String str;
	private String a;
	private String b;
	private String c;
	
	/**
	 * url : http://127.0.0.1:8080/thdPlugin/upload/upload!uploadify.do
	 * @return
	 */
	public String uploadify(){
		this.getLog().info("uploadify...");
		try{
			this.setForwardPage("/plugins/upload/uploadify.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	

	/**
	 * url : http://127.0.0.1:8080/thdPlugin/upload/upload!uploadifySubmit.do
	 * @return
	 */
	public String uploadifySubmit(){
		this.getLog().info("uploadifySubmit...");
		try{
			this.setForwardPage("/plugins/upload/uploadifySubmit.jsp");
			System.out.println("========================================================================================");
			System.out.println(this.getRequest().get("a"));
			System.out.println(this.getRequest().get("str"));
			System.out.println(this.getReq().getAttribute("a"));
			System.out.println(this.getReq().getAttribute("str"));
			System.out.println(this.getRequest().get("a"));
			System.out.println(this.getRequest().get("str"));
			this.getLog().info(file);
			this.getLog().info(this.fileFileName);
			this.getLog().info(this.fileContentType);
			this.getLog().info(this.getReq().getAttribute("a"));
			this.getLog().info(this.getReq().getAttribute("b"));
			this.getLog().info(this.getReq().getAttribute("c"));
			this.getLog().info(this.getStr());
			System.out.println("========================================================================================");
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}


	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}


	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}


	public String getStr() {
		return str;
	}


	public void setStr(String str) {
		this.str = str;
	}


	public String getA() {
		return a;
	}


	public void setA(String a) {
		this.a = a;
	}


	public void setC(String c) {
		this.c = c;
	}

}
