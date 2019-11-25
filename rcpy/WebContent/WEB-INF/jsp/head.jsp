<%@page import="com.duant.rcpy.domain.User"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

</head>

<body onload="reviewChange();">
	<br>
	<div class="container-fluid" id="LG">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span2"></div>
					<div class="span8">
						<div class="navbar">
							<div class="navbar-inner">
								<div class="container-fluid">
									<a data-target=".navbar-responsive-collapse"
										data-toggle="collapse" class="btn btn-navbar"><span
										class="icon-bar"></span><span class="icon-bar"></span><span
										class="icon-bar"></span></a> <a href="${pageContext.request.contextPath }/rcpy_index_select.do" class="brand">aku</a>
									<div class="nav-collapse collapse navbar-responsive-collapse">
										<ul class="nav">
											<li><a
												href="${pageContext.request.contextPath }/rcpy_index_select.do">录入</a>
											</li>
											<!-- <li id="li_input"><a href="#">录入</a></li> -->
											<li>
												<a href="${pageContext.request.contextPath }/rcpy_index_preview.do">预览</a>
											</li>
											<li id="li_reviewChange">
													<%-- <a href="${pageContext.request.contextPath }/review.do">审核</a> --%>
												</li>
												<li id="li_edit">
												</li> 
											<!-- <li class="dropdown"><a data-toggle="dropdown"
												class="dropdown-toggle" href="#">下拉菜单<strong
													class="caret"></strong></a>
												<ul class="dropdown-menu">
													<li><a href="#">下拉导航1</a></li>
													<li><a href="#">下拉导航2</a></li>
													<li><a href="#">其他</a></li>
													<li class="divider"></li>
													<li class="nav-header">标签</li>
													<li><a href="#">链接1</a></li>
													<li><a href="#">链接2</a></li>
												</ul>
											</li> -->
										</ul>
										<ul class="nav pull-right">
											<li><a href="#" id="li_infoid"><%=LocalDate.now() %></a></li>
											<li class="divider-vertical"></li>
											<li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">${user.isadmin eq 0 ? '用户' : '审核员'} : 
											<%User user = (User)request.getSession().getAttribute("user");%>
											<%=user.getUsername() %>
											<strong class="caret"></strong></a>
												<ul class="dropdown-menu">
													<li><a href="#">修改密码</a></li>
													<li><a href="#">联系管理员</a></li>
													<li><a href="#">其他</a></li>
													<li class="divider"></li>
													<li><a href="logout.jsp">注销</a></li>
												</ul></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
					<br><br><br><hr>
					<div class="span2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
//动态显示界面
function reviewChange(){
	var userid = '<%=session.getAttribute("userid")%>';
	var lireviewChange = $('#li_reviewChange');
	var liedit = $('#li_edit');
	var liinput = $('#li_input');
	var htmlli = "<a href='${pageContext.request.contextPath }/review.do'>审核</a>" ;
	var htmlli2 = "<a href='${pageContext.request.contextPath }/rcpy_index_edit.do'>操作</a>";
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/li_reviewChange.do",
		dataType : "json",
		async : true,	
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		data : {
			"userid" : userid,
		},
		success : function(data){
			console.log(data);
			if(data.msg == "success"){
				if(data.isadmin == 1){
					lireviewChange.html(htmlli);
					liedit.html(htmlli2);
				}else{
					//lireviewChange.html(htmlli);
				}
			}if(data.msg == "fail"){
				alert("遇到问题了！");
			}
		},
		error : function(data){
			alert("服务器飞去外星打LOL啦！,请稍后再试...");
		}
	});
	
}
</script>


</html>