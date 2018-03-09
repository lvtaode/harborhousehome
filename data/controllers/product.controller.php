<?php
    require_once("../../init.php");
    function getProductByFid(){
        global $conn;
        @$fid=$_REQUEST["fid"];
        $output=[
        		"count"=>0,//总个数
                "pageSize"=>32,//每页32个
                "pageCount"=>0,//总页数
                "pageNo"=>0,//现在第几页
                "data"=>[],//商品列表
                "imgs"=>[]
        ];
        @$pno=(int)$_REQUEST["pno"];
        if($pno) $output["pageNo"]=$pno;
        if($fid){
            $sql="SELECT hb_product.lid,fid,title,price,lg,sm,md";
            $sql=" FROM hb_product inner join hb_product_pic ON hb_product.fid=hb_product_pic.fid"
            $sql.=" WHERE fid=$fid";
        }
        $result=mysqli_query($conn,$sql);
        $products = mysqli_fetch_all($result,1);
        $output["count"]=count($products);
        $output["pageCount"]=
            ceil($output["count"]/$output["pageSize"]);
        //$sql.= limit pageNo*pageSize,pageSize
        $sql.=" LIMIT ".
                    ($output["pageNo"]*$output["pageSize"]).
                ",".
                    $output["pageSize"];
        $result=mysqli_query($conn,$sql);
        $output["data"]=mysqli_fetch_all($result,1);
        if($fid){
            $sql="SELECT sm,md,lg FROM hb_product_pic";
            $sql.=" WHERE fid=$fid";
            $output["count"]=count($products);
            $output["pageCount"]=ceil($output["count"]/$output["pageSize"]);
            $sql.=" LIMIT ".
                            ($output["pageNo"]*$output["pageSize"]).
                            ",".
                                $output["pageSize"];
            }
        $result=mysqli_query($conn,$sql);
        $imgs = mysqli_fetch_all($result,1);
        $output["imgs"]=$imgs;
        echo json_encode($output);
    }
//    getProductByFid();
    //请求单个商品详情页面]
    function getProductById(){
        global $conn;
        @$lid=$_REQUEST["lid"];
        	$output=[];
        		//"product"=>[
        			//lid,
        			//title,
        			//family_id,
        			//number
        			//price,
        			//md
        		//],
        		//"imgs"=>[large,big,md,small]

        if($lid){
            $sql = "SELECT lid,title,product_number,sold_count,price,material,spec FROM hb_product WHERE lid=$lid";
            	$result=mysqli_query($conn,$sql);
            	$output["product"]=mysqli_fetch_all($result,1)[0];
            	$sql = "SELECT lg,big,mid,small FROM hb_product_detail_pic WHERE lid=$lid";
            	$result=mysqli_query($conn,$sql);
                $output["imgs"]=mysqli_fetch_all($result,1);
                echo json_encode($output);
        }
    }
?>




















