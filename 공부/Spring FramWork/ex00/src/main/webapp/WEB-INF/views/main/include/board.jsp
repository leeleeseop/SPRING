<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
	<div class="card">
	  <div class="card-header">
	  	<h2>
	  		<i class='far fa-list-alt'></i>
	  		일반 게시판
	  	</h2>
	  </div>
	  <div class="card-body">
	  	<c:forEach items="${boardList }" var="vo">
			<div class="card dataRow" data-no="${vo.no }" data-module="board">
			  <div class="card-header">
			  	<span class="float-right">
			  		<fmt:formatDate value="${vo.writeDate }"
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
