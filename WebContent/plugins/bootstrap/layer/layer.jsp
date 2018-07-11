<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../pub/TagLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>layer</title>
<link rel="stylesheet" href="${ctx}/js/layer/skin/default/layer.css"/>

<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/layer/layer.js"></script>
  
  
<script>

 

function fun1(){
	//初体验
	layer.alert('内容')
}
function fun2(){
	layer.alert('内容', {
	  icon: 1,
	  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
	})
}
//询问框

function fun3(){
	layer.confirm(
		'您是如何看待前端开发？',
		{
			btn: ['重要','奇葩'] //按钮
		}, 
		function(){
			layer.msg('的确很重要', {icon: 1});
		}, 
		function(){
			layer.msg('也可以这样', 
				{
					time: 20000, //20s后自动关闭
					btn: ['明白了', '知道了']
				}
			);
		}
	);
}


function fun4(){
	//提示层
	layer.msg('玩命提示中');
}

function fun5(){
	//墨绿深蓝风
	layer.alert(
		'墨绿风格，点击确认看深蓝', 
		{
			skin: 'layui-layer-molv',//样式类名
			closeBtn: 0
		}, 
		function(){
			layer.alert('偶吧深蓝style', 
				{
				skin: 'layui-layer-lan',
				closeBtn: 0,
				shift: 4 //动画类型
				}
			);
		}
	);
}


function fun6(){
	//捕获页
	layer.open({
	  type: 1,
	  shade: false,
	  title: false, //不显示标题
	  content: $('.layer_notice'), //捕获的元素
	  cancel: function(index){
		layer.close(index);
		this.content.show();
		layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', {time: 5000, icon:6});
	  }
	});
}


function fun7(){
	//页面层
	layer.open({
	  type: 1,
	  skin: 'layui-layer-rim', //加上边框
	  area: ['420px', '240px'], //宽高
	  content: 'html内容'
	});
}


function fun8(){
	//自定页
	layer.open({
	  type: 1,
	  skin: 'layui-layer-demo', //样式类名
	  closeBtn: 0, //不显示关闭按钮
	  shift: 2,
	  shadeClose: true, //开启点击遮罩关闭
	  content: '内容'
	});
}


function fun9(){
	//tips层
	layer.tips('Hi，我是tips', '吸附元素选择器，如#id');
}


function fun10(){
	//iframe层
	var i = layer.open({
	  type: 2,
	  title: 'layer mobile页',
	  shadeClose: true,
	  shade: 0.1,
	  area: ['380px', '90%'],
	  content: 'http://layer.layui.com/mobile/' //iframe的url
	}); 
	//alert(i);
}

function fun11(){
	//iframe窗
	layer.open({
	  type: 2,
	  title: false,
	  closeBtn: 0, //不显示关闭按钮
	  shade: [0],
	  area: ['340px', '215px'],
	  // area: ['80%', '90%'],
	  offset: 'rb', //右下角弹出
	  time: 2000, //2秒后自动关闭
	  shift: 2,
	  content: ['test/guodu.html', 'no'], //iframe的url，no代表不显示滚动条
	  end: function(){ //此处用于演示
		layer.open({
		  type: 2,
		  title: '很多时候，我们想最大化看，比如像这个页面。',
		  shadeClose: true,
		  shade: false,
		  maxmin: true, //开启最大化最小化按钮
		  //area: ['893px', '600px'],
		   area: ['80%', '90%'],
		  content: 'http://fly.layui.com/'
		});
	  }
	});
}



function fun12(){
	//加载层
	var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
}


function fun13(){
	//loading层
	var index = layer.load(1, {
	  shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
}


function fun14(){
	//小tips
	layer.tips('我是另外一个tips，只不过我长得跟之前那位稍有些不一样。', '吸附元素选择器', {
	  tips: [1, '#3595CC'],
	  time: 4000
	});
}

function fun15(){
	//prompt层
	layer.prompt({
	  title: '输入任何口令，并确认',
	  formType: 1 //prompt风格，支持0-2
	}, function(pass){
	  layer.prompt({title: '随便写点啥，并确认', formType: 2}, function(text){
		layer.msg('演示完毕！您的口令：'+ pass +' 您最后写下了：'+ text);
	  });
	});
}


function fun16(){
	//tab层
	layer.tab({
	  area: ['600px', '300px'],
	  tab: [{
		title: 'TAB1', 
		content: '内容1'
	  }, {
		title: 'TAB2', 
		content: '内容2'
	  }, {
		title: 'TAB3', 
		content: '内容3'
	  }]
	});
}


function fun17(){
	//相册层
	$.getJSON(
		'test/photos.json?v='+new Date, 
		function(json){
			layer.photos({
				photos: json ,//格式见API文档手册页
				shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
			});
		});
}


<%
	int x = (int)(Math.random()*100);
%>
function fun18(){
	//iframe层
	var i = layer.open({
	  type: 2,
	  title: 'layer mobile页',
	  shadeClose: true,
	  shade: 0.1,
	  area: ['380px', '90%'],
	  content: '${ctx}//bootstrap/bootstrap!layerIn.do?title=<%=x%>' //iframe的url
	}); 
	alert("第" + i + "层");
}


  </script>
</head>
<body>

<button onclick="fun1()">初体验</button>
<button onclick="fun2()">第三方扩展皮肤</button>
<button onclick="fun3()">询问层</button>
<button onclick="fun4()">提示层</button>
<button onclick="fun5()">墨绿深蓝风</button>
<button onclick="fun6()">捕获页</button>
<button onclick="fun7()">页面层</button>
<button onclick="fun8()">自定义页</button>
<button onclick="fun9()">tips层</button>
<button onclick="fun10()">iframe层</button>
<button onclick="fun11()">iframe窗</button>
<button onclick="fun12()">加载层</button>
<button onclick="fun13()">loading层</button>
<button onclick="fun14()">小tips</button>
<button onclick="fun15()">prompt层</button>
<button onclick="fun16()">tab层</button>
<button onclick="fun17()">相册层</button>


<div class="layer_notice">捕获层......</div>
<button onclick="fun18()">嵌套弹出层</button>
<br/>
<a href="${ctx}/plugins/bootstrap/layer/api/layui_doc.html" target="_blank">Layer API</a>
</body>
</html>