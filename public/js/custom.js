var moveSpeed=200;
//移动到右侧
$('#showPersonInfoToRight').click(function () {
    $('#leftUserInfo').hide(moveSpeed);
    $('#rightUserInfo').show(moveSpeed);
});

//移动到左侧
$('#showPersonInfoToLeft').click(function () {
    $('#rightUserInfo').hide(moveSpeed);
    $('#leftUserInfo').show(moveSpeed);
});

//Tooltip
$('[data-toggle="tooltip"]').tooltip({
    container: 'body'
});

//Popover
$('[data-toggle="popover"]').popover();

$.custrom = {};

$.custrom = {
    msg: function(type,msg){
        iziToast[""+type]({title: '提示',position: 'topCenter',theme: 'light',message: msg});
    },
};