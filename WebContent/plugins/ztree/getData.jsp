<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../../pub/TagLib.jsp"%>
[
	<c:forEach items="${treeList}" var="tree" varStatus="index">
	{ 
		id:"${tree.id}",
		name:"${tree.name}",
		code:"${tree.code}",
		isParent:<c:if test="${tree.leaf == '1'}">false</c:if><c:if test="${tree.leaf != '1'}">true</c:if>
	}
	<c:if test="${(index.index+1)!=fn:length(treeList)}">,</c:if>
</c:forEach>
]


