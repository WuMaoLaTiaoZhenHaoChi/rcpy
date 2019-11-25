<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注销</title>
</head>
<body>
    <%
		session.invalidate();
		response.setHeader("refresh","0;URL=index.jsp");
		
	%>
 </body>

</html>