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

        <g:form onSubmit="return fieldValidate(this);" data-validate="parsley" id="doAddGoods" class="form-horizontal" controller="goods" action="doAddGoods" method="post">
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
              <label class="control-label" for="input01">商品名称<font color="red">&nbsp;*</font></label>
              <div class="controls">
                <input data-error-message="商品名称不能为空" data-required="true"  name="goods_name"  type="text" placeholder="请输入商品名称" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">商品编号<font color="red">&nbsp;*</font></label>
              <div class="controls">
                <input data-error-message="商品编号不能为空" data-required="true" name="goods_sn"  type="text" placeholder="请输入商品编号" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">价格<font color="red">&nbsp;*</font></label>
              <div class="controls">
                <input data-type="number" data-type-number-message="商品价格格式不正确" data-required-message="商品价格不能为空" data-required="true" name="price" type="text" placeholder="请输入价格" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>


            
            

            <div class="control-group">

              <!-- Select Basic -->
              <label class="control-label">商品分类<font color="red">&nbsp;*</font></label>
              <div class="controls" id="categorySelect">
                  <category:categorySeclect id="1" controller="goods" action="categorySelect" update="categorySelect"/>
                  <p class="help-block"></p>
                </div>

            </div>


            <div class="control-group" id="attr-group" style="display: none;">

              <label class="control-label">属性描述</label>
              <div class="controls " id="attr-controls">
                <div class="well">
                  <div style="display:none" class="control-group attr-control-group">

                    <label class="attr-control-label" >保质期</label>
                    <div class="attr-controls">
                      <input name="attr_name" type="hidden" placeholder="" class="input-xlarge attr_name">
                      <input name="attr_val" type="text" placeholder="" class="input-xlarge">
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
        <g:formRemote id="selGoodsCategoryAttr" data-validate="parsley" onSuccess="selGoodsCategoryAttrSuccess(data)" class="form-horizontal" name="selGoodsCategoryAttr" on404="alert('not found!')" 
                      url="[controller: 'goodsCategoryAttr', action:'selGoodsCategoryAttr']">
          <input type="hidden" name="c_id" id="c_id" value=""/>
        </g:formRemote>
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
    function fieldValidate(o){
	 if($(o).find("#c_id").val()=='1'){
		 var tip = '<ul id="parsley-31664503854699433" class="parsley-error-list" style="display: block;"><li class="min" style="display: list-item;">商品分类不能为空</li></ul>'
		var exittip = $(o).find("#c_id").next();
		if(!exittip.attr("class")){
			$(o).find("#c_id").after(tip);
		}
	
		
		 return false;
	}else{
		return true;
	}
	 
    }  

    
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
                        uploadJson : '${baseUrl}/image/upload?Jsessionid=${session.id}',
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
    
    function selGoodsCategoryAttrSuccess(data){
      $(".attr-control-group:not(:eq(0))").remove()
      
      
      if(data=='0'){
	   var attr_group = $(".attr-control-group:eq(0)").clone()
            attr_group.html("该分类下没有属性了！")
            $("#attr-controls").find(".well").append(attr_group.show())
	    $("#attr-group").show("slow");
	    return;
      }
      
      
      
      if($("#selGoodsCategoryAttr #c_id").val()!="1"){
        $("#attr-group").show("slow");
        
        $.each(data.pgcAttrJSON,function(i,v){
          
          $.each(v,function(key,val){
            var attr_group = $(".attr-control-group:eq(0)").clone()
            attr_group.find(".attr-control-label").html(val.attr_name)
            attr_group.find(".attr_name").val(val.attr_name)
            
            $("#attr-controls").find(".well").append(attr_group.show())
          })
          
        })
        
        $.each(data.gcAttrJSON,function(i,v){
          var attr_group = $(".attr-control-group:eq(0)").clone()
          attr_group.find(".attr-control-label").html(v.attr_name)
          attr_group.find(".attr_name").val(v.attr_name)
          $("#attr-controls").find(".well").append(attr_group.show())
        })
        
      }else{
        $("#attr-group").hide("slow");
      }
      
      
      
    }
    
    function categoryChange(o){
      
      $("#selGoodsCategoryAttr #c_id").val($(o).val());
      $("#selGoodsCategoryAttr").submit()
      
      
//      if($(o).val()!=""){
//        $("#attr-group").show("slow");
//      }else{
//        $("#attr-group").hide("slow");
//      }
    }
//      if($(o).val()!=""){

  </script>
  <style>

  </style>
</body>

</html>

