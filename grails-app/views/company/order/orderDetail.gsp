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

    <g:render template="/layouts/company_header"/>


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
                    <p class="help-block text-center" >OD8849393</p>
                  </div>
                </div>

                <div class="control-group">

                  <!-- Text input-->
                  <label class="control-label" for="input01">门店</label>
                  <div class="controls">
                    <p class="help-block text-center" >中粮蜀山店</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">状态</label>
                  <div class="controls">
                    <p class="help-block text-center" >已付款</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">金额</label>
                  <div class="controls">
                    <p class="help-block text-center" >2098 </p>
                    <a style="margin-left:5px;" href="#updatePrice" role="button" class="btn" data-toggle="modal">修改金额</a>
                  </div>
                </div>

                <div id="updatePrice" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">修改未付款订单金额：2098</h3>
                  </div>
                  <div class="modal-body" >
                    <div class="control-group">

                      <!-- Select Basic -->
                      <label class="control-label">设定方式</label>
                      <div class="controls">
                        <select class="input-xlarge">
                          <option>设置新订单金额</option>
                          <option>设置订单折扣</option></select>
                      </div>

                    </div>

                    <div class="control-group">

                      <!-- Text input-->
                      <label class="control-label" for="input01">设定值</label>
                      <div class="controls">
                        <input type="text" placeholder="折扣不能大于10" class="input-xlarge">
                        <p class="help-block"></p>
                      </div>
                    </div>

                    <div class="control-group">

                      <!-- Text input-->
                      <label class="control-label" for="input01">新订单金额</label>
                      <div class="controls">
                        <input type="text" placeholder="" class="input-xlarge">
                        <p class="help-block"></p>
                      </div>
                    </div>                  
                  </div>
                  <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button class="btn btn-primary">确定</button>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">下单时间</label>
                  <div class="controls">
                    <p class="help-block text-center" >2013-3-8 13:34:33</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">支付时间</label>
                  <div class="controls">
                    <p class="help-block text-center" >2013-3-8 14:34:33</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">发货时间</label>
                  <div class="controls">
                    <p class="help-block text-center" >2013-3-9 14:34:33</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">收货确认时间</label>
                  <div class="controls">
                    <p class="help-block text-center" >2013-3-10 14:34:33</p>
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
                <tr>
                  <td>东北大米</td>
                  <td>g0112</td>
                  <td>100</td>
                  <td>2</td>
                  <td>200</td>
                </tr>
                <tr>
                  <td>武昌湖大闸蟹</td>
                  <td>g0115</td>
                  <td>1898</td>
                  <td>1</td>
                  <td>1898</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td>总计</td>
                  <td>3</td>
                  <td>2098</td>
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
                    <p class="help-block text-center" >李大富</p>
                  </div>
                </div>

                <div class="control-group">

                  <!-- Text input-->
                  <label class="control-label" for="input01">固定电话</label>
                  <div class="controls">
                    <p class="help-block text-center" >69699999</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">手机号码</label>
                  <div class="controls">
                    <p class="help-block text-center" >13344445555</p>
                  </div>
                </div>

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">收货地址</label>
                  <div class="controls">
                    <p class="help-block text-center" >安徽合肥市政务文化新区习友路融科九重锦2栋1805室</p>
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


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

  <style>
    .text-center{
      float: left;
      padding-top: 5px;
    }
  </style>
</body>

</html>

