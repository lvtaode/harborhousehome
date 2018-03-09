// //查找触发事件的元素
// //绑定事件
// //查找要修改的元素
// //修改元素
//
// //查找class为tree下的所有span,保存在spans中
// var spans =document.querySelectorAll("ul.menu-nav span");
// for(var span of spans){//遍历spans中每个span
//     span.onclick=e=>{//为当前span绑定单击事件
//         var span=e.target;//获得当前span，保存在span中
//         //如果当前span的className是open
//         if(span.className=="right-triangle"){
//             span.className="down-triangle";
//             span.siblings.className="right-triangle";
//         }else if(span.className=="down-triangle"){
//             span.className="right-triangle";
//             span.siblings.className("right-triangle");
//         }
//     }
// }
$("ul.menu-nav").on("click","span",e=>{
    $tar = $(e.target);
    $tar.toggleClass("down-triangle");
    $tar.parent().siblings().children("span").removeClass("down-triangle");
});
$("ul.menu-nav").on("click","li>a",e=>{
    $tar = $(e.target);
    $tar.prev().toggleClass("down-triangle");
    $tar.parent().siblings().children("span").removeClass("down-triangle");
});