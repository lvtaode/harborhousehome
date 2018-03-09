$(()=>{
    if(location.search!=""){
        $.ajax({
            type: "get",
            url: "data/routes/products/getProductById.php",
            data: location.search.slice(1),
            success:function(data){
                    console.log(data);
                    var {product:p,imgs}=data;
                    console.log(imgs);
                    var html="";
                    for(var pic of imgs){
                        // console.log(pic.mid);
                        html+=`<li><a href="javascript:;"><img src=${pic.mid}></a></li>`;
                    }
                    $("#title").html(p.title);
                    $("#container").html(html);
                    $("#number").html(`编号:${p.product_number} <span> 销量:${p.sold_count}</span>`);
                    $("#price").html(`￥ ${p.price}`);
                    $("a.material").html(p.material);
                    $("#spec").html(p.spec);
                    $("#img img").attr("src",imgs[0].big);
                    $("div.superMask").css("background-image",`url(${imgs[0].lg})`);
                    $("#min-img").attr("src",imgs[0].small);
                    $("#md-img img").attr("src",imgs[0].mid);
                    $("#addCart").on("click",e=>{
                        $.ajax({
                            type:"get",
                            url:"data/routes/users/isLogin.php",
                            success:function (data) {
                                if(data.ok==1){
                                    var count=parseInt($("#count").val());
                                    var lid=location.search.split("=")[1];
                                    //console.log(lid);
                                    $.ajax({
                                        type:"get",
                                        url:"data/routes/cart/addToCart.php",
                                        data:"lid="+lid+"&count="+count,
                                        dataType:"text",
                                        success:function(){
                                            alert("加入购物车成功!");
                                            $("#count").val(1);//重置input的值为1
                                        }
                                    })
                                }else{
                                    var url=location.href;
                                    //将back参数值中的: /等保留字转为单字节
                                    url=encodeURIComponent(url);
                                    location="login.html?back="+url;
                                }
                            }
                        })
                    });
                // 商品详情放大镜功能
                $("div.bigMask").mouseover(e=>{
                    var $tar=$(e.target);
                    // console.log(1);
                    $tar.siblings("div.mask").show()
                        .parent().siblings().show();
                });
                $("div.bigMask").mouseleave(e=>{
                    var $tar=$(e.target);
                    // $tar.siblings("div.mask").hide()
                    //     .parent().siblings().hide();
                    $("div.mask").hide();
                    $("div.superMask").hide();
                });
                $("div.bigMask").mousemove(e=>{
                    var Msize = 278;
                    var x=e.offsetX,y=e.offsetY;
                    var top=y-Msize/2,left=x-Msize/2;
                    // console.log(x,y);
                    var $mask = $("div.mask");
                    // console.log($mask);
                    if(top<0) top=0;
                    else if(top>340) top=340;
                    if(left<0) left=0;
                    else if(left>340) left=340;
                    $mask.css({"left":left,"top":top});
                    var position = -1.5*left+"px "+ -2*top+"px";
                    $("div.superMask").css({"background-position":position})
                });

//为class为nav-title下ul下的li绑定点击事件
// $("div.nav-title>ul li").on("mouseover",(e=>{
//         var $tar=$(e.target);
//         if(!$tar.is(".underline")){
//             $tar.addClass("underline");
//         }
//     })
// )
// $("div.nav-title>ul li").mouseleave(e=>{
//     var $tar=$(e.target);
//     if($tar.is(".underline")){
//         $tar.removeClass("underline");
//     }
// })
//加减数量功能
                $(".plus").on("click",e=>{
                    var $tar=$(e.target);
                    var i =parseInt( $tar.siblings("input").val());
                    i++;
                    // console.log($tar.siblings("input"));
                    $tar.siblings("input").attr("value",i);

                });
                $(".minus").on("click",e=>{
                    var $tar=$(e.target);
                    var i =parseInt( $tar.siblings("input").val());
                    if(i==1) return;
                    i--;
                    // console.log($tar.siblings("input"));
                    $tar.siblings("input").attr("value",i);

                });
//==============================================
//右侧小图点击移动图片功能
                var times = 0;
                $("div.img-list").on("click","span",e=>{
                    $tar = $(e.target);
                    var MOVE=90;
                    // console.log(1);
                    if($tar.is(".arrowLeft")){
                        // console.log(1);
                        console.log(times);
                        if(times<=0) return;
                        times--;
                        var remove=times*MOVE;
                        $tar.siblings("div.list").children().css("left",-remove);
                    }
                    if($tar.is(".arrowRight")){
                        // console.log(2)
                        console.log(times)
                        times ++;
                        var remove=times*MOVE;
                        $tar.siblings("div.list").children().css("left",-remove);
                    }
                });

//==============================================
                $("div.nav-title>ul").on("click","li",e=>{
                    var $tar=$(e.target);
                    if(!$tar.is(".underline")){
                        $tar.addClass("underline").siblings()
                            .removeClass("underline");
                        var $menu =$tar.parent().parent().siblings().children("div.hide");
                        $menu.removeClass("hide").siblings().addClass("hide");
                    }

                })
// 鼠标移入/移出显示/隐藏图片功能
                $("li.min-img a img").mouseover(e=>{
                    // console.log(1);
                    var $tar = $(e.target);
                    $tar.parent().siblings("div").show();
                });
                $("li.min-img a img").mouseout(e=>{
                    // console.log(1);
                    var $tar = $(e.target);
                    $tar.parent().siblings("div").hide();
                });
                }
        })
    }

});
