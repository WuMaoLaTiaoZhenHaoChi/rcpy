<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<title>主页</title>
	</head>
	<body>
		<br>
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
											 class="icon-bar"></span><span class="icon-bar"></span></a> <a href="#" class="brand">aku</a>
										<div class="nav-collapse collapse navbar-responsive-collapse">
											<ul class="nav">
												<li class="active">
													<a href="${pageContext.request.contextPath }/rcpy_index_select.do">主页</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath }/rcpy_index_input.do">选择</a>
												</li>
												<li>
													<a href="#">输出</a>
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
												<li>
													<a href="#">${user.isadmin }</a>
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
							<div class="hero-unit">
								<h1>
									人才培养管理系统
								</h1>
								<p>
									这是一个可视化布局模板, 你可以点击模板里的文字进行修改, 也可以通过点击弹出的编辑框进行富文本修改. 拖动区块能实现排序.
								</p>
								<p>
									<a class="btn btn-primary btn-large" href="#">参看更多 »</a>
								</p>
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
									<h2 class="text-center">
										标题
									</h2>
								</div>
								<div class="span2">
								</div>
							</div>
							<div class="row-fluid">
								<br /><br />
								<div class="span12">
									<div class="row-fluid">
										<div class="span2">
										</div>
										<div class="span8">
											<form>
												<fieldset>
													<legend>请选择年级院系及专业</legend>
													<label>年 级&nbsp;</label>
													<select id="" class="selectpicker" data-live-search="true" multiple data-max-options="1">
														<option value="" selected="selected">请选择年级</option>
														<option value="1">2015</option>
														<option value="2">2016</option>
														<option value="3">2017</option>
														<option value="4">2018</option>
													</select><br /><br />
													<label>院 系&nbsp;</label>
													<select class="selectpicker" data-live-search="true" multiple data-max-options="1">
														<option value="" selected="selected">请选择院系</option>
														<optgroup label="电信院">
															<option value="1">计算机科学与技术</option>
															<option value="2">电子信息工程</option>
															<option value="3">数字与媒体</option>
														</optgroup>
														<optgroup label="农生院">
															<option value="1">AAA</option>
															<option value="2">BBB</option>
															<option value="3">CCC</option>
														</optgroup>
														<optgroup label="艺术院">
															<option value="1">AAA</option>
															<option value="2">BBB</option>
															<option value="3">CCC</option>
														</optgroup>
													</select>
													<span class="help-block">这里填写帮助信息.</span>
													<labelclass="checkbox"></label>
														<button type="reset" class="btn">重置</button>&nbsp;&nbsp;
														<button type="submit" class="btn">确定</button>
												</fieldset>
											</form>
										</div>
										<div class="span2">
										</div>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
									<button class="btn btn-block disabled btn-success" type="button">按钮</button>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<h4>
											提示!
										</h4> <strong>警告!</strong> 请注意你的个人隐私安全.
									</div>
								</div>
								<div class="span2">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</body>
</html>
