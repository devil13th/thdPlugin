

//------------------------ window.open 打开窗口 --------------------------------
function openWindow(obj){
	if(obj.url == undefined || obj.url == null){
		throw new Error("please set obj.url");
	}
	var url = obj.url;

	if(url.indexOf("?")!=-1){
		url = url+ "&r_=" + Math.random();
	}else {
		url = url+ "?r_=" + Math.random();
	}
	
	//alert(obj.width + "," + obj.height + "," + obj.top + "," + obj.left);

	var w ;
	if(!obj.width){
		w = screen.width/1.8;
	}else{
		w = parseInt(obj.width);
	}

	var h ;
	if(!obj.height){
		//h = 500;
		
		h=screen.height/1.8;
	}else{
		
		h = parseInt(obj.height);
	}

	var t ;
	if(!obj.top){
		t = 0;
	}else{
		t = parseInt(obj.top);
	}

	var l;
	if(!obj.left){
		l = (screen.width - parseInt(w))/2;
	}else{
		l = parseInt(obj.left);
	}
	
	w = parseInt(w);
	h = parseInt(h);
	l = parseInt(l);
	t = parseInt(t);
	
	//窗口句柄
	var name;
	if(!obj.name){
		name = "win_" + new Date().getTime();
	}else{
		name = obj.name;
	}

	//alert(name);

	//是否可以改变窗口大小
	var resizable = obj.resizable || "yes";

	//是否有滚动条
	var scrollbars= obj.scrollbars || "yes";

	//是否有状态栏
	var status = obj.status || "no";

	//是否有菜单栏
	var menubar = obj.menubar || "no";
	
	//是否有工具栏
	var toolbar = obj.toolbar || "yes";
	
	//是否有地址栏
	var locations = obj.locations || "yes";
	
	return window.open (url,name,"height=" + h + ",width=" + w +  ",top=" + t + ",left=" + l + ",toolbar=" + toolbar + ",menubar=" + menubar + ",scrollbars=" + scrollbars + ", resizable=" + resizable + ",location=" + locations + ", status=" + status + ",hotkeys=esc"); 
}


//打开窗口的快捷方法
function showWin(url,w,h){
	var width = w || "1000px";
	var height = h || "655px";

	openWindow({
		url : url,
		width : width,
		height : height
	});
}


//获取使用window.open打开的窗口的父窗口对象
function getParent(){
	var p = "";
	if (window.opener != undefined) {
		p = window.opener;
	}
	else {
		p = window.dialogArguments;
	};
	return p;
}


