// 自动轮播
$(()=>{
    var $li=$("#banner>li");
    var opc=0,i=0;
    // console.log($li[0].style.opacity);
    // console.log($li.length);
   setInterval(()=>{
       $li[i].style.opacity=0;
        i++;
        if(i>=$li.length){i=0}
        opc=0.5;
        // console.log($li[i]);
        setInterval(()=>{
            opc+=0.1;
            if(opc>1){
                opc=1;
            }
            $li[i].style.opacity=opc;
             // console.log($li[i].style)
        },300)
        // console.log($li[i]);
   },8000)
})
//点击轮播
$(()=>{
    var num=0;
    $("div.bannerImg").on("click","i.rt-btn",e=>{
        console.log(1);
        num++;
        if(num>=5){num=1}
        var move=num*-990;
        var $tar = $(e.target);
        // console.log(1);
        $tar.siblings("div.img-box").css("left",move);
    })
    $("div.bannerImg").on("click","i.lf-btn",e=>{
        // console.log(1);
        num--;
        if(num<=1){num=5}
        if(num>=5){num=1}
        var move=num*990;
        console.log(move)
        var $tar = $(e.target);
        // console.log(1);
        $tar.siblings("div.img-box").css("left",-move);
    })
});

// //回顶部按钮
//     $(window).scroll(()=>{
//         // var scrollTop=document.body.scrollTop
//         //     ||document.documentElement.scrollTop;
//         // console.log($(window).scrollTop());
//         $(window).scrollTop()>=500?$("div.scroll").show():$("div.scroll").hide();
//         $("div.scroll").on("click",()=>{
//             $(document.documentElement).stop(true).animate({
//                 scrollTop:0
//             },1000);
//         })
//     });