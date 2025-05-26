<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>

<!-- Board List CSS 설정과 변경 -->
<link rel="stylesheet" href="/css/list.css">
<script type="text/javascript" src="/js/list.js" ></script>

<style type="text/css">
    
    .goodsDataRow:hover {
    	opacity: 50%
    }
    
</style>

<script type="text/javascript">
$(function(){
	$(".dataRow").click(function(){
		let no = $(this).data("no");
		let module = $(this).data("module");
		location = "/" + module + "/view.do?" 
				+ ((module == "goods")?"goods_no=":"no=") + no
				+ ((module == "notice")?"":"&inc=1");
	})
});
</script>

</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header">
	  	<h2>
	  		<i class="fa fa-thumbs-o-up"></i>
	  		웹짱 닷컴(Webjjang.com)
	  	</h2>
	  </div>
	  <div class="card-body">
	  	<div class="row carouselDiv">
	  		<div class="col">
	  			<jsp:include page="include/carousel.jsp" />
	  		</div>
	  	</div>
	  	<div class="row mt-3">
	  		<div class="col">
	  			<jsp:include page="include/notice.jsp" />
	  		</div>
	  		<div class="col">
	  			<jsp:include page="include/board.jsp" />
	  		</div>
	  	</div>
	  </div>
	</div>
</div>
</body>
</html>