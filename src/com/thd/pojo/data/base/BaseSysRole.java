package com.thd.pojo.data.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the sys_role table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="sys_role"
 */

public abstract class BaseSysRole  implements Serializable {

	public static String REF = "SysRole";
	public static String PROP_ROLE_NAME = "RoleName";
	public static String PROP_ROLE_DES = "RoleDes";
	public static String PROP_ROLE_CODE = "RoleCode";
	public static String PROP_ROLE_STATUS = "RoleStatus";
	public static String PROP_ROLE_LEVEL = "RoleLevel";


	// constructors
	public BaseSysRole () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseSysRole (java.lang.String roleCode) {
		this.setRoleCode(roleCode);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.String roleCode;

	// fields
	private java.lang.String roleName;
	private java.lang.String roleDes;
	private java.lang.String roleLevel;
	private java.lang.String roleStatus;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="assigned"
     *  column="role_code"
     */
	public java.lang.String getRoleCode () {
		return roleCode;
	}

	/**
	 * Set the unique identifier of this class
	 * @param roleCode the new ID
	 */
	public void setRoleCode (java.lang.String roleCode) {
		this.roleCode = roleCode;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: role_name
	 */
	public java.lang.String getRoleName () {
		return roleName;
	}

	/**
	 * Set the value related to the column: role_name
	 * @param roleName the role_name value
	 */
	public void setRoleName (java.lang.String roleName) {
		this.roleName = roleName;
	}



	/**
	 * Return the value associated with the column: role_des
	 */
	public java.lang.String getRoleDes () {
		return roleDes;
	}

	/**
	 * Set the value related to the column: role_des
	 * @param roleDes the role_des value
	 */
	public void setRoleDes (java.lang.String roleDes) {
		this.roleDes = roleDes;
	}



	/**
	 * Return the value associated with the column: role_level
	 */
	public java.lang.String getRoleLevel () {
		return roleLevel;
	}

	/**
	 * Set the value related to the column: role_level
	 * @param roleLevel the role_level value
	 */
	public void setRoleLevel (java.lang.String roleLevel) {
		this.roleLevel = roleLevel;
	}



	/**
	 * Return the value associated with the column: role_status
	 */
	public java.lang.String getRoleStatus () {
		return roleStatus;
	}

	/**
	 * Set the value related to the column: role_status
	 * @param roleStatus the role_status value
	 */
	public void setRoleStatus (java.lang.String roleStatus) {
		this.roleStatus = roleStatus;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.thd.pojo.data.SysRole)) return false;
		else {
			com.thd.pojo.data.SysRole sysRole = (com.thd.pojo.data.SysRole) obj;
			if (null == this.getRoleCode() || null == sysRole.getRoleCode()) return false;
			else return (this.getRoleCode().equals(sysRole.getRoleCode()));
		}
	}

	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getRoleCode()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getRoleCode().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}


	public String toString () {
		return super.toString();
	}


}