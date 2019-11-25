<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								 <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a> <a href="#" class="brand">aku</a>
								<div class="nav-collapse collapse navbar-responsive-collapse">
									<ul class="nav">
										<li class="active">
											<a href="#">主页</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/login_login.do?id=${user.userid}">查询</a>
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
						<div class="span2">
						</div>
						<div class="span8">
							<h3>
								h3. 这是一套可视化布局系统.
							</h3>
							<form>
								<fieldset>
									 <legend>标题</legend> <label>表签名</label><input type="text" /> <span class="help-block">提交及保存</span> <button type="submit" class="btn">提交</button>
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
								h3. 这是一套可视化布局系统.
							</h3>
							<form>
								<fieldset>
									 <legend>表单项</legend> <label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span> <button type="submit" class="btn">提交</button>
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
								h3. 这是一套可视化布局系统.
							</h3>
							<form>
								<fieldset>
									 <legend>表单项</legend> <label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span> <button type="submit" class="btn">提交</button>
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
								h3. 这是一套可视化布局系统.
							</h3>
							<form>
								<fieldset>
									 <legend>表单项</legend> <label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span> <button type="submit" class="btn">提交</button>
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
								h3. 这是一套可视化布局系统.
							</h3>
							<form>
								<fieldset>
									 <legend>表单项</legend> <label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span> <button type="submit" class="btn">提交</button>
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
								h3. 这是一套可视化布局系统.
							</h3>
							<form>
								<fieldset>
									 <legend>表单项</legend> <label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span> <button type="submit" class="btn">提交</button>
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
								h3. 这是一套可视化布局系统.
							</h3>
							<table class="table table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th>
											编号
										</th>
										<th>
											产品
										</th>
										<th>
											交付时间
										</th>
										<th>
											状态
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Default
										</td>
									</tr>
									<tr class="success">
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Approved
										</td>
									</tr>
									<tr class="error">
										<td>
											2
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											02/04/2012
										</td>
										<td>
											Declined
										</td>
									</tr>
									<tr class="warning">
										<td>
											3
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											03/04/2012
										</td>
										<td>
											Pending
										</td>
									</tr>
									<tr class="info">
										<td>
											4
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											04/04/2012
										</td>
										<td>
											Call in to confirm
										</td>
									</tr>
								</tbody>
							</table> <button class="btn" type="button">按钮</button>
						</div>
						<div class="span2">
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