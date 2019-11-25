<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		
		 <!--jquery-->
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/jquery-ui.js" type="text/javascript"></script>
		
		
		<!-- bootstrap -->
		<link href="css/bootstrap-combined.min.css" rel="stylesheet"
		 media="screen">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="js/bootstrap.min.js" type="text/javascript"></script>

		<!-- bootstrap-select -->
		<script src="js/i18n/defaults-zh_CN.min.js"></script>
		<link href="css/bootstrap-select.min.css" rel="stylesheet">
		<script src="js/bootstrap-select.min.js"></script>

		<title>选择</title>
</head>
<body onload="reviewChange();">
<br />
		<div class="container-fluid" id="LG">
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span2">
						</div>
						<div class="span8">
							<div class="navbar">
								<div class="navbar-inner">
									<div class="container-fluid">
										<a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"><span class="icon-bar"></span><span
											 class="icon-bar"></span><span class="icon-bar"></span></a> <a href=""${pageContext.request.contextPath }/rcpy_index_select.do"" class="brand">aku</a>
										<div class="nav-collapse collapse navbar-responsive-collapse">
											<ul class="nav">
												<li>
													<a href="${pageContext.request.contextPath }/rcpy_index_select.do" >主页</a>
												</li>
												<li id="li_input">
													<a href="#" onclick="clickInput();">录入</a>
												</li>  
												<li>
													<a href="${pageContext.request.contextPath }/rcpy_index_preview.do">预览</a>
												</li>
												<li id="li_reviewChange">
													<%-- <a href="${pageContext.request.contextPath }/review.do">审核</a> --%>
												</li>
												<li id="li_edit">
												</li> 
												
												<!-- <li class="dropdown">
													<a data-toggle="dropdown" class="dropdown-toggle" href="#">下拉菜单<strong class="caret"></strong></a>
													<ul class="dropdown-menu">
														<li>
															<a href="#">下拉导航1</a>
														</li>
														<li>
															<a href="#">下拉导航2</a>
														</li>
														<li>
															<a href="#">其他</a>
														</li>
														<li class="divider">
														</li>
														<li class="nav-header">
															标签
														</li>
			
														<li>
															<a href="#">链接1</a>
														</li>
														<li>
															<a href="#">链接2</a>
														</li>
													</ul>
												</li> -->
											</ul>
											<ul class="nav pull-right">
												<li>
													<a href="#">
													<%=LocalDate.now() %>
													</a>
												</li>
												<li class="divider-vertical">
												</li>
												<li class="dropdown">
													<a data-toggle="dropdown" class="dropdown-toggle" href="#">${user.isadmin eq 0 ? '用户' : '审核员'} : ${user.username }<strong class="caret"></strong></a>
													<ul class="dropdown-menu">
														<li>
															<a href="#">修改密码</a>
														</li>
														<li>
															<a href="#">联系管理员</a>
														</li>
														<li>
															<a href="#">其他</a>
														</li>
														<li class="divider">
														</li>
														<li>
															<a href="logout.jsp">注销</a>
														</li>
													</ul>
												</li>
											</ul>
										</div>

									</div>
								</div>

							</div>
							<div class="hero-unit">
								<h1>
									人才培养管理系统
								</h1>
								<p>
									<br>
								</p>
								<!-- <p>
									<a class="btn btn-primary btn-large" href="#">参看更多 »</a>
								</p> -->
							</div>
						</div>
						<div class="span2">
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
<!-- 									<h2 class="text-center">
										标题
									</h2> -->
								</div>
								<div class="span2">
								</div>
							</div>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid">
										<div class="span2">
										</div>
										<div class="span8">
											<form name="rcpy_index_select"  action="rcpy_index_selecttoinput.do" method="POST">
												<fieldset>
													<legend>操作前请先选择年级院系及专业</legend>
													<br>
													<label>年 级&nbsp;</label>
														<select id="select_grade" name="grade" onchange="changeGrade();" >
															<option value="" selected="selected">---请选择年级---</option>
															<c:forEach var="gradeList" items="${gradeList }">
																<option value="${gradeList }">${gradeList }</option>
															</c:forEach>
														</select><br /><br />
													<label>院 系&nbsp;</label>
														<select id="select_college" name="college" onchange="changeCollege();"  >
															<option value="" selected="selected">---请选择院系---</option> 
														</select><br /><br />
													<label>专 业&nbsp;</label>
														<select id="select_specialty" name="specialty" >
															<option value="" selected="selected" >---请选择专业---</option>
														</select>
													<br>
													<span class="help-block" style="color:#FF0000">请选择需要操作的年级、院系、专业...</span>
													<br>
													<labelclass="checkbox"></label>
														<button id="" type="reset" class="btn">重置</button>&nbsp;&nbsp;
														<button type="button" class="btn" onclick="bntSubmit();">确定</button>
												</fieldset>
											</form>
										<br><hr>
										</div>
										<div class="span2">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<br /><br /><br /><br /><br />
<script type="text/javascript">
	
	//点击主页录入
	function clickInput(){
		alert('请先选择信息再进行操作！');
	}

	//动态显示界面
	function reviewChange(){
		var userid = '<%=session.getAttribute("userid")%>';
		var liinput = $('#li_input');
		var lireviewChange = $('#li_reviewChange');
		var liedit = $('#li_edit');
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

	//选择之后确定
	function bntSubmit(){
		var userid = '<%= session.getAttribute("userid")%>';
		var user = '<%= session.getAttribute("user")%>';
		var grade = document.getElementById('select_grade').value;
		var college = document.getElementById('select_college').value;
		var specialty = document.getElementById('select_specialty').value;
		console.log(userid);
		
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/rcpy_select_bntSubmit.do",
			dataType : "json",
			async : true,	
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data : {
				"userid" : userid,
				"grade" : grade,
				"college" : college,
				"specialty" : specialty,
			},
			success : function(data){
				console.log(data);
				if(data.msg == "error"){
					alert("请您先选年级、学院、专业信息！");
				}else{
					var tipMsg = "";
					if(data.tipMsg != "null" && data.tipMsg!="isnull" && data.tipMsg != "success"){
						alert("该人才培养方案已经被驳回，请重新修改！\nTip:" + data.tipMsg);
						window.location.href = "${pageContext.request.contextPath }/rcpy_index_selecttoinput.do";
					}else{
						if(data.msg == "success" || data.msg == "isnull"){
							//审核成功或未审核
							window.location.href = "${pageContext.request.contextPath }/rcpy_index_selecttoinput.do";
						}else if(data.msg == "fail"){
							alert("该人才培养方案管理员已审核通过，不可修改！如有问题请联系管理员！点击确定为您跳转至预览界面！");
							window.location.href = "${pageContext.request.contextPath }/rcpy_index_preview.do";
						}else if(data.msg == "successfail"){
							alert("该人才培养方案已提交，管理员待审核！您还能继续修改！");
							window.location.href = "${pageContext.request.contextPath }/rcpy_index_selecttoinput.do";
						}
					}
					
				}	
			},
			error : function(data){
				alert("服务器飞去外星打LOL啦！,请稍后再试...");
			}
		});
		
		
	}

	function changeGrade()  {
		var grade = document.getElementById('select_grade').value;
	
		//console.log(grade);
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath }/rcpy_select_college.do",
			dataType : "json",
			async : true,	
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data : {
				"grade" : grade,
			},
			success : function(data){
				var nameOpt = "<option value='' selected='selected'>---请选择院系---</option>";
				for(var i=0;i<data.length;i++) {
					nameOpt +="<option value='"+ data[i] +"' >"+ data[i] +"</option>";				
				}
				$('#select_college').html(nameOpt);
				//document.getElementById("select_college").innerHTML = nameOpt;
			}
			
		});
	}
	
	function changeCollege(){
		var grade = document.getElementById('select_grade').value;
		var college = document.getElementById('select_college').value;
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath }/rcpy_select_specialty.do",
			dataType : "json",
			async : true,	
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data : {
				"grade" : grade,
				"college" : college
			},
				success : function(data){
					var nameOpt = "<option value='' selected='selected'>---请选择专业---</option>";
					for(var i=0;i<data.length;i++) {
						nameOpt +="<option value='"+ data[i] +"' >"+ data[i] +"</option>";				
					}
					$('#select_specialty').html(nameOpt);
					//console.log(nameOpt)
					//document.getElementById("select_college").innerHTML = nameOpt;
			}
			
		});
	}
	
	
</script>

</body>
</html>