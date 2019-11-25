<%@page import="org.apache.catalina.Session"%>
<%@page import="com.duant.rcpy.domain.Info"%>
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

<title>审核</title>
</head>

<body>

	<c:import url="head.jsp"></c:import>
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span2"></div>
					<div class="span8">
						<table class="table">
							<thead>
								<tr style="text-align: center;">
									<th>专业编号</th>		
									<th>年级</th>
									<th>院系</th>
									<th>班级</th>
									<th>用户</th>
									<th>状态</th>
									<th colspan="3" >操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var = "info" items="${list }"> 
									<td id="infoid">${info.infoid}</td>
									<td>${info.grade}</td>
									<td>${info.college}</td>
									<td>${info.specialty}</td>
									<td>${info.userid}</td>
									<td>${info.submit eq 0 ? '未提交 ' : '已提交 '} / ${info.change eq 0 ? '未审核' : '已审核'}</td>
									<td>
										<a href="${pageContext.request.contextPath }/rcpy_index_preview.do?infoid=${info.infoid}"><button class="btn">预览</button></a>
										<a href="${pageContext.request.contextPath}/review.do?infoid=${info.infoid}&type=1"><button class="btn">通过</button></a>
										<%-- <a href="${pageContext.request.contextPath}/review.do?infoid=${info.infoid}&type=0"><button class="btn">驳回</button></a> --%>
										
										<a id="modal-441154" href="#modal-container-441154" role="button" class="btn" data-toggle="modal" onclick="Values(${info.infoid});">驳回</a>
										<div class="modal fade" id="modal-container-441154" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabel">
															是否确认驳回人才培养方案
														</h4>
													</div>
													
													<form action="review.do" method="post">
													<div class="modal-body">
														<div id="div_textarea"> 
															<textarea id="textarea_tip" name="textareaTip" rows="5" placeholder="请输入驳回的理由" style="min-width: 100%;font-size:14px;"></textarea>
														</div>
													</div>

													<div class="modal-footer">
														 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> 				
														 <input type="hidden" name="type" value="0">
														  <input type="hidden" id="hidden_infoid" name="infoid" value="">
														 <button type="submit">确认</button>
													</div>
													
													</form>
													
												</div>
												
											</div>
											
										</div>
										
										<!-- <a id="modal-441155" href="#modal-container-441155" role="button" class="btn" data-toggle="modal">通过</a> -->

										<%-- <div class="modal fade" id="modal-container-441155" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabel">
															是否审核通过此人才培养方案
														</h4>
													</div>
													<form action="review.do" method="post">
													<div class="modal-footer">
														 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> 
														 <a href="${pageContext.request.contextPath}/review.do?infoid=${info.infoid}&type=0"><button class="btn btn-primary">确定</button></a>
														 <input type="hidden" name="infoid" value='${info.infoid}'>
														 <input type="hidden" name="type" value="1">
														 <button class="btn btn-default" type="submit">确认</button>
													</div>
													
													</form>
													
												</div>
												
											</div>
											
										</div> --%>
										
									</td>
								<tr>
							</c:forEach>

							</tbody>
						</table>
						<div class="pagination pagination-centered">
							<ul items="${page}">	
								<li id="review_li_shouye" value="1">
									<a href="${pageContext.request.contextPath}/review.do?currentPage=1" >首页</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/review.do?currentPage=${page.prefPage}">上一页</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/review.do?currentPage=${page.prefPage}">${page.prefPage}</a></li>
								<li><a href="">当前：第${page.currentPage}页</a></li>
								<li><a href="${pageContext.request.contextPath}/review.do?currentPage=${page.nextPage}">${page.nextPage}</a></li>
								
								<li>
									<a href="${pageContext.request.contextPath}/review.do?currentPage=${page.nextPage}">下一页</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/review.do?currentPage=${page.totalPages}">尾页</a>
								</li>
							</ul>
						</div>
						
					</div>
					<div class="span2"></div>
				</div>
			</div>
		</div>
		
	</div>

<script type="text/javascript">
	
		//$("#modal-container-441154").modal("hide");
		var model = $("#modal-container-441154").modal("hide");
		var hidden_infoid = $("#hidden_infoid");
		function Values(infoid){
			hidden_infoid.val(infoid);
		}

		
		function reviewBnt(){		
			var currentPage = $("#review_li_shouye").val;

			$.ajax({
				type:"post",
				url : "${pageContext.request.contextPath }/review.do",
				dataType : "json",
				data:{
					"currentPage" : currentPage,
				},
				success : function(data){			
				}	
			});
		}
		
		
</script>



</body>
</html>
