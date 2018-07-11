package com.thd.pojo.ztree.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the tp_tree table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="tp_tree"
 */

public abstract class BaseTpTree  implements Serializable {

	public static String REF = "TpTree";
	public static String PROP_TREE_CODE = "treeCode";
	public static String PROP_TREE_STATUS = "treeStatus";
	public static String PROP_TREE_ID = "treeId";
	public static String PROP_TREE_IS_LEAF = "treeIsLeaf";
	public static String PROP_TREE_NAME = "treeName";


	// constructors
	public BaseTpTree () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseTpTree (java.lang.String treeId) {
		this.setTreeId(treeId);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.String treeId;

	// fields
	private java.lang.String treeName;
	private java.lang.String treeCode;
	private java.lang.String treeStatus;
	private java.lang.String treeIsLeaf;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="uuid.hex"
     *  column="tree_id"
     */
	public java.lang.String getTreeId () {
		return treeId;
	}

	/**
	 * Set the unique identifier of this class
	 * @param treeId the new ID
	 */
	public void setTreeId (java.lang.String treeId) {
		this.treeId = treeId;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: tree_name
	 */
	public java.lang.String getTreeName () {
		return treeName;
	}

	/**
	 * Set the value related to the column: tree_name
	 * @param treeName the tree_name value
	 */
	public void setTreeName (java.lang.String treeName) {
		this.treeName = treeName;
	}



	/**
	 * Return the value associated with the column: tree_code
	 */
	public java.lang.String getTreeCode () {
		return treeCode;
	}

	/**
	 * Set the value related to the column: tree_code
	 * @param treeCode the tree_code value
	 */
	public void setTreeCode (java.lang.String treeCode) {
		this.treeCode = treeCode;
	}



	/**
	 * Return the value associated with the column: tree_status
	 */
	public java.lang.String getTreeStatus () {
		return treeStatus;
	}

	/**
	 * Set the value related to the column: tree_status
	 * @param treeStatus the tree_status value
	 */
	public void setTreeStatus (java.lang.String treeStatus) {
		this.treeStatus = treeStatus;
	}



	/**
	 * Return the value associated with the column: tree_is_leaf
	 */
	public java.lang.String getTreeIsLeaf () {
		return treeIsLeaf;
	}

	/**
	 * Set the value related to the column: tree_is_leaf
	 * @param treeIsLeaf the tree_is_leaf value
	 */
	public void setTreeIsLeaf (java.lang.String treeIsLeaf) {
		this.treeIsLeaf = treeIsLeaf;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.thd.pojo.ztree.TpTree)) return false;
		else {
			com.thd.pojo.ztree.TpTree tpTree = (com.thd.pojo.ztree.TpTree) obj;
			if (null == this.getTreeId() || null == tpTree.getTreeId()) return false;
			else return (this.getTreeId().equals(tpTree.getTreeId()));
		}
	}

	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getTreeId()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getTreeId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}


	public String toString () {
		return super.toString();
	}


}