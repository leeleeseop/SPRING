<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
	<div class="card">
	  <div class="card-header">
	  	<h2>
	  		<i class='fas fa-chalkboard'></i>
	  		공지사항
	  	</h2>
	  </div>
	  <div class="card-body">
	  	<c:forEach items="${noticeList }" var="vo">
			<div class="card dataRow" data-no="${vo.no }" data-module="notice">
			  <div class="card-header">
			  	<span class="float-right">
			  		<fmt:formatDate value="${vo.startDate }"
			  		 pattern="yyyy-MM-dd"/>
			  		 ~
			  		<fmt:formatDate value="${vo.endDate }"
			  		 pattern="yyyy-MM-dd"/>
			  	</span>
			  	글번호 : ${vo.no }
			  </div>
			  <div class="card-body text-ellipsis">
			  	${vo.title }
			  </div>
			</div>
	  	</c:forEach>
	  </div>
	</div>
