<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> 
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
            <div class="row">
                 <div class="col-md-10">                       
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
<div class="col-md-3">
<div class="row"><img src="img/user.jpg" height="200" width="250" class="img-thumbnail"></div>
<div class="row"> <h3> <p>用户:${sessionScope.User.username}</p></h3></div>
</div>

<div class="col-md-9">
<div class="row"><p class="text-center"><h3>编辑个人信息</h3></p></div>

<form class="form-horizontal" id="form1">
<div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">用户名:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="username"  id="username" value="${sessionScope.User.username}">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">电话:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="phone"  id="phone" value="${sessionScope.User.phone}">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">地址:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="address" id="address" value="${sessionScope.User.address}">
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control" id="password" value="${sessionScope.User.password}">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="button" class="btn btn-default" onclick="update()" value="确认修改"></input>
    </div>
  </div>
   <input type="text"  name="userid" value="${sessionScope.User.userid}"  style="visibility:hidden"/>
</form>

  </div>
 </div>
</body>
<script type="text/javascript">

$.fn.validate = function(tips){

    if($(this).val() == "" || $.trim($(this).val()).length == 0){
        alert(tips + "不能为空！");
        throw SyntaxError(); //如果验证不通过，则不执行后面
    }
}


        function update() {
               $("#username").validate("用户名");
        	   $("#phone").validate("用户名");
        	   $("#password").validate("密码");
        	   $("#address").validate("地址");
        	        
        	   var phone=$("#phone").val();
       	    var isMobile=/^(?:13\d|15\d)\d{5}(\d{3}|\*{3})$/;        	  
       	    if(!isMobile.test(phone)){
                   alert("请正确填写电话号码");
                   return false;
               }
        	
            $.ajax({
            //几个参数需要注意一下
                type: "post",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/register/update" ,//url
                data:  $('#form1').serialize(),
                success: function (data) {               
                    if (data.result == "200") {
                        alert("更新成功");   
                        window.location.href = '${pageContext.request.contextPath}/main';
                    }else if(data.result == "400"){
                    	 alert("更新错误");
                    }                    
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
        
       
        
    </script>

</html>