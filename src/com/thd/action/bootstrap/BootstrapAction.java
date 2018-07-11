package com.thd.action.bootstrap;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thd.action.PubAction;
import com.thd.dto.DataTableBean;
import com.thd.dto.FileUploadResult;
import com.thd.service.data.DataService;

public class BootstrapAction extends PubAction {
	@Resource
	private DataService dataService; 
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	private String id;
	private String name;
	/**
	 * fileinputExample
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!fileinputExample.do
	 * @return
	 */
	public String fileinputExample(){
		this.getLog().info("fileinputExample...");
		try{
			this.setForwardPage("/plugins/bootstrap/fileinput/fileinputExample.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	/**
	 * fileinput
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!fileinput.do
	 * @return
	 */
	public String fileinput(){
		this.getLog().info("fileinput...");
		try{
			this.setForwardPage("/plugins/bootstrap/fileinput/fileinput.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}

	/**
	 * fileinputSubmit
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!fileinputSubmit.do
	 * @return
	 */
	public String fileinputSubmit(){
		this.getLog().info("fileinputSubmit...");
		
		System.out.println("id:" + this.id + "|" + this.getReq().getParameter("id"));
		System.out.println("name:" + this.name);
		FileUploadResult fur = new FileUploadResult();
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
		try{
			int i = 1/0;
			System.out.println(this.getFile());
			System.out.println(this.getFileFileName());
			System.out.println(this.getFileContentType());
			
			fur.setFileId(String.valueOf(Math.random()));
			fur.setFileName(this.getFileFileName());
			fur.setFileSize(String.valueOf(this.getFile().length()));
			fur.setStatus("success");
			//this.setMsg("{\"error\":\"failure\"}");
			//int i = 1/0;
			
			this.setMsg(gson.toJson(fur));
			//this.setMsg("{\"status\":\"ok\"}");
			return "ajax";
		}catch(Exception e){
			fur.setStatus("failure");
			fur.setError(e.getMessage());
			this.setMsg(gson.toJson(fur));
			return "ajax";
		}
	}
	
	
	/**
	 * select2
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!select2.do
	 * @return
	 */
	public String select2(){
		this.getLog().info("select2...");
		try{
			this.setForwardPage("/plugins/bootstrap/select2/select2.jsp");
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * select2
	 *  url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!select2GetData.do
	 * @return
	 */
	public String select2GetData(){
		this.getLog().info("select2GetData...");
		try{
			StringBuffer json = new StringBuffer();
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
			Map<String,String> map = new HashMap<String,String>();
			String q = this.getReq().getParameter("q");
			this.getLog().info("query params : " + q);
			List l = dataService.queryUserForSelect2(q,  this.p);
			
			    
			DataTableBean dtb =  new DataTableBean();
			dtb.setCurrentPage(this.p.getCurrentPage());
			dtb.setRecordsTotal(this.p.getListSize());
			dtb.setPageSize(this.p.getPageSize());
			dtb.setData(l);
			String listStr = gson.toJson(dtb);
			this.setMsg(listStr);
			return "ajax";
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
	/**
	 * form validation
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!formvalidation.do
	 * @return
	 */
	public String formvalidation(){
		this.getLog().info("formvalidation...");
		try{
			this.setForwardPage("/plugins/bootstrap/formvalidation/formvalidation.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
	/**
	 * layer 弹出层 消息显示框 确认框
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!layer.do
	 * @return
	 */
	public String layer(){
		this.getLog().info("layer...");
		try{
			this.setForwardPage("/plugins/bootstrap/layer/layer.jsp");
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	/**
	 * layer 弹出层 消息显示框 确认框 - 嵌套页面
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!layerIn.do?xx
	 * @return
	 */
	public String layerIn(){
		this.getLog().info("layerIn...");
		try{
			String title = this.getReq().getParameter("title");
			this.getReq().setAttribute("title", title);
			this.setForwardPage("/plugins/bootstrap/layer/layerIn.jsp");
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
	/**
	 * datetimepicker
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!datetimepicker.do
	 * @return
	 */
	public String datetimepicker(){
		this.getLog().info("datetimepicker...");
		try{
			this.setForwardPage("/plugins/bootstrap/datetimepicker/datetimepicker.jsp");
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
	
	
	/**
	 * icheck
	 * url:http://127.0.0.1:8090/thdPlugins/bootstrap/bootstrap!icheck.do
	 * @return
	 */
	public String icheck(){
		this.getLog().info("icheck...");
		try{
			this.setForwardPage("/plugins/bootstrap/icheck/icheck.jsp");
			
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
