/**
 * Created by jason on 2017/8/6.
 */

function replaceRightAreaContent(url){
    var htmlObj = $.ajax({
        url:url,
        async:false
    });
    // 替换右侧内容区域的html
    $(".right_col").html(htmlObj.responseText);
}