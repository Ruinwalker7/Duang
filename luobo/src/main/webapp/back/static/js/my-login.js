'use strict';

$(function() {

	$("input[type='password'][data-eye]").each(function(i) {
		var $this = $(this),
			id = 'eye-password-' + i,
			el = $('#' + id);

		$this.wrap($("<div/>", {
			style: 'position:relative',
			id: id
		}));

		$this.css({
			paddingRight: 60
		});
		$this.after($("<div/>", {
			html: 'Show',
			class: 'btn btn-primary btn-sm',
			id: 'passeye-toggle-'+i,
		}).css({
				position: 'absolute',
				right: 10,
				top: ($this.outerHeight() / 2) - 12,
				padding: '2px 7px',
				fontSize: 12,
				cursor: 'pointer',
		}));

		$this.after($("<input/>", {
			type: 'hidden',
			id: 'passeye-' + i
		}));

		var invalid_feedback = $this.parent().parent().find('.invalid-feedback');

		if(invalid_feedback.length) {
			$this.after(invalid_feedback.clone());
		}

		$this.on("keyup paste", function() {
			$("#passeye-"+i).val($(this).val());
		});
		$("#passeye-toggle-"+i).on("click", function() {
			if($this.hasClass("show")) {
				$this.attr('type', 'password');
				$this.removeClass("show");
				$(this).removeClass("btn-outline-primary");
			}else{
				$this.attr('type', 'text');
				$this.val($("#passeye-"+i).val());				
				$this.addClass("show");
				$(this).addClass("btn-outline-primary");
			}
		});
	});

	$(".my-login-validation").submit(function() {
		var form = $(this);
        if (form[0].checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
		form.addClass('was-validated');
	});


	document.getElementById("loginForm").addEventListener("submit", function(event) {
		event.preventDefault(); // 阻止表单默认提交行为
		if(document.getElementById("email").value ===""){
			document.getElementsByClassName("invalid-feedback")[0].textContent="请输入用户名"
			return
		}else if(document.getElementById("password").value===""){
			document.getElementsByClassName("invalid-feedback")[1].textContent="请输入密码"
			return;
		}else if(document.getElementById("code").value===""){
			document.getElementById("warning1").textContent="请输入验证码"
			document.getElementById("warning1").style.display="block";
			return;
		}

		fetch("/user/login", {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				username: document.getElementById("email").value, // 确保提供了 'name' 参数
				password: document.getElementById("password").value,
				code:  document.getElementById("code").value
			})
		})
			.then(response => {
				// 检查HTTP响应状态
				if (response.status === 302) {
					// 获取重定向的URL
					window.location.href = response.headers.get('Location');
					return response.json();
				}
				else if (!response.ok) {
					throw new Error(`Network response was not ok: ${response.status}`);
				}
				return response.json();
			}).then(data =>{
				let timestamp;

				document.getElementById("warning1").textContent=data.message
				document.getElementById("warning1").style.display="block";
				if (data.code === 0) {
					window.location.href = "/home"
				} else if(data.code===2002){
					document.getElementById("code").value =""
					timestamp = new Date().getTime();
					captchaImage.src = '/captcha?' + timestamp;
					console.error('请求失败:', data.code, data.message);
				} else if(data.code===2001){
					document.getElementById("code").value =""
					document.getElementById("password").value =""
					timestamp = new Date().getTime();
					captchaImage.src = '/captcha?' + timestamp;
					console.error('请求失败:', data.code, data.message);
				}
			})
			.catch(error => {
				// 处理错误
				document.getElementById("warning1").textContent="服务器出现问题！"
				document.getElementById("warning1").style.display="block";
				console.error("There was a problem with the fetch operation:", error);
			});
	});

	var captchaImage = document.getElementById('verity-code');
	// 为图片添加点击事件监听器
	captchaImage.addEventListener('click', function() {
		var timestamp = new Date().getTime();
		captchaImage.src = '/captcha?' + timestamp;
	});
});
