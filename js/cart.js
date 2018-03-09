$(()=>{
    $.get("data/routes/users/isLogin.php")
        .then(data=>{
            if(data.ok==0)
                location=
                    "login.html?back="+
                    encodeURIComponent(location.href);
            else{
                 $.get("data/routes/cart/getCart.php").then(data=>{
                    var html="";
                    console.log(data);
                    for(var p of data){
                        html+=`<div class="shopping-item">
                  <ul>
                     <li class="checkbox">
                        <div class="item-pic">
                           <input type="checkbox" class="Cinput" name="checkItem">
                           <a href="product_detail.html?lid=${p.lid}">
                              <img title="Hartford 餐椅" src="${p.md}">
                           </a>
                        </div>
                     </li>
                     <li class="product_name">
                        <div class="item-info">
                           <h3>
                              <a href="#">${p.title}</a>
                           </h3>
                           <p class="material">${p.material}</p>
                           <p class="spec">${p.spec}</p>
                        </div>
                     </li>
                     <li class="product_price">
                        <div class="price">
                           <p class="color-red">￥<span>${p.price}</span></p>
                        </div>
                     </li>
                     <li class="product_num">
                        <div class="number">
                           <input type="text" value=${p.count} class="product_val" name="quantity">
                           <button class="plus">+</button>
                           <button class="minus">-</button>
                        </div>
                     </li>
                     <li class="product_operate">
                        <div class="item-operate">
                           <a href="javascript:;">[ 修改 ]</a>
                           <a href="javascript:;">[ 收藏 ]</a>
                           <a href="javascript:;">[ 删除 ]</a>
                        </div>
                     </li>
                  </ul>
               </div>`;
                    };
                    $("#items").html(html);
                     $(".plus").on("click",e=>{
                         var $tar=$(e.target);
                         var i =parseInt( $tar.siblings("input").val());
                         i++;
                         // console.log($tar.siblings("input"));
                         $tar.siblings("input").attr("value",i);
                        load();
                     });
                     $(".minus").on("click",e=>{
                         var $tar=$(e.target);
                         var i =parseInt( $tar.siblings("input").val());
                         if(i==1) return;
                         i--;
                         // console.log($tar.siblings("input"));
                         $tar.siblings("input").attr("value",i);
                         load();
                     });
                     function load(){
                         var $chbAll=$("#selectAll");
                         $chbAll.on("click",e=>{
                             //获得当前input，保存在chbAll中
                             // console.log(1);
                             var $chbAll=$(e.target);
                             var $chbs=$("#items .Cinput");
                             // console.log($chbAll.is(":checked"));
                             //遍历chbs中每个chb
                             for(var chb of $chbs)
                                 //       //设置chb的checked等于chbAll的checked
                                 chb.checked=$chbAll.is(":checked");
                         });
                         var $chbs=$("#items .Cinput");
                         var count=0;
                         for(var chb of $chbs)
                             chb.onclick=e=>{
                                 var $tar=$(e.target);//获得当前chb
                                 console.log($tar);
                                 var num =$tar.parent().parent()
                                     .siblings("li.product_num").children().children("input").val();
                                 var price=$tar.parent().parent()
                                     .siblings("li.product_price").children().children("p")
                                     .children().html();
                                 if($tar[0].checked){
                                     count+=parseInt(num);
                                     var totalPrice=count*parseFloat(price);
                                     $("#product-count").html(count);
                                     $("#totalPrice").html("￥"+totalPrice);
                                     $("#total-amount").html("￥"+totalPrice);
                                 }else{
                                     count-=parseInt(num);
                                     var totalPrice=count*parseFloat(price);
                                     $("#product-count").html(count);
                                     $("#totalPrice").html("￥"+totalPrice);
                                     $("#total-amount").html("￥"+totalPrice);
                                 }
                                 //查找table下tbody下每行第一个td下的未选中的input,保存在unchecked中
                                 var unchecked=$("#items input:checkbox:not(:checked)");
                                 // console.log(unchecked.length);
                                 if(unchecked.length==0)//如果找到unchecked
                                     $chbAll.prop("checked",true);
                                 // console.log(1);
                                 else//否则
                                     $chbAll.prop("checked",false);
                                 // console.log(2);
                             }
                     };
                    load();
                });
            }
            $("#header").load("header.html");
            $("#footer").load("footer.html");
        })
});