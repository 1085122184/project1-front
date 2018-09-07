<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>添加购物车</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="../css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="../js/script.js"></script>
		<style>
		.success_title{
		position:absolute;
		top:76px;
		left:50px;
		font-size: 18px;
        line-height: 25px;
        font-weight: 400;
        color: #71b247}
		img{
		width:60px ;
		height:60px; 
		}
		.fullname{
		position: absolute;
		top: 116px;
		left: 60px;
		overflow: hidden;
		width: 400px;
		height: 58px;
		}
		.pay-btn{
		position: absolute;
		top: 120px;
		left: 960px;
		text-align: center;
		}
		.see-btn{
		position: absolute;
		top: 120px;
		left: 660px;
		background-color: #FFFFFF!important;
		color: red!important;
		text-align: center;
		}
		
		</style>
		<script type="text/javascript">
		function see(id,user_id) {
			location.href="view?id="+id+"&user_id="+user_id;
		}
		function pay(user_id,product_id) {
			location.href="shopcarpay?user_id="+user_id+"&product_id="+product_id;
		}
		</script>
		
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
							<a href="../home/off" target="_top">退出登录</a>
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
						<a id="mc-menu-hd" href="../home/shopcarpay?user_id=${sessionScope.user.id}"
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
						<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
			<div class="nav-table">
				<div class="long-title">
					<span class="all-goods">全部分类</span>
				</div>
				<div class="nav-cont">
					<ul>
						<li class="index"><a href="#">首页</a></li>
						<li class="qc"><a href="#">闪购</a></li>
						<li class="qc"><a href="#">限时抢</a></li>
						<li class="qc"><a href="#">团购</a></li>
						<li class="qc last"><a href="#">大包装</a></li>
					</ul>
					<div class="nav-extra">
						<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
					</div>
				</div>
			</div>
			
			<c:if test="${requestScope.success!=null}">
             <div class="successadd" style="background-color: #F5F5F5">
                <div class="success_top">
                <i class="am-icon-check-circle am-icon-md  seprate" style="margin-top: 30px;color:#71b247 "></i>
                <h3 class="success_title">商品已成功加入购物车</h3>
                </div> 
                <div style="margin-top: 10px">
                <img src="${requestScope.success.pic}" />
                </div>
                <div class="fullname">
                 <a href="" title="${requestScope.success.fullname}" style="color: #333">${requestScope.success.fullname}</a><br />
                     <a style="color: #aaa;font-size: 12px">颜色规格</a> <a style="color: #aaa;font-size: 12px">数量</a>
                </div>
                  <div>
                  <input id="ai-topsearch" class="submit see-btn"  value="查看商品详情" onclick="see(${requestScope.success.product_id},${sessionScope.user.id})">
                  <input id="ai-topsearch" class="submit pay-btn"  value="去购物车结算" onclick="pay(${sessionScope.user.id},${requestScope.success.product_id})">
                  </div>
             </div>
           </c:if>

			<c:if test="${requestScope.success==null}">
				<div class="successadd" style="height: 200px">
				  <div style="background-color:#fffdee;width: 600px;height:50px;position: absolute;top: 120px;left: 300px;padding: 10px 20px;border: 1px solid #edd28b">	
					<i class="am-icon-warning am-icon-md  seprate" title="加入购物车" style="color: #FFCC00;vertical-align: middle"></i>
					<a style="color:#f70;font-size: 12px">您还没有登录！登陆后购物车的商品将保存到您账号中。 <a class="am-btn am-btn-danger am-radius" href="login">立即登录</a> </a>
				  </div>
					
				</div>
			</c:if>
















			<div class="footer">
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
				</div>

			</div>

		<!--引导 -->
		<div class="navCir">
			<li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>

		
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

	</body>

</html>