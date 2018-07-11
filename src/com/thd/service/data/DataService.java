package com.thd.service.data;

import java.util.List;
import java.util.Map;

import com.thd.service.PubService;
import com.thd.util.Page;

public interface DataService extends PubService {
	/**
	 * 根据姓名查询用户
	 * @param sqf 
	 * @return json数据
	 */
	public List queryUser(String name,Page p);
	/**
	 * 根据姓名查询用户
	 * @param sqf 
	 * @return json数据
	 */
	public List queryUserForSelect2(String name,Page p);
	/**
	 * 查询用户
	 * @param map 查询条件
	 * @param p 分页信息
	 * @return 用户列表
	 */
	public List queryUser(Map<String,String> map,Page p);
	/**
	 * 根据ID查询用户
	 * @param ids 用户ID 多个ID用","隔开
	 * @return
	 */
	public List queryUserByIds(String ids);
	/**
	 * 查询所有组织机构
	 * @return
	 */
	public List queryAllOrg();
	
	/**
	 * 根据关键字查询组织机构
	 * Method Description : ########
	 * @param q 查询关键字
	 * @return
	 */
	public List queryOrg(String q);
	
	public String queryOrgNameByOrgCode(String orgCode);
}
