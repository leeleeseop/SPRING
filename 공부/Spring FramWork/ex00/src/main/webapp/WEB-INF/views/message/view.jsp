<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 보기</title>
</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header">
	  	<h2>
	  		<i class='far fa-list-alt'></i>
			${(param.accept == 1)?"받은":"보낸" } 메세지 보기
	  		
	  	</h2>
	  </div>
	  <div class="card-body">
		<div class="card">
		  <div class="card-header">
			<div class="media border p-3">
			  <img src="${(param.accept == 1)?vo.senderPhoto:vo.accepterPhoto }" class="mr-3 mt-3 rounded-circle"
			   style="width:60px;">
			  <div class="media-body">
			    ${(param.accept == 1)?vo.senderName:vo.accepterName }<small>
			    <i>(${(param.accept == 1)?vo.senderId:vo.accepterName})</i></small>
			    <div>보낸 날짜 : <fmt:formatDate value="${vo.sendDate }" pattern="yyyy-MM-dd"/></div>
			    <div>
			    	받은 날짜 : 
			    	<c:if test="${empty vo.acceptDate}">읽지 않음</c:if>
			    	<c:if test="${!empty vo.acceptDate}">
				    	<fmt:formatDate value="${vo.acceptDate }" pattern="yyyy-MM-dd"/>
			    	</c:if>
			    </div>
			  </div>
			</div>
		  </div>
		  <div class="card-body"><pre>${vo.content }</pre></div>
		  <div class="card-footer">
		  	<a href="/message/writeForm.do" class="btn btn-primary">답장</a>
		  	<c:if test="${empty vo.acceptDate }">
		  		<!-- 메시지를 상대방이 읽지 않은 경우에만 삭제가 가능하다. -->
		  		<a href="/message/delete.do" class="btn btn-danger">삭제</a>
		  	</c:if>
	  		<a href="/message/list.do?${pageObject.pageQuery }&mode=${param.mode}"
	  		 class="btn btn-success">리스트</a>
		  </div>
		</div>
	  </div>
	</div>
</div>
</body>
</html>