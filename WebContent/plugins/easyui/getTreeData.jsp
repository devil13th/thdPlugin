<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../../pub/TagLib.jsp"%>
[
	<c:forEach items="${treeList}" var="tree" varStatus="index">
	{ 
		"id":"${tree.id}",
		"text":"${tree.name}",
		"state":"<c:if test="${tree.leaf == '1'}">open</c:if><c:if test="${tree.leaf != '1'}">closed</c:if>" 
	}
	<c:if test="${(index.index+1)!=fn:length(treeList)}">,</c:if>
</c:forEach>
]


