package com.thd.pojo.data.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the sys_user table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="sys_user"
 */

public abstract class BaseSysUser  implements Serializable {

	public static String REF = "SysUser";
	public static String PROP_USER_SEX = "UserSex";
	public static String PROP_USER_TEL = "UserTel";
	public static String PROP_ORG_ID = "OrgId";
	public static String PROP_USER_STATUS = "UserStatus";
	public static String PROP_USER_BIRTHDAY = "UserBirthday";
	public static String PROP_USER_MAIL = "UserMail";
	public static String PROP_ID = "Id";
	public static String PROP_USER_NAME = "UserName";


	// constructors
	public BaseSysUser () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseSysUser (java.lang.String id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.String id;

	// fields
	private java.lang.String userName;
	private java.lang.Integer userSex;
	private java.lang.String userMail;
	private java.lang.String userTel;
	private java.util.Date userBirthday;
	private java.lang.String userStatus;
	private java.lang.String orgId;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="uuid.hex"
     *  column="user_id"
     */
	public java.lang.String getId () {
		return id;
	}

	/**
	 * Set the unique identifier of this class
	 * @param id the new ID
	 */
	public void setId (java.lang.String id) {
		this.id = id;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: user_name
	 */
	public java.lang.String getUserName () {
		return userName;
	}

	/**
	 * Set the value related to the column: user_name
	 * @param userName the user_name value
	 */
	public void setUserName (java.lang.String userName) {
		this.userName = userName;
	}



	/**
	 * Return the value associated with the column: user_sex
	 */
	public java.lang.Integer getUserSex () {
		return userSex;
	}

	/**
	 * Set the value related to the column: user_sex
	 * @param userSex the user_sex value
	 */
	public void setUserSex (java.lang.Integer userSex) {
		this.userSex = userSex;
	}



	/**
	 * Return the value associated with the column: user_mail
	 */
	public java.lang.String getUserMail () {
		return userMail;
	}

	/**
	 * Set the value related to the column: user_mail
	 * @param userMail the user_mail value
	 */
	public void setUserMail (java.lang.String userMail) {
		this.userMail = userMail;
	}



	/**
	 * Return the value associated with the column: user_tel
	 */
	public java.lang.String getUserTel () {
		return userTel;
	}

	/**
	 * Set the value related to the column: user_tel
	 * @param userTel the user_tel value
	 */
	public void setUserTel (java.lang.String userTel) {
		this.userTel = userTel;
	}



	/**
	 * Return the value associated with the column: user_birthday
	 */
	public java.util.Date getUserBirthday () {
		return userBirthday;
	}

	/**
	 * Set the value related to the column: user_birthday
	 * @param userBirthday the user_birthday value
	 */
	public void setUserBirthday (java.util.Date userBirthday) {
		this.userBirthday = userBirthday;
	}



	/**
	 * Return the value associated with the column: user_status
	 */
	public java.lang.String getUserStatus () {
		return userStatus;
	}

	/**
	 * Set the value related to the column: user_status
	 * @param userStatus the user_status value
	 */
	public void setUserStatus (java.lang.String userStatus) {
		this.userStatus = userStatus;
	}



	/**
	 * Return the value associated with the column: org_id
	 */
	public java.lang.String getOrgId () {
		return orgId;
	}

	/**
	 * Set the value related to the column: org_id
	 * @param orgId the org_id value
	 */
	public void setOrgId (java.lang.String orgId) {
		this.orgId = orgId;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.thd.pojo.data.SysUser)) return false;
		else {
			com.thd.pojo.data.SysUser sysUser = (com.thd.pojo.data.SysUser) obj;
			if (null == this.getId() || null == sysUser.getId()) return false;
			else return (this.getId().equals(sysUser.getId()));
		}
	}

	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}


	public String toString () {
		return super.toString();
	}


}