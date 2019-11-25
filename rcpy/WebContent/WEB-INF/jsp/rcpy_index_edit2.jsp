<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!--jquery  -->
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>

<!--bootstrap  -->	
<link href="css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<!--bootstrap-select  -->
<link href="css/bootstrap-select.min.css" rel="stylesheet">
<script src="js/bootstrap-select.min.js"></script>

<title>编辑</title>
</head>

<body>
	
	<c:import url="head.jsp"></c:import>
	
	<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span2">
						</div>
						<div class="span8">
							<div class="tabbable" id="tabs-96488">
								<ul class="nav nav-tabs">
									<li class="active">
										<a href="#panel-508069" data-toggle="tab">编辑专业</a>
									</li>
									<li>
										<a href="#panel-277654" data-toggle="tab">编辑课程</a>
									</li>
									<li>
										<a href="#panel-277655" data-toggle="tab">用户管理</a>
									</li>
								</ul>
								
								<div class="tab-content">
									<div class="tab-pane active" id="panel-508069">
										<h3>添加专业信息</h3>
										<form class="form-horizontal" action="edit.do" method="post">
										<input type="hidden" name=editType value="0">
											<fieldset>
												<legend>请输入年级院系及专业</legend>
												<label>专 业 编 号&nbsp;</label>
												<input id="edit_infoid" type="number" name="infoid" value="" onchange="subjectShow();" />
												<br /><br />
												<label>年 级&nbsp;</label>
												<input id="edit_grade" type="text" name="grade" value=""/>
												<br /><br />
												<label>院系&nbsp;</label>
												<input id="edit_college" type="text" name="college" value=""/>
												<br /><br />
												<label>专业&nbsp;</label>
												<input id="edit_specialty" type="text" name="specialty" value=""/>
												<br /><br />
												<span class="help-block" style="color:#FF0000">请输入需要编辑的年级、院系、专业...</span>
												<br>
												<labelclass="checkbox"></label>
													<button id="" type="reset" class="btn">重置</button>&nbsp;&nbsp;
													<button type="submit" class="btn" onclick="">确定</button>
											</fieldset>
										</form>
									</div>
									
									<div class="tab-pane" id="panel-277654">
										<h3>添加课程</h3>
										<form class="form-horizontal" action="edit.do" method="post">
										<input type="hidden" name="editType" value="1">
											<fieldset>
												<legend>请输入课程类型、课程名称</legend>
												<br>
												<label>课 程 编 号&nbsp;</label>
												<input id="edit_subjectid" type="number" name="subjectid" onchange="subjectShow();"/>
												<br /><br />
												<label>课 程 类 型 1&nbsp;</label>
												<select id="edit_property1" name="property1"  onchange="" >
													<!-- <option value="" selected="selected"> ---请选择--- </option> -->
													<option value="通识课程" >通识课程</option>
													<option value="学科基础课程" >学科基础课程</option>
													<option value="专业课程" >专业课程</option>
													<option value="实践环节" >实践环节</option>
												</select>
												<br /><br />
												<label>课 程 类 型 2&nbsp;</label>
												<select id="edit_property2" name="property2"  onchange="" >
													<!-- <option value="" selected="selected"> ---请选择--- </option> -->
													<option value="必修" >必修</option>
													<option value="选修" >选修</option>
												</select>
												<br /><br />
												<label>课 程 名 称&nbsp;</label>
												<input id="edit_subjectname" type="text" name="subjectname"/>
												<br /><br />
												<span class="help-block" style="color:#FF0000">请输入需要编辑的课程类型、课程名称...</span>
												<br>
												<labelclass="checkbox"></label>
													<button id="" type="reset" class="btn">重置</button>&nbsp;&nbsp;
													<button type="submit" class="btn" onclick="">确定</button>
											</fieldset>
										</form>
										
									</div>
									
									<div class="tab-pane" id="panel-277655">
										<h3>管理用户</h3>
										<form class="form-horizontal" action="edit.do" method="post">
										<input type="hidden" name="editType" value="2">
											<fieldset>
												<legend>请输入用户信息</legend>
												<br>
												<label>用户编号&nbsp;</label>
												<input id="edit_userid" type="number" name="userid" onchange="subjectShow();" />
												<br /><br />
												<label>密码&nbsp;</label>
												<input id="edit_password" type="password" name="password"/>
												<br /><br />
												<label>用户姓名&nbsp;</label>
												<input id="edit_username" type="text" name="username"/>
												<br /><br />	
												<label>用户权限 &nbsp;</label>
												<select id="edit_isadmin" name="isadmin"  onchange="" >
													<!-- <option value="" selected="selected"> ---请选择--- </option> -->
													<option value="0" >普通用户</option>
													<option value="1" >审核用户</option>
												</select>
												<br /><br />
												<span class="help-block" style="color:#FF0000">请输入管理的用户信息...</span>
												<br>
													<button id="" type="reset" class="btn">重置</button>&nbsp;&nbsp;
													<button type="submit" class="btn" onclick="">确定</button>
											</fieldset>
										</form>
									</div>
									
								</div>
							</div>
						</div>
						<div class="span2">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<hr>
		<br><br>
<script type="text/javascript">
	function subjectShow() {
		var subjectid = $("#edit_subjectid").val();
		var infoid = $("#edit_infoid").val();
		var userid = $("#edit_userid").val();
		
		var editgrade = $("#edit_grade");
		var editcollege = $("#edit_college");
		var editspecialty = $("#edit_specialty");
		
		var editproperty1 = $("#edit_property1");
		var editproperty2 = $("#edit_property2");
		var editsubjectname = $("#edit_subjectname");
		
		var editusername = $("#edit_username");
		var editisadmin = $("#edit_isadmin");
		
		if(subjectid != "" || subjectid != null || 
				infoid != "" || infoid != null || 
				userid != "" || userid != null){	
			$.ajax({ 
				type : "POST",
				url : "${pageContext.request.contextPath }/rcpy_index_edit_subject.do",
				dataType : "json",
				async : true,	
				contentType : "application/x-www-form-urlencoded;charset=utf-8",
				data:{
					"subjectid" : subjectid,
					"infoid" : infoid,
					"userid" : userid,
				},
				success : function(data){
					if(data.subject != null){
						editproperty1.val(data.subject.property1);
						editproperty2.val(data.subject.property2);
						editsubjectname.val(data.subject.subjectname);
					}
					if(data.info != null){
						editgrade.val(data.info.grade);
						editcollege.val(data.info.college);
						editspecialty.val(data.info.specialty);
					}
					if(data.user != null){
						editusername.val(data.user.username);
						editisadmin.val(data.user.isadmin);
					}
					if(data.msg != null){
						alert(data.msg);
					}
				},
				error: function(data){
					alert("error!");
				}
			});	
		}else{
			alert("请输入编号！");
		}
	}

</script>
</body>
</html>