package com.thd.service.ztree;

import java.util.List;
import java.util.Map;

import com.thd.pojo.ztree.TpTree;
import com.thd.service.PubService;

public interface ZTreeService extends PubService {
	/**
	 * 根据树形代码获取下级子节点
	 * @param code 树形代码
	 * @return 子节点集合
	 */
	public List<Map> queryNextNodes(String code);
	
	/**
	 * 根据树形代码查询节点对象
	 * @param code 树形代码
	 * @return 节点对象
	 */
	public TpTree queryTreeByCode(String code);
	
	/**
	 * 查询最大属性代码的子节点
	 * @param code 树形代码
	 * @return 子节点中最大的属性代码
	 */
	public String queryMaxTreeCode(String code);
	
	/**
	 * 根据树形代码生成子节点代码
	 * @param code 树形代码
	 * @return 子节点代码
	 */
	public String makeChildCode(String code);
	/**
	 * 保存节点对象
	 * @return
	 */
	public void saveTree(TpTree tree);
	
	/**
	 * 拖动节点
	 * Method Description : ########
	 * @param sourceNodeId 被拖动的节点
	 * @param targetNodeId 拖到位置节点
	 * @param position 拖到的位置  next某节点后   prev某节点前  inner某节点内
	 * @return 成功返回SUCCESS否则返回错误原因
	 */
	public String dragNode(String sourceNodeId,String targetNodeId,String position);
	
	/**
	 * 查询根节点
	 * Method Description : ########
	 * @return
	 */
	public TpTree queryRoot();
	
	/**
	 * 根据ID查询节点
	 * Method Description : ########
	 * @param id
	 * @return
	 */
	public TpTree queryNodeById(String id);
	
	
}
