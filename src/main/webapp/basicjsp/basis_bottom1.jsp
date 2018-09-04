<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--菜单 -->
	<c:if test="${sessionScope.user!=null}">
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="# "> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="../images/no-img_mid_.jpg " />
							</p>
						  	
							<ul class="user_info ">
								<li >${sessionScope.user.email}</li>
								<li>${sessionScope.user.level_name}</li>
							</ul>
						   
						</div>
						<div class="login_btnbox ">
							<a href="" class="login_order ">我的订单</a> <a href="# "
								class="login_favorite ">我的收藏</a>
						</div>
						<i class="icon_arrow_white "></i>
					</div>

				</div>
				<div id="shopCart " class="item " onclick="shopcar(${sessionScope.user.id})">
					<a onclick="javascript:shopcar(${sessionScope.user.id})"> <span class="message "></span>
					</a>
					<p>购物车</p>
					<p class="cart_num ">${sessionScope.count.c}</p>
				</div>
				<div id="asset " class="item ">
					<a href="# "> <span class="view "></span>
					</a>
					<div class="mp_tooltip ">
						我的资产 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="../images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="broadcast " class="item ">
					<a href="# "> <span class="chongzhi "><img
							src="../images/chongzhi.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我要充值 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem "><a href="#none "><span
							class="mpbtn_qrcode "></span></a>
						<div class="mp_qrcode " style="display: none;">
							<img src="../images/weixin_code_145.png " /><i
								class="icon_arrow_white "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
	</c:if>
	
	<script>
	   function shopcar(user_id) {
		location.href="../home/shopcarpay?user_id="+user_id;
	}
	
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="../basic/js/quick_links.js "></script>
</body>
</html>