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
                      <span class="glyphicon glyphicon-user" aria-hidden="true"></span> james
                        <a href="#">个人信息</a>
                        <a href="#">查看订单</a>
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
    <a class="navbar-brand" href="#">首页</a>
  </div>
 

  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">手机数码</a></li>
      <li><a href="#">家用电器</a></li>
      <li><a href="#">鞋靴箱包</a></li>
      <li><a href="#">孕婴保健</a></li>        
    </ul>
    <form class="navbar-form navbar-right" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="商品名">
      </div>
      <button type="submit" class="btn btn-default">搜索商品</button>
    </form>
  </div>
</nav>
</div>

<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h2>我的订单</h2>
				</div>
			</div>
		</div>

	<c:forEach items="${list}" var="orders">
		<div class="row">
			<div class="panel panel-info">
				<div class="panel-heading">订单号:${orders.orderId}</div>
				<div class="panel-body">
					<div class="col-md-3">
						<img src="../img/${orders.goodsImg}.jpg" height="160" width="160">
					</div>
					<div class="row">
						<p class="text-left">
						<h2>商品名:${orders.goodsName}</h2>
						</p>
						<p class="text-right">
						<h2>
							<font color="red">￥${orders.price}</font>
						</h2>
						</p>
							<p class="text-left">
								<c:if test="${orders.state eq '0'}">
									<h3>订单状态:交易中</h3>
								</c:if>
								<c:if test="${orders.state eq '1'}">
									<h3>订单状态:交易完成</h3>
								</c:if>
								<c:if test="${orders.state  eq '2'}">
									<h3>订单状态:退单中</h3>
								</c:if>
							</p>
						</div>
					<div class="text-right">
					
   			           <c:if test="${orders.state eq '0'}"> 
						<button type="button" id="cancel" value="${orders.orderId}" onclick="cancel()" class="btn btn-info">取消订单</button>
						</c:if>
						 <c:if test="${orders.state eq '2'}"> 
						<button type="button" disabled="disabled" id="cancel" value="${orders.orderId}" onclick="cancel()" class="btn btn-info">退单中</button>
						</c:if>
						<c:if test="${orders.state eq '0'||orders.state eq '2'}"> 
						<button type="button" id="finish" value="${orders.orderId}"  onclick="finish()" class="btn btn-info">确认收货</button>
					    </c:if>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>		
	</div>
</body>
  <script type="text/javascript">
  
  function cancel(){	
	  var oid=$("#cancel").val();
	  var option=2
	   $.ajax({
		  //几个参数需要注意一下
		      type: "POST",//方法类型
		      dataType: "json",//预期服务器返回的数据类型
		      url: "${pageContext.request.contextPath}/register/updatestate" ,//url
		      data: {"oid":oid,"option":option},
		      success: function (data) {               
		          if (data.result == "200") {
		              alert("取消成功");   
		              window.location.reload()  
		          }                   
		      },
		      error : function() {
		          alert("异常！");
		      }
		  }); 
	  
	  
	}
  
  
  function finish(){	
	  var oid=$("#finish").val();
	  var option=1
	   $.ajax({
		  //几个参数需要注意一下
		      type: "POST",//方法类型
		      dataType: "json",//预期服务器返回的数据类型
		      url: "${pageContext.request.contextPath}/register/updatestate" ,//url
		      data: {"oid":oid,"option":option},
		      success: function (data) {               
		          if (data.result == "200") {
		              alert("完成订单");   
		              window.location.reload()  
		          }               
		      },
		      error : function() {
		          alert("异常！");
		      }
		  }); 
	  
	  
	}
  
  </script>

</html>