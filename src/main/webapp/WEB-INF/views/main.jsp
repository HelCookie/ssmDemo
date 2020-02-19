<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
            <div id="carousel-example-generic" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
 
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="img/1.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="img/1.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="img/1.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
 
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
      </div>
 
<div class="container">
    <div class="row">
        <span id="" style="font-size: 30px;padding-left:33px;">
            热门商品  
        </span>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-2 hidden-xs hidden-sm" style="height: 400px;">
              <img src="img/big01.jpg" height="100%">  
        </div>
        <div class="col-md-10 col-sm-10" style="padding-left: 10px;">
            <div class="row">
                <div class="col-md-6 hidden-xs hidden-sm" style="height:200px;width: 480px;">
                    <a href="#"><img src="img/middle01.jpg" height="100%" width="100%"></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
            </div>
            <div class="row">
                 <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                   <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                     <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                     <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                  <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                     <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                 <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="buy/tobuy?id=0"><img src="img/small03.jpg"></a>
                    <a href="buy/tobuy?id=0"><p><font color="gray">苏泊尔电饭锅</p></a>
                    <p><font color="red">￥399</font></p>
                </div>
            </div>
        </div>
    </div>
</div>
 
<div class="container" style="margin-top: 10px;">
    <div class="row">
        <ul class="list-inline"  align="center">
            <li><a href="#">关于我们</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">招贤纳士</a></li>
            <li><a href="#">法律声明</a></li>
            <li><a href="#">有情链接</a></li>
            <li><a href="#">支付方式</a></li>
            <li><a href="#">配送方式</a></li>
            <li><a href="#">服务声明</a></li>
            <li><a href="#">广告声明</a></li>
        </ul>
        <div style="text-align: center;margin-top: 5px;margin-bottom: 20px;">
            CopyRight 0000-9999 淘淘商城 版权所有
        </div>
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
			
			window.location.href ="${path}/shopping/buy/search?gname="+para;;		
			
		}
	}
  
  
  </script>
</html>
