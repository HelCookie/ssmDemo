<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> 
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>

<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-4"><h1>欢迎进入商城</h1></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
</div>
<div class="row">
  <div class="col-md-8"></div>
  <div class="col-md-4"></div>
</div>
<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-4">
  
  <form id="form1" class="form-horizontal" method="post">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="username" id="name" placeholder="Name">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" id="pw" placeholder="Password">
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">所属角色</label>
    <div class="col-sm-10">
     <select class="col-sm-5 form-control" name="role">
			<option>用户</option>
			<option>管理员</option>			
		</select> 
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox">记住密码
        </label>
      </div> 
      
             
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="button" value="提交"  onclick="login()" class="btn btn-default"></input>
       <a href="zhuce"><button type="button" class="btn btn-default" ">注册</button></a>
    </div>
  </div>
</form>
  
  
  </div>
  <div class="col-md-4"></div>
</div>
<div class="row">
  <div class="col-md-6"></div>
  <div class="col-md-6"></div>
</div>

</body>
<script type="text/javascript">

$.fn.validate = function(tips){

    if($(this).val() == "" || $.trim($(this).val()).length == 0){
        alert(tips + "不能为空！");
        throw SyntaxError(); //如果验证不通过，则不执行后面
    }
}


        function login() {
        	
        	   $("#name").validate("用户名");
        	    $("#pw").validate("密码");
        	   
        	
            $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/login/reg" ,//url
                data: $('#form1').serialize(),
                success: function (data) {               
                    if (data.result == "200") {
                        alert("登录成功");   
                        window.location.href = '${pageContext.request.contextPath}/main';
                    }else if(data.result == "201"){                   	
                    	 alert("管理员登录成功");
                    	 window.location.href = '${pageContext.request.contextPath}/manage/goods';
                    }                  
                    else if(data.result == "400"){
                    	 alert("账号信息错误");
                    }  
                    
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
        
       
        
    </script>




</html>