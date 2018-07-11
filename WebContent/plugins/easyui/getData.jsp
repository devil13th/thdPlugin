<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>

				
{                                                      
	"total":${sqf.total},
	"rows":[          
		<c:forEach items="${list}" var="u" varStatus="index">                                                
		{
			"id":"${u.id}",
			"name":"${u.name}",
			"sex":"${u.sex}",
			"age":"${u.age}",
			"bir":"${u.bir}"
		}
		
		<c:if test="${(index.index+1)!=fn:length(list)}">,</c:if>
		
		</c:forEach>
	]                                                          
} 