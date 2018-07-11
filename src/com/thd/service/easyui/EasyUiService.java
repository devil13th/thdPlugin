package com.thd.service.easyui;

import java.util.List;
import java.util.Map;

import com.thd.pojo.data.SysUser;
import com.thd.service.PubService;
import com.thd.util.Page;

public interface EasyUiService extends PubService {
	
	/**
	 * 查询用户
	 * @param m 查询条件
	 * @param p 分页信息
	 * @return List<Map> 用户列表
	 */
	public List queryUserToMap(Map<String,String> m,Page p);
	
	/**
	 * 查询用户JSON字符串
	 * @param name
	 * @param p
	 * @return
	 */
	public String queryUserToJson(String name,Page p);
	
	/**
	 * 查询用户JSON字符串
	 * @param ids 用户id 多个id用","隔开
	 * @return
	 */
	public String queryUserToJson2(String ids);
	/**
	 * 保存用户
	 * @param user 用户对象
	 */
	public void saveUser(SysUser user);
	/**
	 * 更新用户
	 * @param id 用户ID
	 * @param user 用户对象
	 * @param nullProperties 置空的属性
	 */
	public void updateUser(String id,SysUser user,String[] nullProperties);
	/**
	 * 根据ID查询用户
	 * @param id 用户ID
	 * @return 用户对象
	 */
	public SysUser queryUserById(String id);
	/**
	 * 查询组织机构JSON字符串
	 * @param name
	 * @return
	 */
	public String queryOrgToJson();
	
	public String queryOrgToJson(String q);
	
	public String queryUserInfoToJson(String userId);
	
	public void deleteAll(String ids);
	
	public void saveA();
	
	public String ajaxSaveUser(String id,String uname,String sex,String bir,String status,String orgId);
	/**
	 * 根据树形代码获取下级子节点
	 * @param code 树形代码
	 * @return 子节点集合
	 */
	public List<Map> queryNextNodes(String code);
	/**
	 * 根据节点id获取下级子节点
	 * @param nodeId 节点id
	 * @return 子节点集合
	 */
	public List<Map> queryNextNodesByNodeId(String nodeId);
	/**
	 * 测试PubDao.queryBySqlToMap()
	 * @return List
	 */
	public List queryTest();
}
