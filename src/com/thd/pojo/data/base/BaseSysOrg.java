package com.thd.pojo.data.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the sys_org table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="sys_org"
 */

public abstract class BaseSysOrg  implements Serializable {

	public static String REF = "SysOrg";
	public static String PROP_ORG_CODE = "OrgCode";
	public static String PROP_ORG_NAME = "OrgName";
	public static String PROP_ORG_TREE_CODE = "OrgTreeCode";


	// constructors
	public BaseSysOrg () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseSysOrg (java.lang.String orgCode) {
		this.setOrgCode(orgCode);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.String orgCode;

	// fields
	private java.lang.String orgName;
	private java.lang.String orgTreeCode;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="assigned"
     *  column="org_code"
     */
	public java.lang.String getOrgCode () {
		return orgCode;
	}

	/**
	 * Set the unique identifier of this class
	 * @param orgCode the new ID
	 */
	public void setOrgCode (java.lang.String orgCode) {
		this.orgCode = orgCode;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: org_name
	 */
	public java.lang.String getOrgName () {
		return orgName;
	}

	/**
	 * Set the value related to the column: org_name
	 * @param orgName the org_name value
	 */
	public void setOrgName (java.lang.String orgName) {
		this.orgName = orgName;
	}



	/**
	 * Return the value associated with the column: org_tree_code
	 */
	public java.lang.String getOrgTreeCode () {
		return orgTreeCode;
	}

	/**
	 * Set the value related to the column: org_tree_code
	 * @param orgTreeCode the org_tree_code value
	 */
	public void setOrgTreeCode (java.lang.String orgTreeCode) {
		this.orgTreeCode = orgTreeCode;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.thd.pojo.data.SysOrg)) return false;
		else {
			com.thd.pojo.data.SysOrg sysOrg = (com.thd.pojo.data.SysOrg) obj;
			if (null == this.getOrgCode() || null == sysOrg.getOrgCode()) return false;
			else return (this.getOrgCode().equals(sysOrg.getOrgCode()));
		}
	}

	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getOrgCode()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getOrgCode().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}


	public String toString () {
		return super.toString();
	}


}