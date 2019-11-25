<%@page import="org.apache.catalina.Session"%>
<%@page import="com.duant.rcpy.domain.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
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
<link href="css/bootstrap-select.min.css" rel="stylesheet">
<script src="js/bootstrap-select.min.js"></script>
<!-- 工具js -->
<script src="js/table_priview.js"></script>

<title>选择</title>
</head>
	<body onload="table_priview();">
		<br>
		<c:import url="head.jsp"></c:import>
		<div class="container-fluid" id="LG">
			<div class="row-fluid">
				<div class="span12">
					<%-- <div class="row-fluid">
						<div class="span2">
						</div>
						<div class="span8">
							<div class="navbar">
								<div class="navbar-inner">
									<div class="container-fluid">
										<a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"><span class="icon-bar"></span><span
											 class="icon-bar"></span><span class="icon-bar"></span></a> <a href="${pageContext.request.contextPath }/rcpy_index_select.do" class="brand">aku</a>
										<div class="nav-collapse collapse navbar-responsive-collapse">
											<ul class="nav">
												<li>
													<a href="${pageContext.request.contextPath }/rcpy_index_select.do">录入</a>
												</li>
												<!-- <li>
													<a href="#">录入</a>
												</li> -->
												<li>
													<a href="${pageContext.request.contextPath }/ rcpy_index_preview.do">预览</a>
												</li>
												<li class="dropdown">
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
												</li>
											</ul>
											<ul class="nav pull-right">
												<li >
												 	<a href="#" id="li_infoid">${info.infoid }</a>
												</li>
												<li class="divider-vertical">
												</li>
												<li class="dropdown">
													<a data-toggle="dropdown" class="dropdown-toggle" href="#">${user.username }<strong class="caret"></strong></a>
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
						</div>
						<div class="span2">
						</div>
					</div> --%>
					
					<div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
									<h2 class="text-center">
										${info.grade }级 ${info.college }学院
									</h2>
									<h3 class="text-center">
										${info.specialty }专业人才培养方案 
									</h3>
								</div>
								<div class="span2">
								</div>
							</div>
							<br>
							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
									<form action="input_table_tbody.do" name="rcpyIndexInput" method="POST">
										<fieldset>
										<legend style="color: RED;" >请您仔细录入每一项</legend>
										<label>请选择您要录入的项目：&nbsp;</label>
											<select id="select_title" name="selecttitle"  onchange="titleChange();" >
												<option value="" selected="selected" > ---请选择--- </option>
												<option value="target" >培养目标</option>
												<option value="require" >基本规格要求</option>
												<option value="feature" >培养特色</option>
												<option value="xuezhi" >学制及学位</option>
												<option value="subject" >主干学科</option>
											</select><br /><br />
											<br>
											<label style="color: #0056B3;">分段请敲回车，首行无需缩进！</label>
											<div id="div_textarea"> 
												<textarea id="textarea_text" name="textareaText" rows="8" style="min-width: 100%;font-size:18px;line-height:28px;">请先选择要先录入的项目标题哟</textarea>
											</div>
											<span class="help-block" style="color:#4CAE4C">请在录入下一项之前务必点击保存</span>
											<button type="reset" class="btn">重置</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn" onclick="insertSubmit();">保存</button>&nbsp;
											<hr /><br />
										</fieldset>
									</form>
								</div>
								<div class="span2">
								</div>
							</div>
	

							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
									<h3>
										教学进度计划表
									</h3>
									<br>
									<form action="rcpyIndexInput6.do" name="rcpyIndexInput6" method="post">
										<fieldset>
											<legend>录入课程</legend>
											<label style="color: #0056B3;">请选择要录入的详细信息</label>
											<br />

											<div class="row-fluid">
												<div class="span3" >
													<h4 style="text-align: center;width: 80%;">课程名称</h4>
												</div>
												<div class="span1">
													<h4 style="text-align: center;width: 120%;">课程性质</h4>
												</div>
												<div class="span1">
													<h4 style="text-align: center;width: 120%;">开课学期</h4>
												</div>
												<div class="span1">
													<h4 style="text-align: center;width: 120%;">学分</h4>
												</div>
												<div class="span1">
													<h4 style="text-align: center;width: 120%;">总学时</h4>
												</div>
												<div class="span1">
													<h4 style="text-align: center;width: 120%;">周学时</h4>
												</div>
												<div class="span1">
													<h4 style="text-align: center;width: 120%;">考试方式</h4>
												</div>
												<div class="span1">
												</div>
												<div class="span2">
													<h4 style="text-align: center;">操作</h4>
												</div>
											</div>
											<hr />

											<div class="row-fluid">
												<div class="span3">
													<select id="select_subject" name="subjectname" style="width: 70%;" onchange="subjectChange();">
													<option value="0" selected="selected" >---请选择课程名称---</option>
													<c:forEach var="subjectAllList" items="${subjectAllList }">	
														<option value="${subjectAllList.subjectname }" >${subjectAllList.subjectname  }</option>
													</c:forEach>
													</select>
												</div>
												<div class="span1" >
													<select id="select_subject_property2" name="property2" style="width: 120%;">
														<option value="" selected="selected" >-</option>
													</select>
												</div>
												<div class="span1" >
													<select id="select_infotosubject_semester" name="semester" style="width: 120%;">
														<option value="1" selected="selected" >一</option>
														<option value="2"  >二</option>
														<option value="3" >三</option>
														<option value="4"  >四</option>
													</select>
												</div>
												<div class="span1">
													<select id="select_infotosubject_fraction" name="fraction" style="width: 120%;">
														<option value="2" selected="selected" >2</option>
														<option value="3" >3</option>
														<option value="4" >4</option>
														<option value="5" >5</option>
														<option value="6" >6</option>
													</select>
												</div>
												<div class="span1">
													<select id="select_infotosubject_classhour" name="classhour" style="width: 120%;" onchange="classhourChange();">
														<option value="8" selected="selected">8</option>
														<option value="16" >16</option>
														<option value="32" >32</option>
														<option value="48" >48</option>
														<option value="64" >64</option>
														<option value="40" >一周</option>
														<option value="80" >两周</option>
													</select>
												</div>
												<div class="span1">
													<input type="number" value="1" id="input_infotosubject_classhourweek" name="classhourweek" style="width: 100%;height: 100%">
												</div>
												<div class="span1">
													<select id="select_infotosubject_mode" name="mode" style="width: 120%;">
														<option value="考试" selected="selected" >考试</option>
														<option value="考察" >考察</option>
													</select>
												</div>
												<div class="span1">
												</div>
												<div class="span2">
													&nbsp;&nbsp;&nbsp;
													<button id="" name="" type="button" class="btn" onclick="infotosubjectInsert();">保存</button>&nbsp;&nbsp;
													<button id="" name="" type="button" class="btn" onclick="infotosubjectDelete();">删除</button>&nbsp;&nbsp;
												</div>									
											</div>
											<hr />
										</fieldset>
									</form>
								</div>
								<div class="span2">
								</div>
							</div>

							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
									<br />
									<h4>
										教学进度安排
									</h4>
									<button id="input_but_priview" type="button" class="btn" onclick="table_priview();">预览</button>
									<br /><br /><br />
									<br />
									<table class="table table-bordered table-hover table-condensed" style="text-align: center;">
										<thead id="input_table_thead">
											<tr>
												<th colspan="2" style="text-align: center;">
													课程性质
												</th>
												<th style="text-align: center;">
													课程编码
												</th >
												<th style="text-align: center;">
													课程名称
												</th>
												<th style="text-align: center;">
													开课学期
												</th>
												<th style="text-align: center;">
													学分
												</th >
												<th style="text-align: center;">
													总学时
												</th>
												<th style="text-align: center;">
													周学时
												</th>
												<th style="text-align: center;">
													考试方式
												</th>
											</tr>
										</thead>
										<tbody id="input_table_tbody">
											<!-- 表格展示 -->
											<tr style='color:RED'>  
												<td colspan='4' >合计</td>
												<td>-</td>
												<td> 0 </td>
												<td> 0 </td>
												<td>-</td>
												<td>-</td>
											</tr>
																						
										</tbody>
									</table> 
									<br /><hr /><br />
								</div>
								<div class="span2">
								</div>
							</div>
							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
								<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<h4>
											警告！
										</h4> <strong>请确认您填写的每一项信息！！！点击提交之后将提交给审核人员审核！！！</strong> 
									</div>
									<button id="submitButton" class="btn btn-block" onclick="submitBnt();" type="button" style="vertical-align: middle;">提交</button>								
									<br /><br /><hr /><br /><br /><br />
								</div>
								<div class="span2">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<script type="text/javascript">	
	function table_priview(){
		var infoid = '<%=session.getAttribute("infoid")%>';
		var tbody = $('#input_table_tbody');
		$.ajax({
			type:"POST",
			url:"input_table_tbody.do",

			data:{
				"infoid":infoid
			},
			success:function(data){
				console.log(data);
				var html1 = "";
					var sum1 = 0;
					var sum2 = 0;
					//tongshi
					var bxtongshicount = data.bxtongshi.length;
					var xxtongshicount = data.xxtongshi.length;
					if(bxtongshicount > 0){
						bxtongshicount += 1
					}
					if(xxtongshicount > 0){
						xxtongshicount += 1
					}
					var tongshicount = bxtongshicount + xxtongshicount;
					if (data.tongshi != null){					
						if(bxtongshicount > 1){
							var bxtongshixunfencount = data.bxtongshi[0].fraction
							var bxtongshixueshicount = data.bxtongshi[0].classhour						
							html1 += "<tr>" + 
										"<td rowspan=" + tongshicount +  " > "+ data.tongshi[0].property1 +" </td>"+
										"<td rowspan=" + bxtongshicount + ">"+ data.tongshi[0].property2 +" </td>"+
										"<td >" +data.tongshi[0].subjectid + "</td>"+
										"<td>" +data.tongshi[0].subjectname + "</td>"+
										"<td>" +data.bxtongshi[0].semester + "</td>"+
										"<td>" +data.bxtongshi[0].fraction + "</td>"+
										"<td>" +data.bxtongshi[0].classhour  + "</td>"+
										"<td>" +data.bxtongshi[0].classhourweek + "</td>"+
										"<td>" +data.bxtongshi[0].mode + "</td>"+
									"</tr>";
							for(var i=1;i<data.bxtongshi.length;i++){
								bxtongshixunfencount += data.bxtongshi[i].fraction
								bxtongshixueshicount += data.bxtongshi[i].classhour
								html1 +=  "<tr>" + 
											"<td >" +data.tongshi[i].subjectid + "</td>"+
											"<td>" +data.tongshi[i].subjectname + "</td>"+
											"<td>" +data.bxtongshi[i].semester + "</td>"+
											"<td>" +data.bxtongshi[i].fraction + "</td>"+
											"<td>" +data.bxtongshi[i].classhour  + "</td>"+
											"<td>" +data.bxtongshi[i].classhourweek + "</td>"+
											"<td>" +data.bxtongshi[i].mode + "</td>"+
										"</tr>";
							}	
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2' >小计</td>" +
										"<td>-</td>"+
										"<td>" + bxtongshixunfencount+ "</td>"+
										"<td>" + bxtongshixueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += bxtongshixunfencount;
							sum2 += bxtongshixueshicount;
						}
						if(xxtongshicount > 1){
							var xxtongshixunfencount = data.xxtongshi[0].fraction
							var xxtongshixueshicount = data.xxtongshi[0].classhour
							if(bxtongshicount == 0){
								html1 += "<tr>" + 
											"<td rowspan=" + tongshicount +  " > "+ data.tongshi[0].property1 +" </td>"+
											"<td rowspan=" + xxtongshicount + ">"+ data.tongshi[0].property2 +" </td>"+
											"<td >" +data.tongshi[0].subjectid + "</td>"+
											"<td>" +data.tongshi[0].subjectname + "</td>"+
											"<td>" +data.xxtongshi[0].semester + "</td>"+
											"<td>" +data.xxtongshi[0].fraction + "</td>"+
											"<td>" +data.xxtongshi[0].classhour  + "</td>"+
											"<td>" +data.xxtongshi[0].classhourweek + "</td>"+
											"<td>" +data.xxtongshi[0].mode + "</td>"+
										"</tr>";
							}else{
								html1 += "<tr>" + 
											"<td rowspan="+xxtongshicount+">选修 </td> " +
											"<td >" +data.tongshi[data.bxtongshi.length ].subjectid + "</td>"+
											"<td>" +data.tongshi[data.bxtongshi.length ].subjectname + "</td>"+
											"<td>" +data.xxtongshi[0].semester + "</td>"+
											"<td>" +data.xxtongshi[0].fraction + "</td>"+
											"<td>" +data.xxtongshi[0].classhour  + "</td>"+
											"<td>" +data.xxtongshi[0].classhourweek + "</td>"+
											"<td>" +data.xxtongshi[0].mode + "</td>"+
										"</tr>";
							}
							
								
							for(var i=1; i<data.xxtongshi.length; i++){
								xxtongshixunfencount += data.xxtongshi[i].fraction
								xxtongshixueshicount += data.xxtongshi[i].classhour
								html1 +=  "<tr>" + 
										"<td >" +data.tongshi[i + data.bxtongshi.length].subjectid + "</td>"+
										"<td>" +data.tongshi[i + data.bxtongshi.length].subjectname + "</td>"+
										"<td>" +data.xxtongshi[i].semester + "</td>"+
										"<td>" +data.xxtongshi[i].fraction + "</td>"+
										"<td>" +data.xxtongshi[i].classhour  + "</td>"+
										"<td>" +data.xxtongshi[i].classhourweek + "</td>"+
										"<td>" +data.xxtongshi[i].mode + "</td>"+
									"</tr>";
							}		
							
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2'>小计</td>" +
										"<td>-</td>"+
										"<td>" + xxtongshixunfencount+ "</td>"+
										"<td>" + xxtongshixueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += xxtongshixunfencount;
							sum2 += xxtongshixueshicount;
						}
						
					}
					
					//xuekejichu
					var bxjichucount = data.bxjichu.length;
					var xxjichucount = data.xxjichu.length;
					if(data.bxjichu.length > 0){
						bxjichucount += 1
					}
					if(data.xxjichu.length > 0){
						xxjichucount += 1
					}
					var jichucount = bxjichucount + xxjichucount;
					if (data.jichu != null){
						if(bxjichucount > 1){
							//console.log(bxjichucount)
							var bxjichuxunfencount = data.bxjichu[0].fraction
							var bxjichuxueshicount = data.bxjichu[0].classhour
							html1 += "<tr>" + 
										"<td rowspan=" + jichucount + " >"+ data.jichu[0].property1 +"</td>"+
										"<td rowspan=" + bxjichucount+ ">"+ data.jichu[0].property2 +"</td>"+
										"<td >" +data.jichu[0].subjectid + "</td>"+
										"<td>" +data.jichu[0].subjectname + "</td>"+
										"<td>" +data.bxjichu[0].semester + "</td>"+
										"<td>" +data.bxjichu[0].fraction + "</td>"+
										"<td>" +data.bxjichu[0].classhour  + "</td>"+
										"<td>" +data.bxjichu[0].classhourweek + "</td>"+
										"<td>" +data.bxjichu[0].mode + "</td>"+
									"</tr>";
							for(var i=1;i<data.bxjichu.length;i++){
								bxjichuxunfencount += data.bxjichu[i].fraction
								bxjichuxueshicount += data.bxjichu[i].classhour
								html1 +=  "<tr>" + 
											"<td >" +data.jichu[i].subjectid + "</td>"+
											"<td>" +data.jichu[i].subjectname + "</td>"+
											"<td>" +data.bxjichu[i].semester + "</td>"+
											"<td>" +data.bxjichu[i].fraction + "</td>"+
											"<td>" +data.bxjichu[i].classhour  + "</td>"+
											"<td>" +data.bxjichu[i].classhourweek + "</td>"+
											"<td>" +data.bxjichu[i].mode + "</td>"+
										"</tr>";
							}	
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2'>小计</td>" +
										"<td>-</td>"+
										"<td>" + bxjichuxunfencount+ "</td>"+
										"<td>" + bxjichuxueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += bxjichuxunfencount;
							sum2 += bxjichuxueshicount;
						}
						if(xxjichucount > 1){
							//console.log(xxjichucount)
							var xxjichuxunfencount = data.xxjichu[0].fraction
							var xxjichuxueshicount = data.xxjichu[0].classhour
							
							if(bxjichucount == 0){
								html1 += "<tr>" + 
											"<td rowspan=" + jichucount + " >"+ data.jichu[0].property1 +"</td>"+
											"<td rowspan=" + xxjichucount+ ">"+ data.jichu[0].property2 +"</td>"+
											"<td>" +data.jichu[0].subjectid + "</td>"+
											"<td>" +data.jichu[0].subjectname + "</td>"+
											"<td>" +data.xxjichu[0].semester + "</td>"+
											"<td>" +data.xxjichu[0].fraction + "</td>"+
											"<td>" +data.xxjichu[0].classhour  + "</td>"+
											"<td>" +data.xxjichu[0].classhourweek + "</td>"+
											"<td>" +data.xxjichu[0].mode + "</td>"+
										"</tr>";
							}else{
								html1 += "<tr>" + 
											"<td rowspan="+xxjichucount+">选修</td> " +
											"<td >" +data.jichu[data.bxjichu.length].subjectid + "</td>"+
											"<td>" +data.jichu[data.bxjichu.length].subjectname + "</td>"+
											"<td>" +data.xxjichu[0].semester + "</td>"+
											"<td>" +data.xxjichu[0].fraction + "</td>"+
											"<td>" +data.xxjichu[0].classhour  + "</td>"+
											"<td>" +data.xxjichu[0].classhourweek + "</td>"+
											"<td>" +data.xxjichu[0].mode + "</td>"+
										"</tr>";	
							}						
							for(var i=1;i<data.xxjichu.length;i++){
								xxjichuxunfencount += data.xxjichu[i].fraction
								xxjichuxueshicount += data.xxjichu[i].classhour
								html1 +=  "<tr>" + 
										"<td >" +data.jichu[i + data.bxjichu.length].subjectid + "</td>"+
										"<td>" +data.jichu[i + data.bxjichu.length].subjectname + "</td>"+
										"<td>" +data.xxjichu[i].semester + "</td>"+
										"<td>" +data.xxjichu[i].fraction + "</td>"+
										"<td>" +data.xxjichu[i].classhour  + "</td>"+
										"<td>" +data.xxjichu[i].classhourweek + "</td>"+
										"<td>" +data.xxjichu[i].mode + "</td>"+
									"</tr>";
							}		
							
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2'>小计</td>" +
										"<td>-</td>"+
										"<td>" + xxjichuxunfencount+ "</td>"+
										"<td>" + xxjichuxueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += xxjichuxunfencount;
							sum2 += xxjichuxunfencount;
						}
						
							
					}
					
					
					//zhuanyekecheng
					var bxzhuanyecount = data.bxzhuanye.length;
					var xxzhuanyecount = data.xxzhuanye.length;
					if(bxzhuanyecount > 0){
						bxzhuanyecount += 1
					}
					if(xxzhuanyecount > 0){
						xxzhuanyecount += 1
					}		
					var zhuanyecount = bxzhuanyecount + xxzhuanyecount;		
					if (data.zhuanye != null){
						if(bxzhuanyecount > 1){
							var bxzhuanyexunfencount = data.bxzhuanye[0].fraction
							var bxzhuanyexueshicount = data.bxzhuanye[0].classhour
							html1 += "<tr>" + 
										"<td rowspan=" + zhuanyecount +  " >"+ data.zhuanye[0].property1 +"</td>"+
										"<td rowspan=" + bxzhuanyecount + ">"+ data.zhuanye[0].property2 +"</td>"+
										"<td >" +data.zhuanye[0].subjectid + "</td>"+
										"<td>" +data.zhuanye[0].subjectname + "</td>"+
										"<td>" +data.bxzhuanye[0].semester + "</td>"+
										"<td>" +data.bxzhuanye[0].fraction + "</td>"+
										"<td>" +data.bxzhuanye[0].classhour  + "</td>"+
										"<td>" +data.bxzhuanye[0].classhourweek + "</td>"+
										"<td>" +data.bxzhuanye[0].mode + "</td>"+
									"</tr>";
							for(var i=1;i<data.bxzhuanye.length;i++){
								bxzhuanyexunfencount += data.bxzhuanye[i].fraction
								bxzhuanyexueshicount += data.bxzhuanye[i].classhour
								html1 +=  "<tr>" + 
											"<td >" +data.zhuanye[i].subjectid + "</td>"+
											"<td>" +data.zhuanye[i].subjectname + "</td>"+
											"<td>" +data.bxzhuanye[i].semester + "</td>"+
											"<td>" +data.bxzhuanye[i].fraction + "</td>"+
											"<td>" +data.bxzhuanye[i].classhour  + "</td>"+
											"<td>" +data.bxzhuanye[i].classhourweek + "</td>"+
											"<td>" +data.bxzhuanye[i].mode + "</td>"+
										"</tr>";
							}	
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2' >小计</td>" +
										"<td>-</td>"+
										"<td>" + bxzhuanyexunfencount+ "</td>"+
										"<td>" + bxzhuanyexueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += bxzhuanyexunfencount;
							sum2 += bxzhuanyexueshicount;
									 
						}
						if(xxzhuanyecount > 1){
							var xxzhuanyexunfencount = data.xxzhuanye[0].fraction
							var xxzhuanyexueshicount = data.xxzhuanye[0].classhour
							console.log(bxzhuanyecount);
							if(bxzhuanyecount == 0){
								html1 += "<tr>" + 
											"<td rowspan=" + zhuanyecount +  " >"+ data.zhuanye[0].property1 +"</td>"+
											"<td rowspan=" + bxzhuanyecount + ">"+ data.zhuanye[0].property1 +"</td>"+
											"<td >" +data.zhuanye[0].subjectid + "</td>"+
											"<td>" +data.zhuanye[0].subjectname + "</td>"+
											"<td>" +data.bxzhuanye[0].semester + "</td>"+
											"<td>" +data.bxzhuanye[0].fraction + "</td>"+
											"<td>" +data.bxzhuanye[0].classhour  + "</td>"+
											"<td>" +data.bxzhuanye[0].classhourweek + "</td>"+
											"<td>" +data.bxzhuanye[0].mode + "</td>"+
										"</tr>";
							}else{
								html1 += "<tr>" + 
											"<td rowspan="+xxzhuanyecount+">选修</td> " +
											"<td >" +data.zhuanye[data.bxzhuanye.length].subjectid + "</td>"+
											"<td>" +data.zhuanye[data.bxzhuanye.length].subjectname + "</td>"+
											"<td>" +data.xxzhuanye[0].semester + "</td>"+
											"<td>" +data.xxzhuanye[0].fraction + "</td>"+
											"<td>" +data.xxzhuanye[0].classhour  + "</td>"+
											"<td>" +data.xxzhuanye[0].classhourweek + "</td>"+
											"<td>" +data.xxzhuanye[0].mode + "</td>"+
										"</tr>";	
							}	
							for(var i=1;i<data.xxzhuanye.length;i++){
								xxzhuanyexunfencount += data.xxzhuanye[i].fraction
								xxzhuanyexueshicount += data.xxzhuanye[i].classhour
								html1 +=  "<tr>" + 
										"<td >" +data.zhuanye[i + data.bxzhuanye.length].subjectid + "</td>"+
										"<td>" +data.zhuanye[i + data.bxzhuanye.length].subjectname + "</td>"+
										"<td>" +data.xxzhuanye[i].semester + "</td>"+
										"<td>" +data.xxzhuanye[i].fraction + "</td>"+
										"<td>" +data.xxzhuanye[i].classhour  + "</td>"+
										"<td>" +data.xxzhuanye[i].classhourweek + "</td>"+
										"<td>" +data.xxzhuanye[i].mode + "</td>"+
									"</tr>";
							}				
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2' >小计</td>" +
										"<td>-</td>"+
										"<td>" + xxzhuanyexunfencount+ "</td>"+
										"<td>" + xxzhuanyexueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += xxzhuanyexunfencount;
							sum2 += xxzhuanyexueshicount;
						}
						
					}
					
					//shijianhuanjie		
					var bxshijiancount = data.bxshijian.length;
					var xxshijiancount = data.xxshijian.length;
					if(bxshijiancount > 0){
						bxshijiancount += 1
					}
					if(xxshijiancount > 0){
						xxshijiancount += 1
					}
					var shijiancount = bxshijiancount + xxshijiancount;
					if (data.shijian != null){	
						if(bxshijiancount > 1){
							var bxshijianxunfencount = data.bxshijian[0].fraction
							var bxshijianxueshicount = data.bxshijian[0].classhour
							html1 += "<tr>" + 
										"<td rowspan=" + shijiancount + " >"+ data.shijian[0].property1 +"</td>"+
										"<td rowspan=" + bxshijiancount+ ">"+ data.shijian[0].property2 +"</td>"+
										"<td >" +data.shijian[0].subjectid + "</td>"+
										"<td>" +data.shijian[0].subjectname + "</td>"+
										"<td>" +data.bxshijian[0].semester + "</td>"+
										"<td>" +data.bxshijian[0].fraction + "</td>"+
										"<td>" +data.bxshijian[0].classhour  + "</td>"+
										"<td>" +data.bxshijian[0].classhourweek + "</td>"+
										"<td>" +data.bxshijian[0].mode + "</td>"+
									"</tr>";
							for(var i=1;i<data.bxshijian.length;i++){
								bxshijianxunfencount += data.bxshijian[i].fraction
								bxshijianxueshicount += data.bxshijian[i].classhour
								html1 +=  "<tr>" + 
											"<td >" +data.shijian[i].subjectid + "</td>"+
											"<td>" +data.shijian[i].subjectname + "</td>"+
											"<td>" +data.bxshijian[i].semester + "</td>"+
											"<td>" +data.bxshijian[i].fraction + "</td>"+
											"<td>" +data.bxshijian[i].classhour  + "</td>"+
											"<td>" +data.bxshijian[i].classhourweek + "</td>"+
											"<td>" +data.bxshijian[i].mode + "</td>"+
										"</tr>";
							}	
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2' >小计</td>" +
										"<td>-</td>"+
										"<td>" + bxshijianxunfencount+ "</td>"+
										"<td>" + bxshijianxueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += bxshijianxunfencount;
							sum2 += bxshijianxueshicount;
						}
						if(xxshijiancount > 1){		
							var xxshijianxunfencount = data.xxshijian[0].fraction
							var xxshijianxueshicount = data.xxshijian[0].classhour
							
							if(bxshijiancount == 0){
								html1 += "<tr>" + 
											"<td rowspan=" + shijiancount + " >"+ data.shijian[0].property1 +"</td>"+
											"<td rowspan=" + xxshijiancount+ ">"+ data.shijian[0].property2 +"</td>"+
											"<td >" +data.shijian[0].subjectid + "</td>"+
											"<td>" +data.shijian[0].subjectname + "</td>"+
											"<td>" +data.xxshijian[0].semester + "</td>"+
											"<td>" +data.xxshijian[0].fraction + "</td>"+
											"<td>" +data.xxshijian[0].classhour  + "</td>"+
											"<td>" +data.xxshijian[0].classhourweek + "</td>"+
											"<td>" +data.xxshijian[0].mode + "</td>"+
										"</tr>";
							}else{
								html1 += "<tr>" + 
											"<td rowspan="+xxshijiancount+">选修</td> " +
											"<td >" +data.shijian[data.bxshijian.length].subjectid + "</td>"+
											"<td>" +data.shijian[data.bxshijian.length].subjectname + "</td>"+
											"<td>" +data.xxshijian[0].semester + "</td>"+
											"<td>" +data.xxshijian[0].fraction + "</td>"+
											"<td>" +data.xxshijian[0].classhour  + "</td>"+
											"<td>" +data.xxshijian[0].classhourweek + "</td>"+
											"<td>" +data.xxshijian[0].mode + "</td>"+
										"</tr>";	
							}
							
						for(var i=1;i<data.xxshijian.length;i++){
								xxshijianxunfencount += data.xxshijian[i].fraction
								xxshijianxueshicount += data.xxshijian[i].classhour
								html1 +=  "<tr>" + 
										"<td >" +data.shijian[i + data.bxshijian.length].subjectid + "</td>"+
										"<td>" +data.shijian[i + data.bxshijian.length].subjectname + "</td>"+
										"<td>" +data.xxshijian[i].semester + "</td>"+
										"<td>" +data.xxshijian[i].fraction + "</td>"+
										"<td>" +data.xxshijian[i].classhour  + "</td>"+
										"<td>" +data.xxshijian[i].classhourweek + "</td>"+
										"<td>" +data.xxshijian[i].mode + "</td>"+
									"</tr>";
									
							}		
							
							html1 += "<tr style='color:RED'>" + 
										"<td colspan='2' >小计</td>" +
										"<td>-</td>"+
										"<td>" + xxshijianxunfencount+ "</td>"+
										"<td>" + xxshijianxueshicount + "</td>"+
										"<td>-</td>"+
										"<td>-</td>"+
									 "</tr>";
							sum1 += xxshijianxunfencount;
							sum2 += xxshijianxueshicount;
						}
							
					}
					
					html1 += "<tr style='color:RED'>" + 
								"<td colspan='4' >合计</td>" +
								"<td>-</td>"+
								"<td>" + sum1 +  "</td>"+
								"<td>" + sum2 + "</td>"+
								"<td>-</td>"+
								"<td>-</td>"+
							 "</tr>";
					
					tbody.html(html1);	
			},
			
			error:function(){
				alert('清先选择年级、院系及专业哟')
			}
			
		});

	}
	
</script>

<script type="text/javascript">

	//用户确认提交
	function submitBnt(){
		var infoid = '<%=session.getAttribute("infoid")%>';
		var userid = '<%=session.getAttribute("userid")%>';
		$.ajax({
			type : "POST",
			url:"${pageContext.request.contextPath }/rcpy_index_input_submit.do",
			dataTpye : "json",
			data: {
				infoid : infoid,
				userid : userid,
			},
			success : function(data){
				if(data.msg == 1){
					alert("提交成功...您可以预览您提交的方案或者去主页继续录入其他专业！")
					window.location.href = "${pageContext.request.contextPath }/rcpy_index_preview.do";
				}
				if(data.msg == 0){
					alert("服务器飞去外星打LOL啦！,请稍后再试...");
				}
			},
			error : function(data){
				
			},
			
		});
		
	}
	
	//专业删除
	function infotosubjectDelete(){
		var infoid = '<%=session.getAttribute("infoid")%>';
		var subjectname = $('#select_subject').val();
		var semester = $('#select_infotosubject_semester').val();
		var fraction = $('#select_infotosubject_fraction').val();
		var classhour = $('#select_infotosubject_classhour').val();
		var classhourweek = $('#input_infotosubject_classhourweek').val();
		var mode = $('#select_infotosubject_mode').val();
		console.log(infoid);
		if(subjectname == 0){
			alert("请您先选择年级、学院及专业再进行操作！");
		}else{
			$.ajax({
				type : "post",
				url:"${pageContext.request.contextPath }/rcpy_index_input_infotosubjectDelete.do",
				dataType : "json",
				data : {
					"infoid" : infoid,
					"subjectname" : subjectname,
					"semester" : semester,
					"fraction" : fraction,
					"classhour" : classhour,
					"classhourweek" : classhourweek,
					"mode" : mode,		
				},
				success : function(data){
					console.log(data.result);
					var result1 = data.result;
					if(result1 == 1){
						alert("删除成功！");
					}else if(result1 == 500){
						alert("此专业暂未录入此科目，还请先录入再删除！");
					}else if(result1 == 440){
						alert("您的选择有误！")
					}else{
						alert("服务器飞去外星打LOL啦！请稍后再试...");
					}					
					table_priview();	
				},
				error : function(){
					console.log(data);
					alert("服务器飞去外星打LOL啦！,请稍后再试...");
				}	
			});
		}
		
	}
	
	//专业各增改操作
	function infotosubjectInsert(){
		var infoid = '<%=session.getAttribute("infoid")%>';
		var subjectname = $('#select_subject').val();
		var semester = $('#select_infotosubject_semester').val();
		var fraction = $('#select_infotosubject_fraction').val();
		var classhour = $('#select_infotosubject_classhour').val();
		var classhourweek = $('#input_infotosubject_classhourweek').val();
		var mode = $('#select_infotosubject_mode').val();
		console.log(infoid);
		if(subjectname == 0){
			alert("请先选择年级、学院及专业再进行操作哟！");
		}else{
			$.ajax({
				type : "post",
				url:"${pageContext.request.contextPath }/rcpy_index_input_infotosubjectInsert.do",
				dataType : "json",
				data : {
					"infoid" : infoid,
					"subjectname" : subjectname,
					"semester" : semester,
					"fraction" : fraction,
					"classhour" : classhour,
					"classhourweek" : classhourweek,
					"mode" : mode,		
				},
				success : function(data){
					console.log(data.result);
					var result1 = data.result;
					if(result1 == 2){
						alert("录入成功！");
					}else if(result1 == 1){
						alert("修改成功！");
					}else if(result1 == 400){
						alert("不能胡乱选择学科哟！")
					}
					else{
						alert("网页飞去外星打LOL啦！");
					}
					table_priview();
				},
				error : function(){
					console.log(data);
					alert("录入失败!");
				}	
			});
		}		
	}

	//动态计算周学时
	function classhourChange(){
		var classhour = $('#select_infotosubject_classhour').val();
		var classhourweek = $('#input_infotosubject_classhourweek');
		var num = classhour / 16;
		if((classhour % 16) == 0 && (classhour / 16) < 5){
			classhourweek.val(num);
		}else{
			classhourweek.val(classhour);
		}	
	}
	
	//动态获取这门科目的property2
	function subjectChange(){
		var subjectname = $('#select_subject').val();
		var property2 = $('#select_subject_property2');
		var html = "";
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath }/rcpy_index_input_insertproperty2.do",
			dataType:"json",
			async : true,	
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data : {
				"subjectname" : subjectname,
			},
			success : function(data){
				//console.log(data);
				html += "<option value=" + data.success + ">" + data.success + "</option>";
				property2.html(html);
				
			},
			error : function(data){
				//console.log(data);
				alert("读取错误，请重试！")
			},
		});
		
	}

	//text保存
	function insertSubmit(){	
		var textareaText = $('#textarea_text').val();
		var value = $('#select_title').val();
		var target = '<%=session.getAttribute("infoid")%>';
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath }/rcpy_index_input_insertText.do",
			dataType : "json",
			async : true,	
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data : {
				"value" : value,
				"infoid" : target,
				"textareaText" : textareaText,
			},
			success : function(data){
				if (data == 1){
					alert("修改成功！");
				}else{
					alert("录入成功！")
				}
				//window.location.href = "${pageContext.request.contextPath }/rcpy_index_input.do";
			},
			error:function(){
				alert("服务器飞去外星打LOL啦！请稍后再试...");
			}
			
		});
		
	}
	
	//动态获取已有数据放入textarea中
	function titleChange(){
		var textarea_text = $('#textarea_text');
		var value = $('#select_title').val();
		var infoid = '<%=session.getAttribute("infoid")%>';
		var nameText = "";
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath }/rcpy_index_input_text.do",
			dataType : "json",
			async : true,	
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data:{
				"infoid" : infoid,
				"value" : value,
			},
			success : function(data){
				if(data.textShow != null){
					nameText += data.textShow;
					textarea_text.val(nameText);
				}else{
					textarea_text.val("");
				}	
			},
			error: function(){
				alert("请先在主页选择年级、院系及专业！");
			}
		});	
	}
	
	
		
</script>	
</body>
</html>