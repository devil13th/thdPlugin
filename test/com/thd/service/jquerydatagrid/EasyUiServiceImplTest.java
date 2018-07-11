package com.thd.service.jquerydatagrid;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.thd.pojo.data.SysUser;
import com.thd.service.easyui.EasyUiService;

public class EasyUiServiceImplTest {
	String[] appContext = new String[]{"conf/appContext-*.xml"};
	private ApplicationContext factory=new ClassPathXmlApplicationContext(appContext); 
	private EasyUiService service = (EasyUiService)factory.getBean("easyUiService");
	
	@Test
	public void insertUser(){
		for(int i = 0 , j = 1000 ; i < j ; i++){
			SysUser u = new SysUser();
			u.setUserBirthday(new Date());
			u.setUserMail("devil13th_" + i + "@dev.org.cn");
			u.setUserName("devil13th_" + i);
			u.setUserSex(i%2);
			u.setUserStatus("1");
			u.setUserTel("13401020304");
			
			
			service.save(u); 
		}
		System.out.println("success");
	}
	
	@Test
	public void saveA(){
		service.saveA();
		System.out.println("success");
	}
	@Test
	public void queryOrgToJson(){
		System.out.println(service.queryOrgToJson());
	}
	
	
}
