package com.thd.action.datatables;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thd.action.PubAction;
import com.thd.dto.DataTableBean;
import com.thd.service.data.DataService;

public class DatatablesAction extends PubAction {
	@Resource
	private DataService dataService; 
	/**
	 * datatables
	 * url:http://127.0.0.1:8090/thdPlugins/datatables/datatables!dataTables.do
	 * @return
	 */
	public String dataTablesApi(){
		this.getLog().info("dataTablesApi...");
		try{
			this.setForwardPage("/plugins/datatables/dataTablesApi.jsp");
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * datatables
	 * url:http://127.0.0.1:8090/thdPlugins/datatables/datatables!dataTablesApiGetData.do
	 * @return
	 */
	public String dataTablesApiGetData(){
		this.getLog().info("dataTablesApiGetData...");
		try{
//			StringBuffer json = new StringBuffer();
//			GsonBuilder builder = new GsonBuilder();
//			Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
//			Map<String,String> map = new HashMap<String,String>();
//			int start = Integer.parseInt(this.getReq().getParameter("start").toString());
//			int pageSize = Integer.parseInt(this.getReq().getParameter("length").toString());
//			this.p.setCurrentPage(start/pageSize+1);
//			this.p.setPageSize(pageSize);
//			List l = dataService.queryUser(null,  this.p);
//			String listStr = gson.toJson(l);
//			json.append("{\"data\":");
//			if(!ListUtil.isNotEmpty(l)){
//				listStr = "[]";
//			}
//			json.append(listStr);
//			
//			json.append(",\"recordsTotal\":" + p.getListSize() + ",\"recordsFiltered\":" + p.getListSize() + ",\"draw\":" + this.getReq().getParameter("draw"));
//			json.append("}");
//			this.setMsg(json.toString());
//			return "ajax";
			
			//延长加载时间,让loading...显示
			Thread.sleep(1000);
			StringBuffer json = new StringBuffer();
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
			Map<String,String> map = new HashMap<String,String>();
			
			int start = Integer.parseInt(this.getReq().getParameter("start").toString());
			int pageSize = Integer.parseInt(this.getReq().getParameter("length").toString());
			this.p.setCurrentPage(start/pageSize + 1);
			this.p.setPageSize(pageSize);
			
			
			Map<String,String> m = new HashMap<String,String>();
			m.put("name", this.getReq().getParameter("name"));
			m.put("sex", this.getReq().getParameter("sex"));
			m.put("mail", this.getReq().getParameter("mail"));
			m.put("tel", this.getReq().getParameter("tel"));
			List l = dataService.queryUser(m,  this.p);
			DataTableBean dt = new DataTableBean();
			dt.setRecordsTotal(p.getListSize());
			dt.setRecordsFiltered(p.getListSize());
			dt.setDraw(Integer.parseInt(this.getReq().getParameter("draw")));
			dt.setData(l);
			
			this.setMsg( gson.toJson(dt));
			//int b = 1/0;
			return "ajax";
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	/**
	 * datatables
	 * url:http://127.0.0.1:8090/thdPlugins/datatables/datatables!dataTables.do
	 * @return
	 */
	public String dataTables(){
		this.getLog().info("dataTables...");
		try{
			this.setForwardPage("/plugins/datatables/dataTables.jsp");
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
}
