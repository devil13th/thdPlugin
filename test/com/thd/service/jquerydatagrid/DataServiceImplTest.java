package com.thd.service.jquerydatagrid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.thd.pojo.data.SysOrg;
import com.thd.service.data.DataService;
import com.thd.util.ListUtil;
import com.thd.util.Page;

public class DataServiceImplTest {
	String[] appContext = new String[]{"conf/appContext-*.xml"};
	private ApplicationContext factory=new ClassPathXmlApplicationContext(appContext); 
	private DataService service = (DataService)factory.getBean("dataService");
	
	@Test
	public void testQueryAllOrg(){
		List<Map<String,Object>> r = service.queryAllOrg();
		if(ListUtil.isNotEmpty(r)){
			for(Map<String,Object> m : r){
				System.out.println(m.get("code").toString()+"|" + m.get("name").toString());
			}
		}
	}
	
	@Test
	public void testQueryOrgNameByOrgCode(){
		System.out.println(service.queryOrgNameByOrgCode("TJ"));
	}
	
	@Test
	public void testQueryList(){
		Map<String,String> m = new HashMap<String,String>();
		m.put("name", "34");
		m.put("sex", "1");
		m.put("mail","");
		m.put("tel","");
		Page p =new Page();
		p.setCurrentPage(1);
		p.setPageSize(10);
		List l = service.queryUser(m,  p);
		System.out.println(l);
	}
	
	
	
}
