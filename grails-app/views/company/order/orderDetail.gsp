<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>

</head>
<body>

  <div class="container">

    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <g:render template="/layouts/leftmenu"/>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <ul id="myTab" class="nav nav-tabs">
          <li class="active"><a href="#home" data-toggle="tab">订单信息</a></li>
          <li class=""><a href="#profile" data-toggle="tab">商品信息</a></li>
          <li class=""><a href="#wuliu" data-toggle="tab">物流跟踪</a></li>
          <li class=""><a href="#shouhuo" data-toggle="tab">收货人信息</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
          <div class="tab-pane fade active in" id="home">
            <form class="form-horizontal">
              <fieldset>
                <div class="control-group">

                  <!-- Text input-->
                  <label class="control-label" for="input01">订单号</label>
                  <div class="controls">
                    <p class="help-block text-center" >${shoppingOrder.order_sn}</p>
                  </div>
                </div>

<!--                <div class="control-group">

                   Text input
                  <label class="control-label" for="input01">门店</label>
                  <div class="controls">
                    <p class="help-block text-center" >中粮蜀山店</p>
                  </div>
                </div>-->

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">状态</label>
                  <div class="controls">
                    <p class="help-block text-center" >
			<order:orderStatusDic status="${shoppingOrder.status}"/>
		    </p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">金额</label>
                  <div class="controls">
                    <p class="help-block text-center" >${shoppingOrder.amount}</p>
                    
		    <g:if test="${shoppingOrder.status=='waitpay'}">
		    <a style="margin-left:5px;" href="#updatePrice" role="button" class="btn" data-toggle="modal">修改金额</a>
		    </g:if>
                  </div>
                </div>


                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">下单时间</label>
                  <div class="controls">
                    <p class="help-block text-center" >${shoppingOrder.dateCreated}</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">支付时间</label>
                  <div class="controls">
                    <p class="help-block text-center" ><datetime:getDateTime longtime="${shoppingOrder.payTime}"/></p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">发货时间</label>
                  <div class="controls">
                    <p class="help-block text-center" ><datetime:getDateTime longtime="${shoppingOrder.shipTime}"/></p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">收货确认时间</label>
                  <div class="controls">
                    <p class="help-block text-center" ><datetime:getDateTime longtime="${shoppingOrder.payTime}"/></p>
                  </div>
                </div>





                <div class="control-group">
                  <label class="control-label"></label>

                  <!-- Button -->
                  <div class="controls">
                    <a href="orderList" class="btn btn-default">返回</a>
                  </div>
                </div>
              </fieldset>
            </form>
          </div>
          <div class="tab-pane fade" id="profile">
		 
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>价格</th>
                  <th>数量</th>
                  <th>小计</th>
                </tr>
              </thead>
              <tbody>
		      
		      <g:each in="${orderGoods}" status="i" var="goods">
			      <tr >
				<td>${goods.goods.goods_name}</td>
				<td>${goods.goods.goods_sn}</td>
				<td>${goods.price}</td>
				<td class="num">${goods.num}</td>
				<td class="amount">${goods.price * goods.num}</td>
			      </tr>
		      </g:each>
		      
                <tr>
                  <td></td>
                  <td></td>
                  <td>总计</td>
                  <td class="total_num">3</td>
                  <td class="total_amount">2098</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="wuliu">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>处理时间</th>
                  <th>处理信息</th>
                  <th>操作人</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>2013-03-12 18:28:40</td>
                  <td>已发货,运单号为2844837691</td>
                  <td>企业客服</td>
                </tr>
                <tr>
                  <td>2013-03-12 23:11:40</td>
                  <td>扫描地点：广东省广州市天河区车陂，扫描信息：已打包</td>
                  <td>快递人员</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="shouhuo">
            <form class="form-horizontal">
              <fieldset>
                <div class="control-group">

                  <!-- Text input-->
                  <label class="control-label" for="input01">收货人姓名</label>
                  <div class="controls">
                    <p class="help-block text-center" >${shoppingOrder.buy_user}</p>
                  </div>
                </div>


                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">手机号码</label>
                  <div class="controls">
                    <p class="help-block text-center" >${shoppingOrder.telphone}</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">收货地址</label>
                  <div class="controls">
                    <p class="help-block text-center" >${shoppingOrder.address}</p>
                  </div>
                </div>






                <div class="control-group">
                  <label class="control-label"></label>

                  <!-- Button -->
                  <div class="controls">
                    <a href="orderList" class="btn btn-default">返回</a>
                  </div>
                </div>
              </fieldset>
            </form>
          </div>
        </div>



      </div><!--/span-->
    </div><!--/row-->

	<g:form  data-validate="parsley" id="${shoppingOrder?.id}" class="form-horizontal" controller="order" action="companyUpdateOrderAmount" method="post">
               
		
		<div id="updatePrice" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">订单金额：${shoppingOrder.amount}</h3>
                  </div>
                  <div class="modal-body" >
                    <div class="control-group">

                      <!-- Select Basic -->
                      <label class="control-label">设定方式</label>
                      <div class="controls">
			<select onchange="setNewAmount(this)"  class="input-xlarge">
                          <option value="#newamount">设置新订单金额</option>
                          <option value="#discount">设置订单折扣</option>
			</select>
                      </div>

                    </div>

                    <div id="discount"  class="control-group setAmountMode" style="display:none">

                      <!-- Text input-->
                      <label class="control-label" for="input01">折扣</label>
                      <div class="controls">
                        <input  data-range-message="折扣只能输入1到10数字之间" data-range="[1, 10]"  data-type="number" data-type-number-message="数字格式不正确" type="text" name="discount" placeholder="折扣不能大于10" class="input-xlarge">
                        <p class="help-block"></p>
                      </div>
                    </div>

                    <div id="newamount" class="control-group setAmountMode" style="display:block">

                      <!-- Text input-->
                      <label class="control-label" for="input01">新订单金额</label>
                      <div class="controls">
                        <input  data-type="number" data-type-number-message="数字格式不正确" type="text" name="newamount" placeholder="" class="input-xlarge">
                        <p class="help-block"></p>
                      </div>
                    </div>                  
                  </div>
                  <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button type="submit" class="btn btn-primary">确定</button>
                  </div>
                </div>
	</g:form>	
    
    

    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

  <style>
    .text-center{
      float: left;
      padding-top: 5px;
    }
  </style>
  <script>
	  
	  function setNewAmount(o){
		  jQuery(".setAmountMode").hide();
		  jQuery(".setAmountMode").find("input").val("")
		  jQuery(jQuery(o).val()).show();
	  }
	  
	  
	  $(document).ready(function(){
		  var num = "0";
		  jQuery(".num").each(function(){
			  num = parseInt(num) + parseInt(jQuery(this).html());
		  });
		  jQuery(".total_num").html(num);
		  
		  var amount = "0";
		  jQuery(".amount").each(function(){
			  amount = parseInt(amount) + parseInt(jQuery(this).html());
		  });
		  jQuery(".total_amount").html(amount);
	  });
  </script>
</body>

</html>

