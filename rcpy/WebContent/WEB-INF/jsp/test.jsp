<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>

<title>登录</title>


</head>
<body>

<table frame="box" rules="all">
    <tr>
        <td>序号</td>
        <td>年级</td>
        <td>学院</td>
        <td>专业</td>
        <td colspan="2">操作</td>
    </tr>
    <c:if test="${list!= null || fn:length(list) != 0}">
        <c:forEach items="${list}" var="info" begin="0" end="${fn:length(list) }">
            <tr>
                <td>${info.infoid}</td>
                <td>${info.grade}</td>
                <td>${info.college}</td>
                <td>${info.specialty}</td>
                <td><a href="#">通过</a></td>
                <td><a href="#">不通过</a></td>
                    <%--<td>${user.create_at}</td>--%>
                    <%--<td>${user.update_at}</td>--%>
               <%--  <jsp:useBean id="create_at" class="java.util.Date"/>
                <jsp:setProperty name="create_at" property="time" value="${user.create_at}"/>
                <td><fmt:formatDate value="${create_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <jsp:useBean id="update_at" class="java.util.Date"/>
                <jsp:setProperty name="update_at" property="time" value="${user.update_at}"/>
                <td><fmt:formatDate value="${update_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
            </tr>
        </c:forEach>
    </c:if>
</table>

<table>
    <tr items="${page}">
        <form method="GET" action="${pageContext.request.contextPath}/review.do">
            <td><input type="hidden" name="currentPage" value="1"></td>
            <td><input type="submit" value="首页"></td>
        </form>
        <form method="GET" action="${pageContext.request.contextPath}/review.do">
            <td><input type="hidden" name="currentPage" value="${page.prefPage}"></td>
            <td><input type="submit" value="上一页"></td>
        </form>
        <td>当前：第${page.currentPage}页<--></td>
        <td>共：${page.totalPages}页</td>
        <form method="GET" action="${pageContext.request.contextPath}/review.do">
            <td><input type="hidden" name="currentPage" value="${page.nextPage}"></td>
            <td><input type="submit" value="下一页"></td>
        </form>
        <form method="GET" action="${pageContext.request.contextPath}/review.do">
            <td><input type="hidden" name="currentPage" value="${page.totalPages}"></td>
            <td><input type="submit" value="尾页"></td>
        </form>
    </tr>
</table>


<!-- 	<form action="test.do" method="post">
		textid:<input type="text" name="textid" value="2">
		title:<input type="text" name="title" value="title"><br>
		
		target:<input type="text" name="target" value="100101">
		targettext:<textarea type="text" name="targettext" value="100101"></textarea><br>
		
		require:<input type="text" name="require" value="100101">
		requiretext:<textarea type="text" name="requiretext" value="100101"></textarea><br>
		
		feature:<input type="text" name="feature" value="100101">
		teaturetext:<textarea type="text" name="teaturetext" value="100101"></textarea><br>
		
		xuezhi:<input type="text" name="xuezhi" value="100101">
		xuezhitext:<textarea type="text" name="xuezhitext" value="100101">
			(1)AAAA
			(2)BBBB
		</textarea><br>
		
		subject:<input type="text" name="subject" value="100101">
		subjecttext:<textarea type="text" name="subjecttext" value="100101">
		(1)AAAA
		(2)BBBB
		</textarea><br>	
		infoid:<input type="text" name="infoid" value="2"><br>
			 <button type="submit">测试</button>
	</form> -->

<!-- 	*****************
	<form action="test.do" method="post">
		subjectid:<input type="text" name="subjectid" value="100101"><br>
		property1:<input type="text" name="property1" value="通识课程"><br>
		property2:<input type="text" name="property2" value="必修"><br>
		subjectname:<input type="text" name="subjectname" value="C语言基础"><br>
			<button type="submit">测试</button>
	</form>

	******************
	<form action="test.do" method="post">
		infotosubjectid:<input type="text" name="infotosubjectid" value="1"><br>
		fraction:<input type="text" name="fraction" value="1"><br>
		classhour:<input type="text" name="classhour" value="1"><br>
		classhourweek:<input type="text" name="classhourweek" value="1"><br>
		mode:<input type="text" name="mode" value="1"><br>
		infoid:<input type="text" name="infoid" value="20151001"><br>
		subjectid:<input type="text" name="subjectid" value="1"><br>
		semester:<input type="text" name="semester" value="1"><br>
			<button type="submit">测试</button>
	</form> -->
	
	<form action="" >
		<input type="button" value="报表导出" onclick="download()"/>
		<a href="test.do?infoid=20151001" >下载</a>
	</form>
	


<script type="text/javascript">
function download(){
     var url="test.do?infoid=20151001";
     window.open(url);
}
</script>

</body>
</html>

	