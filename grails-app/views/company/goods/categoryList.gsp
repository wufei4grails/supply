<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
    <r:require modules="ztree"/>
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
        <div id="legend" class="">
          <legend class="">商品分类列表</legend>
        </div>
        <div class="row-fluid">
          <div class="span4">
            <ul id="treeDemo" class="ztree"></ul>
          </div>
          <div class="span8" style="">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">添加一级分类</a></li>
              <li><a href="#profile" data-toggle="tab" id="catAttr"></a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade in active" id="home">
                <g:formRemote  id="addCategory" data-validate="parsley" onSuccess="addCategorySuccess(data)" class="form-horizontal" name="addCategory" on404="alert('not found!')" 
                              url="[controller: 'goods', action:'addCategory']">
                  <input type="hidden" name="parent_id" id="parent_id" value=""/>
                  <input type="hidden" name="name" id="name" value=""/>
                  <input type="hidden" name="node_id" id="node_id" value=""/>
                </g:formRemote>


                <g:formRemote id="removeCategory" data-validate="parsley" onSuccess="removeCategorySuccess(data)" class="form-horizontal" name="removeCategory" on404="alert('not found!')" 
                              url="[controller: 'goods', action:'removeCategory']">
                  <input type="hidden" name="node_id" id="node_id" value=""/>
                </g:formRemote>

                <g:formRemote  data-validate="parsley" onSuccess="addCategorySuccess(data)" class="form-horizontal" name="addCategory" on404="alert('not found!')" 
                              url="[controller: 'goods', action:'addCategory']">
                  <input type="hidden" name="parent_id" id="parent_id" value="1"/>
                  <fieldset >
                    <div class="control-group" >

                      <label class="control-label" for="input01" style="width:60px;">分类名称</label>
                      <div class="controls" style="margin-left:80px;">
                        <input  name="name" data-required-message="分类名称不能为空" data-required="true" type="text" placeholder="请输入分类名称" class="input-xlarge catename">
                        <p class="help-block"></p>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" style="width:60px;"></label>

                      <div class="controls" style="margin-left:80px;">
                        <button id='addCateButton' data-loading-text="正在提交..." type="submit" class="btn btn-primary">提交</button>
                      </div>
                    </div>
                  </fieldset>
                </g:formRemote>
              </div>
              <div class="tab-pane fade" id="profile">
                <div id="pgcAttr">
                
                </div>
<!--                <p>继承水果的属性：产地，功用</p>
                <p>继承仁果类的属性：果核数量</p>-->
                <p>自己的属性：</p>
                <g:formRemote data-validate="parsley"  class="form-horizontal" onSuccess="updateGoodsCategoryAttrSuccess(data)" name="updateGoodsCategoryAttr"  on404="alert('not found!')" 
                              url="[controller: 'goodsCategoryAttr', action:'updateGoodsCategoryAttr']">
                  <input type="hidden" name="c_id" id="c_id"/>
                  
                  <div class="well" id="updateattr">
<!--                    <div class="attr-controls">


                      <input value=""  name="attr_name" type="text" placeholder="" class="input-xlarge">
                      <a class="add" href="#" onclick="addAttr(this)">添加</a>
                      <a class="remove" style="display:none" href="#" onclick="removeAttr(this)">删除</a>

                    </div>-->
                    
                    
                    <div class="controls" align="left">
                      <button  type="submit" class="btn btn-primary">提交</button>
                    </div>
                  </div>
                  
                </g:formRemote>
                <div id="forattr">
                  <div class="attr-controls" style="display:none">


                    <input value=""  name="attr_name" type="text" placeholder="" class="input-xlarge">
                    <a class="add" href="#" onclick="addAttr(this)">添加</a>
                    <a class="remove" style="display:none" href="#" onclick="removeAttr(this)">删除</a>

                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row-fluid">
          </div><!--/span-->
        </div><!--/row-->



      </div> <!-- /container -->

    </div>

    <g:render template="/layouts/company_footer"/>
    <SCRIPT type="text/javascript">
      
                    function updateGoodsCategoryAttrSuccess(t){
                      if(t=='1'){
                        alert("修改分类属性成功！")
                      }
                      if(t=='0'){
                        alert('分类属性名不能为空！')
                      }
                    }
      
                    function removeCategorySuccess(t){
                      alert("删除分类成功！")
//                      window.location.reload();
                    }
        
                    function addCategorySuccess(t){
//                      var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
//                      treeObj.addNodes(null,t)
                      if(t=='0'){
                        //alert("请输入分类名称！")
                      }else{
                        alert("设置分类成功！")
                        window.location.reload();
                      }
                      
                    }
                    function removeAttr(o){
                      $(o).parents(".attr-controls").remove();
                    }
                    function addAttr(o){
                       var attr = $(o).parents(".attr-controls").clone();
                       attr.find("input").val("");
                       //$(o).parents(".well").append(attr);
                       $(o).parents(".attr-controls").after(attr);
                       $(o).next().show();
                       $(o).hide();
                    }
                   var setting = {
                           view: {
                                   addHoverDom: addHoverDom,
                                   removeHoverDom: removeHoverDom,
                                   selectedMulti: false
                           },
                           edit: {
                                   enable: true,
                                   editNameSelectAll: true
   //				showRemoveBtn: showRemoveBtn,
   //				showRenameBtn: showRenameBtn
                           },
                           data: {
                                   simpleData: {
                                           enable: true
                                   }
                           },
                           callback: {
                                   beforeDrag: beforeDrag,
                                   beforeEditName: beforeEditName,
                                   beforeRemove: beforeRemove,
                                   beforeRename: beforeRename,
                                   onRemove: onRemove,
                                   onRename: onRename,
                                   onClick: onClick
                           }
                   };
                   var zNodes = ${ctree}

                   var log, className = "dark";
                   
                   
                   function onClick(event, treeId, treeNode) {
                     $("#catAttr").html(treeNode.name+"分类的属性")
                     $("#c_id").val(treeNode.id)
                     
                     
                     $.ajax({
                        type: "POST",
                        url: "<%= request.getContextPath() %>/goodsCategoryAttr/selGoodsCategoryAttr",
                        data: "c_id="+treeNode.id,
                        success: function(msg){
                  
                          
//                  <p>继承水果的属性：产地，功用</p>
                           $("#pgcAttr").empty()
                          $(msg.pgcAttrJSON).each(function(){
                            
                            for (var k1 in this) {  
                                var p = "<p>继承"+k1+"的属性：" 
                                  
                                 for(var k2 in this[k1]){
                                   p = p + this[k1][k2].attr_name + ","
                                 }
              
                                p = p + "</p>"
//                                alert(p)
                                $("#pgcAttr").prepend(p)
                            }  
                            
                            
                            
                          });
                  
                          $("#updateattr .attr-controls").remove()
                          
                          
                          $(msg.gcAttrJSON).each(function(){
                            //alert(this.attr_name)
                            
                            var attr_controls = $("#forattr .attr-controls").clone();
                            attr_controls.find("input").val(this.attr_name);
//                            alert(attr_controls.html())
                            attr_controls.show()
                            $("#updateattr").prepend(attr_controls)
                            
                          });
                          
                          if($(msg.gcAttrJSON).length==0){
                            var attr_controls = $("#forattr .attr-controls").clone();
                            attr_controls.show()
                            $("#updateattr").prepend(attr_controls)
                          }
                          
                          $("#updateattr .remove").show();
                          $("#updateattr .add").hide();
                          $("#updateattr .add:last").show();
                          
                          
                          
                        }
                      });


                   }
                   
//                   function initCategoryAttr(data){
//                     alert(data)
//                   }
                   
                   function beforeDrag(treeId, treeNodes) {
                           return false;
                   }
                   function beforeEditName(treeId, treeNode) {
                           className = (className === "dark" ? "":"dark");
                           showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                           var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                           zTree.selectNode(treeNode);
//                           return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
                   }
                   function beforeRemove(treeId, treeNode) {
                           className = (className === "dark" ? "":"dark");
                           showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                           var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                           zTree.selectNode(treeNode);
                           return confirm("确认删除 商品分类： " + treeNode.name + " 吗？");
                   }
                   function onRemove(e, treeId, treeNode) {
                           
                       $("#removeCategory #node_id").val(treeNode.id);
                        $("#removeCategory").submit()
                      
                        showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                   }
                   function beforeRename(treeId, treeNode, newName) {
                           className = (className === "dark" ? "":"dark");
                           showLog("[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                           if (newName.length == 0) {
                                   alert("节点名称不能为空.");
                                   var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                                   setTimeout(function(){zTree.editName(treeNode)}, 10);
                                   return false;
                           }
                           return true;
                   }
                   function onRename(e, treeId, treeNode) {
                    
                      var parent_id = treeNode.getParentNode()==null?"1":treeNode.getParentNode().id;
                    
                      
                      $("#addCategory #parent_id").val(parent_id)
                      $("#addCategory #name").val(treeNode.name);
                      $("#addCategory #node_id").val(treeNode.id);
                      $("#addCategory").submit()
                      
                      
                      showLog("[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                   }
                   function showRemoveBtn(treeId, treeNode) {
                           return !treeNode.isFirstNode;
                   }
                   function showRenameBtn(treeId, treeNode) {
                           return !treeNode.isLastNode;
                   }
                   function showLog(str) {
                           if (!log) log = $("#log");
                           log.append("<li class='"+className+"'>"+str+"</li>");
                           if(log.children("li").length > 8) {
                                   log.get(0).removeChild(log.children("li")[0]);
                           }
                   }
                   function getTime() {
                           var now= new Date(),
                           h=now.getHours(),
                           m=now.getMinutes(),
                           s=now.getSeconds(),
                           ms=now.getMilliseconds();
                           return (h+":"+m+":"+s+ " " +ms);
                   }

                   var newCount = 1;
                   function addHoverDom(treeId, treeNode) {
                           var sObj = $("#" + treeNode.tId + "_span");
                           if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
                           var addStr = "<span class='button add' id='addBtn_" + treeNode.id
                                   + "' title='add node' onfocus='this.blur();'></span>";
                           sObj.after(addStr);
                           var btn = $("#addBtn_"+treeNode.id);
                           if (btn) btn.bind("click", function(){
                                   var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                                   zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                                   return false;
                           });
                   };
                   function removeHoverDom(treeId, treeNode) {
                           $("#addBtn_"+treeNode.id).unbind().remove();
                   };
                   function selectAll() {
                           var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                           zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
                   }
		
                   $(document).ready(function(){
                           $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                           $("#selectAll").bind("click", selectAll);
                   });
    </SCRIPT>
    <style type="text/css">
      .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
      .attr-controls{
        margin-bottom:5px;
      }
    </style>
</body>

</html>

