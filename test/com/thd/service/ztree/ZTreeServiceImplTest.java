package com.thd.service.ztree;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.thd.pojo.ztree.TpTree;
import com.thd.util.ListUtil;

public class ZTreeServiceImplTest {
	String[] appContext = new String[]{"conf/appContext-*.xml"};
	private ApplicationContext factory=new ClassPathXmlApplicationContext(appContext); 
	private ZTreeService service = (ZTreeService)factory.getBean("zTreeService");
	@Test
	public void test(){
		List l = service.queryNextNodes("root");
		System.out.println(l);
	}
	
	@Test
	public void queryTreeByCode(){
		TpTree tree = service.queryTreeByCode("root.00001");
		System.out.println(tree.getTreeName());
	}
	
	@Test
	public void queryNextNodes(){
		List l = service.queryNextNodes("root.00001");
		System.out.println(l);
	}
	
	@Test
	public void queryMaxTreeCode(){
		String code = service.queryMaxTreeCode("root.00001");
		System.out.println(code);
	}
	
	@Test
	public void makeChildCode(){
		String code = service.makeChildCode("root.00001");
		System.out.println(code);
	}
	
}
