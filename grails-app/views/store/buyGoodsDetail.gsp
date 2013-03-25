<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
  <r:require modules="bootstrap"/>

</head>
<body>

  <div class="container">

    <g:render template="/layouts/store_header"/>


    <div class="row-fluid">
      <g:render template="/store/buyGoodsCategory"/>
      <div class="span9">
        <g:render template="/store/buyGoodsNav"/>
        <div class="row-fluid">
          <div class="span5" style="margin-bottom:10px;">
            <img  src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg" class="img-polaroid">
          </div>
          <div class="span7">
            <h3 class="goods-title">普装南汇甜瓜，甜脆可口</h3>
            <h5>商品编号：34990</h5>
            <h5>价格：100元</h5>
            <h5>数量：<input class="input-mini" type="text" ></h5>
            <a href="cartManager" class="btn btn-large btn-primary">立即采购</a>
            <a href="#" class="btn btn-large btn-warning">加入购物车</a>
          </div>
        </div>
        <div class="row-fluid">
          <div class="span12">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">商品描述</a></li>
              <li><a href="#profile" data-toggle="tab">商品属性</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade in active" id="home">
                <p>
                  <img height="302" alt="" width="600" src="http://xiangxia.com/userfiles/image/42a6742f-492f-406d-97c5-086c7b20a5e5.jpg"><br>
                  <br><strong>南汇精品甜瓜 6只装/箱 <br>
                    <br></strong>古代，中世纪的阿拉伯人视甜瓜为“天堂圣果”，节典佳日常被作为贡品而顶礼膜拜。就是现在，甜瓜也每每以美味佳肴的角色，出现在各国招待贵宾的国宴上。在国际市场上甜瓜属高档果品，换汇率居各类水果最前列。甜瓜除鲜食外，还可以制作甜瓜干。 <br>
                  <br><img height="26" alt="" width="600" src="http://xiangxia.com/userfiles/image/3ef02c22-02dd-43fb-b4c1-a4176a5a9737.jpg"><br>
                  <br>甜瓜在植物学分类上属葫芦科，它性喜干热、充足的阳光和昼夜温差大的自然环境。甜瓜营养丰富，新鲜瓜肉中含有水分80-90％，糖类8-20％，此外还含有蛋白质以及钾、钙、铁、磷等微量元素和维生素等。 <br>
                  <br>甜瓜根据果实的成熟期可分为早、中熟的夏甜瓜和中、晚熟的秋甜瓜。其形状有圆、椭圆、卵圆、长棒、短筒等；瓜皮的颜色有白玉、金黄、青皂、果绿和杂色等许多品种。 <br>
                  <br><img height="302" alt="" width="600" src="http://xiangxia.com/userfiles/image/c3b49454-4100-4b2e-abb2-f399e26ccba9.jpg"><br>
                  <br>瓜肉有黄色和绿色等，黄如橙，绿如翠，味甘如蜜，爽口似梨，入口即融，没有渣滓。古诗赞美甜瓜：“冰泉浸绿玉，霜刀破黄金；凉冷消晚暑，清甘洗渴心。”可谓恰如其分。 <br>
                  <br><img height="302" alt="" width="600" src="http://xiangxia.com/userfiles/image/6e57649d-d120-4ed9-b821-899c471d7cbd.jpg"> <img height="26" alt="" width="600" src="http://xiangxia.com//userfiles/image/5096b677-861d-4541-ac8f-a0c48fe169b6.jpg"><br>
                  <br>南汇，因“大海环 其东南，扬子江出海后受海潮抵托，折旋向南，与钱塘江在此交汇”而得名，所以这里地势 平坦，气候湿润，绵长的海岸线形成辽阔的沿海滩涂，为种植瓜果提供了十分优越的自然条件。 <br>
                  <br><img height="290" alt="" width="600" src="http://xiangxia.com/userfiles/image/8c8612e6-8ba7-4c30-b418-5d5df242b088.jpg"><br>
                  <br>享有“全国瓜果之乡”美名的南汇目前种植甜瓜面积达1.2万公顷，其中甜瓜成为全国除新疆以外最大生产基地。南汇地区极有利于甜瓜种植，甜瓜糖度相比其他地区高出2—3度，生产的甜瓜具有清凉爽口、蜜汁甜而不腻。有一种独特的口感，深受市民好评。 <br>
                  <br><img height="441" alt="" width="600" src="http://xiangxia.com/userfiles/image/9953db9d-c4e4-4a1b-b9ab-935afdf7c8de.jpg"><br>
                  <br>甜瓜产于南汇东南海滩，此地土质盐碱成分较高，极有利于甜瓜种植，甜瓜糖度相比其他地区高出2—3度，生产的甜瓜具有清凉爽口、蜜汁甜而不腻，有一种独特的口感。<br>
                  <br><img height="441" alt="" width="600" src="http://xiangxia.com/userfiles/image/b997c6b1-d740-4ee6-bd09-083550aff511.jpg"><br>
                  <br><img height="26" alt="" width="600" src="http://xiangxia.com/userfiles/image/7241dee2-c3f4-46ae-8c1e-eac0e425ca5c.jpg"><br>
                  <br>甜瓜还可入药，瓜籽炒熟后研末吞服，可治慢性气管炎；用黄酒冲服，治疗劳损腰痛、腹内结聚不消；瓜蒂可消肿，治疗肝炎。甜瓜中的钾离子含量相当高，大约每100克瓜肉中含有250毫克左右的钾。 <br>
                  <br><strong>甜瓜的营养分析</strong><br>
                  <br>1. 甜瓜含大量碳水化合物及柠檬酸等，且水分充沛，可消暑清热、生津解渴、除烦； <br>
                  <br>2. 甜瓜中的转化酶可将不溶性蛋白质转变成可溶性蛋白质，能帮助肾脏病人吸收营养； <br>
                  <br>3. 甜瓜蒂中的葫芦素B能保护肝脏，减轻慢性肝损伤； <br>
                  <br>4. 现代研究发现，甜瓜子有驱杀蛔虫，丝虫等作用； <br>
                  <br>5. 甜瓜营养丰富，可补充人体所需的能量及营养素。 <br>
                  <br><img height="26" alt="" width="600" src="http://xiangxia.com//userfiles/image/f03dfb51-b0c1-486d-a338-f065098558ca.jpg"><br>
                  <br><img height="441" alt="" width="600" src="http://xiangxia.com//userfiles/image/f01fde21-dc95-45ca-8910-761a59617624.jpg"><br>
                  <br>甜瓜大棚<br>
                  <br><img height="441" alt="" width="600" src="http://xiangxia.com/userfiles/image/0cf2d1b9-fc83-4db0-8ebe-f442fdd7c81d.jpg"><br>
                  <br>清晨新鲜采摘，24小时新鲜到您家！<br>
                  <br><img height="441" alt="" width="600" src="http://xiangxia.com/userfiles/image/9e91b911-5532-4c62-ac9a-95f404eab672.jpg"><br type="_moz">
                </p>
              </div>
              <div class="tab-pane fade" id="profile">
                <div class="row-fluid">
                  <div class="span3">产地：南汇</div>
                  <div class="span3">规格：6只装</div>
                  <div class="span3">重量：1KG</div>
                  <div class="span3">甜度：80％</div>
                </div>
                <div class="row-fluid">
                  <div class="span3">产地：南汇</div>
                  <div class="span3">规格：6只装</div>
                  <div class="span3">重量：1KG</div>
                  <div class="span3">甜度：80％</div>
                </div>
                <div class="row-fluid">
                  <div class="span3">产地：南汇</div>
                  <div class="span3">规格：6只装</div>
                  <div class="span3">重量：1KG</div>
                  <div class="span3">甜度：80％</div>
                </div>
                <div class="row-fluid">
                  <div class="span3">产地：南汇</div>
                  <div class="span3">规格：6只装</div>
                  <div class="span3">重量：1KG</div>
                  <div class="span3">甜度：80％</div>
                </div>
              </div>
            </div>
          </div>
        </div>



      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->
  <style>
    .goods-title{
      border-bottom: 1px solid rgba(0,0,0,0.2);
    }


    .img-polaroid{
      height: 250px;
    }

  </style>

</body>

</html>

