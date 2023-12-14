// 获取日期
var today = new Date();
// 获取当前年月日
var year = today.getFullYear();
var month = today.getMonth();
var data = today.getDate();

function exit(){
    window.location.href = "exit"
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
    var content = document.getElementById("content")
    frame.style.height = (content.clientHeight-80)+"px";
}

function $(id) {
    return document.getElementById(id);
}

window.onload = function() {
    changeframe();
}