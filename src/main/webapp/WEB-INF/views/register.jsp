<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Utf-8">
<title>注册</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> 
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>

	<div class="row">
		<div class="col-md-2">
		</div>
<div class="col-md-8">
<h2 style="center;">用户注册信息输入</h2>
</div>

	</div>
<form id="form1">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

	<div class="form-group has-success has-feedback">
  <label class="control-label" for="inputSuccess2">输入用户名</label>
  <input type="text" class="form-control" name="username" id="name" aria-describedby="inputSuccess2Status">
 
</div>
<div class="form-group has-warning has-feedback">
  <label class="control-label" for="inputWarning2">输入密码</label>
  <input type="password" class="form-control" name="password" id="pw" aria-describedby="inputWarning2Status">

</div>
<div class="form-group has-error has-feedback">
  <label class="control-label" for="inputError2">输入电话</label>
  <input type="text" class="form-control" name="phone" id="ph" aria-describedby="inputError2Status">
  
</div>
	<div class="form-group has-success has-feedback">
  <label class="control-label" for="inputSuccess2">输入地址</label>
  <input type="text" class="form-control" name="address" id="ad" aria-describedby="inputSuccess2Status">
  
</div>
			
<input type="button" value="保存信息" class="btn btn-primary btn-lg active" onclick="save()"></input>

		</div>

	</div>
</form>


</body>
<script type="text/javascript">

$.fn.validate = function(tips){

    if($(this).val() == "" || $.trim($(this).val()).length == 0){
        alert(tips + "不能为空！");
        throw SyntaxError(); //如果验证不通过，则不执行后面
    }
}
function save() {
	
	   $("#name").validate("用户名");
	    $("#pw").validate("密码");
	    $("#ph").validate("电话");
	    $("#ad").validate("地址");
	    var phone=$("#ph").val()	      
	    var isMobile=/^(?:13\d|15\d)\d{5}(\d{3}|\*{3})$/;   
	    var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	    if(!isMobile.test(phone)){
            alert("请正确填写电话号码");
            return false;
        }
	    
 $.ajax({
 //几个参数需要注意一下
     type: "POST",//方法类型
     dataType: "json",//预期服务器返回的数据类型
     url: "${pageContext.request.contextPath}/register/save" ,//url
     data: $('#form1').serialize(),
     success: function (data) {               
         if (data.result == "200") {
             alert("注册成功");   
             window.location.href = '${pageContext.request.contextPath}';
         }                   
     },
     error : function() {
         alert("异常！");
     }
 });
}


</script>

</html>