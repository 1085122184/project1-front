<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的甜品，你的爱~</title>
<link rel="shortcut icon" href="../images/logo_01.png">
<link rel="stylesheet" href="../css/shoppingCar.css"> 
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/carts.css">
<script type="text/javascript">
function goshopping(id) {
	location.href="goshopping?id="+id;
}
function del(id) {
	if(confirm("确认移除购物车？")){
		var url = "delcar?id="+id;
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
function pay(id,user_id){
		var ids=[];
		var counts=[];
		var nowprices=[];
		var prices=[];
			$(".son_check").each(function(){
				if( $(this).prop("checked")){
					ids.push($(this).attr("myid"));
					counts.push($(this).attr("mycount"));
					nowprices.push($(this).attr("mynowprice"));
					prices.push($(this).attr("myprice"));
				}
			});	
		if(ids.length==0){
			alert("请选择行");
			return ;
		}
		location.href="pay?id="+id+"&user_id="+user_id+"&ids="+ids+"&counts="+counts+"&nowprices="+nowprices+"&prices="+prices;
}

</script>
</head>

<body>
<!--页头-->
<div id="headCon">
	<div>
    	<p>我的甜品 你的爱~</p>
    	<c:if test="${sessionScope.user==null}">
        <ol>
            <li><a href="login.html">请登录</a></li>
            <li><a href="register.html">注册</a></li>
            <a href="order.html">我的订单</a>
        </ol>
        </c:if>
        <c:if test="${sessionScope.user!=null}">
        <ol>
            <li><a href="../User/index.jsp">${sessionScope.user.email}</a></li>
            <li><a href="off">退出登录</a></li>
            <a href="order.html">我的订单</a>
        </ol>
        </c:if>
    </div>
    <ul>
    	<a href="index.html"><li></li></a>
        <p>我的购物车</p>
      
    </ul>
</div>
<!--内容-->
<c:if test="${requestScope.size!=0}">
<div id="contentCon">
	<ul>
    	<li>
        	<p>我的商品（${sessionScope.count.c}）</p>
            <span></span>
        </li>
       
    </ul>
    <section class="cartMain">
    
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价（元）</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">小计（元）</li>
                <li class="list_op">操作</li>
            </ul>
        </div>
   
        <div class="cartBox">
            <div class="shop_info">
                
            </div>
            <div class="order_content">
            <c:if test="${requestScope.size!=0}">
               <c:forEach items="${requestScope.shopcar}" var="r">
                <ul class="order_lists" >
                    <li class="list_chk">
                        <input type="checkbox" id="checkbox_${r.id}" class="son_check" myid="${r.id}" mycount="${r.count}" mynowprice="${r.nowprice}" myprice="${r.price}">
                        <label for="checkbox_${r.id}"></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="${r.pic}"alt="" style="width: 90px;height:90px"></a></div>
                        <div class="list_text"><a href="javascript:;">${r.fullname}</a></div>
                    </li>
                    <li class="list_info">
                        <p>净含量：250克</p>
                        <p>规&nbsp;&nbsp;&nbsp;&nbsp;格：中杯</p>
                    </li>
                    <li class="list_price" style="margin-left: -5px">
                        <p class="price">￥${r.nowprice}</p>
                    </li>
                    <li class="list_amount" style="margin-left: -20px">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="${r.count}" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum" style="margin-left: 5px">
                        <p class="sum_price">￥${r.nowprice*r.count}</p>
                    </li>
                    <li class="list_op">
                        <p class="del"style="margin-left: 30px"><a onclick="javascript:del(${r.id})" style="cursor: pointer;">移除商品</a></p>
                    </li>
                </ul>
               </c:forEach> 
              </c:if> 
             
            </div>
        </div>
       <!-- 店铺  暂时不需要 -->
       <!--
        <div class="cartBox">
            <div class="shop_info">
                <div class="all_check">
                    
                    <input type="checkbox" id="shop_b" class="shopChoice">
                    <label for="shop_b" class="shop"></label>
                </div>
                <div class="shop_name">
                    店铺：<a href="javascript:;">卷卷旗舰店</a>
                </div>
            </div>
            <div class="order_content">
                <ul class="order_lists">
                    <li class="list_chk">
                        <input type="checkbox" id="checkbox_4" class="son_check">
                        <label for="checkbox_4"></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="../images/buy_11.jpg" alt=""></a></div>
                        <div class="list_text"><a href="javascript:;">许留山<br>进口土耳其软糖</a></div>
                    </li>
                    <li class="list_info">
                        <p>净含量：100克</p>
                        <p>规&nbsp;&nbsp;&nbsp;&nbsp;格：1包</p>
                    </li>
                    <li class="list_price">
                        <p class="price">￥80.00</p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="1" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">￥80.00</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                    </li>
                </ul>
                <ul class="order_lists">
                    <li class="list_chk">
                        <input type="checkbox" id="checkbox_5" class="son_check">
                        <label for="checkbox_5"></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="../images/buy_15.jpg" alt=""></a></div>
                        <div class="list_text"><a href="javascript:;">卡蜜儿<br>小杏仁芝麻饼干</a></div>
                    </li>
                    <li class="list_info">
                        <p>净含量：250克</p>
                        <p>规&nbsp;&nbsp;&nbsp;&nbsp;格：1包</p>
                    </li>
                    <li class="list_price">
                        <p class="price">￥50.12</p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="1" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">￥20.00</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                    </li>
                </ul>
            </div>
        </div>
        -->
        <!--底部-->
        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                
                <div class="calBtn"><a onclick="javascript:pay(${sessionScope.user.id},${sessionScope.user.id})">结算</a></div>
            
            </div>
        </div>
    </section>
    <section class="model_bg"></section>
    
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="../js/carts.js"></script>
</div>
</c:if>
 <c:if test="${requestScope.size==0}">
                <div style="margin:50px 0 0 500px;height: 300px">
                <img src="../images/kk.png">
                 <li style="position:absolute;top:210px;left:620px;font-size: 14px">购物车空空的哦~，去看看心仪的商品吧~</li>
                 <a style="position:absolute;top:240px;left:620px;color: blue;cursor: pointer;" onclick="javascript:goshopping(${requestScope.user_id.id})">去购物> </a>
                </div>
</c:if> 
<!--页脚-->
<div id="footCon">
	<ul>
    	<li>
        	<div class="cold"></div>
            <span></span>
            <ol>
            	<h2>18小时低温</h2>
            	<p>全程冷链配送</p>
            </ol>
        </li>
        <li>
        	<div class="wuxiu"></div>
            <span></span>
            <ol>
            	<h2>7*24小时营业</h2>
            	<p>全年无休</p>
            </ol>
        </li>
        <li>
        	<div class="baoyou"></div>
            <span></span>
            <ol>
            	<h2>满88包邮</h2>
            	<p>次日送达</p>
            </ol>
        </li>
    </ul>
    <ol>
    	<li>
        	<i></i>
            <a href="index.html">www.sweetlove.com</a>
            <div>
            	<a href="http://www.weibo.com" class="weibo"></a>
                <a href="http://wx.qq.com" class="weixin"></a>
            </div>
        </li>
        <ul>
        	<li class="text01">
            	<p>关于甜爱</p>
                <span></span>
                <a href="#">媒体报道</a>
                <a href="#">知识产权</a>
                <a href="#">加入我们</a>
            </li>
            <li>
            	<p>帮助中心</p>
                <span></span>
                <a href="#">购物指南</a>
                <a href="#">订单管理</a>
                <a href="#">常见问题</a>
            </li>
            <li>
            	<p>服务支持</p>
                <span></span>
                <a href="#">服务保障</a>
                <a href="#">用户协议</a>
                <a href="#">售后服务</a>
            </li>
            <li>
            	<p>商业合作</p>
                <span></span>
                <a href="#">集合采购</a>
                <a href="#">品牌合作</a>
                <a href="#">媒体合作</a>
            </li>
        </ul>
        <div>
        	<p>联系我们</p>
            <h2>400-8888-000</h2>
            <span>24小时服务热线</span>
            <a href="#">在线客服</a>
        </div>
    </ol>
    <div></div>
    <li>
        <p>Copyright © 2016 sweetlove.com Inc.All Rights Reserved. 北京甜爱食品有限公司</p>
        <span>版权所有 京ICP备14049645号-1 增值电信业务经营许可证：京ICP证160100号</span>
    </li>
</div>
</body>
</html>
