package com.thd.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.thd.util.MyBeanUtils;
import com.thd.util.Page;

public class PubDao extends HibernateDaoSupport {
	/**
	 * @description 保存对象
	 * @param obj 保存的对象
	 */
	public void save(Object obj) {
		this.getHibernateTemplate().save(obj);
	};
	
	/**
	 * @description 更新对象
	 * @param obj 更新的对象
	 */
	public void update(Object obj) {
		this.getHibernateTemplate().update(obj);
	}
	
	/**
	 * @description 根据参数对象更新数据库对象
	 * @param original 根据此对象不为空的属性更新数据库中的对象
	 * @param id 需要更新对象的id
	 * @param nullProperties 需要设置为空的属性
	 * @throws Exception
	 */
	public void update(Object original,Serializable id,Object[] nullProperties) throws Exception{
		Object dest = this.findById(original.getClass(), id);
		MyBeanUtils.copyNotNullProperties(dest, original);
		MyBeanUtils.setObjNullProperties(dest, nullProperties);
		this.getHibernateTemplate().update(dest);
	}
	
	/**
	 * @description 删除对象
	 * @param obj 删除的对象 对象要有主键
	 */
	public void delete(Object obj) {
		this.getHibernateTemplate().delete(obj);
	}
	
	/**
	 * @description 根据id删除对象
	 * @param c 删除的对象类型
	 * @param id 删除的对象的主键
	 */
	public void delete(Class c,Serializable id){
		Object obj = findById(c,id);
		this.delete(obj);
	}
	
	/**
	 * @description 保存或更新对象
	 * @param obj 保存或更新的对象 有主键则是更新 没有主键则是保存
	 */
	public void saveOrUpdate(Object obj){
		this.getHibernateTemplate().saveOrUpdate(obj);
	}
	
	/**
	 * @description 根据id查找对象
	 * @param c 对象的类
	 * @param id 对象的id
	 * @return 
	 */
	@SuppressWarnings("unchecked")
	public Object findById(Class c,Serializable id){
		return this.getHibernateTemplate().get(c, id);
	}
	
	
	/**
	 * @description hql基础查询
	 * @param hql hql查询语句
	 * @param params 条件的值,对应hql中的"?"
	 * @param currPage 当前页
	 * @param pageSIze 每页显示条目数量
	 * @return 
	 */
	@SuppressWarnings("unchecked")
	public List<Object> findByHql(final String hql,final Object[] params,final int currPage,final int pageSize) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Query query = session.createQuery(hql);
				if(params!=null && params.length>0){
					for(int i = 0 , j = params.length ; i < j ; i++){
						query.setParameter(i,params[i]);
					}
				}
				if (currPage >= 1 && pageSize >= 1) {
					query.setFirstResult((currPage - 1) * pageSize);
					query.setMaxResults(pageSize);
				}
				return query.list();
			}
		});
	}
	
	
	/**
	 * @description 无参数的hql全部记录查询
	 * @param hql hql语句
	 * @return 
	 */
	public List findByHql(String hql){
		return findByHql(hql,null,0,0);
	}
	
	/**
	 * @description 带有参数的hql全部记录查询
	 * @param hql hql语句
	 * @param params  条件的值,对应hql中的"?"
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object> findByHql(final String hql,final Object[] params) {
		return findByHql(hql,params,0,0);
	}
	
	/**
	 * @description 不带参数的hql分页查询
	 * @param hql hql语句
	 * @param currPage 当前页
	 * @param pageSize 每页显示条目数量
	 * @return 
	 */
	public List<Object> findByHql(String hql,int currPage,int pageSize) {
		return findByHql(hql,null,currPage,pageSize);
	}
	
	
	/**
	 * @description sql基础查询
	 * @param sql sql语句
	 * @param params 条件的值,对应sql语句中的"?"
	 * @param currPage 当前页
	 * @param pageSize 每页显示条目数量
	 * @return List<Object[]>
	 */
	@SuppressWarnings("unchecked")
	public List<Object> findBySql( final String sql,final Object[] params,final int currPage, final int pageSize) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session s) throws HibernateException,SQLException {
				Query query = s.createSQLQuery(sql);
				if(params!=null && params.length>0){
					for(int i = 0 , j = params.length ; i < j ; i++){
						query.setParameter(i,params[i]);
					}
				}
				if (currPage >= 1  && pageSize >= 1) {
					query.setFirstResult((currPage - 1) * pageSize);
					query.setMaxResults(pageSize);
				}
				List list = query.list();
				return list;
			}
		});
	}
	
	/**
	 * @description 不带参数的sql全部记录查询
	 * @param sql sql语句
	 * @return List<Object[]>
	 */
	public List<Object> findBySql(final String sql) {
		return this.findBySql(sql, null, 0, 0);
	}
	
	
	/**
	 * @description 带参数的sql全部记录查询
	 * @param sql
	 * @param params
	 * @return List<Object[]>
	 */
	@SuppressWarnings("unchecked")
	public List<Object> findBySql(final String sql,final Object[] params) {
		return this.findBySql(sql, params, 0, 0);
	}
	
	/**
	 * 不带参数的sql分页查询
	 * @param sql sql语句
	 * @param currPage 当前页
	 * @param pageSize 每页显示条目数量
	 * @return  List<Object[]>
	 */
	public List<Object> findBySql(final String sql,int currPage,int pageSize) {
		return this.findBySql(sql, null, currPage, pageSize);
	}
	
	
	
	
	/**
	 * @description sql基础查询 
	 * @param sql sql语句
	 * @param params 条件的值,对应sql语句中的"?"
	 * @param currPage 当前页
	 * @param pageSize 每页显示条目数量
	 * @return List<Map>
	 */
	@SuppressWarnings("unchecked")
	public List<Map> findBySqlToMap( final String sql,final Object[] params,final int currPage, final int pageSize) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session s) throws HibernateException,SQLException {
				Query query = s.createSQLQuery(sql);
				query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
				if(params!=null && params.length>0){
					for(int i = 0 , j = params.length ; i < j ; i++){
						query.setParameter(i,params[i]);
					}
				}
				if (currPage >= 1  && pageSize >= 1) {
					query.setFirstResult((currPage - 1) * pageSize);
					query.setMaxResults(pageSize);
				}
				List list = query.list();
				return list;
			}
		});
	}
	
	/**
	 * @description 不带参数的sql全部记录查询
	 * @param sql sql语句
	 * @return List<Map>
	 */
	public List<Map> findBySqlToMap(final String sql) {
		return this.findBySqlToMap(sql, null, 0, 0);
	}
	
	/**
	 * @description 带参数的sql全部记录查询
	 * @param sql
	 * @param params
	 * @return List<Map>
	 */
	@SuppressWarnings("unchecked")
	public List<Map> findBySqlToMap(final String sql,final Object[] params) {
		return this.findBySqlToMap(sql, params, 0, 0);
	}
	
	
	/**
	 * @description sql基础查询 
	 * @param sql sql语句
	 * @param params 条件的值,对应sql语句中的"?"
	 * @param page  分页信息
	 * @return List<Map>
	 */
	public List<Map> findBySqlToMap( final String sql,final Object[] params,Page page){
		List allResult = this.findBySql(sql, params);
		
		//如果页面或单页数量小于等于0则返回全部记录
		if(page.getCurrentPage() <= 0 || page.getPageSize() <= 0){
			return allResult;
		}
		
		
		if (allResult != null && !allResult.isEmpty()) {
			int rowsNum = allResult.size();
			int temp = rowsNum % page.getPageSize(); // 取模
			int pageNum = 0;
			if (temp > 0) {// 如果有余数
				pageNum = rowsNum / page.getPageSize() + 1;
			} else if (temp == 0)
				pageNum = rowsNum / page.getPageSize();
			page.setListSize(rowsNum);// 设置总记录条数
			page.setMaxPage(pageNum);// 设置最大页数
			return this.findBySqlToMap(sql.toString(), params, page.getCurrentPage(), page.getPageSize());
		} else {
			page.setListSize(0);
			page.setMaxPage(0);
			page.setCurrentPage(1);
			return null;
		}
	};
	
	
	/**
	 * 不带参数的sql分页查询
	 * @param sql sql语句
	 * @param currPage 当前页
	 * @param pageSize 每页显示条目数量
	 * @return List<Map>
	 */
	public List<Map> findBySqlToMap(final String sql,int currPage,int pageSize) {
		return this.findBySqlToMap(sql, null, currPage, pageSize);
	}
	
	
	/**
	 * @description 执行sql语句
	 * @param sql
	 */
	@SuppressWarnings("unchecked")
	public void executeSql(final String sql) {
		this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Query query = session.createSQLQuery(sql);
				query.executeUpdate();
				return null;
			}
		});
	}
	
	
	/**
	 * @description 执行带"?"的sql语句
	 * @param sql sql语句
	 * @param params 条件的值,对应sql语句中的"?"
	 */
	@SuppressWarnings("unchecked")
	public void executeSql(final String sql,final Object[] params) {
		this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Query query = session.createSQLQuery(sql);
				if(params!=null && params.length>0){
					for(int i = 0 , j = params.length ; i < j ; i++){
						query.setParameter(i,params[i]);
					}
				}
				query.executeUpdate();
				return null;
			}
		});
	}
	
	public Object getOne(List<Object> l ){
		if( (l!=null) && !l.isEmpty()){
			if(l.get(0)!=null){
				return l.get(0);
			}else{
				return null;
			}			
		}else{
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List pageSQL(String sql,Object[] obj,Page page){
		List allResult = this.findBySql(sql, obj);
		
		//如果页面或单页数量小于等于0则返回全部记录
		if(page.getCurrentPage() <= 0 || page.getPageSize() <= 0){
			return allResult;
		}
		
		
		if (allResult != null && !allResult.isEmpty()) {
			int rowsNum = allResult.size();
			int temp = rowsNum % page.getPageSize(); // 取模
			int pageNum = 0;
			if (temp > 0) {// 如果有余数
				pageNum = rowsNum / page.getPageSize() + 1;
			} else if (temp == 0)
				pageNum = rowsNum / page.getPageSize();
			page.setListSize(rowsNum);// 设置总记录条数
			page.setMaxPage(pageNum);// 设置最大页数
			return this.findBySql(sql.toString(), obj, page.getCurrentPage(), page
					.getPageSize());
		} else {
			page.setListSize(0);
			page.setMaxPage(0);
			page.setCurrentPage(1);
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List pageHQL(String hql,Object[] obj,Page page){
		List allResult = this.findByHql(hql, obj);
		
		//如果页面或单页数量小于等于0则返回全部记录
		if(page.getCurrentPage() <= 0 || page.getPageSize() <= 0){
			return allResult;
		}
		
		if (allResult != null && !allResult.isEmpty()) {
			
			int rowsNum = allResult.size();
			int temp = rowsNum % page.getPageSize(); // 取模
			int pageNum = 0;
			if (temp > 0) {// 如果有余数
				pageNum = rowsNum / page.getPageSize() + 1;
			} else if (temp == 0)
				pageNum = rowsNum / page.getPageSize();
			page.setListSize(rowsNum);// 设置总记录条数
			page.setMaxPage(pageNum);// 设置最大页数
			return this.findByHql(hql.toString(), obj, page.getCurrentPage(), page.getPageSize());
			
		} else {
			page.setListSize(0);
			page.setMaxPage(0);
			page.setCurrentPage(1);
			return null;
		}
	}
	
	public void merge(Object obj){
		this.getHibernateTemplate().merge(obj);
	}
	public void flush(){
		getHibernateTemplate().flush();  
	}
	public void clear(){
		this.getHibernateTemplate().clear();
	}
	
	
}
