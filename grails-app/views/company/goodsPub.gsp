<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
  <r:require modules="bootstrap"/>
  <r:require module="fileuploader" />
</head>
<body>

  <div class="container">
<%
String baseUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
%>
    <script type="text/javascript" src="${baseUrl}/kindeditor-4.1.5/kindeditor-min.js"></script>
    <script type="text/javascript" src="${baseUrl}/kindeditor-4.1.5/lang/zh_CN.js"></script>
    <g:render template="/layouts/company_header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li class="active"><a href="goodsPub">发布新商品</a></li>
            <li ><a href="upGoodsList">上架商品列表</a></li>
            <li ><a href="downGoodsList">下架商品列表</a></li>
            <li><a href="goodsCategoryList">商品分类列表</a></li>
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
                <input type="text" placeholder="请输入商品名称" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">商品编号</label>
              <div class="controls">
                <input type="text" placeholder="请输入商品编号" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">价格</label>
              <div class="controls">
                <input type="text" placeholder="请输入价格" class="input-xlarge">
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
                  <option value="2">杂粮</option>
                  <option value="3">蔬菜</option>
                </select>
              </div>

            </div>


            <div class="control-group" id="attr-group" style="display: none;">

              <label class="control-label">蔬菜分类的属性</label>
              <div class="controls">
                <div class="well">
                  <div class="control-group">

                    <label class="attr-control-label" >保质期</label>
                    <div class="attr-controls">
                      <input type="text" placeholder="" class="input-xlarge">
                      <p class="help-block"></p>
                    </div>

                  </div>

                  <div class="control-group">

                    <label class="attr-control-label" >包装方式</label>
                    <div class="attr-controls">
                      <input type="text" placeholder="" class="input-xlarge">
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
                <textarea id="goods_desc" name="goods_desc" style="width:100%" rows="15"></textarea>
                <!--                <div class="textarea">
                                  <textarea type="" class=""  rows="6"></textarea>
                                </div>-->
              </div>
            </div>

            <div class="control-group">
              <!--<label class="control-label">上传图片</label>-->

              <!-- File Upload -->
              <div class="controls">
                <!--<input class="input-file" id="fileInput" type="file">-->
                <uploader:uploader id="picupload"  url="${[controller:'image', action:'upload']}" >
                </uploader:uploader>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"></label>

              <!-- Button -->
              <div class="controls">
                <button class="btn btn-primary">提交</button>

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
    .qq-upload-button{
      background: #0044cc;
    }
  </style>
  <script>
    
    $(document).ready(function(){
      
      
      var inp = $(".qq-upload-button").find("input");
      $(".qq-upload-button").text("上传图片");
      $(".qq-upload-button").append(inp);
      
      
      var editor;
        KindEditor.ready(function(K) {
                editor = K.create('textarea[name="goods_desc"]', {
                        resizeType : 1,
                        allowPreviewEmoticons : false,
                        uploadJson : 'uploadKindEditor.do',
                        fileManagerJson : 'resource/js/kindeditor-4.1.5/jsp/file_manager_json.jsp',
                        allowImageUpload : true,
                        items : [
                                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                });
        });
      
    });
    
    
    
    function categoryChange(o){
      if($(o).val()!=""){
        $("#attr-group").show("slow");
      }else{
        $("#attr-group").hide("slow");
      }
    }
//      if($(o).val()!=""){

  </script>
</body>

</html>

