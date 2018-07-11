package com.thd.service.ztree;

import java.util.List;
import java.util.Map;

import com.thd.pojo.ztree.TpTree;
import com.thd.service.PubServiceImpl;
import com.thd.util.ListUtil;
import com.thd.util.StringUtil;
import com.thd.util.TreeUtil;

public class ZTreeServiceImpl extends PubServiceImpl implements ZTreeService {
	
	public List<Map> queryNextNodes(String code){
		String sql = "select tree_id as id,tree_name as name ,tree_code as code,tree_status as status,tree_is_leaf as leaf from tp_tree tree  where 1=1 ";
		sql += " and tree_code like '" + code + ".%' and tree_code not like '" + code + ".%.%'";
		return this.query(sql);
	};
	
	public TpTree queryTreeByCode(String code){
		String sql = "select tree_id from tp_tree where tree_code like '" + code + "'";
		List l = this.getPubDao().findBySql(sql);
		if(ListUtil.isNotEmpty(l)){
			String id = l.get(0).toString();
			return (TpTree)this.getPubDao().findById(TpTree.class, id);
		}else{
			return null;
		}
	};
	
	
	public String queryMaxTreeCode(String code){
		String sql = "select tree_code from tp_tree where tree_code like '" + code + ".%' and tree_code not like '" + code + ".%.%' order by tree_code desc";
		List l = this.getPubDao().findBySql(sql);
		if(ListUtil.isNotEmpty(l)){
			return l.get(0).toString();
		}else{
			return null;
		}
	};
	
	public String makeChildCode(String code){
		String str = "";
		String maxCode = this.queryMaxTreeCode(code);
		int ct = 1;
		if(StringUtil.isNotEmpty(maxCode)){
			ct = TreeUtil.getCount(maxCode) + 1;
		}
		code = code + "." + TreeUtil.createCode("00000", ct);
		return code;
	}
	
	public void saveTree(TpTree tree){
		String pCode = tree.getTreeCode();
		TpTree pTree = this.queryTreeByCode(pCode);
		if(pTree != null){
			pTree.setTreeIsLeaf("0");
			this.getPubDao().update(pTree);
		}
		tree.setTreeCode(this.makeChildCode(pCode));
		this.getPubDao().save(tree);
	};
	
	public String dragNode(String sourceNodeId,String targetNodeId,String position){
		if("inner".equals(position)){
			
		}else if("next".equals(position)){
			
		}else if("prev".equals(position)){
			
		}else{
			return "位置错误!";
		}
		return "SUCCESS";
	};
	
	public TpTree queryRoot(){
		return queryTreeByCode("root");
	};
	
	
	public TpTree queryNodeById(String id){
		return (TpTree)this.getPubDao().findById(TpTree.class, id);
	};
	
}
