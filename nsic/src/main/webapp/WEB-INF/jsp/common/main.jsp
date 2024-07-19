<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌표 테스트</title>
<script language="JavaScript" type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {	
$("#main").load("/testDiv.do");
});
</script>
</head>
<body>
<div style="position:absolute;left:10px;width:400px;">
	<table style=" border-collapse: collapse;text-align: left;margin-bottom:10px;width:95%;">
		<tr><th style="background-color: #f2f2f2;font-weight: normal;padding: 4px 8px;border: 1px solid #ddd;">좌표 설정하기</th></tr>
		<tr><td style="padding: 4px 8px;border: 1px solid #ddd;">페이지 1 설정</td></tr>
		<tr><td style="padding: 4px 8px;border: 1px solid #ddd;">페이지 2 설정</td></tr>
		<tr><td style="padding: 4px 8px;border: 1px solid #ddd;">페이지 3 설정</td></tr>
	</table>
</div>
<div id="main" style="position:absolute;left:410px;height:1200px;padding:0px 0px;margin:0px 0px;">
</div>
</body>
</html>