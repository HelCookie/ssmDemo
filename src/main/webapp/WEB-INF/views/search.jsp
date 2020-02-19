<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> 
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
            <div class="row">
                 <div class=" col-md-10">                       
                 </div>
                
                 <div class="col-md-8" style="padding-top: 15px">
                      <span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${sessionScope.User.username}
                        <a href="${path}/shopping/userinfo">个人信息</a>
                        <a href="${path}/shopping/register/myorder?id=${sessionScope.User.userid}">查看订单</a>
                 </div>
            </div>
      </div>
      <div class="container" style="margin-top: 10px">
            <nav class="navbar navbar-inverse" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="${path}/shopping/main">首页</a>
  </div>
 
  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">手机数码</a></li>
      <li><a href="#">家用电器</a></li>
      <li><a href="#">鞋靴箱包</a></li>
      <li><a href="#">孕婴保健</a></li>
    
     
    </ul>
    <div class="navbar-form navbar-right" >
      <div class="form-group">
        <input type="text" class="form-control" id="searchtable">
      </div>
    <button class="btn btn-default" onclick="jump()" id="search">搜索商品</button>
    </div>
  </div><!-- /.navbar-collapse -->
</nav>
      </div>



	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h2>搜索结果</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${pageinfo.list}" var="goods">
			<div class="col-md-3">
				<a href="${path}/shopping/buy/tobuy?id=${goods.gid}">
					<div class="thumbnail">
						<img src="../img/${goods.img}.jpg" height="160" width="160">
						<div class="caption">
							<h3 class="text-center">${goods.gname}</h3>
							<p class="text-center">
								<font color="red">￥${goods.price}</font>
							</p>
						</div>
					</div>
				</a>
			</div>
	</c:forEach>															
		</div>
		
		
		<div class="first_line" style="text-align: center">
			<nav aria-label="Page navigation">
			<ul class="pagination">
				<!-- 首页跳转 -->
				<li><a
					href="search?pn=1&gname=${param.gname}">首页</a></li>
				<!-- 如果有前一页 -->
				<c:if test="${pageinfo.hasPreviousPage == false}">
					<li class="disabled"><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>

				<c:if test="${pageinfo.hasPreviousPage == true}">
					<li><a
						href="search?pn=${pageinfo.pageNum-1}&gname=${param.gname}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<!------------------>
				<!-- 分页条 -->
				<!-- 分页条 -->
				<c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
					<c:if test="${page_num == pageInfo.pageNum}">
						<li class="active"><a
							href="search?pn=${page_num}&gname=${param.gname}">${page_num}</a>
						</li>
					</c:if>
					<c:if test="${page_num != pageInfo.pageNum}">
						<li><a
							href="search?pn=${page_num}&gname=${param.gname}">${page_num}</a></li>
					</c:if>
				</c:forEach>
				<!-- --------- -->
				<!--是否有后一页的判断-->
				<c:if test="${pageinfo.hasNextPage == false}">
					<li class="disabled"><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>

				<c:if test="${pageinfo.hasNextPage == true}">
					<li><a
						href="search?pn=${pageinfo.pageNum+1}&gname=${param.gname}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<!-- 末页跳转 -->
				<li><a
					href="search?pn=${pageinfo.pages}&gname=${param.gname}">末页</a></li>
			</ul>
			</nav>
		</div>	
	
		
	</div>


</body>
  <script type="text/javascript">
  function jump(){
		var patrn=/[`~!@#$%^&*()_+<>?:{},.\/;[\]]/im;
		var para=$("#searchtable").val();
		if(patrn.test(para))
			{
			alert("提示信息：您输入的数据含有非法字符！");
			return false;
			}
		else{
			
			window.location.href ="${path}/shopping/buy/search?gname="+para;		
			
		}
	}
  
  
  </script>

</html>