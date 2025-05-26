<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글보기</title>
<script type="text/javascript">
$(function(){
	$("#deleteBtn").click(function(){
		if(!confirm("정말 삭제하시겠습니까?")) return false;
	});
});
</script>
</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header">
	  	<h2>
	  		<i class="material-icons">speaker_notes</i>
	  		공지사항 상세 보기
	  	</h2>
	  </div>
	  <div class="card-body">
			<div class="card" data-no="${vo.no }">
			  <div class="card-header">
			  	${vo.no }. ${vo.title }
			  </div>
			  <div class="card-body">
			  	<pre>${vo.content }</pre>
			  </div>
			  <div class="card-footer">
			  	<span>
			  		<fmt:formatDate value="${vo.startDate }"
			  		 pattern="yyyy-MM-dd"/>
			  		  ~ 
			  		<fmt:formatDate value="${vo.endDate }"
			  		 pattern="yyyy-MM-dd"/>
			  	</span>
			  	<span class="float-right">
			  		수정일 : 
			  		<fmt:formatDate value="${vo.updateDate }"
			  		 pattern="yyyy-MM-dd"/>
			  	</span>
			  </div>
			</div>
	  </div>
	  
	  <div class="card-footer">
	  	<div class="btn-group">
	  		<c:if test="${!empty login and login.gradeNo == 9 }">
			  	<button class="btn btn-primary" id="updateBtn">수정</button>
				<!-- 모달창은 열어서 비밀번호를 입력 받고 삭제하여 가는 처리 -->
			  	<button class="btn btn-danger" id="deleteBtn">삭제</button>
		  	</c:if>
		  	<button class="btn btn-warning" id="listBtn" >리스트</button>
		</div>
	  </div>
	  
	</div>
</div>
<!-- container의 끝 -->



</body>
</html>