var BASE_PREFIX = "http://localhost:8080";

var api = {
    NOTICE_SHOW_URL: BASE_PREFIX + "/notice",
}

doAjax = function(url, data, success, options) {
    var that = this;
    options = options || {};
    data = data || {};
    return $.ajax({
        type: options.type || 'post',
        dataType: options.dataType || 'json',
        data: data,
        url: url,
        success: function(res) {
            console.log(res);
            if(res.code == 0) {
                console.log("category return success")
                success && success(res);
            } else {
                layer.msg(res.msg || res.code, {
                    shift: 6
                });
            }
        },
        error: function(e) {
            options.error || layer.msg('请求异常，请重试', {
                shift: 6
            });
        }
    });
}


doAjax( api.NOTICE_SHOW_URL ,{},function (res){
    res.data.forEach(function(element) {
        var newDiv = $('<div class="layui-panel">\n' +
            '  <div style="padding: 9px;" class="notice-panel">' +
            '<i class="fa fa-bullhorn" />   '+element.content+'</div>\n' +
            '</div>')
        $('#notice-content').append(newDiv)
    });

    //公告
    layui.use(function(){
        var carousel = layui.carousel;
        var form = layui.form;
        var util = layui.util;
        var $ = layui.$;

        // 渲染
        var carInst = carousel.render({
            elem: '#ID-carousel-demo-set',
            width: 'auto',
            height: '30px',
            anim: 'updown',
            interval: 3000,
            arrow: 'none',
            indicator: 'none',
        });
        var height = $('.notice-panel').eq(0).outerHeight()
        console.log(height)
        carInst.reload({
            height: height+'px',
        })
    });

},{})



// $(window).resize(function() {
//     console.log("窗口大小改变了！");
// });
let index = 0; // 当前显示的图片索引
// function moveSlide(step) {
//     const slides = document.querySelectorAll('.slide');
//     const totalSlides = slides.length;
//
//     // 更新当前图片的索引
//     index = (index + step + totalSlides) % totalSlides;
//
//     // 计算并设置新位置
//     const newTransformValue = 'translateX(' + (-index * 100) + '%)';
//     document.querySelector('.slides').style.transform = newTransformValue;
// }

function moveSlide(step) {
    const slides = document.querySelectorAll('.slide');
    const indicators = document.querySelectorAll('.indicator');
    const totalSlides = slides.length;

    // 更新当前图片的索引
    index = (index + step + totalSlides) % totalSlides;

    // 更新幻灯片
    const newTransformValue = 'translateX(' + (-index * 100) + '%)';
    document.querySelector('.slides').style.transform = newTransformValue;

    // 更新指示器
    indicators.forEach(ind => ind.classList.remove('active'));
    indicators[index].classList.add('active');
}

function movetoSlide(step) {
    const slides = document.querySelectorAll('.slide');
    const indicators = document.querySelectorAll('.indicator');
    const totalSlides = slides.length;

    // 更新当前图片的索引
    index = (step + totalSlides) % totalSlides;

    // 更新幻灯片
    const newTransformValue = 'translateX(' + (-index * 100) + '%)';
    document.querySelector('.slides').style.transform = newTransformValue;

    // 更新指示器
    indicators.forEach(ind => ind.classList.remove('active'));
    indicators[index].classList.add('active');
}

// setInterval(function() {
//     moveSlide(1);
// }, 3000); // 每3秒自动播放下一张

