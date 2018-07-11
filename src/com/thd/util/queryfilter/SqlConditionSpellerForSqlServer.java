package com.thd.util.queryfilter;

/**
 * oracle sqlserver单个条件语句拼写器
 */
public class SqlConditionSpellerForSqlServer extends SqlConditionSpeller {
	/**
	 * 构造方法
	 * @param property 属性名
	 * @param operator 操作符
	 * @param value 值
	 * @param valueType 值类型
	 */
	public SqlConditionSpellerForSqlServer(String property, SqlSpellerOperatorType operator, Object value,
			SqlSpellerDataType valueType) {
		super(property, operator, value, valueType, SqlSpellerDbType.SQLSERVER);
	}
	
	/**
	 * 构造方法
	 * @param property 属性名
	 * @param operator 操作符
	 * @param value 值
	 * @param valueType 值类型
	 */
	public SqlConditionSpellerForSqlServer(String property, String operator, Object value,
			String valueType) {
		super(property, SqlSpellerOperatorType.getType(operator), value, SqlSpellerDataType.getType(valueType), SqlSpellerDbType.SQLSERVER);
	}
	
	public SqlConditionSpellerForSqlServer(){
		
	}
	/*
	 * @see com.thd.util.queryfilter.SqlConditionSpeller#spell()
	 */
	public String spell() throws Exception{
		return super.spell();
	}
	/*
	 * @see com.thd.util.queryfilter.SqlConditionSpeller#valueToString(com.thd.util.queryfilter.SqlSpellerDataType, java.lang.Object)
	 */
	public String valueToString(SqlSpellerDataType type,Object value) throws Exception{
		if(type.equals(SqlSpellerDataType.S)){
			return " '" + value + "' ";
		}else if(type.equals(SqlSpellerDataType.N)){
			return value.toString();
		}else if(type.equals(SqlSpellerDataType.BD)){
			return value.toString();
		}else if(type.equals(SqlSpellerDataType.FT)){
			return value.toString();
		}else if(type.equals(SqlSpellerDataType.D)){
			return " '" + value + "' ";
		}else{
			throw new RuntimeException("错误的类型!");
		}
	}

}
