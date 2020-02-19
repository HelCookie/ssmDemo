<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>manage</title> 
  <!-- Stylesheets -->
  <link href="../style/bootstrap.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="../style/font-awesome.css"> 
  <!-- jQuery UI -->
  <link rel="stylesheet" href="../style/jquery-ui.css"> 
  <!-- Calendar -->
  <link rel="stylesheet" href="../style/fullcalendar.css">
  <!-- prettyPhoto -->
  <link rel="stylesheet" href="../style/prettyPhoto.css">  
  <!-- Star rating -->
  <link rel="stylesheet" href="../style/rateit.css">
  <!-- Date picker -->
  <link rel="stylesheet" href="../style/bootstrap-datetimepicker.min.css">
  <!-- CLEditor -->
  <link rel="stylesheet" href="../style/jquery.cleditor.css"> 
  <!-- Uniform -->
  <link rel="stylesheet" href="../style/uniform.default.css"> 
  <!-- Bootstrap toggle -->
  <link rel="stylesheet" href="../style/bootstrap-switch.css">
  <!-- Main stylesheet -->
  <link href="../style/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="../style/widgets.css" rel="stylesheet">   
  
  <link rel="shortcut icon" href="../img/favicon/favicon.png">
</head>

<body>

<!-- Header starts -->
  <header>
    <div class="container">
      <div class="row">

        <!-- Logo section -->
        <div class="col-md-4">
          <!-- Logo. -->
           <div class="logo">
            <h1><a href="#">网上购物商城<span class="bold"></span></a></h1>
            <p class="meta"><h4>后台管理系统</h4></p>
          </div>
          <!-- Logo ends -->
        </div>

        <!-- Button section -->
        <div class="col-md-4">

          
          
        </div>

        <!-- Data section -->

        <div class="col-md-4">
          <div class="header-data">

           <ul class="nav navbar-nav pull-right">
          <li class="dropdown pull-right">            
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="icon-user"></i> admin <b class="caret"></b>              
            </a>
            
            <!-- Dropdown menu -->
            <ul class="dropdown-menu">
              <li><a href="#"><i class="icon-user"></i> Profile</a></li>
              <li><a href="#"><i class="icon-cogs"></i> Settings</a></li>
              <li><a href="login.html"><i class="icon-off"></i> Logout</a></li>
            </ul>
          </li>
          
        </ul>

          </div>
        </div>

      </div>
    </div>
  </header>

<!-- Header ends -->

<!-- Main content starts -->

<div class="content">

  	<!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-dropdown"><a href="#">Navigation</a></div>

        <!--- Sidebar navigation -->
        <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
        <ul id="nav">
          <!-- Main menu with font awesome icon -->
          <li><a href="${path}/shopping/manage/goods"><i class="icon-home"></i> 首页</a></li>                                         
          <li><a href="${path}/shopping/manage/goods" class="open"><i class="icon-table"></i> 商品管理</a></li>
          <li><a href="${path}/shopping/manage/order"><i class="icon-tasks"></i> 订单管理</a></li>
          <li><a href="${path}/shopping/manage/toaddgoods"><i class="icon-magic"></i> 添加商品</a></li>
        
        </ul>
    </div>

    <!-- Sidebar ends -->

  	<!-- Main bar -->
  	<div class="mainbar">

      <!-- Page heading -->
      <div class="page-head">
        <h2 class="pull-left"><i class="icon-table"></i> Tables</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="index.html"><i class="icon-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="#" class="bread-current">Dashboard</a>
        </div>

        <div class="clearfix"></div>

      </div>
      <!-- Page heading ends -->

	    <!-- Matter -->

	    <div class="matter">
        <div class="container">

          <!-- Table -->

            <div class="row">

              <div class="col-md-12">

                <div class="widget">

                <div class="widget-head">
                  <div class="pull-left">商品表</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>

                  <div class="widget-content">

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>商品号</th>
												<th>商品名</th>
												<th>价格</th>
												<th>库存</th>
												<th>图片</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${goodslist}" var="goods">
												<tr>
													<td>${goods.gid}</td>
													<td>${goods.gname}</td>
													<td>${goods.price}</td>
													<td>${goods.stock}</td>
													<td>${goods.img}.jpg</td>
													<td>
														<button type="button" value="${goods.gid}"
															class="btn btn-info" data-toggle="modal">编辑信息</button>
														<button type="button" class="btn btn-danger" id="del"
															value="${goods.gid}" onclick="delgoods()">删除商品</button>
													</td>
												</tr>

											</c:forEach>


										</tbody>
									</table>

									<div class="widget-foot">

                      
                       
                      
                      <div class="clearfix"></div> 

                    </div>

                  </div>
                </div>

           
              </div>

            </div>

        </div>
		  </div>
		<!-- Matter ends -->
    </div>

   <!-- Mainbar ends -->	    	
   <div class="clearfix"></div>

</div>
<!-- Content ends -->

<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2012 | <a href="#">Your Site</a> </p>
      </div>
    </div>
  </div>
</footer> 	

<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 

<!-- JS -->
<script src="../js/jquery.js"></script> <!-- jQuery -->
<script src="../js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="../js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
<script src="../js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="../js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="../js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->

<!-- jQuery Flot -->
<script src="../js/excanvas.min.js"></script>
<script src="../js/jquery.flot.js"></script>
<script src="../js/jquery.flot.resize.js"></script>
<script src="../js/jquery.flot.pie.js"></script>
<script src="../js/jquery.flot.stack.js"></script>

<!-- jQuery Notification - Noty -->
<script src="../js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="../js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="../js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="../js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="../js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="../js/sparklines.js"></script> <!-- Sparklines -->
<script src="../js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="../js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
<script src="../js/jquery.uniform.min.js"></script> <!-- jQuery Uniform -->
<script src="../js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
<script src="../js/filter.js"></script> <!-- Filter for support page -->
<script src="../js/custom.js"></script> <!-- Custom codes -->
<script src="../js/charts.js"></script> <!-- Charts & Graphs -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4>编辑商品信息</h4>
      </div>
      <div class="modal-body">

					<form class="form-horizontal" id="form1">
					
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">商品号:</label>
							<div class="col-sm-10">
								<input type="text" name="gid" readonly="readonly" class="form-control" id="gid">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">商品名:</label>
							<div class="col-sm-10">
								<input type="text" name="gname" class="form-control" id="gname">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">价格:</label>
							<div class="col-sm-10">
								<input type="text" name="price" class="form-control" id="gprice">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">库存:</label>
							<div class="col-sm-10">
								<input type="text" name="stock" class="form-control" id="gstock">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">描述:</label>
							<div class="col-sm-10">
								<input type="text" name="des" class="form-control" id="gdes">
							</div>
						</div>

					</form>
				</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="save()">保存信息</button>
      </div>
    </div>
  </div>
</div>


</body>

<script type="text/javascript">

$(".btn-info").click(function(){   
	   var gid= $(this).attr("value");
	   $.ajax({
			  //几个参数需要注意一下
			      type: "POST",//方法类型
			      dataType: "json",//预期服务器返回的数据类型
			      url: "${pageContext.request.contextPath}/manage/query" ,//url
			      data: {"gid":gid},
			      success: function (data) {               
			          if (data.result == "200") {
			                			              
			              $("#gname").val(data.gname);
			              $("#gid").val(data.gid);
			              $("#gprice").val(data.gprice);
			              $("#gstock").val(data.gstock);
			              $("#gdes").val(data.gdes);
			              $('#exampleModal').modal('show');
			          }else if(data.result=="400"){
			        	  alert("没有拿到");   
			          }        
			          
			      },
			      error : function() {
			          alert("异常！");
			      }
			  });  
	    
	    
	});
	
	
	
$(".btn-danger").click(function(){   
   var gid= $(this).attr("value");
    $.ajax({
		  //几个参数需要注意一下
		      type: "POST",//方法类型
		      dataType: "json",//预期服务器返回的数据类型
		      url: "${pageContext.request.contextPath}/manage/delgoods" ,//url
		      data: {"gid":gid},
		      success: function (data) {               
		          if (data.result == "200") {
		              alert("删除成功");   
		              window.location.reload()  
		          }else if(data.result=="400"){
		        	  alert("删除失败");   
		          }        
		          
		      },
		      error : function() {
		          alert("异常！");
		      }
		  });  
   
    
});
	
$.fn.validate = function(tips){

    if($(this).val() == "" || $.trim($(this).val()).length == 0){
        alert(tips + "不能为空！");
        throw SyntaxError(); //如果验证不通过，则不执行后面
    }
}
	
function save() {
	
	   $("#gname").validate("用户名");
	    $("#gid").validate("商品号");
	    $("#gstock").validate("库存");
	    $("#gprice").validate("价格");
	    $("#gdes").validate("描述");
     
	    
$.ajax({
//几个参数需要注意一下
  type: "POST",//方法类型
  dataType: "json",//预期服务器返回的数据类型
  url: "${path}/shopping/manage/updategoods" ,//url
  data: $('#form1').serialize(),
  success: function (data) {               
      if (data.result == "200") {
          alert("更新成功");   
          window.location.reload() 
      }else if(data.result=="400") {
    	  alert("更新失败"); 
      }                  
  },
  error : function() {
      alert("异常！");
  }
});

}



</script>
</html>