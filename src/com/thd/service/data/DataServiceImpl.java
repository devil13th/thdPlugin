package com.thd.service.data;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.thd.dao.JdbcDao;
import com.thd.dao.PubDao;
import com.thd.pojo.data.SysOrg;
import com.thd.service.PubServiceImpl;
import com.thd.util.Page;
import com.thd.util.StringUtil;

public class DataServiceImpl extends PubServiceImpl implements DataService {
	@Resource
	private PubDao pubDao;
	@Resource
	private JdbcDao jdbcDao;
	
	public List queryUser(String name,Page p){
		String sql = "select " +
				" user_id as id, " +
				" user_name as name, " +
				" user_sex as sex, " +
				" case user_sex when '1' then '男' when '0' then '女' else '' end as sexval," + 
				" user_birthday as bir, "+
				" user_status as status,"+
				" org_id as orgId, "+
				" user_mail as email, "+
				" user_tel as tel "+
				" from sys_user where 1=1 and user_status <> '0' ";
		if(StringUtil.isNotEmpty(name)){
			sql += " and user_name like '%" + name + "%' ";
		}
		List<String> params = new ArrayList<String>();
		params.add("%" + name + "%");
		
		
		
		sql += " order by user_name";
		return jdbcDao.query(sql,null, p);
	}
	
	public List queryUserForSelect2(String name,Page p){
		String sql = "select " +
				" user_id as id, " +
				" user_name as text, " +
				" user_sex as sex, " +
				" case user_sex when '1' then '男' when '0' then '女' else '' end as sexval," + 
				" user_birthday as bir, "+
				" user_status as status,"+
				" org_id as orgId, "+
				" user_mail as email, "+
				" user_tel as tel "+
				" from sys_user where 1=1 and user_status <> '0' ";
		if(StringUtil.isNotEmpty(name)){
			sql += " and user_name like '%" + name + "%' ";
		}
		List<String> params = new ArrayList<String>();
		params.add("%" + name + "%");
		
		
		
		sql += " order by user_name";
		return jdbcDao.query(sql,null, p);
	}
	
	public List queryUser(Map<String,String> map,Page p){
		String sql = "select " +
				" user_id as id, " +
				" user_name as name, " +
				" user_sex as sex, " +
				" case user_sex when '1' then '男' when '0' then '女' else '' end as sexval," + 
				" user_birthday as bir, "+
				" user_status as status,"+
				" org_id as orgId, "+
				" user_mail as mail, "+
				" user_tel as tel "+
				" from sys_user where 1=1 and user_status <> '0' ";
		List<String> params = new ArrayList<String>();
		if(map != null){
			
			if(StringUtil.isNotEmpty(map.get("name"))){
				String name = map.get("name").trim();
				sql += " and user_name like ? ";
				params.add("%" + name + "%");
			}
			
			if(StringUtil.isNotEmpty(map.get("sex"))){
				String sex = map.get("sex").trim();
				sql += " and user_sex = ? ";
				params.add(sex);
			}
			
			if(StringUtil.isNotEmpty(map.get("mail"))){
				String mail = map.get("mail").trim();
				sql += " and user_mail like ? ";
				params.add("%" + mail + "%");
			}
			
			if(StringUtil.isNotEmpty(map.get("tel"))){
				String tel = map.get("tel").trim();
				sql += " and user_tel like ? ";
				params.add("%" + tel + "%");
			}
		}
		sql += " order by user_name";
		return jdbcDao.query(sql,params.toArray(), p);
	};
	
	
	public List queryUserByIds(String ids){
		List<String> params = new ArrayList<String>();
		String sql = "select " +
				" user_id as id, " +
				" user_name as name, " +
				" user_sex as sex, " +
				" case user_sex when '1' then '男' when '0' then '女' else '' end as sexval," + 
				" user_birthday as bir, "+
				" user_status as status,"+
				" org_id as orgId, "+
				" user_mail as email "+
				" from sys_user where 1=1 and user_status <> '0' ";
		sql += " and ( 1 <> 1 ";
		if(StringUtil.isNotEmpty(ids)){
			String[] idArray = ids.split(",");
			for(String id : idArray){
				sql += " or user_id = ? ";
				params.add(id);
			}
		}
		sql += ")";
		
		
		return jdbcDao.query(sql,params.toArray(),null);
	}
	
	public List queryAllOrg(){
		String sql  = "select org_code as code,org_name as name from sys_org";
		return this.jdbcDao.query(sql, null, null);
	};
	
	public List queryOrg(String q){
		String sql  = "select org_code as code,org_name as name from sys_org where 1=1 ";
		List params = new ArrayList();
		if(StringUtil.isNotEmpty(q)){
			sql += " and (org_name like ? or org_code like ? )";
			params.add("%" + q + "%");
			params.add("%" + q + "%");
		}
		return this.jdbcDao.query(sql, params.toArray(), null);
	};
	
	
	public String queryOrgNameByOrgCode(String orgCode){
		SysOrg org = (SysOrg)this.getPubDao().findById(SysOrg.class, orgCode);
		if(org!=null){
			return org.getOrgName();
		}else{
			return null;
		}
	};
}
