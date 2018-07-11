package com.thd.action.easyui;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thd.action.PubAction;
import com.thd.bean.TreeGridDataBean;
import com.thd.pojo.data.SysOrg;
import com.thd.pojo.data.SysUser;
import com.thd.pojo.ztree.TpTree;
import com.thd.service.easyui.EasyUiService;
import com.thd.util.ListUtil;
import com.thd.util.StringUtil;

public class EasyUiAction extends PubAction {
	@Resource
	private EasyUiService easyUiService;
	
	private TpTree tree = new TpTree();
	
	private SysUser sysUser = new SysUser();
	private SysOrg sysOrg = new SysOrg();
	private String ids ;
	//easyui combobox 参数
	private String q ;
	//easyui tree 参数
	private String id;
	
	/**
	 * datagrid 快速开发标准
	 * url:http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!userEditSubmit.do
	 * @return
	 */
	public String userEditSubmit(){
		this.getLog().info("userEditSubmit...");
		try{
			
			if(StringUtil.isNotEmpty(this.sysUser.getId())){
				this.sysUser = this.easyUiService.queryUserById(this.sysUser.getId());
				if(this.sysUser == null){
					throw new Exception("未找到用户");
				}
			}
			
			if(StringUtil.isNotEmpty(this.sysUser.getId())){
				this.easyUiService.updateUser(this.sysUser.getId(),this.sysUser,null);
			}else{
				this.easyUiService.saveUser(this.sysUser);
			}
			this.setScriptContent("getParent().reloadDg();window.close()");
			this.setMsg("保存成功");
			return "msg";
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * datagrid 快速开发标准
	 * url:http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!datagridStandard.do
	 * @return
	 */
	public String userEdit(){
		this.getLog().info("userEdit...");
		try{
			this.setForwardPage("/plugins/easyui/userEdit.jsp");
			
			if(StringUtil.isNotEmpty(this.sysUser.getId())){
				this.sysUser = this.easyUiService.queryUserById(this.sysUser.getId());
				if(this.sysUser == null){
					throw new Exception("未找到用户");
				}
			}
			
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * datagrid 快速开发标准
	 * url:http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!datagridStandard.do
	 * @return
	 */
	public String datagridStandard(){
		this.getLog().info("datagridStandard...");
		try{
			this.setForwardPage("/plugins/easyui/datagridStandard.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//datagrid 快速开发标准
	public String datagridStandardGetData(){
		this.getLog().info("datagridStandardGetData...");
		try{
			
			StringBuffer json = new StringBuffer();
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
			Map<String,String> map = new HashMap<String,String>();
			
			//=======快速开发======以下map的查询条件字段名保持和数据库一致
			//名称
			map.put("USER_NAME", this.getReq().getParameter("USER_NAME"));
			//邮箱
			map.put("USER_MAIL", this.getReq().getParameter("USER_MAIL"));
			//排序
			map.put("sort",getReq().getParameter("sort"));	
			map.put("order",getReq().getParameter("order"));	
			
			List l = this.easyUiService.queryUserToMap(map, this.p);
			String listStr = gson.toJson(l);
			json.append("{\"total\":" + p.getListSize() + ",\"rows\":");
			if(!ListUtil.isNotEmpty(l)){
				listStr = "[]";
			}
			json.append(listStr);
			json.append("}");
			
			this.setMsg(json.toString());
			return "ajax";
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	
	/**
	 * ajax
	 * url: http://127.0.0.1:8090/exam/exam!ajax.do 
	 * @return
	 */
	public String doajax(){
		this.getLog().info("doajax...");
		try{
			//删除用户
			if("deleteUser".equals(this.getAjaxMethod())){
				try{
					this.getLog().info("ajax deleteUser()");
					this.sysUser = this.easyUiService.queryUserById(id);
					if(this.sysUser !=null){
						this.easyUiService.delete(sysUser);
					}else{
						throw new Exception("未找到用户");
					}
					this.setMsg("success");
				}catch(Exception e){
					this.setMsg(e.getMessage());
				}
				return "ajax";
			}
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	//combogrid例子
	public String combogrid(){
		this.getLog().info("combogrid...");
		try{
			this.setForwardPage("/plugins/easyui/combogrid.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	//combotree例子
	public String combotree(){
		this.getLog().info("combotree...");
		try{
			this.setForwardPage("/plugins/easyui/combotree.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	//layout例子
	public String layout(){
		this.getLog().info("layout...");
		try{
			this.setForwardPage("/plugins/easyui/layout.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	//layout例子
	public String layout2(){
		this.getLog().info("layout...");
		try{
			this.setForwardPage("/plugins/easyui/layout2.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	//datagrid selector例子
	public String datagridSelector(){
		this.getLog().info("datagrid...");
		try{
			this.setForwardPage("/plugins/easyui/datagridSelector.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * datagrid例子
	 * http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!datagrid.do?sysUser.userName=2
	 * @return
	 */
	public String datagrid(){
		this.getLog().info("datagrid...");
		try{
			this.setForwardPage("/plugins/easyui/datagrid.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	/**
	 * datagrid api
	 * url http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!datagridApi.do
	 * @return
	 */
	public String datagridApi(){
		this.getLog().info("datagrid...");
		try{
			this.setForwardPage("/plugins/easyui/datagridApi.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	/**
	 * datagrid选择器
	 * http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!datagridSelect.do?ids=402881e846e119dc0146e119e29c0013,402881e846e119dc0146e119e2a80014
	 * @return
	 */
	public String datagridSelect(){
		this.getLog().info("select...");
		try{
			this.setForwardPage("/plugins/easyui/datagridSelect.jsp");
			this.getReq().setAttribute("ids", this.getReq().getParameter("ids"));
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	/**
	 * 获取数据
	 * http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!getUserData.do
	 * @return
	 */
	public String getUserData(){
		this.getLog().info("getUserData...");
		try{
			//this.setForwardPage("/plugins/easyui/getData.jsp");
			this.setForwardPage("/plugins/easyui/json.jsp");
			if(this.getReq().getParameter("rows") != null){
				this.getP().setPageSize(Integer.parseInt(this.getReq().getParameter("rows")));
				this.getP().setCurrentPage(Integer.parseInt(this.getReq().getParameter("page")));
				this.setJson(easyUiService.queryUserToJson(sysUser.getUserName(), this.getP()));
			}else{
				this.getP().setPageSize(0);
				this.getP().setCurrentPage(0);
				this.setJson(easyUiService.queryUserToJson(sysUser.getUserName(), this.getP()));
			}
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	public String getUserData2(){
		this.getLog().info("getUserData2...");
		try{
			//this.setForwardPage("/plugins/easyui/getData.jsp");
			this.setForwardPage("/plugins/easyui/json.jsp");
			this.setJson(easyUiService.queryUserToJson2(this.getReq().getParameter("ids")));
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	/**
	 * 编辑用户
	 * http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!edit.do
	 * @return
	 */
	public String edit(){
		this.getLog().info("edit...");
		try{
			this.setForwardPage("/plugins/easyui/edit.jsp");
			if(StringUtil.isNotEmpty(sysUser.getId())){
				sysUser = (SysUser)easyUiService.findById(SysUser.class, sysUser.getId());
			}
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	/**
	 * 保存用户
	 * http://127.0.0.1:8080/thdPlugin/easyUi/easyUi!editSubmit.do
	 * @return
	 */
	public String editSubmit(){
		this.getLog().info("editSubmit...");
		try{
			this.setForwardPage("/plugins/easyui/edit.jsp");
			
			if(StringUtil.isEmpty(sysUser.getId())){
				sysUser.setId(null);
			}
			
			easyUiService.saveOrUpdate(sysUser);
			this.setMsg("操作成功");
			this.setScriptContent("parent.tab.datagrid(\"reload\");parent.closeWin();");
			return "msg";
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	public String deleteAllUser(){
		this.getLog().info("deleteAll...");
		this.setForwardPage("/plugins/easyui/json.jsp");
		try{
			easyUiService.deleteAll(ids);
			this.setJson( "{\"status\":\"success\"}");
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			this.setJson("{\"status\":\"failure\",\"msg\":\"" + e.getMessage() + "\"}");
			return this.SUCCESS;
		}
	}
	
	
	public String getOrgData(){
		this.getLog().info("getOrgData...");
		try{
			this.setForwardPage("/plugins/easyui/json.jsp");
			
			if(StringUtil.isEmpty(sysOrg.getOrgCode())){
				this.setJson(easyUiService.queryOrgToJson());
			}else{
				this.setJson("[{\"code\":\"ZJ\",\"name\":\"" + sysOrg.getOrgCode() + "下级单位\"},{\"code\":\"FZ\",\"name\":\"" + sysOrg.getOrgCode() + "下级单位\"}]");
			}
			System.out.println(this.getJson());
			
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	public String getOrgData2(){
		this.getLog().info("getOrgData2...");
		try{
			this.setForwardPage("/plugins/easyui/json.jsp");
			/*
			if(StringUtil.isNotEmpty(q)){
				//this.setJson(easyUiService.queryOrgToJson());
			}else{
				this.setJson("[{\"code\":\"ZJ\",\"name\":\"" + q + "下级单位\"},{\"code\":\"FZ\",\"name\":\"" + q + "下级单位\"}]");
			}*/
			this.setJson(easyUiService.queryOrgToJson(q));
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	public String getUserInfoData(){
		this.getLog().info("getUserInfoData...");
		try{
			this.setForwardPage("/plugins/easyui/json.jsp");
			this.setJson(easyUiService.queryUserInfoToJson(sysUser.getId()));
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	
	
	
	public String combobox(){
		this.getLog().info("combobox...");
		try{
			this.setForwardPage("/plugins/easyui/combobox.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
	
	//property grid 例子 -- 主页
	public String propertyGrid(){
		this.getLog().info("propertyGrid...");
		try{
			this.setForwardPage("/plugins/easyui/propertyGrid.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//property grid 例子 -- 获取数据
	public String queryPropertyGridData(){
		this.getLog().info("queryPropertyGridData...");
		try{
			this.setForwardPage("/plugins/easyui/queryPropertyGridData.jsp");
			Gson g = new Gson();
			String uid = "402881e846e119dc0146e119e1a30002";
			if(StringUtil.isNotEmpty(ids)){
				uid = ids;
			}
			String str="";
			str = this.easyUiService.queryUserInfoToJson(uid);
			this.getRequest().put("json", str);
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//form 例子 -- 首页
	public String form(){
		this.getLog().info("form...");
		try{
			this.setForwardPage("/plugins/easyui/form.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	//form 例子 -- 加载数据
	public String loadFormData(){
		this.getLog().info("loadFormData...");
		try{
			this.setForwardPage("/plugins/easyui/loadFormData.jsp");
			
			String id = "402881e846e119dc0146e119e0230001";
			if(StringUtil.isNotEmpty(ids)){
				id = ids;
			}
			SysUser u = (SysUser)this.easyUiService.findById(SysUser.class, id);
			Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			String str = g.toJson(u);
			this.getLog().info(str);
			this.getRequest().put("json", str);
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}

	//tree例子
	public String tree(){
		this.getLog().info("datagrid...");
		try{
			this.setForwardPage("/plugins/easyui/tree.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	//datagrid例子
	public String treegrid(){
		this.getLog().info("datagrid...");
		try{
			this.setForwardPage("/plugins/easyui/treegrid.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//下级节点获取数据
	public String getTreeData(){
		try{
			this.setForwardPage("/plugins/easyui/getTreeData.jsp");
			String code = StringUtil.isEmpty(tree.getTreeCode()) ? "root" : tree.getTreeCode().trim();
			List<Map> l =  easyUiService.queryNextNodesByNodeId(id);
			
			this.getRequest().put("treeList", l);
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//下级节点获取数据
	public String getTreeData2(){
		try{
			this.setForwardPage("/plugins/easyui/getTreeData2.jsp");
			List r = new ArrayList();
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.setDateFormat("yyyy-MM-dd").create();
			if(StringUtil.isEmpty(this.getId())){
				for(int i = 0 , j = 10 ; i < j ;i++){
					
				}
				TreeGridDataBean tgdb1 = new TreeGridDataBean();
				tgdb1.setId("1");
				tgdb1.setAge("1");
				tgdb1.setBir("2011-01-01");
				tgdb1.setName("张三");
				//该属性必须有
				tgdb1.setParentId("0");
				//该属性必须有
				tgdb1.setState("closed");
				TreeGridDataBean tgdb2 = new TreeGridDataBean();
				tgdb2.setId("2");
				tgdb2.setAge("2");
				tgdb2.setBir("2011-01-02");
				tgdb2.setName("李四");
				//该属性必须有
				tgdb2.setParentId("0");
				//该属性必须有
				tgdb2.setState("closed");
				r.add(tgdb1);
				r.add(tgdb2);
				this.setMsg("{\"total\":" + r.size() + ",\"rows\":" + gson.toJson(r) + "}");
			}else{
				TreeGridDataBean tgdb3 = new TreeGridDataBean();
				tgdb3.setId(String.valueOf(Math.random()));
				tgdb3.setAge("1");
				tgdb3.setBir("2011-01-01");
				tgdb3.setName("张三儿子");
				tgdb3.setParentId(this.getId());
				tgdb3.setState("open");
				
				TreeGridDataBean tgdb4 = new TreeGridDataBean();
				tgdb4.setId(String.valueOf(Math.random()));
				tgdb4.setAge("2");
				tgdb4.setBir("2011-01-02");
				tgdb4.setName("李四儿子");
				//必须要有parentId
				tgdb4.setParentId(this.getId());
				tgdb4.setState("open");
				r.add(tgdb3);
				r.add(tgdb4);
				this.setMsg( gson.toJson(r) );
			}
			System.out.println(r);
			
			
			//注意：如果是空结果集则total的值是0,而且必须加双引号
			//this.setMsg("{\"total\":\"0\",\"rows\":[]}");
			//this.setMsg("");
			return "ajax";
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	public TpTree getTree() {
		return tree;
	}

	public void setTree(TpTree tree) {
		this.tree = tree;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public SysOrg getSysOrg() {
		return sysOrg;
	}

	public void setSysOrg(SysOrg sysOrg) {
		this.sysOrg = sysOrg;
	}
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	public SysUser getSysUser() {
		return sysUser;
	}

	public void setSysUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}
}
