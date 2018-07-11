package com.thd.service.easyui;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thd.dao.PubDao;
import com.thd.pojo.data.SysUser;
import com.thd.pojo.ztree.TpTree;
import com.thd.service.PubServiceImpl;
import com.thd.service.data.DataService;
import com.thd.util.DateFormart;
import com.thd.util.Page;
import com.thd.util.StringUtil;

public class EasyUiServiceImpl extends PubServiceImpl implements EasyUiService {
	@Resource
	private PubDao pubDao;
	@Resource
	private DataService dataService;
	
	public List queryUserToMap(Map<String,String> m,Page p){
		
		//=======快速开发======  以下sql从powerdesigner中黏贴到excel后处理  
		String sql = "select "+
				" t.USER_ID       as    USER_ID,"+//0 用户ID
				" t.USER_NAME     as    USER_NAME,"+//1 用户姓名
				" t.USER_SEX      as    USER_SEX,"+//2 用户性别
				" t.USER_MAIL     as    USER_MAIL,"+//3用户邮箱
				" t.USER_TEL      as    USER_TEL,"+//4用户电话
				" t.USER_BIRTHDAY as    USER_BIRTHDAY"+//5 用户生日
				" from SYS_USER t where 1=1 ";
		
		List<String> param = new ArrayList<String>();
		if(m!=null){
			//=======快速开发====== 查询条件保证和SQL的字段名保持一致    直接黏贴字段名 保持大小写一致
			
			//用户名
			if(StringUtil.isNotEmpty(m.get("USER_NAME"))){
				sql += " and t.USER_NAME like ? ";
				param.add("%" + m.get("USER_NAME").toString().trim() + "%");
			}
			
			//邮箱
			if(StringUtil.isNotEmpty(m.get("USER_MAIL"))){
				sql += " and t.USER_MAIL like ? ";
				param.add("%" + m.get("USER_MAIL").toString().trim() + "%");
			}
		}
		
		//排序 写死即可
		if(StringUtil.isNotEmpty((String)m.get("sort"))){
			sql+=" order by " + m.get("sort").toString().toUpperCase() + " " +m.get("order").toString().toUpperCase();
		}
		
		return this.getPubDao().findBySqlToMap(sql, param.toArray(),p);
	};
	
	
	public List queryUserData(String name,Page p){
		return dataService.queryUser(name,  p);
	}
	
	public String queryUserToJson(String name,Page p){
		StringBuffer json = new StringBuffer();
		List l = this.queryUserData(name,p);
		GsonBuilder builder = new GsonBuilder();
		//Gson gson = builder.setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
		String listStr = gson.toJson(l);
		  
		json.append("{\"total\":" + p.getListSize() + ",\"rows\":");
		if(StringUtil.isEmpty(listStr)){
			listStr = "[]";
		}
		json.append(listStr);
		json.append("}");
		
		//{ "total":1, "rows":[ { "id":"8a808af13c09399c013c09399d830001", "name":"devil13th", "sex":"1", "age":"5", "bir":"2013-01-05" } ] } 
		return json.toString();
	};
	
	public String queryUserToJson2(String ids){
		StringBuffer json = new StringBuffer();
		List l = dataService.queryUserByIds(ids);
		GsonBuilder builder = new GsonBuilder();
		//Gson gson = builder.setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
		String listStr = gson.toJson(l);
		  
		json.append("{\"total\":" + l.size() + ",\"rows\":");
		if(StringUtil.isEmpty(listStr)){
			listStr = "[]";
		}
		json.append(listStr);
		json.append("}");
		
		//{ "total":1, "rows":[ { "id":"8a808af13c09399c013c09399d830001", "name":"devil13th", "sex":"1", "age":"5", "bir":"2013-01-05" } ] } 
		return json.toString();
	};
	
	public void saveUser(SysUser user){
		this.getPubDao().save(user);
	};
	public void updateUser(String id,SysUser user,String[] nullProperties){
		try{
			this.getPubDao().update(user, id, nullProperties);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	};
	
	
	public SysUser queryUserById(String id){
		return (SysUser)this.getPubDao().findById(SysUser.class, id);
	};
	
	public String queryOrgToJson(){
		List l = dataService.queryAllOrg();
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		String listStr = gson.toJson(l);
		return listStr;
	};
	
	
	public String queryOrgToJson(String q){
		List l = dataService.queryOrg(q);
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		String listStr = gson.toJson(l);
		return listStr;
	};
	
	public String queryUserInfoToJson(String userId){
		SysUser u = (SysUser)this.pubDao.findById(SysUser.class, userId);
		/*String json = 
		"{\"total\":4,\"rows\":["+
		"{\"name\":\"Name\",\"value\":\"" + u.getUserName() + "\",\"group\":\"ID Settings\",\"editor\":\"text\"},"+
		"{\"name\":\"Sex\",\"value\":\"" + u.getUserSex() + "\",\"group\":\"ID Settings\",\"editor\":\"text\"},"+
		"{\"name\":\"Mail\",\"value\":\"" + u.getUserMail() + "\",\"group\":\"Info Settings\",\"editor\":\"text\"},"+
		"{\"name\":\"Org\",\"value\":\"" + u.getOrgId() + "\",\"group\":\"Info Settings\",\"editor\":\"text\"}"+
		"]}";*/
		String json = 
				"{\"total\":4,\"rows\":["+
				"{\"name\":\"Name\",\"value\":\"" + u.getUserName() + "\",\"group\":\"ID Settings\",\"editor\":\"text\"},"+
				"{\"name\":\"Sex\",\"value\":\"" + u.getUserSex() + "\",\"group\":\"ID Settings\",\"editor\":\"text\"},"+
				"{\"name\":\"Mail\",\"value\":\"" + u.getUserMail() + "\",\"group\":\"Info Settings\",\"editor\":\"text\"},"+
				"{\"name\":\"Org\",\"value\":\"" + u.getOrgId() + "\",\"group\":\"Info Settings\",\"editor\":{\"type\":\"combobox\",\"options\":{\"url\":\"${ctx}/easyUi/easyUi!getOrgData.do\",\"valueField\":\"code\",\"textField\":\"name\"}}}"+
				"]}";
		
		return json;
	};
	
	public void deleteAll(String ids){
		if(StringUtil.isNotEmpty(ids)){
			String[] idss = ids.split(",");
			if(ids.length() > 0){
				for(String id : idss){
					SysUser u = (SysUser)this.findById(SysUser.class, id);
					u.setUserStatus("0");
					this.getPubDao().update(u);
				}
			}
		}
	};
	
	
	
	public void saveA(){
		SysUser g = (SysUser)this.getPubDao().findById(SysUser.class, "8a808af13c4cba69013c4cba6a5e0001");
		g.setUserName("xxx");
		try{
			int i = 1/0;
		}catch(Exception e){
			this.getLog().info(e.getMessage());
			this.getLog().error(e.getMessage());
		}
	}
	
	public String ajaxSaveUser(String id,String uname,String sex,String bir,String status,String orgId){
		try{
			SysUser u = new SysUser();
			u.setUserName(uname);
			u.setUserBirthday(DateFormart.toDate(bir));
			u.setUserSex(Integer.parseInt(sex));
			u.setUserStatus(status);
			if(StringUtil.isNotEmpty(id)){
				u.setId(id);
				this.getPubDao().update(u);
			}else{
				this.getPubDao().save(u);
			}
			return "success";
		}catch(Exception e){
			return e.getMessage();
		}
		
	};
	public List<Map> queryNextNodes(String code){
		String sql = "select tree_id as id,tree_name as name ,tree_code as code,tree_status as status,tree_is_leaf as leaf from tp_tree tree  where 1=1 ";
		sql += " and tree_code like '" + code + ".%' and tree_code not like '" + code + ".%.%'";
		return this.query(sql);
	};
	
	public List<Map> queryNextNodesByNodeId(String nodeId){
		String treeCode = "root";
		if(StringUtil.isNotEmpty(nodeId)){
			TpTree t = (TpTree)this.getPubDao().findById(TpTree.class, nodeId);
			treeCode = t.getTreeCode();
		}
		return this.queryNextNodes(treeCode);
	};
	
	public List queryTest(){
		String sql = "select "
				+ "t.tree_id ,"
				+ "t.tree_name as TREE_NAME,"
				+ "t.tree_code as TREE_CODE "
				+ "from tp_tree t";
		return this.getPubDao().findBySqlToMap(sql);
	};
}
