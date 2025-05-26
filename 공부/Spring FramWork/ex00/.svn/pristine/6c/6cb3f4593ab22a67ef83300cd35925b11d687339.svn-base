<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 검색 리스트</title>

<style type="text/css">
.dataRow>.card-header{
	background: #e0e0e0
}
.dataRow:hover{
	border-color: orange;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function(){
	
	// 이벤트 처리
	// 글보기 이동 처리
	$(".dataRow").click(function(){
		let module = $(this).data("module");
		let no = $(this).data("no");
		// alert(no);
		location = "/" + module + "/view.do?no=" + no + "&inc=1"
				+ "&${pageObject.pageQuery}";
	});
	
	// perPageNum 처리
	$("#perPageNum").change(function(){
		// alert("change perPageNum");
		// page는 1페이지 + 검색 데이터를 전부 보낸다.
		$("#searchForm").submit();
	});
	
	// 검색 데이터 세팅
	$("#key").val('${(empty pageObject.key)?"t":pageObject.key}');
	// perPageNum 세팅
	$("#perPageNum")
	.val('${(empty pageObject.perPageNum)?"10":pageObject.perPageNum}');
	
});
</script>

</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header"><h2>통합 검색 리스트</h2></div>
	  <div class="card-body">
	  	<c:forEach items="${list }" var="vo">
			<div class="card dataRow" data-no="${vo.no }" data-module="${vo.module }">
			  <div class="card-header">
			  	<span class="float-right">
			  		작성일 : <fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/> 
			  	</span>
			  	module : ${vo.module }
			  </div>
			  <div class="card-body">
			  	<pre>${vo.title }</pre>
			  </div>
			</div>
	  	</c:forEach>
	  </div>
	  <div class="card-footer">
	  	<div>
	  		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
	  	</div>
	  </div>
	</div>
</div>
</body>
</html>