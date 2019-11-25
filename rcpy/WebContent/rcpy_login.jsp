<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>登录</title>


</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span2">
					</div>
					<br>
					<div class="span8">
						<div class="hero-unit">
							<h1>
								人才培养管理系统
							</h1>
						</div>
					</div>
					<div class="span2">
					</div>
				</div>
				<div class="row-fluid">
					<div class="span2">
					</div>
					<div class="span4">
						<img alt="140x140" src="images/rcpy_aku.jpg" class="img-rounded" />
					</div>
					<br><br><br>
					<div class="span4">
						<form id="login_form" class="form-horizontal" method="post" action="login_login.do" >
							<div class="control-group">
								 <label class="control-label" for="inputtext">账号</label>
								<div class="controls">
									<input id="login_inputId" name="userid" type="number" value="${user.userid }" />
								</div>
							</div>
							<div class="control-group">
								 <label class="control-label" for="inputPassword">密码</label>
								<div class="controls">
									<input id="login_inputPassword" name="password" type="password" />
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									 <label class="checkbox"><input type="checkbox" /> 记住我</label> 
									 <button id="login_btn" type="button" name="login_submit" class="btn" onclick="login()">登陆</button>
								</div>
							</div>
						</form>
					</div>
					<div class="span2">
					</div>
				</div>
				<div class="row-fluid">
					<div class="span4">
					</div>
					<div class="span4">
						<br /><br /><br />
						<h4 class="text-center">
							AKU版权所有
						</h4>
					</div>
					<div class="span4">
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

	function login(){
		var userid = document.getElementById('login_inputId').value;
		var password = document.getElementById('login_inputPassword').value;
	
		if(userid == '' || userid == undefined || userid == null || password == '' || password == undefined || password == null  ){
			alert('账号和密码不能为空！');
			return false;
		}else{	
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/login_login.do",
				dataType : "json",
				async : true,	
				contentType : "application/x-www-form-urlencoded;charset=utf-8",
				data : {
					"userid" : userid,
					"password" : password
				},
				success : function(data){		
					console.log(data);
					if(data.msg == "success"){
						//console.log(data.msg);
						if(data.isadmin == 1){
							alert("欢迎回来！管理员   ***" + data.username + "***");
						}else{
							alert("欢迎回来！用户   ***" + data.username + "***");
						}
						window.location.href = "${pageContext.request.contextPath }/rcpy_index_select.do";
					} else if (data.msg == "fail"){
						alert("密码错误！请重试！");
						return;
					} else if (data.msg == "404"){
						alert("没有此账号！请重试!");
						return;
					}
				}
			});
		}
	}
		
</script>

</body>
</html>