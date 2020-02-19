<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购买界面</title>
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
<div class="col-md-4">
<div class="row"><img src="../img/${goods.img}.jpg" height="200" width="250" class="img-thumbnail"></div>

</div>

<div class="col-md-8">
<div class="row"><p class="text-center"><h2><p>${goods.gname}</p></h2></p></div>
<div class="row">
<p class="text-left">
<h2>价格:<font color="red">￥${goods.price}</font></h2>
</p>
</div>

<div class="row">
<p class="text-left">
<h2>商品描述:${goods.des}</h2>
</p>
</div>

	<div class="row">						
				<h2 style="display:inline">数量:		</h2>		
				<input type="text" disabled="disabled" style="width:25px;height: 30px;" id="num" value="1">	
				<button type="button" class="btn btn-default" id="jian" onclick="jian1()">-</button>
                <button type="button" class="btn btn-default" id="jia" onclick="jia1()">+</button>					 
	</div>
	
	<div class="row">
	<p class="text-left">
	<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">立即购买</button>
	</p>
	</div>

</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">填写订单信息</h4>
      </div>
      <div >
        
          <div class="form-group">
            <label for="recipient-name" class="control-label">电话:</label>
            <input type="text" class="form-control" id="ph" value="${sessionScope.User.phone}">
          </div>       
          <div class="form-group">
            <label for="message-text" class="control-label" >地址:</label>
            <input type="text" class="form-control" id="addressinfo" value="${sessionScope.User.address}"></input>
          </div>               
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="buy()">确认购买</button>
      </div>
      
    </div>
  </div>
</div>


<div class="container">s
    <div class="row">
        <span id="" style="font-size: 30px;padding-left:33px;">
            热门商品  
        </span>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-2 hidden-xs hidden-sm" style="height: 400px;">
              <img src="../img/big01.jpg" height="100%">  
        </div>
        <div class="col-md-10 col-sm-10" style="padding-left: 10px;">
            <div class="row">
                <div class="col-md-6 hidden-xs hidden-sm" style="height:200px;width: 480px;">
                    <a href="#"><img src="../img/middle01.jpg" height="100%" width="100%"></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
            </div>
            <div class="row">
                 <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                   <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                     <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                     <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                  <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                     <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                 <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="tobuy?id=0"><img src="../img/small03.jpg"></a>
                    <a href="tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="text"  id="userid" value="${sessionScope.User.userid}"  style="visibility:hidden"/>
</body>

<script type="text/javascript">

function jia1() {
	var num1 = $("#num").val(); 	
	var num2=num1*1+1;
	$("#num").val(num2);
	if(num2>0){
		$("#jian").attr('disabled',false);		
	}
	        }

function jian1() {
	var num1 = $("#num").val(); 
	var num2=num1*1-1;
	$("#num").val(num2);
	if(num2<=0){
		$("#jian").attr('disabled',true);
		return false;
	}
	
	        }


$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) 
	  var recipient = button.data('whatever')	
	  var modal = $(this)
	  modal.find('.modal-title').text('填写订单信息')
	  modal.find('.modal-body input').val(recipient)
	})

	
   
  function jump(){
		var patrn=/[`~!@#$%^&*()_+<>?:{},.\/;[\]]/im;
		var para=$("#searchtable").val();
		if(patrn.test(para))
			{
			alert("提示信息：您输入的数据含有非法字符！");
			return false;
			}
		else{
			
			window.location.href ="${path}/shopping/buy/search?gname="+para;;		
			
		}
	}
	
function buy(){
	var id=${param.id};
	var num=$("#num").val();
	var ph=$("#ph").val();
	var address=$("#addressinfo").val();
	var userid=$("#userid").val();
	
	 $.ajax({
         //几个参数需要注意一下
             type: "POST",//方法类型
             dataType: "json",//预期服务器返回的数据类型
             url: "${pageContext.request.contextPath}/buy/order" ,//url
             data: {"id":id,"num":num,"ph":ph,"address":address,"userid":userid},
             success: function (data) {               
                 if (data.result == "200") {
                     alert("购买成功");   
                    window.location.href = '${path}/shopping/main'; 
                 }else if(data.result == "408"){
                 	 alert("库存不足");
                 }                    
             }, 
             error : function() {
                 alert("异常！");
             }
         });
	
	
	
}
	
  
</script>

</html>