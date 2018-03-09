$(()=>{
     var $uname=$("#uname"),$upwd=$("#upwd");
    function checkName(txt){
        return new Promise(callback=>{
            $.ajax({
                type:"post",
                url:"data/routes/users/checkName.php",
                data:"uname="+txt.value.trim(),
                dataType:"text"
            }).then(text=>{
                console.log(text);
                if(text=="false"){
                    $("div.name span").addClass("ok")
                        .html("");
                }else
                    $("div.name span").removeClass("ok").html("用户名不存在");
                    callback();
            })
        })
    }

    $uname.blur((e)=>{
        if(!$uname.val().trim()){
            $("div.name span").removeClass("ok").html("用户名不能为空");
        }else
            checkName(e.target);
    });
    $upwd.blur((e)=>{
        if(!$uname.val().trim()){
            $("div.upwd span").removeClass("ok").html("密码不能为空");
        }
    });
   $("div.login-btn").on("click","button",(e)=>{
        e.preventDefault();
       if(!$uname.val().trim()){
           $("div.name span").removeClass("ok").html("用户名不能为空");
           return;
       }
       if(!$upwd.val().trim()){
           $("div.upwd span").removeClass("ok").html("请输入密码");
           return;
       }
       $.post("data/routes/users/login.php",$("#user-login").serialize())
           .then(result=>{
                // console.log(result);
               if(result){
                   if(location.search!==""){
                       location=decodeURIComponent(
                           location.search.slice(6)
                       );
                   }else
                       location="main.html";
               }else{
                   $("div.upwd span").removeClass("ok").html("密码错误!");
               }
           })
   });
});