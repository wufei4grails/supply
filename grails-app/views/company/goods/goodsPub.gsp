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
<%
String baseUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
%>
    <script type="text/javascript" src="${baseUrl}/kindeditor-4.1.5/kindeditor-min.js"></script>
    <script type="text/javascript" src="${baseUrl}/kindeditor-4.1.5/lang/zh_CN.js"></script>
    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <g:render template="/layouts/leftmenu"/>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">

        <g:form data-validate="parsley" class="form-horizontal" controller="goods" action="doAddGoods" method="post">
          <fieldset>
            <div id="legend" class="">
              <legend class="">发布新商品</legend>
            </div>

            <g:if test="${flash.message}">
              <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>${flash.message}</strong>
              </div>
            </g:if>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">商品名称</label>
              <div class="controls">
                <input data-error-message="商品名称不能为空" data-required="true"  name="goods_name"  type="text" placeholder="请输入商品名称" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">商品编号</label>
              <div class="controls">
                <input data-error-message="商品编号不能为空" data-required="true" name="goods_sn"  type="text" placeholder="请输入商品编号" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">价格</label>
              <div class="controls">
                <input data-type="number" data-type-number-message="商品价格格式不正确" data-required-message="商品价格不能为空" data-required="true" name="price" type="text" placeholder="请输入价格" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>



            <div class="control-group">

              <!-- Select Basic -->
              <label class="control-label">商品分类</label>
              <div class="controls">
                <select name="c_id"  class="input-xlarge" id="" onchange="categoryChange(this)">
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
                <textarea  name="goods_text" id="goods_text"  style="width:100%" rows="15"></textarea>
                <!--                <div class="textarea">
                                  <textarea type="" class=""  rows="6"></textarea>
                                </div>-->
              </div>
            </div>

            <div class="control-group">
              <!--<label class="control-label">上传图片</label>-->

              <!-- File Upload -->
              <div class="controls">
                <input type="hidden" id="img_url" name="img_url" value="" />
                <input class="btn btn-primary" id="image" value="上传图片">
              </div>
            </div>


            <div class="control-group">
              <!--<label class="control-label">上传图片</label>-->

              <!-- File Upload -->
              <div class="controls">
                <ul class="goods-img">
                  
                 

                </ul>


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
        </g:form>

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

    .goods-img{
      margin: 0 0 10px 0;
    }
    .goods-img li{
      position: relative;
      display: inline-block;
      width: 120px;
      height: 150px;
      margin-left: 10px;
      margin-bottom: 10px;
      line-height: 150px;
      border: 1px solid rgba(0, 0, 0, 0.2);
    }
    
    .goods-img li img{
      max-height:  150px;
      max-width: 120px;
    }
    
    .goods-img li i{
      position: absolute; 
      top:130px; 
      right:0px;
      cursor:pointer;
    }


  </style>
  <script>
    
    function delImg(o){
      $(o).parents("li").remove();
      initImgUrl();
    }
    
    function initImgUrl(){
      var img_url = '';
      $(".img_url").each(function(){
        img_url = img_url + "," + $(this).attr("src"); 
//          alert($(this).attr("src"))
      });
      $("#img_url").val(img_url);
    }
    
    
    $(document).ready(function(){
      
      
      
      
        KindEditor.ready(function(K) {
               var editor = K.create('textarea[name="goods_text"]', {
                        resizeType : 1,
                        allowFileManager:true,
                        allowPreviewEmoticons : true,
                        uploadJson : '${baseUrl}/image/upload',
                        fileManagerJson : '${baseUrl}/kindeditor-4.1.5/jsp/file_manager_json.jsp',
                        allowImageUpload : true,
                        items : ['preview','source', 'wordpaste','quickformat','fullscreen','|',
                                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                'insertunorderedlist', '|','insertfile','template','anchor','emoticons', 'image','multiimage', 'link','|','baidumap']
                });
                
                
                K('#image').click(function() {
                        editor.loadPlugin('multiimage', function() {
                                editor.plugin.multiImageDialog({
                                        showRemote : false,
                                        imageUrl : K('#img_url').val(),
                                        clickFn : function(url, title, width, height, border, align) {
                                                K('#img_url').val(url.url);
                                                $.each(url,function(n,v) { 
                                                      var img_li = '<li>'
                                                                     + '<img class="img_url" src="'+v.url+'" >'
                                                                     + '<i onclick="delImg(this)" class="icon-remove"></i>'
                                                                    +'</li>'
                                                      $(".goods-img").append(img_li);
                                                });
                                                initImgUrl();
                                               editor.hideDialog();
                                        }
                                });
                        });
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
  <style>

  </style>
</body>

</html>

