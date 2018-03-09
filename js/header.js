//加载main.html->自动执行header.js
$(()=>{
    $("#header").load("header.html",()=>{
        //搜索功能
        if(location.search)
            $("#txtSearch").val(
                decodeURI(location.search.split("=")[1])
            );
        $("[data-trigger=search]").click(()=>{
            //获得id为txtSearch的内容,去掉开头和结尾的空格保存在变量kw中
            var kw=$("#txtSearch").val().trim();
            if(kw!=="")//如果kw不为""
            //用location跳转到products.html?kw=kw
                location="product_list.html?kw="+kw;
        });
        loadStatus();
        $("#logout").on("click",(e)=>{
            console.log(1);
            e.preventDefault();
            $.get("data/routes/users/logout.php")
                .then(()=>{
                   console.log(2);
                   location.reload();
                })
        });

    });
    function loadStatus(){
       //判断是否登录
        $.get("data/routes/users/isLogin.php")
            .then(data=>{
                //data:{ok:1,uname:xxx}
                if(data.ok==1){
                    $("li.isLogin,li.isRegister").hide();
                    $("li.center").show();
                    $("#welcome").html("欢迎您,"+data.uname);
                }
            })
    }
});
//回顶部按钮
$(window).scroll(()=>{
  // var scrollTop=document.body.scrollTop
  //     ||document.documentElement.scrollTop;
  // console.log($(window).scrollTop());
  $(window).scrollTop()>=500?$("div.scroll").show():$("div.scroll").hide();
  $("div.scroll").on("click",()=>{
    $(document.documentElement).stop(true).animate({
      scrollTop:0
    },1000);
  })
});