$(function(){

   $('.photos').infinitescroll({
        navSelector  : "#infinite_scroll_nav",
        nextSelector : ".next.nav_button",
        itemSelector : "article.photo",
        loading: {
            img: 'http://sawyerhollenshead.com/images/loader.gif',
            msgText: '',
            finishedMsg: ''
        }
   });

});