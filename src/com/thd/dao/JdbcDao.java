package com.thd.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.thd.util.Page;

public class JdbcDao {
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Map<String,Object>> query(String sql,Object[] params,Integer currentPage ,Integer pageSize){
		if(currentPage !=null && pageSize != null && pageSize.compareTo(0)!=0 ){
			sql += " limit " + ((currentPage-1)*pageSize) + "," + pageSize ;
		}
		return this.jdbcTemplate.queryForList(sql, params);
	}
	
	public List<Map<String,Object>> query(String sql,Object[] params,Page p){
		if(p!= null){
			p.setListSize(this.queryCount(sql, params));
			return this.query(sql, params,p.getCurrentPage(),p.getPageSize());
		}else{
			return this.query(sql, params,null,null);
		}
	}
	
	public int queryCount(String sql,Object[] params){
		String ctSql = "select count(*) from (" + sql + ") as result";
		return this.jdbcTemplate.queryForInt(ctSql,params);
	}
}
