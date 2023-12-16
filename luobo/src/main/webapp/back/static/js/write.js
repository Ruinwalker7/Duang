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
        path    : "editor.md/lib/"
    });

    testEditor = editormd("test-editormd", {

        width   : "100%",
        height  : 640,
        watch : true,                // 关闭实时预览
        syncScrolling : "single",
        path    : "editor.md/lib/"
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

$(document).ready(function() {


    $('#submitArticle').click(function() {

        // 使用jQuery简化数据收集
        var data = {
            title: $('#titleInput').val(),
            content: testEditor.getMarkdown(),
            summary: testEditor2.getPreviewedHTML(),
            html: testEditor.getPreviewedHTML(),
            publishTime: $('#createDate').val()==""?getCurrentDateTime():$('#createDate').val(),
            categoryID: $("#categorySelector").val()
        };

        console.log(data)
        // 将数据转换为JSON格式
        var jsonData = JSON.stringify(data);

        // 使用jQuery简化Ajax请求
        $.ajax({
            url: '/blog/create',
            type: 'POST',
            contentType: 'application/json',
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