$(function() {
	
	$('.login a:first-child').on('click',function(){
		$('#login').show();
		$('.mask').show();
	});
	$('.mask').on('click',function(){
		$(this).hide();
		$('#login').hide();
	});
	$('.login a:last-child').on('click',function(){
		$('#reg').show();
		$('.mask').show();
	});
	$('.mask').on('click',function(){
		$(this).hide();
		$('#reg').hide();
	});
	$('#reg .reg-cont p:last-child a').on('click',function(){
		$('#reg').hide();
		$('#login').show();
	});
	$('#login .login-cont p:last-child a').on('click',function(){
		$('#login').hide();
		$('#reg').show();
	});
	
	//下拉菜单
	$('.nav-cont ul li:nth-child(3)').mouseover(function(){
		$('.drop-down').stop(true,false).slideDown(300);
	}).mouseleave(function(){
		$('.drop-down').stop(true,false).slideUp(300);
	});
	
});

//登录
function login() {
	var username = $('#username').val();
	var password = $('#password').val();
	// 传数据到控制层
	$.ajax({
		type : 'post',
		url : "/MessageBoard/control/login.jsp",
		data : {
			'username' : username,
			'password' : password
		},
		error : function() {
			alert("登录出错！");
		},
		success : function(data) { // 返回成功执行回调函数。
			// alert(data.d);
			if (data == -1) {
				alert('用户名和密码不能为空！');
			} else if (data == -2) {
				alert('用户名不存在！');
			} else if (data == -3) {
				alert('用户名或密码错误！');
			} else if (data == 1) {
				// 登录成功后返回首页
				$('#login').hide();
				$('.mask').hide();
				//登陆成功刷新页面，显示用户
				//window.location.reload();
				top.location.reload();
//				$('.login').hide();
//				$('#user-login span:nth-child(2)').text(username);
//				$('#user-login').show();
			}
		}
	});
};

function not_null() {
	var password = $('#reg-password').val();
	if (password == '') {
		$('#not-same').text('密码不能为空!').show();
	} else {
		$('#not-same').text('两次密码不一致!').hide();
	}
}

// 两次密码是否一致
function secPassword() {
	var password = $('#reg-password').val();
	var sec_password = $('#sec-reg-password').val();
	if (sec_password == '') {
		$('#not-same').text('密码不能为空!').show();
		return;
	} else {
		$('#not-same').text('两次密码不一致!').hide();
	}
	if (password !== sec_password) {
		$('#not-same').show();
	} else {
		$('#not-same').hide();
	}
};

// 用户名是否已存在
function checkUsername() {
	var username = $('#reg-username').val();
	if (username == '') {
		$('#already-username').text('用户名不能为空!').show();
		return;
	} else {
		$('#already-username').text('用户名已存在!').hide();
	}
	$.ajax({
		type : 'post',
		url : '/MessageBoard/control/checkUsername.jsp',
		data : {
			'username' : username
		},
		error : function() {
			alert('检查用户名出错');
		},
		success : function(data) {
			if (data == -1) {
				$('#already-username').show();
			} else {
				$('#already-username').hide();
			}
		}
	})
}

// 注册
function reg() {

	var username = $('#reg-username').val();
	var password = $('#reg-password').val();

	if (username == '' || password == '') {
		alert('用户密码不能为空');
		return;
	}

	if ($('#already-username').css('display') != 'none') {
		alert('这个用户名真的已经有了，换一个吧');
		return;
	}
	if ($('#not-same').css('display') != 'none') {
		alert('所以说了密码不一样啊！！');
		return;
	}

	$.ajax({
		type : 'post',
		url : '/MessageBoard/control/reg.jsp',
		data : {
			'username' : username,
			'password' : password
		},
		error : function() {
			alert('登录出错');
		},
		success : function(data) {
			$('#reg').hide();
		}
	});
};

function toLog() {
	alert('请先登录');
	$('#login').show();
	$('.mask').show();
}


