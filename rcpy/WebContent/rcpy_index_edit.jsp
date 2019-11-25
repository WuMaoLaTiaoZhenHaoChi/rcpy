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
<!-- <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"> -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<!--bootstrap-select  -->
<link href="css/bootstrap-select.min.css" rel="stylesheet">
<script src="js/bootstrap-select.min.js"></script>

<title>编辑</title>
</head>

<body>
	
	<c:import url="staticjsp/head.jsp"></c:import>
	
	<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span2">
						</div>
						<div class="span8">
							<div class="tabbable" id="tabs-96488">
								<ul class="nav nav-tabs">
									<li>
										<a href="#panel-508069" data-toggle="tab">编辑专业</a>
									</li>
									<li class="active">
										<a href="#panel-277654" data-toggle="tab">编辑学科</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane" id="panel-508069">
										<p>
											第一部分内容.
										</p>
										<form class="form-horizontal" action="" method="post">
											<fieldset>
												<legend>请输入年级院系及专业</legend>
												<br>
												<label>年 级&nbsp;</label>
												<input type="tel" name="grade"/>
												<br /><br />
												<label>院系&nbsp;</label>
												<input type="tel" name="grade"/>
												<br /><br />
												<label>专业&nbsp;</label>
												<input type="tel" name="grade"/>
												<br /><br />
												<br>
												<span class="help-block" style="color:#FF0000">请输入需要编辑的年级、院系、专业...</span>
												<br>
												<labelclass="checkbox"></label>
													<button id="" type="reset" class="btn">重置</button>&nbsp;&nbsp;
													<button type="button" class="btn" onclick="bntSubmit();">确定</button>
											</fieldset>
										</form>
									</div>
									<div class="tab-pane active" id="panel-277654">
										<p>
											第二部分内容.
										</p>
										
										<form class="form-horizontal" action="" method="post">
											<fieldset>
												<legend>请输入课程类型、课程名称</legend>
												<br>
												<label>通识编号&nbsp;</label>
												<input type="text" name="property1"/>
												<br /><br />
												<br>
												<label>通识课程&nbsp;</label>
												<input type="text" name="property1"/>
												<br /><br />
												<label>课程类型&nbsp;</label>
												<input type="text" name="property2"/>
												<br /><br />
												<label>课程名称&nbsp;</label>
												<input type="text" name="subjectname"/>
												<br /><br />
												<br>
												<span class="help-block" style="color:#FF0000">请输入需要编辑的课程类型、课程名称...</span>
												<br>
												<labelclass="checkbox"></label>
													<button id="" type="reset" class="btn">重置</button>&nbsp;&nbsp;
													<button type="button" class="btn" onclick="bntSubmit();">确定</button>
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
	
</body>
</html>