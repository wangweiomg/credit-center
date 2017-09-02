<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="name" type="java.lang.String" required="true" rtexprvalue="true"%>
<%@ attribute name="disable" type="java.lang.String" required="false" rtexprvalue="true"%>

 <%@ attribute name="value" type="java.util.Date" required="true" rtexprvalue="true"%>

<fmt:formatDate var="__tt__" value="${value}" pattern="yyyy-MM-dd"/>

<input  <c:if test="${ disable == 'true'}">disabled="true"</c:if> style="margin-left: -4px;" onfocus="WdatePicker()" oncontextmenu="return false" class="Wdate input-medium" type="text" name="${name}" value="${__tt__}"/> 
