<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/tjnav.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/pbaol.js" ></script>
        <style type="text/css">
        	#baolImgs{
        		width:60em;
				height:11em;
				/*border:1px solid red;*/
        	}
			.baolImgBorder{
				padding-top:10px;
				padding-right:10px;
				width:11em;
				height:11em;
				overflow:hidden;
				/*border:1px solid red;*/
				float:left;
				position: relative;
				/*border:1px solid red;*/
			}
			.baolImg{
				width:100%;
				height:100%;
				background-color: gray;
			}
			.closeLayer{
				display:none;
				z_index:99;
				position:absolute;
				left:90px;
				top:0px;
			}
			
			.dropdown-submenu{position:relative;}
			.dropdown-submenu>.dropdown-menu{
				top:0;
				left:100%;
				margin-top:-6px;
				margin-left:-1px;
				-webkit-border-radius:0 6px 6px 6px;
				-moz-border-radius:0 6px 6px 6px;
				border-radius:0 6px 6px 6px;
			}
			.dropdown-submenu:hover>.dropdown-menu{display:block;}
			.dropdown-submenu>a:after{
				display:block;
				content:" ";
				float:right;
				width:0;
				height:0;
				border-color:transparent;
				border-style:solid;
				border-width:5px 0 5px 5px;
				border-left-color:#cccccc;
				margin-top:5px;
				margin-right:-10px;
			}
			.dropdown-submenu:hover>a:after{border-left-color:#ffffff;}
			.dropdown-submenu.pull-left{float:none;}
			.dropdown-submenu.pull-left>.dropdown-menu{
				left:-100%;
				margin-left:10px;
				-webkit-border-radius:6px 0 6px 6px;
				-moz-border-radius:6px 0 6px 6px;
				border-radius:6px 0 6px 6px;
			}
			
			select {   
			  /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/  
			  border: solid 1px #000;   
			  /*很关键：将默认的select选择框样式清除*/  
			  appearance:none;   
			  -moz-appearance:none;   
			  -webkit-appearance:none;   
			  /*在选择框的最右侧中间显示小箭头图片*/  
			  background: url("http://ourjs.github.io/static/2015/arrow.png") no-repeat scroll rightright center transparent;   
			  /*为下拉小箭头留出一点位置，避免被文字覆盖*/  
			  padding-right: 14px;   
			}   
			/*清除ie的默认选择框样式清除，隐藏下拉箭头*/  
			select::-ms-expand { display: none; } 
		</style>
    </head>
    <body>
    	<!-- 导航开始  -->
		<div id="temp-nav" style="margin-top:.1em">
			<div id="true-nav">
				<ul id="nav-li">
					<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=精选&pageNow=1">精选</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=爆料&pageNow=1">爆料</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=发现&pageNow=1">发现</a></li>
					
					<c:choose>
						<c:when test="${tUserInfo != null}">
							<li id="user-nav" class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									${tUserInfo.nickname}
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu dropdown-menu-right" >
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的信息</a></li>
									<li><a href="${pageContext.request.contextPath}/pbaol">我要爆料</a></li>
									<li><a href="${pageContext.request.contextPath}/pxianz">闲置发布</a></li>
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=1">我的消息</a></li>
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的爆料</a></li>
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=5">我的收藏</a></li>
									<li id="exit"><a href="${pageContext.request.contextPath}/user/exit">退出</a></li>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li id="register-control"><a href="${pageContext.request.contextPath}/user/toRegister">注册</a></li>
							<li id="login-control"><a href="#">登录</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- 导航结束  -->
		<div>
			<h1 style="text-align:center;">爆料投稿</h1>
		</div>
		
		<div style="width:70em; margin:0 auto">
			<form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/user/addTBaol" enctype="multipart/form-data">
				<input type="text" name="userId" value="${tUserInfo.userId}" style="display: none;" />
				<div class="form-group">
					<label for="baolUrl" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-10">
						<input id="baolUrl" name="baolUrl" type="text" class="form-control" required />
					</div>
				</div>
				<div class="form-group">
					<label for="baolTitle" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-10">
						<input id="baolTitle" name="baolTitle" type="text" class="form-control" required="required"  />
					</div>
				</div>
				<div class="form-group">
					<label for="baolPrice" class="col-sm-2 control-label">价格</label>
					<div class="col-sm-10">
						<input id="baolPrice" name="baolPrice" type="text" class="form-control" required="required"  />
					</div>
				</div>	
				<div class="form-group">
					<label for="kindId" class="col-sm-2 control-label">商品种类</label>
					<div class="col-sm-4 dropdown">
						<input type="text" id="kindId" name="kindId" style="display: none;"/>
                		<input type="text" id="kindName" class="dropdown-toggle form-control" style="cursor: pointer;" data-toggle="dropdown" readonly="readonly" />
		                <ul class="dropdown-menu" style="margin-left:1em;" >
			             	<c:forEach var="tKindLevelOne" items="${tKindLevelOneList}">
								<li class="dropdown-submenu">
									<a href="javascript:;" onclick="getKindName(this, '${tKindLevelOne.kindId}')">${tKindLevelOne.kindName}</a>
									<ul class="dropdown-menu">
										<c:forEach var="tKindLevelTwo" items="${tKindLevelTwoList}">
											<c:if test="${tKindLevelTwo.kindParentId == tKindLevelOne.kindId}">
												<li class="dropdown-submenu">
													<a href="javascript:;" onclick="getKindName(this, '${tKindLevelTwo.kindId}')">${tKindLevelTwo.kindName}</a>
													<ul class="dropdown-menu">
														<c:forEach var="tKindLevelThree" items="${tKindLevelThreeList}">
															<c:if test="${tKindLevelThree.kindParentId == tKindLevelTwo.kindId}">
																<li><a href="javascript:;" onclick="getKindName(this, '${tKindLevelThree.kindId}')">${tKindLevelThree.kindName}</a></li>
															</c:if>
														</c:forEach>
													</ul>
												</li>
											</c:if>				
										</c:forEach>
									</ul>
								</li>
					        </c:forEach>
		                </ul>
					</div>
				</div>	
				<div class="form-group">
					<label for="mallId" class="col-sm-2 control-label">商城</label>
					<div class="col-sm-4 dropdown">
						<select name="mallId" class="form-control">
							<option selected="selected" style="display: none;"></option>
							<c:forEach var="tMall" items="${tMallList}">
								<option style="margin:0.2em 0;padding:0.2em 0; padding-left:1em;" value="${tMall.mallId}">
									${tMall.mallName}
								</option>
					        </c:forEach>
						</select>
					</div>
				</div>		
				<div class="form-group">
					<label for="baolBrand" class="col-sm-2 control-label">品牌</label>
					<div class="col-sm-4">
						<input id="baolBrand" name="baolBrand" type="text" class="form-control" required="required"  />
					</div>
				</div>	
				<div class="form-group">
					<label for="baolPriceAdv" class="col-sm-2 control-label">价格优势</label>
					<div class="col-sm-10">
						<textarea id="baolPriceAdv" name="baolPriceAdv" class="form-control" row="4" required="required"></textarea>
					</div>
				</div>		
				<div class="form-group">
					<label for="baolGoodsAdv" class="col-sm-2 control-label">商品优势</label>
					<div class="col-sm-10">
						<textarea id="baolGoodsAdv" name="baolGoodsAdv" class="form-control" row="4" required="required"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="baolImgs" class="col-sm-2 control-label">爆料图片</label>
					<div id="baolImgs" class="col-sm-10">
						<input type="file" id="showBaolImgOneD" name="baolImgUpload" onchange="getImgURL(this, 'baolImgOn')" style="display:none;" />
						<div class="baolImgBorder" id="showBaolImgOne">  
	        				<img id="baolImgOne" src="images/+.png" class="baolImg" />
	   					</div> 
					</div>
				</div>
				<div class="form-group" style="text-align:center;">
					<input class="btn btn-default btn-lg" type="submit" value="提交" />	
				</div>
			</form>
		</div>

		<br>  
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 	</body>
</html>