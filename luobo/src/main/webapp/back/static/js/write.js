function resizeIframe(iframe) {
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
var testEditor,testEditor2;

window.onload = function (){

    testEditor2 = editormd("test-editormd2", {

        width   : "100%",
        height  : 300,
        watch : false,                // 关闭实时预览
        syncScrolling : "single",
        path    : "editor.md/lib/",
        toolbarIcons : function() {
            // Or return editormd.toolbarModes[name]; // full, simple, mini
            // Using "||" set icons align right.
            return ["undo", "redo", "|", "bold", "del", "quote","|", "h1","h2","h3","h4","h5","h6","|", "list-ul","list-ol","hr","|","reference-link", "link","image","code","preformatted-text","pagebreak","html-entities","table","emoji","|","goto-line", "preview", "watch", "|", "fullscreen","search","clear"]
        },
    });

    testEditor = editormd("test-editormd", {

        width   : "100%",
        height  : 640,
        watch : true,                // 关闭实时预览
        syncScrolling : "single",
        path    : "editor.md/lib/",
        imageUpload : true,
        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
        imageUploadURL : "/api/upload",
        toolbarIcons : function() {
            // Or return editormd.toolbarModes[name]; // full, simple, mini
            // Using "||" set icons align right.
            return ["undo", "redo", "|", "bold", "del", "quote","|", "h1","h2","h3","h4","h5","h6","|", "list-ul","list-ol","hr","|","reference-link", "link","image","code","preformatted-text","pagebreak","html-entities","table","emoji","|","goto-line", "preview", "watch", "|", "fullscreen","search","clear"]
        },
        onload : function() {
            testEditor2.unwatch()
            testEditor.watch()
            // testEditor.unwatch()
            // alert("onload");
            // this.setMarkdown("### onloaded");
            // console.log("onload =>", this, this.id, this.settings);
        }
    });


}
function getCurrentDateTime() {
    var now = new Date();

    var year = now.getFullYear();
    var month = String(now.getMonth() + 1).padStart(2, '0');
    var day = String(now.getDate()).padStart(2, '0');
    var hours = String(now.getHours()).padStart(2, '0');
    var minutes = String(now.getMinutes()).padStart(2, '0');


    return `${year}-${month}-${day}T${hours}:${minutes}`;
}

function getFirstImageSrc(htmlString) {
    // 创建一个新的DOM解析器
    var parser = new DOMParser();
    // 将HTML字符串解析为文档对象
    var doc = parser.parseFromString(htmlString, "text/html");
    // 尝试找到第一个<img>标签
    var img = doc.querySelector("img");
    // 如果找到了<img>标签，返回其src属性
    return img ? img.src : null;
}



$(document).ready(function() {


    $('#submitArticle').click(function() {
        var htmlString = testEditor.getPreviewedHTML();
        var firstImageSrc = getFirstImageSrc(htmlString);
        console.log(firstImageSrc); // 输出：image1.jpg
        // 使用jQuery简化数据收集
        var data = {
            title: $('#titleInput').val(),
            content: testEditor.getMarkdown(),
            blogAbstract: testEditor2.getPreviewedHTML(),
            blogAbstractText:testEditor2.getMarkdown(),
            html: testEditor.getPreviewedHTML(),
            publishTime: $('#createDate').val()==""?getCurrentDateTime():$('#createDate').val(),
            lastUpdateTime: getCurrentDateTime(),
            categoryID: $("#categorySelector").val(),
            tags: $("#tags").val(),
            coverURL:firstImageSrc
        };

        console.log(data)
        // 将数据转换为JSON格式
        var jsonData = JSON.stringify(data);

        // 使用jQuery简化Ajax请求
        $.ajax({
            url: '/blog/create',
            type: 'POST',
            contentType: 'application/json; charset=UTF-8',
            data: jsonData,
            success: function(response) {
                console.log('Success:', response);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
});