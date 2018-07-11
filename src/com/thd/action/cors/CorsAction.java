/** 
 * Class Description:########
 * Date : 2016年9月12日 下午10:12:21
 * Auth : wanglei 
*/  

package com.thd.action.cors;

import com.thd.action.PubAction;

public class CorsAction extends PubAction {
	/**
	 * send ajax page
	 * url:http://127.0.0.1:8090/thdPlugins/cors/cors!sendAjax.do
	 * @return
	 */
	public String sendAjax(){
		this.getLog().info("sendAjax...");
		try{
			this.setForwardPage("/plugins/cors/sendAjax.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * cors for ajax cors
	 * url:http://127.0.0.1:8090/thdPlugins/cors/cors!general.do
	 * @return
	 */
	public String general(){
		this.getLog().info("general...");
		try{
			this.setForwardPage("/plugins/cors/general.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * jsonp for ajax cors
	 * url:http://127.0.0.1:8090/thdPlugins/cors/cors!jsonp.do
	 * @return
	 */
	public String jsonp(){
		this.getLog().info("jsonp...");
		try{
			this.setForwardPage("/plugins/cors/jsonp.jsp");
			this.getReq().setAttribute("cb", this.getReq().getParameter("callback"));
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * cors for ajax cors
	 * url:http://127.0.0.1:8090/thdPlugins/cors/cors!cors.do
	 * @return
	 */
	public String cors(){
		this.getLog().info("cors...");
		try{
			this.setForwardPage("/plugins/cors/cors.jsp");
			this.getReq().setAttribute("cb", this.getReq().getParameter("callback"));
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
	/**
	 * cors for ajax cors
	 * url:http://127.0.0.1:8090/thdPlugins/cors/cors!corsPage.do
	 * @return
	 */
	public String corsPage(){
		this.getLog().info("corsPage...");
		try{
			this.setForwardPage("/plugins/cors/corsPage.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
}
