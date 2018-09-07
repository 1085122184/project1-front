<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>首页</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
		type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/skin.css" rel="stylesheet" type="text/css" />
	<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	<style>
strong {
	float: left;
	color: #e4393c;
	font-size: 20px;
	font-weight: 400;
	font-family: Verdana;
	line-height: 33px;
	width: 200px;
	position: absolute;
	top: 62px;
}
</style>
</head>

<body>
	<div class="hmtop">
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
			<div class="logo">
				<img src="../images/logo.png" />
			</div>
			<div class="logoBig">
				<li><img src="../images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>

	<div class="shopNav">
		<div class="slideall">

			<div class="long-title"style="position: absolute;left: -120px;">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont" style="position: absolute;left: -120px">
				<ul>
					<li class="index"><a href="#">首页</a></li>
					<li class="qc"><a href="#">闪购</a></li>
					<li class="qc"><a href="#">限时抢</a></li>
					<li class="qc"><a href="#">团购</a></li>
					<li class="qc last"><a href="#">大包装</a></li>
				</ul>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull" style="position: absolute;left: -120px;height: 600px!important;">
				<jsp:include page="../basicjsp/basis_type.jsp" ></jsp:include>
			</div>
     		<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document).ready(function() {
									$("li").hover(function() {$(".category-content .category-list li.first .menu-in").css("display","none");
														$(".category-content .category-list li.first").removeClass("hover");
														$(this).addClass("hover");
														$(this).children("div.menu-in").css("display","block")
													},
													function() {
														$(this).removeClass("hover")
														$(this).children("div.menu-in").css("display","none")
													});
								})
			</script>

	</div>
	<div class="shopMainbg" > 
		<div class="shopMain" id="shopmain" >
			<div id="f1" style="position: absolute;top: 180px;left:-150px;width: 1900px" >
				<!--甜点-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>${requestScope.typename.name}</h4>
						<h3>每一道甜品都有一个故事</h3>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree big">
					<c:forEach items="${requestScope.product}" var="p">
						<div class="am-u-sm-6 am-u-md-3 text-five  big"
							style="height: 350px !important;">
							<c:if test="${sessionScope.user!=null}">
								<a href="view?id=${p.id}&user_id=${sessionScope.user.id}"> <img
									src="${p.pic}" />
									<div class="outer-con ">
										<!-- outer-con   在hmstyle.css-->
										<div>
											<strong>￥${p.nowprice}元</strong>
										</div>
										<div class="title" title="${p.activity}">
											<em style="font-size: 12px;"> ${p.fullname} </em>
										</div>
										<div>
											<a href="addcar?user_id=${sessionScope.user.id}&product_id=${p.id}&count=1">
												<i class="am-icon-shopping-cart am-icon-md  seprate"
												style="position: absolute; top: 135px" title="加入购物车"></i> <i
												class="am-icon-heart-o am-icon-md  seprate"
												style="position: absolute; left: 155px; top: 135px"
												title="收藏"></i>
											</a>
										</div>
									</div>
								</a>
							</c:if>
							<c:if test="${requestScope.user==null}">
								<a href="upview?id=${p.id}"> <img
									src="${p.pic}" />
									<div class="outer-con ">
										<!-- outer-con   在hmstyle.css-->
										<div>
											<strong>￥${p.nowprice}元</strong>
										</div>
										<div class="title" title="${p.activity}">
											<em style="font-size: 12px;"> ${p.fullname} </em>
										</div>
										<div>
											<a href="failedadd">
												<i class="am-icon-shopping-cart am-icon-md  seprate"
												style="position: absolute; top: 135px" title="加入购物车"></i> 
												<i class="am-icon-heart-o am-icon-md  seprate"
												style="position: absolute; left: 155px; top: 135px"
												title="收藏"></i>
											</a>
										</div>
									</div>
								</a>
							</c:if>
						</div>
					</c:forEach>
				</div>


			</div>
			<jsp:include page="../basicjsp/basis_bottom1.jsp" ></jsp:include>
		</div>
	</div>
	


	<jsp:include page="../basicjsp/basis_bottom.jsp" ></jsp:include>
</html>