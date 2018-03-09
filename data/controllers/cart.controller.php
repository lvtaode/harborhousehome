<?php
    require_once("../../init.php");
    function addToCart(){
        global $conn;
        session_start();
        @$uid=$_SESSION["uid"];
        @$lid=$_REQUEST["lid"];
        @$count=$_REQUEST["count"];
        if($uid){
        	$sql="select * from hb_shoppingcart_item where uid=$uid and lid=$lid";
        	$result=mysqli_query($conn,$sql);
            //如果$uid的购物车中有$lid商品
            if(count(mysqli_fetch_all($result,1)))
                $sql="update hb_shoppingcart_item set count=count+$count where uid=$uid and lid=$lid";
            else//否则
                $sql="insert into hb_shoppingcart_item (uid,lid,count) values ($uid,$lid,$count)";
            mysqli_query($conn,$sql);
        }
    }
    function updateCart(){
            global $conn;
	        @$iid=$_REQUEST["iid"];
	        @$count=$_REQUEST["count"];
	    if($count==0)
		    $sql="delete from hb_shoppingcart_item where iid=$iid";
	    else
		    $sql="update hb_shoppingcart_item set count=$count where iid=$iid";
	        mysqli_query($conn,$sql);
    }
    function getCart(){
    	global $conn;
    	session_start();
    	@$uid=$_SESSION["uid"];
    	if($uid){
    		//$sql="select iid, lid, title, spec, price, count ,(select md from hb_product_pic where lid=lid) as md from hb_shoppingcart_item inner join hb_product on lid=lid where uid=$uid";
   	$sql="SELECT iid, title,material, hb_shoppingcart_item.lid,spec, price, count,(select md from hb_product_pic where hb_product_pic.lid=hb_shoppingcart_item.lid) as md FROM hb_shoppingcart_item inner join hb_product ON hb_shoppingcart_item.lid=hb_product.lid WHERE uid=$uid";
   		$result=mysqli_query($conn,$sql);
   		echo json_encode(mysqli_fetch_all($result,1));
//    		echo json_encode(mysqli_fetch_all($result,1));
    	}else{
    		echo json_encode([]);
    	}
    }
    function clearCart(){
    	global $conn;
    	session_start();
    	@$uid=$_SESSION["uid"];
    	if($uid){
    		$sql="delete from hb_shoppingcart_item where user_id=$uid";
    		mysqli_query($conn,$sql);
    	}
    }
?>