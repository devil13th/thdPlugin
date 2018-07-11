package com.thd.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.thd.util.Page;

public class PubAction extends ActionSupport implements RequestAware, SessionAware {
	

	//Struts2 封装 HttpServletRequest 
	Map<String,Object> request;
	
	//Struts2 封装  HttpSession
	Map<String,Object> session;
	
	//日志
	private Logger log = Logger.getLogger(this.getClass());
	
	//分页信息
	public Page p = new Page();
	
	//Struts2 Action 返回的字符串
	public String forward;
	
	//显示信息页 是否是modaiDialog;
	private String modaiDialog;
	
	//信息页执行脚本的内容
	private String scriptContent;
	
	//信息页返回的数据
	private String returnValue;
	
	//信息页显示的信息
	private String msg;
	
	//信息也跳转地址
	private String url;
	
	//跳转jsp页地址
	private String forwardPage;
	
	//排序字段
	private String order;
	
	//排序方式
	private String sort;
	
	//json数据
	private String json;
	
	//操作
	private String operate;
	
	//ajax请求
	private String ajaxMethod;
	
	
	public String getAjaxMethod() {
		return ajaxMethod;
	}

	public void setAjaxMethod(String ajaxMethod) {
		this.ajaxMethod = ajaxMethod;
	}

	/**
	 * 适用于easyUI dategrid的,每页的大小 
	 */
	private Integer rows = 10;
	/**
	 * 适用于easyUI dategrid的,开始取数据的索引号
	 */
	private Integer page = 1;
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
		this.p.setCurrentPage(this.page);
	}
	
	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
		this.p.setPageSize(this.rows);
	}
	

	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	//Struts2 Action 异常 设置forward
	public String err(Exception e){
		forward = "err";
		request.put("err",e.getMessage());
		return forward;
	}
	
	//获取HttpServletRequest 对象
	protected HttpServletRequest getReq() {
		return ServletActionContext.getRequest();
	}
	
	//获取HttpServletRepons 对象
	protected HttpServletResponse getRes() {
		return ServletActionContext.getResponse();
	}
	
	//获取HttpSession 对象
	protected HttpSession getSess() {
		return ServletActionContext.getRequest().getSession();
	}
	
	//依赖注入HttpServletRequest
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	//依赖注入HttpSession
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String getModaiDialog() {
		return modaiDialog;
	}

	public void setModaiDialog(String modaiDialog) {
		this.modaiDialog = modaiDialog;
	}

	public String getScriptContent() {
		return scriptContent;
	}

	public void setScriptContent(String scriptContent) {
		this.scriptContent = scriptContent;
	}

	public String getReturnValue() {
		return returnValue;
	}

	public void setReturnValue(String returnValue) {
		this.returnValue = returnValue;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	
	
	public Map<String, Object> getRequest() {
		return request;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	

	public Page getP() {
		return p;
	}

	public void setP(Page p) {
		this.p = p;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public Logger getLog() {
		return log;
	}

	public String getForwardPage() {
		return forwardPage;
	}

	public void setForwardPage(String forwardPage) {
		this.forwardPage = forwardPage;
	}
	
	
	
	

}
