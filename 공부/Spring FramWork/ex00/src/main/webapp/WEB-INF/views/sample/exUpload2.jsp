<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<h1>파일 업로드2</h1>
<form action="exUploadPost2" method="post" enctype="multipart/form-data">
	첨부 파일 : <input type="file" name="files" multiple><br>
	<button>전송</button>
</form>
</body>
</html>