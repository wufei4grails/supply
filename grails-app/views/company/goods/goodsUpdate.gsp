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

				<g:form onSubmit="return fieldValidate(this);" data-validate="parsley" class="form-horizontal" controller="goods" action="doUpdateGoods" method="post">
					  <!--<input value="${goods.id}" name="id">-->
					<g:hiddenField name="id" value="${goods?.id}" />
					<g:hiddenField name="img"  value="${goods?.img}" />
					<fieldset>
						<div id="legend" class="">
							<legend class="">修改商品</legend>
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
								<input value="${goods.goods_name}" data-error-message="商品名称不能为空" data-required="true"  name="goods_name"  type="text" placeholder="请输入商品名称" class="input-xlarge">
								<p class="help-block"></p>
							</div>
						</div>

						<div class="control-group">

							<!-- Text input-->
							<label class="control-label" for="input01">是否上架</label>
							<div class="controls">
								<g:select value="${goods.status}" name="status" optionKey="status" optionValue="queryShow" from="${[[status:"on",queryShow:"上架"],[status:"off",queryShow:"下架"]]}" />
							</div>
						</div>

						<div class="control-group">

							<!-- Text input-->
							<label class="control-label" for="input01">商品编号<font color="red">&nbsp;*</font></label>
							<div class="controls">
								<input value="${goods.goods_sn}" data-error-message="商品编号不能为空" data-required="true" name="goods_sn"  type="text" placeholder="请输入商品编号" class="input-xlarge">
								<p class="help-block"></p>
							</div>
						</div>

						<div class="control-group">

							<!-- Text input-->
							<label class="control-label" for="input01">价格<font color="red">&nbsp;*</font></label>
							<div class="controls">
								<input value="${goods.price}" data-type="number" data-type-number-message="商品价格格式不正确" data-required-message="商品价格不能为空" data-required="true" name="price" type="text" placeholder="请输入价格" class="input-xlarge">
								<p class="help-block"></p>
							</div>
						</div>



						<div class="control-group">

							<!-- Select Basic -->
							<label class="control-label">商品分类<font color="red">&nbsp;*</font></label>
							<div class="controls" id="categorySelect">
								<category:categorySeclect id="${goods.c_id}" controller="goods" action="categorySelect" update="categorySelect"/> 
								<p class="help-block"></p>
							</div>

						</div>



						<div class="control-group" id="attr-group" style="">

							<label class="control-label">属性描述</label>
							<div class="controls" id="attr-controls">
								<div class="well">
									<div style="display:none" class="control-group attr-control-group">

										<label class="attr-control-label" >保质期</label>
										<div class="attr-controls">
											<input name="attr_name" type="hidden" placeholder="" class="input-xlarge attr_name">
											<input name="attr_val" type="text" placeholder="" class="input-xlarge">
											<p class="help-block"></p>
										</div>

									</div>

									<g:each in="${goodsAttrList}">
										<div  class="control-group attr-control-group old-attr-control-group">

											<label class="attr-control-label" >${it.attr_name}</label>
											<div class="attr-controls">
												<input value="${it.attr_name}" name="attr_name" type="hidden" placeholder="" class="input-xlarge attr_name">
												<input value="${it.attr_val}" name="attr_val" type="text" placeholder="" class="input-xlarge">
												<p class="help-block"></p>
											</div>

										</div>

									</g:each>



								</div>
							</div>



						</div>


						<div class="control-group">

							<!-- Textarea -->
							<label class="control-label">商品描述</label>
							<div class="controls">
								<textarea  name="goods_text" id="goods_text"  style="width:100%" rows="15">
${goods.goods_text}
                
								</textarea>
								<!--                <div class="textarea">
										  <textarea type="" class=""  rows="6"></textarea>
										</div>-->
							</div>
						</div>

						<div class="control-group">
						  <!--<label class="control-label">上传图片</label>-->

							<!-- File Upload -->
							<div class="controls">
								<input type="hidden" id="old_img_url" name="old_img_url" value="" />
								<input type="hidden" id="img_url" name="img_url" value="" />
								<input class="btn btn-primary" id="image" value="上传图片">
							</div>
						</div>


						<div class="control-group">
						  <!--<label class="control-label">上传图片</label>-->

							<!-- File Upload -->
							<div class="controls">
								<ul class="goods-img">
									<g:each in="${attachList}">
										<li id='${it.id}'>
										<g:img class="img_url" uri="${it.url}"/>

										<g:remoteLink controller="goods" action="delImg"  id="${it.id}"  onComplete="delImg(${it.id})">
											<i class="icon-remove"></i> 
										</g:remoteLink>

										</li>
									</g:each>


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
	    $("#"+o).remove();
	  }
    
	  initOldImgUrl();
	  function initOldImgUrl(){
	    var old_img_url = '';
	    $(".img_url").each(function(){
	      old_img_url = old_img_url + "," + $(this).attr("src"); 
      //          alert($(this).attr("src"))
	    });
	    $("#old_img_url").val(old_img_url);
	  }
    
	  function initImgUrl(){
	    var img_url = '';
	    var old_img_url = $("#old_img_url").val();
	    $(".img_url").each(function(){
	      var src = $(this).attr("src"); 
	      if(old_img_url.indexOf(src)>0){
          
	      }else{
		img_url = img_url + "," + src;
	      }
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
									   + '<i class="icon-remove"></i>'
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
		//当商品分类切换时，将老数据保留，其它删除掉
	    $(".attr-control-group:not(:eq(0)):not('.old-attr-control-group')").remove()
	    var old_control = $(".attr-control-group");//取出已填写的数据，当选择分类再遍历父分类的属性时，与已有老数据相同时就不要再复盖属性，保留之前填写的值
      
      
	    if($("#selGoodsCategoryAttr #c_id").val()!="1"){
	      $("#attr-group").show("slow");
	      
	      $.each(data.pgcAttrJSON,function(i,v){
          
		$.each(v,function(key,val){
			var is_add = true;
			//遍历判断是否有和老数据相同的属性
			$.each(old_control,function(old_key,old_val){
				if($(old_val).find(".attr-control-label").html()==val.attr_name){
					is_add = false;//当有相同属性时不再添加数据
				}
			});
			
			if(is_add){
				var attr_group = $(".attr-control-group:eq(0)").clone()
				attr_group.find(".attr-control-label").html(val.attr_name)
				attr_group.find(".attr_name").val(val.attr_name)

				$("#attr-controls").find(".well").append(attr_group.show())
			}
			
		})
          
	      })
        
	      $.each(data.gcAttrJSON,function(i,v){
			var is_add = true;
			//遍历判断是否有和老数据相同的属性
			$.each(old_control,function(old_key,old_val){
				if($(old_val).find(".attr-control-label").html()==v.attr_name){
					is_add = false;//当有相同属性时不再添加数据
				}
			});
			
			if(is_add){
				var attr_group = $(".attr-control-group:eq(0)").clone()
				attr_group.find(".attr-control-label").html(v.attr_name)
				attr_group.find(".attr_name").val(v.attr_name)
				$("#attr-controls").find(".well").append(attr_group.show())
			}
	      
	      
		
	      })
        
	    }else{
	      $("#attr-group").hide("slow");
	    }
	  }
    
	  function categoryChange(o){
      
	    $("#selGoodsCategoryAttr #c_id").val($(o).val());
	    $("#selGoodsCategoryAttr").submit()
	  }
      //      if($(o).val()!=""){

	</script>
	<style>

	</style>
</body>

</html>

