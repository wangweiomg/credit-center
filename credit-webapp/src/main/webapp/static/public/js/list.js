'use strict';
(function () {
    //删除tab标签
    function closeTab() {
        var navTabs=$('#nav-tabs');
        navTabs.on('click','.close-tab',function () {
            var parent=$(this).closest('li');
            if(parent.hasClass('active')){
                parent.remove();
                navTabs.find('li').eq(0).addClass('active');
                $('#home').addClass('active in');
                $('#detail').removeClass('active in');
            }else{
                $(this).closest('li').remove();
            }
        })
    }
    //新建输入框
    function addInput() {
        var $btn=$('#formFile select');
        $btn.on('change',function () {
            var $val=$(this).find("option:selected").val();
            if($val==='新建'){
                $(this).after('<input type="text" placeholder="请输入附件名" class="form-control">');
            }
            return false;
        });
    }
    //添加附件
    function addFile() {
        var $btn=$('#addFile');
        var $firstLi=$('#formFile li').eq(0);
        $btn.on('click',function () {
           var  $item=$firstLi.clone(true);
            $(this).closest('li').before($item);
            return false;
        });
    }
    //添加客户详情
    function addClientDetail() {
        var $btnLink=$('.add-tab'),
            $navTabs=$('#nav-tabs'),
            $title=$('#addTabTitle').val();
        $btnLink.click(function () {
            var $tabLinkDetail = $('<li class="active"><a href="#detail" href="javascript:;" data-toggle="tab">'+$title+'&emsp;</a><span class="close-tab">&times;</span></li>');
            $navTabs.find('li').removeClass('active');
            $navTabs.append($tabLinkDetail);
            $('#home').removeClass('in active');
            $('#detail').addClass('in active')
        });
    }
    //自定义下拉框
    function customDropdown() {
        var $customMenu = $('#custom-menu');
        $('#custom-dropdown').click(function () {
            $customMenu.toggle();
        });
        $customMenu.find('.btn').on('click',function () {
            $customMenu.hide();
        });
    }
    //自定义列表
    function checkMenu() {
        var parent=$('#custom-menu'),
            btn=parent.find('.btn-primary'),
            table=$('.table'),
            arrTh=table.find('thead').find('th'),
            arrTr=table.find('tbody').find('tr'),
            arrInput=parent.find('input'),
            arrTitle=[];
        btn.on('click',function () {
           for(var i=0;i<arrInput.length;i++){
               arrTh.eq(i+1).removeClass('hidden');
               arrTr.each(function () {
                   $(this).find('td').eq(i).removeClass('hidden');
               });
               if(arrInput[i].checked==false){
                   arrTitle.push(i);
                   arrTh.eq(i+1).addClass('hidden');
                   arrTr.each(function () {
                       $(this).find('td').eq(i).addClass('hidden');
                   });
               }
           }
        });
    }
    //用户进度
    function userProcess() {
        var $btnPrev = $('.btn-prev'),
            $btnNext = $('.btn-next'),
            $index = 0,
            $dlForm = $('#dl_form').find('dd'),
            $stepsWrap = $('.sui-steps .wrap');
        $btnNext.click(function () {
            $index = $(this).closest('.btns-tab').index();
            $(this).closest('.btns-tab').addClass('hidden').next('.btns-tab').removeClass('hidden');
            $dlForm.eq($index).removeClass('hidden').siblings('dd').addClass('hidden');
            $stepsWrap.eq($index).find('div').addClass('current').removeClass('todo')
                .end().prev().find('div').addClass('finished').removeClass('current')
                .find('.round').html('<span class="glyphicon glyphicon-ok"></span>');
        });
        $btnPrev.click(function () {
            $index = $(this).closest('.btns-tab').index();
            $(this).closest('.btns-tab').addClass('hidden').prev('.btns-tab').removeClass('hidden');
            $dlForm.eq($index - 2).removeClass('hidden').siblings('dd').addClass('hidden');
            $stepsWrap.eq($index - 2).find('div').addClass('current').removeClass('finished')
                .find('.round').html($index - 1)
                .end().end().next().find('div').addClass('todo').removeClass('current');

        });
    }
    //提交成功
    function submitSuccess() {
        var $btnSubmit=$('#btnSubmit'),
            $text=$('#successText');
        $btnSubmit.on('click',function () {
            $text.fadeIn(function () {
                // window.location.href="http://www.baidu.com";
            });

        });
    }
    function start() {
        //删除tab标签
         closeTab();
        //新建输入框
        addInput();
        //添加附件
        addFile();
        //添加客户详情
        addClientDetail();
        //自定义下拉框
        customDropdown();
        //自定义列表
         checkMenu();
        //用户进度
        userProcess();
        //提交成功
        submitSuccess();
    }
    return {
        start:start
    }
}()).start();