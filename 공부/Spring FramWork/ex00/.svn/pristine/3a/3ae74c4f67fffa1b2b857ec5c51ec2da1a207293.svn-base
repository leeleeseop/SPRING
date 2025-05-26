<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${newList }" var="messageVO">
<a class="dropdown-item d-flex align-items-center" href="/message/view.do?no=${messageVO.no }&inc=1">
    <div class="dropdown-list-image mr-3">
        <img class="rounded-circle" src="${messageVO.senderPhoto }"
            alt="...">
        <div class="status-indicator bg-success"></div>
    </div>
    <div class="font-weight-bold">
        <div class="text-truncate text-ellipsis">${messageVO.content }</div>
        <div class="small text-gray-500">
        	${messageVO.senderName } . 
        	<fmt:formatDate value="${messageVO.sendDate }" pattern="yyyy-MM-dd"/>  
        </div>
    </div>
</a>
</c:forEach>
<a class="dropdown-item text-center small text-gray-500" href="/message/list.do">Read More Messages</a>