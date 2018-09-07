<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人中心</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/systyle.css" rel="stylesheet" type="text/css">

	</head>

	<body>
	
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:if test="${sessionScope.user==null}">
							<a href="../home/login.jsp" target="_top" class="h">亲，请登录</a>
							<a href="../home/register.jsp" target="_top">免费注册</a>
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
						<a href="center?id=${sessionScope.user.id}" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
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
						<a id="mc-menu-hd" href="../home/failedadd"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
					</div>
				</c:if>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="../home/myorder" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a>
					</div>
			</ul>
		</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="../images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
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
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="wrap-left">
						<div class="wrap-list">
							<div class="m-user">
								<!--个人信息 -->
								<div class="m-bg"></div>
								<div class="m-userinfo">
									<div class="m-baseinfo">
										<a href="information.html">
											<img src="../images/getAvatar.do.jpg">
										</a>
										<em class="s-name">${sessionScope.user.email}<span class="vip1"></em>
										<div class="s-prestige am-btn am-round">
											</span>会员福利</div>
									</div>
									<div class="m-right">
										<div class="m-new">
											<a href="news.html"><i class="am-icon-bell-o"></i>消息</a>
										</div>
										<div class="m-address">
											<a href="addr?user_id=${sessionScope.user.id}&id=${sessionScope.user.id}" class="i-trigger">我的收货地址</a>
										</div>
									</div>
								</div>

								<!--个人资产
								<div class="m-userproperty">
									<div class="s-bar">
										<i class="s-icon"></i>个人资产
									</div>
									<p class="m-bonus">
										<a href="bonus.html">
											<i><img src="../images/bonus.png"/></i>
											<span class="m-title">红包</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-coupon">
										<a href="coupon.html">
											<i><img src="../images/coupon.png"/></i>
											<span class="m-title">优惠券</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-bill">
										<a href="bill.html">
											<i><img src="../images/wallet.png"/></i>
											<span class="m-title">钱包</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-big">
										<a href="#">
											<i><img src="../images/day-to.png"/></i>
											<span class="m-title">签到有礼</span>
										</a>
									</p>
									<p class="m-big">
										<a href="#">
											<i><img src="../images/72h.png"/></i>
											<span class="m-title">72小时发货</span>
										</a>
									</p>
								</div> -->
							</div>
							<div class="box-container-bottom"></div>

							<!--订单 -->
							<div class="m-order">
								<div class="s-bar">
									<i class="s-icon"></i>我的订单
									<a class="i-load-more-item-shadow" href="../home/myorder">全部订单</a>
								</div>
								<ul>
									<li><a href="../home/myorder"><i><img src="../images/pay.png"/></i><span>待付款</span></a></li>
									<li><a href="../home/myorder"><i><img src="../images/send.png"/></i><span>待发货<em class="m-num"></em></span></a></li>
									<li><a href="../home/myorder"><i><img src="../images/receive.png"/></i><span>待收货</span></a></li>
								</ul>
							</div>
							<!--九宫格-->
							<div class="user-patternIcon">
								<div class="s-bar">
									<i class="s-icon"></i>我的常用
								</div>
								<ul>

									<a href="../home/shopcart.html"><li class="am-u-sm-4"><i class="am-icon-shopping-basket am-icon-md"></i><img src="../images/iconbig.png"/><p>购物车</p></li></a>
									<a href="collection.html"><li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i><img src="../images/iconsmall1.png"/><p>我的收藏</p></li></a>
									<a href="../home/home.html"><li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i><img src="../images/iconsmall0.png"/><p>为你推荐</p></li></a>
									<a href="comment.html"><li class="am-u-sm-4"><i class="am-icon-pencil am-icon-md"></i><img src="../images/iconsmall3.png"/><p>好评宝贝</p></li></a>
									<a href="foot.html"><li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i><img src="../images/iconsmall2.png"/><p>我的足迹</p></li></a>                                                                        
								</ul>
							</div>
							<!--物流 -->
							

							<!--收藏夹 -->
						<div class="you-like">
							<div class="s-bar">
								我的收藏 <a class="am-badge am-badge-danger am-round">降价</a> <a
									class="am-badge am-badge-danger am-round">下架</a> <a
									class="i-load-more-item-shadow" href="#"><i
									class="am-icon-refresh am-icon-fw"></i>换一组</a>
							</div>
							<div class="s-content">
								<div class="s-item-wrap">
									<div class="s-item">

										<div class="s-pic">
											<a href="#" class="s-pic-link"> <img
												src="../images/0-item_pic.jpg_220x220.jpg"
												alt="包邮s925纯银项链女吊坠短款锁骨链颈链日韩猫咪银饰简约夏配饰"
												title="包邮s925纯银项链女吊坠短款锁骨链颈链日韩猫咪银饰简约夏配饰"
												class="s-pic-img s-guess-item-img">
											</a>
										</div>
										<div class="s-price-box">
											<span class="s-price"><em class="s-price-sign">¥</em><em
												class="s-value">42.50</em></span> <span class="s-history-price"><em
												class="s-price-sign">¥</em><em class="s-value">68.00</em></span>

										</div>
										<div class="s-title">
											<a href="#" title="包邮s925纯银项链女吊坠短款锁骨链颈链日韩猫咪银饰简约夏配饰">包邮s925纯银项链女吊坠短款锁骨链颈链日韩猫咪银饰简约夏配饰</a>
										</div>
										<div class="s-extra-box">
											<span class="s-comment">好评: 98.03%</span> <span
												class="s-sales">月销: 219</span>

										</div>
									</div>
								</div>
							</div>
							<div class="s-more-btn i-load-more-item" data-screen="0">
								<i class="am-icon-refresh am-icon-fw"></i>更多
							</div>
						</div>
					</div>
					</div>
					<div class="wrap-right">

						<!-- 日历-->
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<em>21</em>
									<span>星期一</span>
									<span>2015.12</span>
								</div>
							</div>
						</div>
						<!--新品 -->
						<div class="new-goods">
							<div class="s-bar">
								<i class="s-icon"></i>今日新品
								<a class="i-load-more-item-shadow">15款新品</a>
							</div>
							<div class="new-goods-info">
								<a class="shop-info" href="#" target="_blank">
									<div class="face-img-panel">
										<img src="../images/imgsearch1.jpg" alt="">
									</div>
									<span class="new-goods-num ">4</span>
									<span class="shop-title">剥壳松子</span>
								</a>
								<a class="follow " target="_blank">关注</a>
							</div>
						</div>

						<!--热卖推荐 -->
						<div class="new-goods">
							<div class="s-bar">
								<i class="s-icon"></i>热卖推荐
							</div>
							<div class="new-goods-info">
								<a class="shop-info" href="#" target="_blank">
									<div >
										<img src="../images/imgsearch1.jpg" alt="">
									</div>
                                    <span class="one-hot-goods">￥9.20</span>
								</a>
							</div>
						</div>

					</div>
				</div>
				<!--底部-->
				<jsp:include page="../basicjsp/basis_bottom.jsp"></jsp:include>

			</div>

			<jsp:include page="../basicjsp/Usermenu.jsp"></jsp:include>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="../home/home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="../home/sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="../home/shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li class="active"><a href="index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>

</html>