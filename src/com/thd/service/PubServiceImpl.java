package com.thd.service;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.thd.dao.PubDao;
import com.thd.util.ListUtil;
import com.thd.util.Page;
import com.thd.util.queryfilter.SqlQueryFilter;

public class PubServiceImpl implements PubService{
	@Resource
	private PubDao pubDao;
	
	//日志
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * @see com.thd.service.PubService#getLog()
	 */
	public Logger getLog() {
		return log;
	}
	
	/*
	 * @see com.ccse.core.service.PubService#delete(java.lang.Object)
	 */
	public void delete(Object obj) {
		this.pubDao.delete(obj);
	}
	
	/*
	 * @see com.thd.service.PubService#deleteById(java.lang.Class, java.io.Serializable)
	 */
	public void deleteById(Class c,Serializable id){
		this.getPubDao().delete(c, id);
	};
	
	/*
	 * @see com.ccse.core.service.PubService#save(java.lang.Object)
	 */
	public void save(Object obj) {
		this.pubDao.save(obj);
		
	}
	/*
	 * @see com.ccse.core.service.PubService#update(java.lang.Object)
	 */
	public void update(Object obj) {
		this.pubDao.update(obj);
		
	}
	
	
	public void saveOrUpdate(Object obj){
		this.getPubDao().saveOrUpdate(obj);
	};
	
	/*
	 * @see com.ccse.core.service.PubService#query(java.lang.String)
	 */
	public List query(String sql){
		return this.pubDao.findBySqlToMap(sql);
	};
	
	/*
	 * @see com.ccse.core.service.PubService#query(java.lang.String, com.ccse.core.web.paging.Page)
	 */
	public List query(String sql,Page page){
		List l = this.getPubDao().findBySql(sql);
		if(ListUtil.isNotEmpty(l)){
			page.setListSize(l.size());
			int m = l.size() % page.getPageSize();
			if( m == 0){
				page.setMaxPage(l.size() / page.getPageSize());
			}else{
				page.setMaxPage(l.size() / page.getPageSize() + 1);
			}
		}else{
			page.setListSize(0);
		}
		return this.getPubDao().findBySqlToMap(sql, page.getCurrentPage(), page.getPageSize());
	};
	/*
	 * @see com.ccse.core.service.PubService#query(java.lang.String, java.lang.Object[], com.ccse.core.web.paging.Page)
	 */
	public List query(String sql,Object[] params,Page page){
		List l = this.getPubDao().findBySql(sql, params);
		if(ListUtil.isNotEmpty(l)){
			page.setListSize(l.size());
			int m = l.size() % page.getPageSize();
			if( m == 0){
				page.setMaxPage(l.size() / page.getPageSize());
			}else{
				page.setMaxPage(l.size() / page.getPageSize() + 1);
			}
		}else{
			page.setListSize(0);
		}
		return this.getPubDao().findBySqlToMap(sql, params, page.getCurrentPage(), page.getPageSize());
	};
	
	/*
	 * @see com.ccse.core.service.PubService#query(com.ccse.core.command.sql.SqlQueryFilter)
	 */
	public List query(SqlQueryFilter filter){
		String sql = filter.toSql();
		List l = this.getPubDao().findBySqlToMap(sql);
		if(ListUtil.isNotEmpty(l)){
			filter.setTotal(l.size());
		}
		return this.getPubDao().findBySqlToMap(sql, filter.getPage(),filter.getRows());
	};
	
	
	public Object findById(Class c,Serializable id){
		return this.getPubDao().findById(c, id);
	};
	
	public PubDao getPubDao() {
		return pubDao;
	}

	public void setPubDao(PubDao pubDao) {
		this.pubDao = pubDao;
	}
	
	

}
