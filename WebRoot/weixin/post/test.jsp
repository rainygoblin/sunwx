<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>iScroll demo: Check DOM Changes</title>
<script type="text/javascript" src="/sunwx/common/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/sunwx/weixin/common/js/iscroll.js"></script>

<script type="text/javascript">

var myScroll;
function loaded() {
	myScroll = new iScroll('wrapper', { hScrollbar:false,onScrollEnd:function(){
	    alert(myScroll.x +"    "+myScroll.maxScrollX);
	} });
	
	
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded', loaded, false);

</script>

<style type="text/css" media="all">
body,ul,li {
	padding:0;
	margin:0;
	border:0;
}

body {
	font-size:12px;
	-webkit-user-select:none;
    -webkit-text-size-adjust:none;
	font-family:helvetica;
}

#header {
	position:absolute; z-index:2;
	top:0; left:0;
	width:100%;
	height:45px;
	line-height:45px;
	background-color:#d51875;
	background-image:-webkit-gradient(linear, 0 0, 0 100%, color-stop(0, #fe96c9), color-stop(0.05, #d51875), color-stop(1, #7b0a2e));
	background-image:-moz-linear-gradient(top, #fe96c9, #d51875 5%, #7b0a2e);
	background-image:-o-linear-gradient(top, #fe96c9, #d51875 5%, #7b0a2e);
	padding:0;
	color:#eee;
	font-size:20px;
	text-align:center;
}

#header a {
	color:#f3f3f3;
	text-decoration:none;
	font-weight:bold;
	text-shadow:0 -1px 0 rgba(0,0,0,0.5);
}

#footer {
	position:absolute; z-index:2;
	bottom:0; left:0;
	width:100%;
	height:48px;
	background-color:#222;
	background-image:-webkit-gradient(linear, 0 0, 0 100%, color-stop(0, #999), color-stop(0.02, #666), color-stop(1, #222));
	background-image:-moz-linear-gradient(top, #999, #666 2%, #222);
	background-image:-o-linear-gradient(top, #999, #666 2%, #222);
	padding:0;
	border-top:1px solid #444;
}

#wrapper {
	position:absolute; z-index:1;
	top:45px; bottom:48px; left:0;
	width:100%;
	background:#aaa;
	overflow:auto;
}

#scroller {
	position:absolute; z-index:1;
/*	-webkit-touch-callout:none;*/
	-webkit-tap-highlight-color:rgba(0,0,0,0);
	width:100%;
	padding:0;
}

#scroller ul {
	list-style:none;
	padding:0;
	margin:0;
	width:100%;
	text-align:left;
}

#scroller li {
	padding:0 10px;
	height:40px;
	line-height:40px;
	border-bottom:1px solid #ccc;
	border-top:1px solid #fff;
	background-color:#fafafa;
	font-size:14px;
}

#myFrame {
	position:absolute;
	top:0; left:0;
}

</style>
</head>
<body>

<div id="header"><a href="http://cubiq.org/iscroll">iScroll</a></div>
<div id="wrapper">
	<div id="scroller" style="width: 2000px;background-color: #aaaaaa;">
		<ul id="thelist">
			<li>Pretty row 1</li>
			<li>Pretty row 2</li>
			<li>Pretty row 3</li>
			<li>Pretty row 4</li>
			<li>Pretty row 5</li>
			<li>Pretty row 6</li>
			<li>Pretty row 7</li>
			<li>Pretty row 8</li>
			<li>Pretty row 9</li>
		
		</ul>
	</div>
</div>
<div id="footer"></div>

</body>
</html>