$("ul.menu-nav").on("click","span",e=>{
    $tar = $(e.target);
    $tar.toggleClass("down-triangle");
    $tar.parent().siblings().children("span").removeClass("down-triangle");
});
$("ul.menu-nav").on("click","li>a",e=>{
    e.preventDefault();
    $tar = $(e.target);
    $tar.prev().toggleClass("down-triangle");
    $tar.parent().siblings().children("span").removeClass("down-triangle");
});
function loadProducts(pno=0){
    $.ajax({
        type:"GET",
        url:"data/routes/products/getProductByFid.php?fid=1",
        data:{pno:pno},
        success:function(output){
           console.log(output.imgs);
           var data=output.data;
           var html="";
           for(var p of data){
               html+=`<div class="list">
               <ul>
                  <li>
                     <a href="product_detail.html?lid=${p.lid}">
                        <img id="mid" src="">
                     </a>
                  </li>
                  <li>
                     <a href="product_detail.html?lid=${p.lid}">
                        <img id="small" src="">
                     </a>
                  </li>
                  <li>
                     <h3><a href="product_detail.html?lid=${p.lid}">${p.title}</a></h3>
                     <p class="color-black">${p.price}<span class="rt color-red"><i>NEW Sale</i></span></p>
                  </li>
               </ul>
            </div>`;

           }
          // console.log(output.imgs[0].md);
          //   var imgs =output.imgs;
          //   for(pic of imgs){
          //     $("#mid").attr("src",pic.sm);
          //     $("#small").attr("src",pic.md);
          //   }
           $("div.clear").html(html);
           var $pageNav=$("div.pageNav");
           var html=`
                    <a id="firstly" class="disabled active" href="#"> << </a>
                    <a id="prev" class="disabled active" href="#"> < </a>
                    <span>${pno+1}/${output.pageCount}</span>
                    <a id="next" class="disabled active" href="#"> > </a>
                    <a id="last" class="disabled active"  href="#"> >> </a>
                   `;
           $pageNav.html(html);
            $("#firstly").on("click",e=>{
               e.preventDefault();
                var pno=0;
                loadProducts(pno);
            });
            $("#last").on("click",e=>{
                e.preventDefault();
                var pno=output.pageCount-1;
                loadProducts(pno);
            });
            $("#prev").on("click",e=>{
                e.preventDefault();
                console.log(output.pageNo+1);
                var pno=output.pageNo;
                console.log(pno);
                if(pno=0) return;
                loadProducts(pno);
            });
            $("#next").on("click",e=>{
                e.preventDefault();
                var pno=output.pageNo+1;
                if(pno==output.pageCount) return;
                loadProducts(pno);
            });
            checkAStatus($pageNav,output.pageCount,output.pageNo);
        },
        error:function(){
            alert("网络发了故障，请检查");
        }
    })
}
function checkAStatus($divPages,pageCount,pageNo) {
    if(pageNo!=0&&pageNo!=pageCount-1){
        $divPages.children().children('a').removeClass("disabled");
    }else{
        if(pageNo==0){
            $("#firstly").removeClass("active");
            $("#prev").removeClass("active");
        }
        if(pageNo==pageCount-1){
            $("#last").removeClass("active");
            $("#next").removeClass("active");
        }
    }
}
loadProducts();