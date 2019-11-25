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

		<title>预览</title>
</head>
	<body>
		<br>
		<c:import url="head.jsp"></c:import>
		
		<div class="container-fluid" id="LG">		
					<div class="row-fluid">
					
						<div class="span2">
						</div>
						<div class="span6">
						</div>
						<div class="span2">
							<!-- <input id="input_semester" type="number" style="width: 35%" value="0"> -->
							<label>请选择学期进行导出&nbsp;</label>
							<select id="input_semester">
								<option value="0" selected="selected"> 全部 </option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>
							<br><br>
							<button id="" type="button" class="btn" onclick="downloadExcel();">Excel</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="" type="button" class="btn" onclick="downloadWord();">Word</button>
							
						</div>
						<div class="span2">
						</div>
					</div>
					<hr>
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
										<label>请选择需要预览的项目：&nbsp;</label>
											<select id="preview_title" name="selecttitle"  onchange="titleChange();" >
												<option value="" selected="selected"> ---请选择--- </option>
												<option value="target" >培养目标</option>
												<option value="require" >基本规格要求</option>
												<option value="feature" >培养特色</option>
												<option value="xuezhi" >学制及学位</option>
												<option value="subject" >主干学科</option>
											</select><br />
											<br>
											<div id="div_textarea"> 
												<textarea id="textarea_text" name="textareaText" rows="8" style="min-width: 100%;font-size:18px;line-height:28px;">----请先选择要预览的项目！----</textarea>
											</div>
											<br><br><hr />
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
								</div>
								<div class="span2">
								</div>
							</div>
							
							<div class="row-fluid">
								<div class="span2">
								
								</div>
								<div class="span8">
									<br />
<!-- 									<h4>
										教学进度安排
									</h4> -->
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
									<br />
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

	//下载word
	function downloadWord(){
		var infoid = '<%= session.getAttribute("infoid")%>';
		var url= "rcpy_index_preview_outputWord.do?infoid="+infoid;
		if(infoid != null){
			window.open(url);
			//alert("下载成功！");
		}else{
			alert("出错了！");
		} 
	}

	//下载excel
	function downloadExcel(){
		var semester = $('#input_semester').val();
		console.log(semester);
		var infoid = '<%= session.getAttribute("infoid")%>';
		var url= "rcpy_index_preview_outputExcel.do?infoid="+infoid+"&semester="+semester;
		if(infoid != null && semester >= 0){
			window.open(url);
			//alert("下载成功！");
		}else{
			alert("出错了！");
		} 
	}

	//失败品
	function outputExcel(){
		var semester = $('#input_semester').val();
		var infoid = '<%= session.getAttribute("infoid")%>';
		console.log(semester);
		console.log(infoid);
		var url= "rcpy_index_preview_outputExcel.do?infoid="+infoid+"&semester="+semester;
		window.open(url);
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/rcpy_index_preview_outputExcel.do",
			dataType : "json",
			async : true,	
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data:{
				"infoid" : infoid,
				"semester" : semester,
			},
			success : function(data){
				console.log(data.msg);
				alert("导出成功！");	
			},
			error : function(data){
				console.log(data.msg);
				alert("导出失败！");
			},
			
		});
		
	}
	
	//动态获取已有数据放入textarea中
	function titleChange(){
		var textarea_text = $('#textarea_text');
		var value = $('#preview_title').val();
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