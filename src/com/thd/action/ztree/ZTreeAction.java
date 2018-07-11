package com.thd.action.ztree;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thd.action.PubAction;
import com.thd.pojo.ztree.TpTree;
import com.thd.service.ztree.ZTreeService;
import com.thd.util.StringUtil;
import com.thd.util.TreeUtil;

public class ZTreeAction extends PubAction {
	@Resource
	private ZTreeService zTreeService;
	
	private TpTree tree = new TpTree();
	
	
	// 以下是选择所用参数
	
	//选择框类型 checkbox radio
	private String ckType ;
	//获取焦点的code  多个code用","隔开
	private String focusCodes;
	//打开节点code 多个code用","隔开
	private String openCodes;
	//被选中的code 多个code用","隔开
	private String checkCodes;
	
	//回调函数
	private String callBackPath;
	


	//选择树节点例子
	public String openCheckTree(){
		try{
			this.setForwardPage("/plugins/ztree/openCheckTree.jsp");
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
		


	//frameset页
	public String index(){
		try{
			this.setForwardPage("/plugins/ztree/treeFrame.jsp");
			TpTree t = new TpTree();
			if(StringUtil.isNotEmpty(tree.getTreeId())){
				t = this.zTreeService.queryNodeById(tree.getTreeId());
			}else{
				t = this.zTreeService.queryRoot();
			}
			if(t!=null){
				this.tree = t;
				return this.SUCCESS;
			}else{
				throw new Exception("未找到根节点");
			}
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	
	//选择树
	public String select(){
		
		//http://127.0.0.1:8080/thdPlugin/tree/tree_select.do?ckType=checkbox&checkCodes=root.00001,root.00001.00001,root.00002,root.00003.00001.00001
		try{
			this.setForwardPage("/plugins/ztree/treeSelect.jsp");
			
		
			if(StringUtil.isNotEmpty(focusCodes)){
				this.getRequest().put("focusCodes", focusCodes.split(","));
			}
			if(StringUtil.isNotEmpty(openCodes)){
				this.getRequest().put("openCodes", openCodes.split(","));
			}
			if(StringUtil.isNotEmpty(checkCodes)){
				this.getRequest().put("checkCodes", checkCodes.split(","));
			}
			
			
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
		
		
	//树形目录
	public String tree(){
		try{
			this.setForwardPage("/plugins/ztree/tree.jsp");
			TpTree t = new TpTree();
			if(StringUtil.isNotEmpty(tree.getTreeId())){
				t = this.zTreeService.queryNodeById(tree.getTreeId());
			}else{
				t = this.zTreeService.queryRoot();
			}
			if(t!=null){
				this.tree = t;
				return this.SUCCESS;
			}else{
				throw new Exception("未找到根节点");
			}
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//下级节点获取数据
	public String getData(){
		try{
			this.setForwardPage("/plugins/ztree/getData.jsp");
			String code = StringUtil.isEmpty(tree.getTreeCode()) ? "root" : tree.getTreeCode().trim();
			List<Map> l =  zTreeService.queryNextNodes(code);
			
//			GsonBuilder builder = new GsonBuilder();
//			Gson gson = builder.create();
//			String listStr = gson.toJson(l);
			this.getRequest().put("treeList", l);
			return this.SUCCESS;
		}catch(Exception e){
			return this.err(e);
		}
	}
	
	//编辑
	public String edit(){
		try{
			this.setForwardPage("/plugins/ztree/edit.jsp");
			if(StringUtil.isEmpty(tree.getTreeId())){
				throw new Exception("未获取到树形代码");
			}
			tree = zTreeService.queryNodeById(tree.getTreeId());
			if(tree == null){
				throw new Exception("未找到该节点");
			}
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	//新增
	public String add(){
		try{
			this.setForwardPage("/plugins/ztree/treeResult.jsp");
			if(StringUtil.isEmpty(tree.getTreeCode())){
				throw new Exception("未获取到树形代码");
			}
			//tree.setTreeCode(tree.getTreeCode());
			tree.setTreeName("新增子节点");
			tree.setTreeIsLeaf("1");
			zTreeService.saveTree(tree);
			//this.setMsg("新增节点操作成功");
			
			//设置刷新节点的父节点
			//this.getRequest().put("refreshParent",TreeUtil.parentCode(tree.getTreeCode()));
			//设置刷新节点
			this.getRequest().put("refresh",TreeUtil.parentCode(tree.getTreeCode()));
			//设置树形菜单焦点
			this.getRequest().put("focus",tree.getTreeCode());
			
			
			this.setUrl("tree_edit.do?operate=edit&tree.treeId=" + tree.getTreeId());
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	
	//编辑提交
	public String editSubmit(){
		try{
			this.setForwardPage("/plugins/ztree/treeResult.jsp");
			if(StringUtil.isNotEmpty(tree.getTreeId()) ){
				//编辑
				zTreeService.update(tree);
				this.setMsg("编辑操作成功");
				
				//设置刷新节点的父节点
				this.getRequest().put("refreshParent",tree.getTreeCode());
				//设置树形菜单焦点
				this.getRequest().put("focus",tree.getTreeCode());
			}
			this.setUrl("tree_edit.do?operate=edit&tree.treeCode=" + tree.getTreeCode());
			return this.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return this.err(e);
		}
	}
	
	
	//删除节点
	public String delete(){
		try{
			if(StringUtil.isEmpty(tree.getTreeId()) ){
				throw new Exception("请指定删除节点的id");
			}
			this.getLog().info("删除节点：" + tree.getTreeId());
			zTreeService.deleteById(TpTree.class, tree.getTreeId());
			this.setMsg("success");
		}catch(Exception e){
			e.printStackTrace();
			this.setMsg(e.getMessage());
		}
		return "ajax";
	}
	
	
	
	public TpTree getTree() {
		return tree;
	}

	public void setTree(TpTree tree) {
		this.tree = tree;
	}
	
	public String getFocusCodes() {
		return focusCodes;
	}

	public void setFocusCodes(String focusCodes) {
		this.focusCodes = focusCodes;
	}

	public String getOpenCodes() {
		return openCodes;
	}

	public void setOpenCodes(String openCodes) {
		this.openCodes = openCodes;
	}

	public String getCheckCodes() {
		return checkCodes;
	}

	public void setCheckCodes(String checkCodes) {
		this.checkCodes = checkCodes;
	}

	public String getCkType() {
		return ckType;
	}

	public void setCkType(String ckType) {
		this.ckType = ckType;
	}
	
	public String getCallBackPath() {
		return callBackPath;
	}

	public void setCallBackPath(String callBackPath) {
		this.callBackPath = callBackPath;
	}
}
