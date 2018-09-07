<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>结算页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

	<link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/city.js"></script>
	<script type="text/javascript" src="../js/address.js"></script>
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
					<c:if test="${sessionScope.user!=null}">
						<a href="../home/page" target="_top" class="h">商城首页</a>
					</c:if>	
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
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
				</div>
				<div class="clear"></div>
				<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:forEach items="${requestScope.address}" var="r">
							<c:if test="${r.status==1}">
								<li class="user-addresslist defaultAddr" id="addr${r.id}">
							</c:if>
							<c:if test="${r.status==0}">
								<li class="user-addresslist" id="addr${r.id}">
							</c:if>
							<span class="new-option-r mmm" id="change${r.id}"
								onclick="change(${r.id},${requestScope.user.id})"><i
								class="am-icon-check-circle"></i> ${r.statusname}</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">${r.name}</span> <span
									class="new-txt-rd2">${r.tel}</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> 
								    <span class="province">${r.province4}</span>
									<span class="city">${r.city4}</span>
									<span class="area">${r.area4}</span>

									<span class="street">${r.addr}</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<!--<a href="#"><i class="am-icon-edit"></i>编辑</a> --><span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="del(${r.id});"><i class="am-icon-trash"></i>删除</a>
							</div>
							<c:if test="${r.status==1}">
								</li>
							</c:if>
							<c:if test="${r.status==0}">
								</li>
							</c:if>
						</c:forEach>

					</ul>

				<div class="clear"></div>
			</div>
			
			<div class="clear"></div>

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>
					 <form action="order?user_id=${sessionScope.user.id}" method="post" class="orders">
					 <input type="hidden" value="${requestScope.faultaddr.id}" name="address_id" id="addrid"/>
					 <input type="hidden" value="${sessionScope.pids}" name="product_id" />
					 <input type="hidden" value="${requestScope.ids}" name="ids" />
					 <input type="hidden" value="${sessionScope.counts}" name="countss" />
					 <input type="hidden" value="${sessionScope.prices}" name="price" />
					 <input type="hidden" value="${sessionScope.nowprices}" name="nprice" />
					 <input type="hidden" value="${requestScope.sums.oldtotalmoney}" name="amount" />
					 <input type="hidden" value="${requestScope.sums.totalmoney}" name="nowamount" />
					 
                  <c:forEach items="${requestScope.products}" var="r">
 					<tr class="item-list">
						<div class="bundle  bundle-last">
							<div class="bundle-main">
								<ul class="item-content clearfix">
									<div class="pay-phone">
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" class="J_MakePoint" > <img
													src="${r.pic}" 
													class="itempic J_ItemImg" style="width: 75px;height:75px"> </a>
											</div>
											<div class="item-info">
												<div class="item-basic-info" style="height: 40px;width: 250px;margin-top: 30px;overflow: hidden;">
													<a href="#" class="item-title J_MakePoint"
														data-point="tbcart.8.11">${r.fullname}</a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props" style="margin-top: 16px">
												<span class="sku-line">颜色：12#川南玛瑙</span> <span
													class="sku-line">包装：裸装</span>
											</div>
										</li>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
												   <a class="J_Price price-now" style="position: absolute;top:22px;left: 518px" >${r.nowprice}</a>
												</div>
											</div>
										</li>
									</div>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<span class="phone-title">购买数量</span>
												<div class="sl">
													 <span style="position: absolute;top: 6px"><a style="font-size:12px" name="count">${r.count}</a></span>
 												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${r.count*r.nowprice}</em>
										</div>
									</li>
									<li class="td td-oplist">
										<div class="td-inner">
											<span class="phone-title">配送方式</span>
											<div class="pay-logis">
												快递<b class="sys_item_freprice">0</b>元
											</div>
										</div>
									</li>

								</ul>
								<div class="clear"></div>
							</div>
					</tr>
					</c:forEach>
					</form>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="pay-total">
				<!--留言-->
				<div class="order-extra">
					<div class="order-user-info">
						<div id="holyshit257" class="memo">
							<label>买家留言：</label> <input type="text"
								title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
								placeholder="选填,建议填写和卖家达成一致的说明"
								class="memo-input J_MakePoint c2c-text-default memo-close">
								<div class="msg hidden J-msg">
									<p class="error">最多输入500个字符</p>
								</div>
						</div>
					</div>

				</div>
				<!--优惠券 -->
				<div class="buy-agio">
					<li class="td td-coupon"><span class="coupon-title">优惠券</span>
						<select data-am-selected>
							<option value="a">
								<div class="c-price">
									<strong>￥8</strong>
								</div>
								<div class="c-limit">【消费满95元可用】</div>
							</option>
							<option value="b" selected>
								<div class="c-price">
									<strong>￥3</strong>
								</div>
								<div class="c-limit">【无使用门槛】</div>
							</option>
					</select></li>

					<li class="td td-bonus"><span class="bonus-title">红包</span> <select
						data-am-selected>
							<option value="a">
								<div class="item-info">
									¥50.00<span>元</span>
								</div>
								<div class="item-remainderprice">
									<span>还剩</span>10.40<span>元</span>
								</div>
							</option>
							<option value="b" selected>
								<div class="item-info">
									¥50.00<span>元</span>
								</div>
								<div class="item-remainderprice">
									<span>还剩</span>50.00<span>元</span>
								</div>
							</option>
					</select></li>

				</div>
				<div class="clear"></div>
				
				<div class="logistics">
						<h3>选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付方式-->
					<div class="logistics">
						<h3>选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="../images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="../images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="../images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>
				
				
				
			</div>
			<!--含运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计（含运费） <span>¥</span><em class="pay-sum">${requestScope.sums.totalmoney}</em>
				</p>
			</div>

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥${requestScope.sums.totalmoney}</span>
								<em class="style-large-bold-red " id="J_ActualFee"></em>
							</span>
						</div>

						<div id="holyshit268" class="pay-address">

							<p class="buy-footer-address">
								<span class="buy-line-title buy-line-title-type">寄送至：</span>
								 <span class="buy--address-detail"> 
								 <span class="province" id="province4" >${requestScope.faultaddr.province4}</span>
									<span class="city" id="city4">${requestScope.faultaddr.city4}</span>
									<span class="dist" id="area4">${requestScope.faultaddr.area4}</span>
									<span class="street" id="addr">${requestScope.faultaddr.addr}</span>
								</span> 
								
							</p>
							<p class="buy-footer-address">
								<span class="buy-line-title">收货人：</span> <span
									class="buy-address-detail"> <span class="buy-user" id="name">${requestScope.faultaddr.name}
								</span> <span class="buy-phone" id="tel">${requestScope.faultaddr.tel}</span>
								</span>
							</p>
						</div>
					</div>
					

					<div id="holyshit269" class="submitOrder">
						<div class="go-btn-wrap">
							<a id="J_Go" onclick="javascript:order();" class="btn-go" tabindex="0"
								title="点击此按钮，提交订单" >提交订单</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
		<div class="footer-bd">
			<p>
				<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
					href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
					href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
					- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
					target="_blank">网页模板</a></em>
			</p>
		</div>
	</div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover" style="width: 750px!important;">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12" style="width: 650px!important;">
			<form class="am-form am-form-horizontal f1" action="../User/insertaddr" method="post">
                <input type="hidden" value="${requestScope.user.id}" name="user_id"/>
				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" id="user-name" name="name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" name="tel" placeholder="手机号必填" type="tel">
					</div>
				</div>
				<div class="am-form-group ">
					<label for="user-address" class="am-form-label">所在地</label>
					<div class="am-form-content address">
						<select name="province4" class="am-u-lg-width1"></select>
						<select name="city4" class="am-u-lg-width2"></select>
						<select name="area4"></select>
					</div>
				</div>
				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"
							name="addr"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<button class="am-btn am-btn-danger" type="button" onclick="save();">保存</button>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>
	<script type="text/javascript">
	function change(id,user_id){
		var url = "../User/change?id="+id+"&user_id="+user_id;
		$.ajax({
			type : "post",
			async : false,
			url : url,
			timeout:1000,
			success:function(dates){
				//$('#change'+dates[0].id).html(dates[0].status_name);
				
				//alert($('#change'+dates[0].id).text());
				$('#change'+dates[0].id).parents("ul").find(".mmm").text("选择该地址默认");
				$('#change'+dates[0].id).text(dates[0].statusname);
				$('#province4').text(dates[0].province4);
				$('#city4').text(dates[0].city4);
				$('#area4').text(dates[0].area4);
				$('#addr').text(dates[0].addr);
				$('#name').text(dates[0].name);
				$('#tel').text(dates[0].tel);
				$('#addrid').val(dates[0].id);
			},
		});
		
	}
	function del(id){
		if(confirm("确认删除")){
		var url = "../User/del?id="+id;
		$.ajax({
			type : "post",
			async : false,
			url : url,
			timeout:1000,
			success:function(dates){
				window.location.reload();
				},
		});
		}
	}
		$(document).ready(
				function() {
					$(".new-option-r").click(
							function() {
								$(this).parent('.user-addresslist').addClass(
										"defaultAddr").siblings().removeClass(
										"defaultAddr");
							});

					var $ww = $(window).width();
					if ($ww > 640) {
						$("#doc-modal-1").removeClass(
								"am-modal am-modal-no-btn")
					}

					//省市区 三级联动
					new PCAS("province4", "city4", "area4", "北京市");

				})
			
		function save() {
			$.post($(".f1").attr("action"), $(".f1").serialize(),
					function(json) {
						if (json.status > 0) {
							alert("添加成功");
							window.location.reload();
						} else {
							alert(json.text);
						}
					}, "json");
		}
		function order() {
			$.post($(".orders").attr("action"), $(".orders").serialize(),
					function(json) {
						if (json.status > 0) {
							alert("添加成功");
							location.href="order.jsp";
						} else {
							alert(json.text);
						}
					}, "json");
			
			
			
			
			
			//location.href="order?amount="+amount+"&nowamount="+nowamount+"&address_id="+address_id+"&user_id="+user_id;
		}
	</script>

	<div class="clear"></div>
</body>

</html>