<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
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
		function confirms(id) {
			if(confirm("确认收货？")){
			var url = "confirm?id="+id;
			$.ajax({
				type : "post",
				async : false,
				url : url,
				timeout:1000,
				success:function(dates){
					location.href="myorder?id="+id;
					
				},
			});
		}
		}
		
		</script>

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
									<a href="../User/center?id=${sessionScope.user.id}" target="_top"><i
										class="am-icon-user am-icon-fw"></i>个人中心</a>
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
									<a id="mc-menu-hd"
										href="../home/shopcarpay?user_id=${sessionScope.user.id}"
										target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
								</div>
							</c:if>
							<c:if test="${sessionScope.user==null}">
								<div class="menu-hd">
									<a id="mc-menu-hd" href="../home/failedadd" target="_top"><i
										class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
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
					   <div class="long-title"><span class="all-goods">个人中心</span></div>
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

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">待付款</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">交易完成</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											
											
											
											
											
											
											<!--交易成功-->
											<c:forEach items="${requestScope.orderlist}" var="r">
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${r.code}</a></div>
													<span>成交时间：${r.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
												
													<div class="order-left" >
													  <c:forEach items="${requestScope.details}" var="rr">
													    <c:if test="${rr.orders_id==r.id}">
														<ul class="item-list">
														
															<li class="td td-item">
																<div class="item-pic" style="margin-top: 4px">
																	<a href="#" class="J_MakePoint">
																		<img src="${rr.pic}" class="itempic J_ItemImg" style="height: 70px;width: 70px">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${rr.fullname}</p>
																			
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price" style="margin-top: 8px">
																	${rr.nowprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number" style="margin-top: 8px">
																	<span>×</span>${rr.count}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														
														</ul>
														</c:if>
                                                      </c:forEach>
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${r.nowamount}
																<p>含运费：<span>0.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status" style="margin-top: 8px">
																	<p class="Mystatus">${r.status_name}</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu" id="caozuo">
																  <c:if test="${r.status==0}">
																	<a style="font-size: 14px;color: #FFF;" onclick="javascript:payment(${r.id})">一键支付</a>
																  </c:if>
																  <c:if test="${r.status==1}">
																	等待发货
																  </c:if>
																  <c:if test="${r.status==2}">
																	<a style="font-size: 14px;color: #FFF;" onclick="javascript:confirms(${r.id})">确认收货</a>
																  </c:if>
																  <c:if test="${r.status==3}">
																	交易成功
																  </c:if>
																</div>
															</li>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
											
											
											

											<!--不同状态订单-->
											
										</div>

									</div>

								</div>
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp;&nbsp;&nbsp;&nbsp;</td>&nbsp;
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${requestScope.orderlist0}" var="r">
											<div class="order-status1">
											
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${r.code}</a></div>
													<span>成交时间：${r.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
													<div class="order-left" >
													<c:forEach items="${requestScope.details0}" var="rr">
													    <c:if test="${rr.orders_id==r.id}">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic" style="margin-top: 4px">
																	<a href="#" class="J_MakePoint">
																		<img src="${rr.pic}" class="itempic J_ItemImg" style="height: 70px;width: 70px">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${rr.fullname}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price" style="margin-top: 8px">
																	${rr.nowprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number" style="margin-top: 8px">
																	<span>×</span>${rr.count}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
														</c:if>
														</c:forEach>
 													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${r.nowamount}
																<p>含运费：<span>0.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status" style="margin-top: 8px">
																	<p class="Mystatus">等待买家付款</p>
																	</div>
															</li>
															<li class="td td-change">
																<a style="font-size: 14px;color: #FFF;" onclick="javascript:payment(${r.id})">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>

												</div>
											</div>
											</c:forEach>
										</div>

									</div>
								</div>
								
								
								
								
								
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${requestScope.orderlist1}" var="r">
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${r.code}</a></div>
													<span>成交时间：${r.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left" >
													<c:forEach items="${requestScope.details1}" var="rr">
													    <c:if test="${rr.orders_id==r.id}">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic" style="margin-top: 4px">
																	<a href="#" class="J_MakePoint">
																		<img src="${rr.pic}" class="itempic J_ItemImg" style="height: 70px;width: 70px">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${rr.fullname}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price" style="margin-top: 8px">
																	${rr.nowprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number" style="margin-top: 8px">
																	<span>×</span>${rr.count}
																</div>
															</li>
															
														</ul>
														</c:if>
														</c:forEach>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${r.nowamount}
																<p>含运费：<span>0.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																</div>
															</li>
															<li class="td td-change" style="margin-top: 8px">
																<div class="am-btn am-btn-danger anniu">
																	提醒发货</div>
															</li>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
									</div>
								</div>
								
								
								
								
								
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${requestScope.orderlist2}" var="r">
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${r.code}</a></div>
													<span>成交时间：${r.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content" >
													<div class="order-left" >
													<c:forEach items="${requestScope.details2}" var="rr">
													    <c:if test="${rr.orders_id==r.id}">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic" style="margin-top: 4px">
																	<a href="#" class="J_MakePoint">
																		<img src="${rr.pic}" class="itempic J_ItemImg" style="height: 70px;width: 70px">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${rr.fullname}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price" style="margin-top: 8px">
																	${rr.nowprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number" style="margin-top: 8px">
																	<span>×</span>${rr.count}
																</div>
															</li>
															
														</ul>
														</c:if>
														</c:forEach>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${r.nowamount}
																<p>含运费：<span>0.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status" style="margin-top: 8px">
																	<p class="Mystatus">卖家已发货</p>
																	</div>
															</li>
															<li class="td td-change">
															<a style="font-size: 14px;color: #FFF;" onclick="javascript:confirms(${r.id})">
																<div class="am-btn am-btn-danger anniu">
																	确认收货</div></a>
															</li>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
									</div>
								</div>

								
								
								
								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${requestScope.orderlist3}" var="r">
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${r.code}</a></div>
													<span>成交时间：${r.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content" >
													<div class="order-left" >
													<c:forEach items="${requestScope.details3}" var="rr">
													    <c:if test="${rr.orders_id==r.id}">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic" style="margin-top: 4px">
																	<a href="#" class="J_MakePoint">
																		<img src="${rr.pic}" class="itempic J_ItemImg" style="height: 70px;width: 70px">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${rr.fullname}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price" style="margin-top: 8px">
																	${rr.nowprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number" style="margin-top: 8px">
																	<span>×</span>${rr.count}
																</div>
															</li>
															
														</ul>
														</c:if>
														</c:forEach>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${r.nowamount}
																<p>含运费：<span>0.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status" style="margin-top: 8px">
																	<p class="Mystatus">已确认收货</p>
																	</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	交易完成</div>
															</li>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
									</div>
								</div>
								
								
								
							
							
							
							
							</div>

						</div>
					</div>
				</div>
				<!--底部-->
				<jsp:include page="../basicjsp/basis_bottom.jsp"></jsp:include>
			</div>
			<jsp:include page="../basicjsp/Usermenu.jsp"></jsp:include>
		</div>

	</body>

</html>