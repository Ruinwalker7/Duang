// 获取日期
var today = new Date();
// 获取当前年月日
var year = today.getFullYear();
var month = today.getMonth();
var data = today.getDate();
var content;
function exit(){
    window.location.href = "exit"
}

function resizeIframe(iframe) {
    console.log(iframe)
    try {
        var iframeDocument = iframe.contentDocument || iframe.contentWindow.document;
        var iframeBody = iframeDocument.body;


        // 调整iframe高度以匹配内容高度
        iframe.style.height = iframeBody.scrollHeight + 'px';

        // 调整iframe宽度以匹配内容宽度（如果需要）
        iframe.style.width = iframeBody.scrollWidth + 'px';
    } catch (e) {
        console.error("Error resizing iframe:", e);
    }
}

function changeframe(){
    // 使用 querySelectorAll 选择所有类名为 "highlight" 的元素
    var elements = document.querySelectorAll(".navItem");
    var frame = document.getElementById("mainframe")
    console.log(elements)
    // 遍历元素列表并对每个元素进行操作
    elements.forEach(function(element) {
        element.addEventListener('click', function() {
            frame.setAttribute("src",this.getAttribute("data-src"))

            })
    })
    frame.addEventListener('load', function() {
        console.log('Iframe loaded!');
        frame.style.height = (content.clientHeight-10)+"px";
        console.log(frame.style.height)
        // 在这里执行其他操作
    });
    content = document.getElementById("content")
    frame.style.height = (content.clientHeight-10)+"px";
}

function $(id) {
    return document.getElementById(id);
}

window.onload = function() {
    changeframe();
}

