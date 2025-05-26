<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<!-- Board List CSS 설정과 변경 -->
<link rel="stylesheet" href="/css/list.css">
<script type="text/javascript" src="/js/list.js" ></script>

<script type="text/javascript">
$(function(){
	$("#${pageObject.period}").prop('checked', true); // 태그 선택을 아이디로
	<%-- $("[value='${pageObject.period}']").prop('checked', true); // 태그 선택 속성으로 --%>
	
	// 이벤트 처리
	$(".dataRow").click(function(){
		// alert("click");
		// 글번호 필요 - 수집
		let no = $(this).data("no");
		console.log("no = " + no);
		//location="view.do?no=" + no + "&inc=1&${pageObject.pageQuery}";
		location="view.do?no=" + no;
	});
	
	// perPageNum 처리
	$("#perPageNum").change(function(){
		// alert("change perPageNum");
		// page는 1페이지 + 검색 데이터를 전부 보낸다.
		$("#searchForm").submit();
	});
	
	// 검색 데이터 세팅
	$("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
	$("#perPageNum")
		.val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
	
	$(".noticeOption").change(function(){
		//alert("라디오버튼 체인지");
		if (this.optionList[0].checked) {
			//alert("현재공지 보여주세요");
			location = "/notice/list.do?period=pre";
		}
		else if (this.optionList[1].checked) {
			//alert("이전공지 보여주세요");
			location = "/notice/list.do?period=old";
		}
		else if (this.optionList[2].checked) {
			//alert("예정공지 보여주세요");
			location = "/notice/list.do?period=res";
		}
		else if (this.optionList[3].checked) {
			//alert("모든공지 보여주세요");
			location = "/notice/list.do?period=all";
		}
	});
});
</script>

</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header">
	  	<h2>
	  		<i class='fas fa-chalkboard'></i>
	  		공지사항 리스트
	  	</h2>
	  </div>
	  <div class="card-body">
		<c:if test="${!empty login && login.gradeNo == 9 }">
			<form class="noticeOption">
			  <div class="custom-control custom-radio custom-control-inline">
			    <input type="radio" class="custom-control-input" id="pre" name="optionList" value="pre">
			    <label class="custom-control-label" for="pre">현재공지</label>
			  </div>
			  <div class="custom-control custom-radio custom-control-inline">
			    <input type="radio" class="custom-control-input" id="old" name="optionList" value="old">
			    <label class="custom-control-label" for="old">이전공지</label>
			  </div>
			  <div class="custom-control custom-radio custom-control-inline">
			    <input type="radio" class="custom-control-input" id="res" name="optionList" value="res">
			    <label class="custom-control-label" for="res">예정공지</label>
			  </div>
			  <div class="custom-control custom-radio custom-control-inline">
			    <input type="radio" class="custom-control-input" id="all" name="optionList" value="all">
			    <label class="custom-control-label" for="all">모든공지</label>
			  </div>
			</form>
		</c:if>
	
		<!-- 검색란의 시작 -->
		<form action="list.do" id="searchForm">
	  		<input name="page" value="1" type="hidden">
	  		<input name="period" value="${param.period }" type="hidden">
		  <div class="row">
		  	<div class="col-md-8">
		  		<div class="input-group mb-3">
				  <div class="input-group-prepend">
				      <select name="key" id="key" class="form-control">
				      	<option value="t">제목</option>
				      	<option value="c">내용</option>
				      	<option value="tc">제목/내용</option>
				      	<option value="tcw">모두</option>
				      </select>
				  </div>
				  <input type="text" class="form-control" placeholder="검색"
				   id="word" name="word" value="${pageObject.word }">
				  <div class="input-group-append">
				      <button class="btn btn-outline-primary">
				      	<i class="fa fa-search"></i>
				      </button>
				  </div>
				</div>
		  	</div>
		  	<!-- col-md-8의 끝 : 검색 -->
		  	<div class="col-md-4">
		  		<!-- 너비를 조정하기 위한 div 추가. float-right : 오른쪽 정렬 -->
		  		<div style="width: 200px;" class="float-right">
				  <div class="input-group mb-3">
				    <div class="input-group-prepend">
				      <span class="input-group-text">Rows/Page</span>
				    </div>
				    <select id="perPageNum" name="perPageNum" class="form-control">
				    	<option>10</option>
				    	<option>15</option>
				    	<option>20</option>
				    	<option>25</option>
				    </select>
				  </div>
			  </div>
		  	</div>
		  	<!-- col-md-4의 끝 : 한페이지당 표시 데이터 개수 -->
		  </div>
	    </form>
  
	  	<c:forEach items="${list }" var="vo">
			<div class="card dataRow" data-no="${vo.no }">
			  <div class="card-header">
			  	<b>${vo.title }</b>
			  </div>
			  <div class="card-body">
			  	<span class="float-right">
			  		<fmt:formatDate value="${vo.writeDate }"
			  		 pattern="yyyy-MM-dd"/>
			  	</span>
			  	<fmt:formatDate value="${vo.startDate }" pattern="yyyy-MM-dd"/>
			  	  ~ 
			  	<fmt:formatDate value="${vo.endDate }" pattern="yyyy-MM-dd"/>
			  </div>
			</div>
	  	</c:forEach>
	  </div>
	  <div class="card-footer">
	  	<div>
	  		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
	  	</div>
		<a href="writeForm.do" class="btn btn-primary">글등록</a>
	  </div>
	</div>
</div>
</body>
</html>