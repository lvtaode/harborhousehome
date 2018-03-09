$("#updateYzm").on("click",function(){
        // console.log(1);
				// console.log(this);
        this.src = "data/yzm/code_gg.php";
})
// updateYzm.onclick = function(){
//     this.src = "data/code_gg.php";
// }
$("div.yzm a").on("click",e=>{
    e.preventDefault();
		var $tar=$(e.target) 
//    console.log(1);
//    console.log($tar.siblings("img"));
		$tar.siblings("img").attr("src","data/yzm/code_gg.php");
})
//未选中禁用注册按钮功能
$("div.line>:checkbox").on("click",e=>{
    // console.log(1);
    var $tar=$("div.register-btn>button");
    $tar.toggleClass("available");
    if( $tar.hasClass("available")){
        $tar.attr("disabled",false);
    }else{
        $tar.attr("disabled",true);
    }
});
//验证输入内容功能
(()=>{
    var $uname=$("form [name=uname]"),
        $upwd=$("form [name=upwd]"), $rupwd=$("form [name=rupwd]"),
        $yzm=$("form [name=yzm]"),$form=$("form");
    // console.log($form,sp,);
    function vali(x,sp,min,max){
        var $span=$(sp);//查找$txt旁边的span
        if(!x.val()){
            $span.removeClass("ok");
            $span.html("不能为空!");
            return false;
        }
        if(x.val().trim().length>=min
            &&x.val().trim().length<=max){
            $span.html("");
            $span.addClass("ok");
            return true;
        }else{
            $span.removeClass("ok");
            $span.html("必须介于"+min+"~"+max+"位之间!");
            return false;
        }
    };
    $uname.blur((e)=>{
        if(vali($uname,"div.name span",3,9)){
            checkName(e.target);
        }

    });
    function checkName(txt){
        return new Promise(callback=>{
            $.ajax({
                type:"post",
                url:"data/routes/users/checkName.php",
                data:"uname="+txt.value.trim(),
                dataType:"text"
            }).then(text=>{
                if(text=="false"){
                   $("div.name span").removeClass("ok")
                                        .html("用户名已存在!");
                }
                else
                    callback();
            })
        })
    }
    $uname.focus(()=>{
        $("div.name span").removeClass("ok")
                                .html("用户名介于3-9位之间");
    });
    $upwd.focus(()=>{
        $("div.upwd span").removeClass("ok")
                             .html("密码介于6-12位之间");
    });
    $upwd.blur(()=>{
        vali($upwd,"div.upwd span",6,12);
    });
    function ruPwd(){
        if(vali($rupwd,"div.rupwd span",6,12)){
            if($upwd.val()==$rupwd.val()){
                $("div.rupwd span").html("")
                                      .addClass("ok");
                return true;
            }else{
                $("div.rupwd span").removeClass("ok")
                                        .html("两次密码不一致");
                return false;
            }
        }
    }
    $rupwd.blur(()=>{
        ruPwd();
    });
    function yzm(){
        var yzmReg = /^[a-z]{4}$/i;
        if(!yzmReg.test($yzm.val())){
            $("div.yzmInput span").removeClass("ok")
                                    .html("验证码格式不正确");
            return false;
        }else{
            $("div.yzmInput span").html("")
                                    .addClass("ok");
            return true;
        }
    }
    $yzm.blur(()=>{
        yzm();
    });
    $("#btn").on("click",(e)=>{
        e.preventDefault();
        var rName=vali($uname,"div.name span",3,9),
            uPwd =vali($upwd,"div.upwd span",6,12),
            uPwd2=ruPwd(),rYzm = yzm();
        // console.log(rName,uPwd,uPwd2,rYzm);
        if(rName&&uPwd&&uPwd2&&rYzm){
            // 注册功能
            $.ajax({
                type:"POST",
                url:"data/routes/users/register.php",
                data:"uname="+$uname.val()+"&upwd="+$upwd.val(),
                dataType:'text'
            }).then(()=>{
                location="login.html"
            })
        }
    })
})();