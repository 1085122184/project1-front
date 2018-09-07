<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript" src="../js/city.js"></script>
<script type="text/javascript">
		function change(id,user_id){
			var url = "change?id="+id+"&user_id="+user_id;
			$.ajax({
				type : "post",
				async : false,
				url : url,
				timeout:1000,
				success:function(dates){
					//$('#change'+dates[0].id).html(dates[0].status_name);
					
					//alert($('#change'+dates[0].id).text());
					$('#change'+dates[0].id).parents("ul").find(".mmm").text("设为默认");
					$('#change'+dates[0].id).text(dates[0].status_name);
				},
			});
			
		}
		function del(id){
			if(confirm("确认删除")){
			var url = "del?id="+id;
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
		function  save() {
			$.post($(".f1").attr("action"),$(".f1").serialize(),function(json){
				if(json.status>0){
					window.location.reload();
				}else{
					alert(json.text);
				}
			},"json");
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
					<c:if test="${sessionScope.user!=null}">
						<a href="../home/page" target="_top" class="h">商城首页</a>
					</c:if>	
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
						<a id="mc-menu-hd" href="failedadd"
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
							<input id="searchInput" name="index_none_header_sysc" type="text"
								placeholder="搜索" autocomplete="off"> <input
								id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
								type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
			</div>
		</article>
	</header>

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
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:forEach items="${requestScope.address}" var="r">
							<c:if test="${r.status==1}">
								<li class="user-addresslist defaultAddr" id="addr${r.id}">
							</c:if>
							<c:if test="${r.status==0}">
								<li class="user-addresslist" id="addr${r.id}">
							</c:if>
							<span class="new-option-r mmm" id="change${r.id}"
								onclick="change(${r.id},${sessionScope.user.id})"><i
								class="am-icon-check-circle"></i> ${r.status_name}</span>
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
								<!--<a href="#"><i class="am-icon-edit"></i>编辑</a>  --> <span
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
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8"   style="margin-top: 20px;">
								<form class="am-form am-form-horizontal f1"  action="insertaddr" method="post">
                                     <input type="hidden" name="user_id" value="${sessionScope.user.id}">
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
											 <select name="province4" class="am-u-lg-width1"></select>&nbsp;&nbsp;
											 <select name="city4" class="am-u-lg-width2"></select>&nbsp;&nbsp;
											 <select name="area4"></select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"
												placeholder="输入详细地址" name="addr"></textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<button class="am-btn am-btn-danger" type="button" onclick="save();">保存</button> <a
												href="javascript: void(0)"
												class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
							//省市区 三级联动
							new PCAS("province4", "city4", "area4", "北京市");

							
						})
					</script>

				<div class="clear"></div>

			</div>
			<!--底部-->
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

		<jsp:include page="../basicjsp/Usermenu.jsp"></jsp:include>
	</div>

</body>

</html>