package com.thd.action.cookie;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import com.thd.action.PubAction;

/**
 * 修改C:\Windows\System32\drivers\etc\hosts文件 加入以下内容
 * 127.0.0.1 devil13th.thd.com
 * 192.168.191.1  thd.thd.com
 * 设置cookie的请求使用其中一个域名,获取cookie的请求使用另一个域名
 */
public class CookieAction extends PubAction{
	
	
	/**
	 * 设置Cookie 
	 * url:http://devil13th.thd.com:8090/thdPlugins/auth/auth!setCookie.do
	 * 修改C:\Windows\System32\drivers\etc\hosts文件 加入以下内容
	 * 127.0.0.1 devil13th.thd.com
	 * 192.168.191.1  thd.thd.com
	 * 设置cookie的请求使用其中一个域名,获取cookie的请求使用另一个域名
	 */
	public String setCookie(){
		this.getLog().info("setCookie...");
		try{
			this.setForwardPage("/plugins/cookie/setCookie.jsp");
			Cookie cookieName = new Cookie("name","devil13th");
			cookieName.setMaxAge(5000);
			cookieName.setPath("/");
			cookieName.setDomain(".thd.com");
			this.getRes().addCookie(cookieName);
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	/**
	 * getCookie
	 * url:http://thd.thd.com:8090/thdPlugins/auth/auth!setCookie.do
	 * 修改C:\Windows\System32\drivers\etc\hosts文件 加入以下内容
	 * 127.0.0.1 devil13th.thd.com
	 * 192.168.191.1  thd.thd.com
	 * 设置cookie的请求使用其中一个域名,获取cookie的请求使用另一个域名
	 * @return
	 */
	public String getCookie(){
		this.getLog().info("getCookie...");
		try{
			this.setForwardPage("/plugins/cookie/getCookie.jsp");
			Cookie[] cookies = this.getReq().getCookies();//这样便可以获取一个cookie数组
			List l = new ArrayList();
			if(cookies!=null){
			for(Cookie cookie : cookies){
				System.out.println(cookie.getName() + ":" + cookie.getValue());
				l.add(cookie.getName() + ":" + cookie.getValue());
				
			}
			}else{
				System.out.println("not have cookie");
			}
			this.getReq().setAttribute("cookieList", l);
			System.out.println(this.getReq().getSession().getId());
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
}
