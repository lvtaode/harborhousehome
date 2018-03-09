SET NAMES UTF8;
DROP DATABASE IF EXISTS harbor;
CREATE DATABASE harbor CHARSET=UTF8;
USE harbor;
--用户信息
CREATE TABLE hb_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),
    upwd VARCHAR(32)
);
--产品系列
CREATE TABLE hb_product_family(
    fid INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(32) DEFAULT NULL
);
INSERT INTO hb_product_family VALUES('1','家具');
INSERT INTO hb_product_family VALUES('2','灯具');
INSERT INTO hb_product_family VALUES('3','墙饰');
INSERT INTO hb_product_family VALUES('4','窗帘');
INSERT INTO hb_product_family VALUES('5','地毯');
INSERT INTO hb_product_family VALUES('6','家纺');
INSERT INTO hb_product_family VALUES('7','装饰品');
INSERT INTO hb_product_family VALUES('8','餐厨用品');
INSERT INTO hb_product_family VALUES('9','儿童');

-- ----------------------------
-- hb_product 具体产品
-- ----------------------------
CREATE TABLE hb_product(
    lid INT(12) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fid INT(12) DEFAULT NULL,
    title VARCHAR(128) DEFAULT NULL,
    product_number VARCHAR(12) NOT NULL DEFAULT 121212,
    sold_count int(11) default NULL,
    price decimal(10,2) DEFAULT NULL,
    material VARCHAR(128) DEFAULT NULL,
    spec VARCHAR(128) DEFAULT NULL
);
--111001
--商品类别 产品系列 具体物品 001编号
INSERT INTO hb_product VALUES('1','1','Harbor 餐桌','111001','3556','7888.00','环保人造板','长160X宽90X高76CM');
INSERT INTO hb_product VALUES('2','1','Harbor 餐桌','111002','3500','9888.00','美国红橡木','长165X宽98X高78CM');
INSERT INTO hb_product VALUES('3','1','Harbor 餐桌','111003','356','6999.00','美国红橡木','长165X宽98X高78CM');
INSERT INTO hb_product VALUES('4','1','Harbor 餐桌','111004','2514','8957.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('5','1','Harbor 餐椅','112001','564','2680.00','东南亚橡胶木','长40X宽57X高93CM');
INSERT INTO hb_product VALUES('6','1','Harbor 餐椅','112002','355','2585.00','东南亚橡胶木','长49X宽50X高93CM');
INSERT INTO hb_product VALUES('7','1','Harbor 餐椅','112003','254','2088.00','东南亚橡胶木','长49X宽57X高91CM');
INSERT INTO hb_product VALUES('8','1','Harbor 餐椅','112004','123','1688.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('9','1','Harbor 餐椅','112005','563','1965.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('10','1','Harbor 餐椅','112006','189','1996.00','东南亚橡胶木','长49X宽57X高95CM');
INSERT INTO hb_product VALUES('11','1','Harbor 餐椅','112007','598','1687.00','东南亚橡胶木','长49X宽55X高98CM');
INSERT INTO hb_product VALUES('12','1','Harbor 餐椅','112008','215','1569.00','东南亚藤','长49X宽57X高96CM');
INSERT INTO hb_product VALUES('13','1','Harbor 餐椅','112009','265','1698.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('14','1','Harbor 餐椅','112010','265','1688.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('15','1','Harbor 餐椅','112011','265','1658.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('16','1','Harbor 餐椅','112012','65','1234.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('17','1','Harbor 餐椅','112013','12','1825.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('18','1','Harbor 餐椅','112014','369','1688.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('19','1','Harbor 餐椅','112015','165','1413.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('20','1','Harbor 餐椅','112016','89','1365.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('21','1','Harbor 餐椅','112017','254','1255.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('22','1','Harbor 餐椅','112018','698','1578.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('23','1','Harbor 餐椅','112019','265','1658.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('24','1','Harbor 餐椅','112020','265','1289.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('25','1','Harbor 餐椅','112021','235','1683.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('26','1','Harbor 餐椅','112022','265','1684.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('27','1','Harbor 餐椅','112023','123','1685.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('28','1','Harbor 餐椅','112024','156','1658.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('29','1','Harbor 餐椅','112025','65','2362.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('30','1','Harbor 餐椅','112026','564','2360.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('31','1','Harbor 餐椅','112027','12','2300.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('32','1','Harbor 餐椅','112028','62','2302.00','东南亚橡胶木','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('33','1','Harbor 餐椅','112029','53','2320.00','东南亚藤','长49X宽57X高98CM');
INSERT INTO hb_product VALUES('34','1','Harbor 餐桌','111005','231','8957.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('35','1','Harbor 餐桌','111006','52','8900.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('36','1','Harbor 餐桌','111007','360','8800.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('37','1','Harbor 餐桌','111008','365','8562.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('38','1','Harbor 餐桌','111009','235','8999.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('39','1','Harbor 餐桌','111010','956','15262.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('40','1','Harbor 餐桌','111011','221','8222.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('41','1','Harbor 餐桌','111012','230','8358.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('42','1','Harbor 餐桌','111013','330','8365.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('43','1','Harbor 餐桌','111014','369','8231.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('44','1','Harbor 餐桌','111015','154','2658.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('45','1','Harbor 餐桌','111016','365','10235.00','美国红橡木/美国红橡木单板/环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('46','1','Harbor 餐桌','111017','23','6598.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('47','1','Harbor 餐桌','111018','568','5999.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('48','1','Harbor 餐桌','111019','262','5666.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('49','1','Harbor 餐桌','111020','22','3669.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('50','1','Harbor 餐桌','111021','367','8957.00','美国红橡木/美国红橡木单板/环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('51','1','Harbor 餐桌','111022','365','7888.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('52','1','Harbor 餐桌','111023','569','9999.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('53','1','Harbor 餐桌','111024','365','8957.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('54','1','Harbor 餐桌','111025','365','10200.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('55','1','Harbor 餐桌','111026','234','10236.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('56','1','Harbor 餐桌','111027','36','8000.00','美国红橡木/美国红橡木单板/环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('57','1','Harbor 餐桌','111028','78','7588.00','美国红橡木单板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('58','1','Harbor 餐桌','111029','265','4399.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('59','1','Harbor 餐桌','111030','365','6999.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('60','1','Harbor 餐桌','111031','265','7888.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('61','1','Harbor 餐桌','111032','685','8555.00','美国红橡木/美国红橡木单板/环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('62','1','Harbor 餐桌','111033','89','5999.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('63','1','Harbor 餐桌','111034','236','4355.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('64','1','Harbor 餐桌','111035','94','3699.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('65','1','Harbor 餐桌','111036','224','6988.00','环保人造板','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('66','1','Harbor 餐桌','111037','258','4658.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('67','1','Harbor 餐桌','111038','29','5623.00','美国红橡木','长155X宽90X高86CM');
INSERT INTO hb_product VALUES('68','1','Harbor 餐桌','111039','26','1253.00','美国红橡木','长155X宽90X高86CM');


/**商城商品图片**/
CREATE TABLE hb_product_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,     #商品编号
  fid INT,     #商品类别编号
  md VARCHAR(256),            #小图片路径
  sm VARCHAR(256),            #中图片路径
  lg VARCHAR(256)             #大图片路径
);
INSERT INTO hb_product_pic VALUES
(NULL, 1,1, 'img/product-list/dining-room/table/big/01.jpg','img/product-list/dining-room/table/small/01.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 2,1, 'img/product-list/dining-room/table/big/02.jpg','img/product-list/dining-room/table/small/02.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 3,1, 'img/product-list/dining-room/table/big/03.jpg','img/product-list/dining-room/table/small/03.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 4,1 ,'img/product-list/dining-room/table/big/04.jpg','img/product-list/dining-room/table/small/04.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 5,1, 'img/product-list/dining-room/chair/big/01.jpg','img/product-list/dining-room/chair/small/01.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 6,1, 'img/product-list/dining-room/chair/big/02.jpg','img/product-list/dining-room/chair/small/02.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 7,1, 'img/product-list/dining-room/chair/big/03.jpg','img/product-list/dining-room/chair/small/03.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 8,1, 'img/product-list/dining-room/chair/big/04.jpg','img/product-list/dining-room/chair/small/04.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 9,1, 'img/product-list/dining-room/chair/big/05.jpg','img/product-list/dining-room/chair/small/05.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 10,1, 'img/product-list/dining-room/chair/big/06.jpg','img/product-list/dining-room/chair/small/06.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 11,1, 'img/product-list/dining-room/chair/big/07.jpg','img/product-list/dining-room/chair/small/07.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 12,1, 'img/product-list/dining-room/chair/big/08.jpg','img/product-list/dining-room/chair/small/08.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 13,1, 'img/product-list/dining-room/chair/big/09.jpg','img/product-list/dining-room/chair/small/09.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 14,1, 'img/product-list/dining-room/chair/big/10.jpg','img/product-list/dining-room/chair/small/10.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 15,1, 'img/product-list/dining-room/chair/big/11.jpg','img/product-list/dining-room/chair/small/11.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 16,1, 'img/product-list/dining-room/chair/big/12.jpg','img/product-list/dining-room/chair/small/12.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 17,1, 'img/product-list/dining-room/chair/big/13.jpg','img/product-list/dining-room/chair/small/13.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 18,1, 'img/product-list/dining-room/chair/big/14.jpg','img/product-list/dining-room/chair/small/14.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 19,1, 'img/product-list/dining-room/chair/big/15.jpg','img/product-list/dining-room/chair/small/15.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,20,1,'img/product-list/dining-room/chair/big/16.jpg','img/product-list/dining-room/chair/small/16.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,21,1,'img/product-list/dining-room/chair/big/17.jpg','img/product-list/dining-room/chair/small/17.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 22,1,'img/product-list/dining-room/chair/big/18.jpg','img/product-list/dining-room/chair/small/18.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 23,1,'img/product-list/dining-room/chair/big/19.jpg','img/product-list/dining-room/chair/small/19.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 24,1,'img/product-list/dining-room/chair/big/20.jpg','img/product-list/dining-room/chair/small/20.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 25,1,'img/product-list/dining-room/chair/big/21.jpg','img/product-list/dining-room/chair/small/21.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 26,1,'img/product-list/dining-room/chair/big/22.jpg','img/product-list/dining-room/chair/small/22.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 27,1,'img/product-list/dining-room/chair/big/23.jpg','img/product-list/dining-room/chair/small/23.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL, 28,1,'img/product-list/dining-room/chair/big/24.jpg','img/product-list/dining-room/chair/small/24.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,29,1,'img/product-list/dining-room/chair/big/25.jpg','img/product-list/dining-room/chair/small/25.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,30,1,'img/product-list/dining-room/chair/big/26.jpg','img/product-list/dining-room/chair/small/26.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,31,1,'img/product-list/dining-room/chair/big/27.jpg','img/product-list/dining-room/chair/small/27.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,32,1,'img/product-list/dining-room/chair/big/28.jpg','img/product-list/dining-room/chair/small/28.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,33,1,'img/product-list/dining-room/chair/big/29.jpg','img/product-list/dining-room/chair/small/29.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,34,1,'img/product-list/dining-room/table/big/05.jpg','img/product-list/dining-room/table/small/05.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,35,1,'img/product-list/dining-room/table/big/06.jpg','img/product-list/dining-room/table/small/06.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,36,1,'img/product-list/dining-room/table/big/07.jpg','img/product-list/dining-room/table/small/07.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,37,1,'img/product-list/dining-room/table/big/08.jpg','img/product-list/dining-room/table/small/08.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,38,1,'img/product-list/dining-room/table/big/09.jpg','img/product-list/dining-room/table/small/09.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,39,1,'img/product-list/dining-room/table/big/10.jpg','img/product-list/dining-room/table/small/10.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,40,1,'img/product-list/dining-room/table/big/11.jpg','img/product-list/dining-room/table/small/11.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,41,1,'img/product-list/dining-room/table/big/12.jpg','img/product-list/dining-room/table/small/12.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,42,1,'img/product-list/dining-room/table/big/13.jpg','img/product-list/dining-room/table/small/13.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,43,1,'img/product-list/dining-room/table/big/14.jpg','img/product-list/dining-room/table/small/14.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,44,1,'img/product-list/dining-room/table/big/15.jpg','img/product-list/dining-room/table/small/15.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,45,1,'img/product-list/dining-room/table/big/16.jpg','img/product-list/dining-room/table/small/16.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,46,1,'img/product-list/dining-room/table/big/17.jpg','img/product-list/dining-room/table/small/17.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,47,1,'img/product-list/dining-room/table/big/18.jpg','img/product-list/dining-room/table/small/18.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,48,1,'img/product-list/dining-room/table/big/19.jpg','img/product-list/dining-room/table/small/19.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,49,1,'img/product-list/dining-room/table/big/20.jpg','img/product-list/dining-room/table/small/20.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,50,1,'img/product-list/dining-room/table/big/21.jpg','img/product-list/dining-room/table/small/21.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,51,1,'img/product-list/dining-room/table/big/22.jpg','img/product-list/dining-room/table/small/22.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,52,1,'img/product-list/dining-room/table/big/23.jpg','img/product-list/dining-room/table/small/23.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,53,1,'img/product-list/dining-room/table/big/24.jpg','img/product-list/dining-room/table/small/24.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,54,1,'img/product-list/dining-room/table/big/25.jpg','img/product-list/dining-room/table/small/25.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,55,1,'img/product-list/dining-room/table/big/26.jpg','img/product-list/dining-room/table/small/26.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,56,1,'img/product-list/dining-room/table/big/27.jpg','img/product-list/dining-room/table/small/27.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,57,1,'img/product-list/dining-room/table/big/28.jpg','img/product-list/dining-room/table/small/28.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,58,1,'img/product-list/dining-room/table/big/29.jpg','img/product-list/dining-room/table/small/29.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,59,1,'img/product-list/dining-room/table/big/30.jpg','img/product-list/dining-room/table/small/30.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,60,1,'img/product-list/dining-room/table/big/31.jpg','img/product-list/dining-room/table/small/31.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,61,1,'img/product-list/dining-room/table/big/32.jpg','img/product-list/dining-room/table/small/32.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,62,1,'img/product-list/dining-room/table/big/33.jpg','img/product-list/dining-room/table/small/33.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,63,1,'img/product-list/dining-room/table/big/34.jpg','img/product-list/dining-room/table/small/34.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,64,1,'img/product-list/dining-room/table/big/35.jpg','img/product-list/dining-room/table/small/35.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,65,1,'img/product-list/dining-room/table/big/36.jpg','img/product-list/dining-room/table/small/36.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,66,1,'img/product-list/dining-room/table/big/37.jpg','img/product-list/dining-room/table/small/37.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,67,1,'img/product-list/dining-room/table/big/38.jpg','img/product-list/dining-room/table/small/38.jpg','img/product-list/dining-room/nav/客厅家具.jpg'),
(NULL,68,1,'img/product-list/dining-room/table/big/39.jpg','img/product-list/dining-room/table/small/39.jpg','img/product-list/dining-room/nav/客厅家具.jpg');


--购物车表
CREATE TABLE hb_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,      #用户编号
  lid INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

--详情页面图片表
CREATE TABLE hb_product_detail_pic(
      did INT PRIMARY KEY AUTO_INCREMENT,
      lid INT,   #商品编号
      lg VARCHAR(64),
      big VARCHAR(64),
      mid VARCHAR(64),
      small VARCHAR(64)
);
INSERT INTO hb_product_detail_pic VALUES(NULL,'5','img/product_detail/weldon/large/1.jpg','img/product_detail/weldon/big/1.jpg','img/product_detail/weldon/md/1.jpg','img/product_detail/weldon/small/1.jpg'),
(NULL,'5','img/product_detail/weldon/large/2.jpg','img/product_detail/weldon/big/2.jpg','img/product_detail/weldon/md/2.jpg','img/product_detail/weldon/small/1.jpg'),
(NULL,'5','img/product_detail/weldon/large/3.jpg','img/product_detail/weldon/big/3.jpg','img/product_detail/weldon/md/3.jpg','img/product_detail/weldon/small/1.jpg'),
(NULL,'5','img/product_detail/weldon/large/4.jpg','img/product_detail/weldon/big/4.jpg','img/product_detail/weldon/md/4.jpg','img/product_detail/weldon/small/1.jpg'),
(NULL,'5','img/product_detail/weldon/large/5.jpg','img/product_detail/weldon/big/5.jpg','img/product_detail/weldon/md/5.jpg','img/product_detail/weldon/small/1.jpg'),
(NULL,'5','img/product_detail/weldon/large/6.jpg','img/product_detail/weldon/big/6.jpg','img/product_detail/weldon/md/6.jpg','img/product_detail/weldon/small/1.jpg');
INSERT INTO hb_product_detail_pic VALUES(NULL,'2','img/product_detail/weldon/large/7.jpg','img/product_detail/weldon/big/7.jpg','img/product_detail/weldon/md/7.jpg','img/product_detail/weldon/small/2.jpg'),
(NULL,'6','img/product_detail/weldon/large/8.jpg','img/product_detail/weldon/big/8.jpg','img/product_detail/weldon/md/8.jpg','img/product_detail/weldon/small/2.jpg'),
(NULL,'6','img/product_detail/weldon/large/9.jpg','img/product_detail/weldon/big/9.jpg','img/product_detail/weldon/md/9.jpg','img/product_detail/weldon/small/2.jpg'),
(NULL,'6','img/product_detail/weldon/large/10.jpg','img/product_detail/weldon/big/10.jpg','img/product_detail/weldon/md/10.jpg','img/product_detail/weldon/small/2.jpg'),
(NULL,'6','img/product_detail/weldon/large/11.jpg','img/product_detail/weldon/big/11.jpg','img/product_detail/weldon/md/11.jpg','img/product_detail/weldon/small/2.jpg'),
(NULL,'6','img/product_detail/weldon/large/12.jpg','img/product_detail/weldon/big/12.jpg','img/product_detail/weldon/md/12.jpg','img/product_detail/weldon/small/2.jpg');