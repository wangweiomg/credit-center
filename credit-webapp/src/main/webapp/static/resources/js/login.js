$(function() {
	// Waves初始化
	Waves.displayEffect();
	// 输入框获取焦点后出现下划线
	$('.form-control').focus(function() {
		$(this).parent().addClass('fg-toggled');
	}).blur(function() {
		$(this).parent().removeClass('fg-toggled');
	});
});
Checkbix.init();
$(function() {
	// 点击登录按钮
	$('#login-bt').click(function() {
		login();
	});
	// 回车事件
	$('#username, #password').keypress(function (event) {
		if (13 == event.keyCode) {
			login();
		}
	});
});
// 登录
var BASE_PATH = '';
var BACK_URL = '/';
function login() {
    var pass = $("#password").val();
    // var srcs = CryptoJS.enc.Utf8.parse(pass)
    // var key  = CryptoJS.enc.Utf8.parse('o7H8uIM2O5qv65l2');
    // var encrypted = CryptoJS.AES.encrypt(srcs, key, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
    $.ajax({
		url: BASE_PATH + '/login',
		type: 'POST',
		data: {
			username: $('#username').val(),
			password: pass,
			rememberMe: $('#rememberMe').is(':checked'),
			backurl: BACK_URL
		},
		beforeSend: function() {

		},
		success: function(json){
		    location.href = '/index';
            console.log(1, json);
            if (json.code == 200) {
				location.href = json.data;
			} else {
				// alert(json.data);
				if (10101 == json.code) {
					$('#username').focus();
				}
				if (10102 == json.code) {
					$('#password').focus();
				}
			}
		},
		error: function(error){
			console.log(2, error);
		}
	});
}