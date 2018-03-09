<?php
    require_once("../../init.php");
    //注册功能  创建register函数
    function register(){
        global $conn;
        @$uname=$_REQUEST["uname"];
        @$upwd=$_REQUEST["upwd"];
        if($uname&&$upwd){
            $sql="INSERT INTO hb_user VALUES(null,'$uname','$upwd')";
            mysqli_query($conn,$sql);
        }
    }
    //检查用户名是否存在
    function checkName(){
        global $conn;
        @$uname=$_REQUEST["uname"];
        if($uname){
           $sql="SELECT * FROM hb_user WHERE uname='$uname'";
           $result=mysqli_query($conn,$sql);
           $users=mysqli_fetch_all($result,1);
           if(count($users)!=0){
              return false;
           }else{
              return true;
           }
        }
    }
    //登录验证
    function login(){
        global $conn;
        @$uname=$_REQUEST["uname"];
        @$upwd=$_REQUEST["upwd"];
        if($uname&&$upwd){
            $sql="SELECT * FROM hb_user WHERE uname='$uname'";
            $sql.=" AND binary upwd='$upwd'";
            $result=mysqli_query($conn,$sql);
            $user=mysqli_fetch_all($result,1);
            if(count($user)!=0){
                session_start();
                $_SESSION["uid"]=$user[0]["uid"];
                return true;
            }else
                return false;
        }
    }
    //检查是否登录
    function isLogin(){
        global $conn;
        session_start();
        @$uid=$_SESSION["uid"];
        if($uid){
            $sql="SELECT uname FROM hb_user WHERE uid=$uid";
            $result = mysqli_query($conn,$sql);
            $user=mysqli_fetch_all($result,1);
            return ["ok"=>1,"uname"=>$user[0]["uname"]];
        }else{
            return ["ok"=>0];
        }
    }
    //退出登录
    function logout(){
        session_start();
        $_SESSION["uid"]=null;
        echo 'true';
    }
?>