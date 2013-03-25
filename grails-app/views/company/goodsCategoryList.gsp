<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
    <r:require modules="bootstrap"/>
    <r:require modules="ztree"/>
</head>
<body>

  <div class="container">


    <g:render template="/layouts/company_header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li><a href="goodsPub">发布新商品</a></li>
            <li ><a href="upGoodsList">上架商品列表</a></li>
            <li ><a href="downGoodsList">下架商品列表</a></li>
            <li class="active"><a href="goodsCategoryList">商品分类列表</a></li>
          </ul>
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
              <li><a href="#profile" data-toggle="tab">苹果分类的属性</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade in active" id="home">
                <form class="form-horizontal">
                  <fieldset >
                    <div class="control-group" >

                      <label class="control-label" for="input01" style="width:60px;">分类名称</label>
                      <div class="controls" style="margin-left:80px;">
                        <input type="text" placeholder="请输入分类名称" class="input-xlarge">
                        <p class="help-block"></p>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" style="width:60px;"></label>

                      <div class="controls" style="margin-left:80px;">
                        <button class="btn btn-primary">提交</button>

                      </div>
                    </div>
                  </fieldset>
                </form>
              </div>
              <div class="tab-pane fade" id="profile">
                <p>继承水果的属性：产地，功用</p>
                <p>继承仁果类的属性：果核数量</p>
                <p>苹果的属性：</p>
                <div class="well">
                  <div class="attr-controls">
                    <input type="text" placeholder="" class="input-xlarge">
                    <a href="#" onclick="addAttr(this)">添加</a>
                    <a style="display:none" href="#" onclick="removeAttr(this)">删除</a>
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
                    function removeAttr(o){
                      $(o).parents(".attr-controls").remove();
                    }
                    function addAttr(o){
                       var attr = $(o).parents(".attr-controls").clone();
                       attr.find("input").val("");
                       $(o).parents(".well").append(attr);
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
                                   onRename: onRename
                           }
                   };

                   var zNodes =[
                           { name:"水果",
                                   children: [
                                           { name:"瓜类", open:true,
                                                   children: [
                                                           { name:"西瓜"},
                                                           { name:"香瓜"},
                                                           { name:"菜瓜"},
                                                           { name:"哈密瓜"}
                                                   ]},
                                           { name:"仁果类",
                                                   children: [
                                                           { name:"苹果"},
                                                           { name:"梨"}
                                                   ]},
                                           { name:"浆果类",
                                                   children: [
                                                           { name:"葡萄"},
                                                           { name:"蕃茄"}
                                                   ]}
                                   ]},
                           { name:"蔬菜",
                                   children: [
                                           { name:"根菜类", open:true,
                                                   children: [
                                                           { name:"胡萝卜"},
                                                           { name:"大头菜"},
                                                           { name:"芜菁"},
                                                           { name:"根用甜菜"}
                                                   ]},
                                           { name:"绿叶蔬菜",
                                                   children: [
                                                           { name:"莴苣"},
                                                           { name:"芹菜"},
                                                           { name:"菠菜"},
                                                           { name:"茼蒿"}
                                                   ]},
                                           { name:"葱蒜类",
                                                   children: [
                                                           { name:"洋葱"},
                                                           { name:"大蒜"}
                                                   ]}
                                   ]}

                   ];

                   var log, className = "dark";
                   function beforeDrag(treeId, treeNodes) {
                           return false;
                   }
                   function beforeEditName(treeId, treeNode) {
                           className = (className === "dark" ? "":"dark");
                           showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                           var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                           zTree.selectNode(treeNode);
                           return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
                   }
                   function beforeRemove(treeId, treeNode) {
                           className = (className === "dark" ? "":"dark");
                           showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
                           var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                           zTree.selectNode(treeNode);
                           return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
                   }
                   function onRemove(e, treeId, treeNode) {
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
    </style>
</body>

</html>

