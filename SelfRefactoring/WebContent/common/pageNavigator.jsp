<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:if test="${ resultPage.getBeginUnitPage()>1 }">
		<a href="javascript:fncGetList('${ resultPage.beginUnitPage - resultPage.pageUnit}')">◀ 이전</a>
</c:if>

<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
	<a href="javascript:fncGetList('${ i }');">${ i }</a>
</c:forEach>

<c:if test="${ resultPage.endUnitPage != resultPage.maxPage }">
		<a href="javascript:fncGetList('${resultPage.beginUnitPage + resultPage.pageUnit}')">이후 ▶</a>
</c:if>