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
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li ><a href="upGoodsList">上架商品列表</a></li>
            <li ><a href="downGoodsList">下架商品列表</a></li>
            <li class="active"><a href="goodsPub">发布新商品</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">

        <form class="form-horizontal">
          <fieldset>
            <div id="legend" class="">
              <legend class="">发布新商品</legend>
            </div>
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">商品名称</label>
              <div class="controls">
                <input value="东北大米" type="text" placeholder="请输入商品名称" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">商品编号</label>
              <div class="controls">
                <input value="g0112" type="text" placeholder="请输入商品编号" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">价格</label>
              <div class="controls">
                <input value="100" type="text" placeholder="请输入价格" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>



            <div class="control-group">

              <!-- Select Basic -->
              <label class="control-label">商品分类</label>
              <div class="controls">
                <select class="input-xlarge" id="" onchange="categoryChange(this)">
                  <option value="">请选择</option>
                  <option value="1">水果</option>
                  <option value="2" selected="selected">杂粮</option>
                  <option value="3">蔬菜</option>
                </select>
              </div>

            </div>


            <div class="control-group" id="attr-group" style="display: block;">

              <label class="control-label">蔬菜分类的属性</label>
              <div class="controls">
                <div class="well">
                  <div class="control-group">

                    <label class="attr-control-label" >保质期</label>
                    <div class="attr-controls">
                      <input value="12个月" type="text" placeholder="" class="input-xlarge">
                      <p class="help-block"></p>
                    </div>

                  </div>

                  <div class="control-group">

                    <label class="attr-control-label" >包装方式</label>
                    <div class="attr-controls">
                      <input value="盒装" type="text" placeholder="" class="input-xlarge">
                      <p class="help-block"></p>
                    </div>

                  </div>


                </div>
              </div>



            </div>


            <div class="control-group">

              <!-- Textarea -->
              <label class="control-label">商品描述</label>
              <div class="controls">
                <div class="textarea">
                  <textarea type="" class=""  rows="6">
优制大米，营养丰富</textarea>
                </div>
              </div>
            </div>

            <div class="control-group">
              <label class="control-label">上传图片</label>

              <!-- File Upload -->
              <div class="controls">
                <input class="input-file" id="fileInput" type="file">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"></label>

              <!-- Button -->
              <div class="controls">
                <button class="btn btn-primary">提交</button>
                <a href="upGoodsList" class="btn btn-default">返回</a>
              </div>
            </div>
          </fieldset>
        </form>

      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

  <style>
    .attr-control-label{
      float: left;
      width: 60px;
      padding-top: 5px;
      text-align: right;
    }
    .attr-controls{
      margin-left: 80px;
    }
  </style>
  <script>
    function categoryChange(o){
      if($(o).val()!=""){
        $("#attr-group").show("slow");
      }else{
$("#attr-group").hide("slow");
}
}

</script>
</body>

</html>

