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
						<img alt="140x140" src="images/困.png" class="img-rounded" />
					</div>
					<br><br><br>
					<div class="span4">
						<form class="form-horizontal" method="post" action="login_login.do" >
							<div class="control-group">
								 <label class="control-label" for="inputtext">账号</label>
								<div class="controls">
									<input id="login_inputId" name="userid" type="number" value="${user.id }" onkeyup="value=value.replace(/[^\d]/g,'')"/>
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
									 <label class="checkbox"><input type="checkbox" /> 记住我</label> <button type="submit" id="login_btn" name="login_submit" class="btn">登陆</button>
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
							aku版权所有
						</h4>
						<h4 class="text-center">
							aku版权所有
						</h4>
					</div>
					<div class="span4">
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
    var oTxt = document.getElementById('login_inputId');
    var oPwd = document.getElementById('login_inputPassword');

    var oBtn = document.getElementById('login_btn');
    function isnull(val) {

        var str = val.replace(/(^\s*)|(\s*$)/g, '');//去除空格;

        if (str == '' || str == undefined || str == null) {
           //console.log('is null');
            alert('账号和密码不能为空');
            return true;
        } else {
            console.log('not null');
        	return false;
        }
    }
    oBtn.onclick = function () {
        isnull( oTxt.value );
    }
    oBtn.onclick = function () {
        isnull( oPwd.value );
    }
</script>

</body>
</html>