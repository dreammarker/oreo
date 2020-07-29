<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.yedam.movie.Paging" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach begin="${paging.startPage}" end="${paging.startPage}" var="i">
<a href="javascript:doList(${i-1})"><</a>
</c:forEach>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<a href="javascript:doList(${i})">${i}</a>
</c:forEach>

<c:forEach begin="${paging.endPage}" end="${paging.endPage}" var="i">
<a href="javascript:doList(${i+1})">></a>
</c:forEach>


