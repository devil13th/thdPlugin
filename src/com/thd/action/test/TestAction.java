package com.thd.action.test;

import java.util.List;

import javax.annotation.Resource;

import com.thd.action.PubAction;
import com.thd.service.easyui.EasyUiService;

public class TestAction extends PubAction {
	@Resource
	private EasyUiService easyUiService;
	/**
	 * url : http://127.0.0.1:8080/thdPlugin/test/test!test.do
	 * @return
	 */
	public String test(){
		this.getLog().info("test...");
		try{
			List l = easyUiService.queryTest();
			System.out.println(l);
			return "ajax";
		}catch(Exception e){
			return this.err(e);
		}
	}
}
