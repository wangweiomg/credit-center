'use strict';
(function () {
    //侧边栏切换内容页面
    function curContent() {
        var $iframe=$('#iframe');
        $('.panel-body a,.noBody').click(function () {
            $('#aside .active').removeClass('active');
            if($(this).hasClass('noBody')){
                $(this).closest('dt').addClass('active');
            }else{
                $(this).addClass('active');
            }
            $iframe.attr('src',$(this).attr('data-href'));
        });
    }
    function start() {
        //侧边栏切换内容页面
        curContent();
    }
    return {
        start: start
    }
}()).start();