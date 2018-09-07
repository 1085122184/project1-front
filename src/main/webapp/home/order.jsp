<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="../AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>

</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:if test="${sessionScope.user==null}">
							<a href="login.jsp" target="_top" class="h">亲，请登录</a>
							<a href="register.jsp" target="_top">免费注册</a>
						</c:if>
						<c:if test="${sessionScope.user!=null}">
							<a href="" target="_top" class="h">${sessionScope.user.email}</a>
							<a href="off" target="_top">退出登录</a>
						</c:if>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="../home/page" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
				<c:if test="${sessionScope.user!=null}">
					<div class="menu-hd MyShangcheng">
						<a href="../User/center?id=${sessionScope.user.id}" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</c:if>	
				<c:if test="${sessionScope.user==null}">
					<div class="menu-hd MyShangcheng">
						<a href="" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</c:if>
				</div>
				<div class="topMessage mini-cart">
				<c:if test="${sessionScope.user!=null}">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="shopcarpay?user_id=${sessionScope.user.id}"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
					</div>
				</c:if>
				<c:if test="${sessionScope.user==null}">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="failedadd"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
					</div>
				</c:if>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="myorder" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a>
					</div>
			</ul>
		</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logo"><img src="../images/logo.png" /></div>
    <div class="logoBig">
      <li><img src="../images/logobig.png" /></li>
    </div>
    
    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>       
        <form>
        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
        <input id="ai-topsearch" class="submit" value="搜索" index="1" type="submit"></form>
    </div>     
</div>

<div class="clear"></div>



<div class="take-delivery">
 <div class="status">
   <h2>订单提交成功，请尽快付款！订单号：${sessionScope.code}</h2>
   <div class="successInfo">
     <ul>
       <li>订单详情</li>
       <div class="user-info">
         <p>收货人：${sessionScope.addr.name}</p>
         <p>联系电话：${sessionScope.addr.tel}</p>
         <p>收货地址：${sessionScope.addr.province4}${sessionScope.addr.city4}${sessionScope.addr.area4}${sessionScope.addr.addr}</p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服 <button type="button" class="am-btn am-btn-danger am-radius" style="position:absolute;top:360px;left: 675px " onclick="payment(${sessionScope.orders_id});">立刻付款</button>
             
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="myorder" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="myorder" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</div>
<script type="text/javascript">
function payment(id) {
	var url = "payment?id="+id;
	$.ajax({
		type : "post",
		async : false,
		url : url,
		timeout:1000,
		success:function(dates){
			alert("付款成功");
			location.href="myorder?id="+id;
			
		},
	});
}

</script>

<div class="footer" >
 <div class="footer-hd">
 <p>
 <a href="#">恒望科技</a>
 <b>|</b>
 <a href="#">商城首页</a>
 <b>|</b>
 <a href="#">支付宝</a>
 <b>|</b>
 <a href="#">物流</a>
 </p>
 </div>
 <div class="footer-bd">
 <p>
 <a href="#">关于恒望</a>
 <a href="#">合作伙伴</a>
 <a href="#">联系我们</a>
 <a href="#">网站地图</a>
 <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
 </p>
 </div>
</div>


</body>
</html>
