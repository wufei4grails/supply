<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
	
        
</head>

<body style="font-family:'Arial Unicode MS'">
      <style type="text/css">
		body {
			font-size:12px;
			
			border-color:#CCCCCC;
			table-layout:fixed; 
			word-break:break-strict;
			width:100%;
		}
		
		.tdb {border:1px solid;border-color:#CCCCCC;}
		
	</style>
        
        
	<table cellspacing="0" style="  border-collapse:collapse;" id="printArea">
		<tr >
			<td >
                          <g:if test="${params.print_barcode == '1'}">
                            <div id="barcodeTarget"></div>
                          </g:if>
                          
                          
			</td>
			<td >
			</td>
			<td ></td>
			<td ></td>
			<td ></td>
			<td ></td>
			<td ></td>
			<td colspan="2">
                          <g:if test="${params.print_order_sn == '1'}">
                            订单号：${shoppingOrder.order_sn}
                          </g:if>  
                        </td>
		</tr>
<!--		<tr >
			<td width="650px" colspan="9" align="center" style="font-size:20px;">
			<br/>
			</td>
			
		</tr>-->
<!--		<tr >
			<td   colspan="9" align="center" style="font-size:20px;">猴坑茶业全程供应链管理平台--打印订单</td>
		</tr>-->
<!--		<tr >
			<td   colspan="9" align="center" style="">
			<span style="font-size: 15px;margin-right: 50px;">（取货收据）</span>
			</td>
		</tr>-->
<!--		<tr >
			<td width="650px" colspan="9" align="center" style="font-size:20px;">
			<br/>
			</td>
			
		</tr>-->
<!--		<tr style="height: 20px;">
			<td >卖家ID：</td>
			<td >zfpifatest</td>
			<td >卖家名称：</td>
			<td >zftest店铺</td>
			<td ></td>
			<td >负责人：</td>
			<td >zf</td>
			<td >联系电话：</td>
			<td >18715059331</td>
		</tr>
		<tr >
			<td >地址：</td>
			<td colspan="5" >中国>广东>东莞市>虎门 合肥政务区西游</td>
			
		</tr>-->
		<tr >
			<td colspan="8">&nbsp;</td>
			
		</tr>
		
		<g:if test="${params.print_order_person == '1'}">
			<tr >
				
				<td colspan="2" align="center" class="tdb">收货人</td>
				<td colspan="5" align="center" class="tdb">${shoppingOrder.person_name}</td>
				<td class="tdb" align="center">手机号码</td>
				<td class="tdb" align="center">${shoppingOrder.telphone}</td>
			</tr>
			<tr >
				<td colspan="2" align="center" class="tdb">收货地址</td>
				<td colspan="7" align="center" class="tdb"><area:areaName id="${shoppingOrder.area_id}"/> ${shoppingOrder.address}</td>
			</tr>
		</g:if>	
			
                        <g:if test="${params.print_order_goods == '1'}">
                        
			<tr >
				<td colspan="4" align="center" class="tdb">商品名称</td>
				<td colspan="2" align="center" class="tdb">商品编号</td>
				
				<td colspan="1" align="center" class="tdb">价格</td>
                                <td align="center" class="tdb">数量</td>
				<td colspan="1" align="center" class="tdb">小计</td>
			</tr>
			
			
                        
                        
                          <g:each in="${orderGoods}" status="i" var="goods">

                                <tr >
                                          <td colspan="4" align="center" class="tdb">${goods.goods.goods_name}</td>
                                          <td colspan="2" align="center" class="tdb">${goods.goods.goods_sn}</td>

                                          <td colspan="1" align="center" class="tdb">${goods.price}</td>
                                          <td align="center" class="tdb num" >${goods.num}</td>
                                          <td  align="center" class="tdb amount">${goods.price * goods.num}</td>

                                  </tr>


                          </g:each>





                          <tr >
                                  <td colspan="6" align="center" class="tdb">合计</td>

                                  <td colspan="1" align="center" class="tdb"></td>
                                  <td align="center" class="tdb total_num" >6</td>
                                  <td colspan="1" align="center" class="tdb total_amount"  ></td>
                          </tr>
			</g:if>
			<tr >
				<td colspan="8">&nbsp;</td>
			</tr>
			
		
			
		
			
		
			
		
<!--		<tr >
			<td colspan="2" align="center" class="tdb">合计出货数量：</td>
			<td colspan="7" align="center" class="tdb">24</td>

		</tr>
		<tr >
			<td colspan="2" align="center" class="tdb">授权取货人姓名：</td>
			<td colspan="3" align="center" class="tdb"></td>
			<td colspan="2" align="center" class="tdb">联系电话：</td>
			<td colspan="2" align="center" class="tdb"></td>
		</tr>
		<tr >
			<td colspan="9">&nbsp;</td>
		</tr>-->
		
		
		
		
		
		
<!--		<tr >
			<td colspan="9" style="color:red">
				此联做为取货凭证交给批发商，取货时需清点数量无误。
			</td>
		</tr>-->
		<tr >
			<td colspan="9">&nbsp;</td>
		</tr>
<!--		<tr >
			<td colspan="3" align="center" ></td>
			<td colspan="2" align="center" ></td>
			<td colspan="2" align="center" >签收人：</td>
			<td colspan="2" align="center" style="border-bottom:1px solid black"></td>
		</tr>-->
                <tr >
			<td colspan="3" align="center" ></td>
			<td colspan="2" align="center" ></td>
                        <td colspan="2" align="center" ></td>
			<td colspan="2" align="center" ></td>
		</tr>
                <tr >
			<td colspan="1" align="left" >
                          <g:if test="${params.print_time == '1'}">
                              打印时间:${printTime}
                         </g:if>
                          
                        
                        </td>
			<td colspan="4" align="left" ></td>
                        <td colspan="2" align="center" >
                          
                          <g:if test="${params.print_user == '1'}">
                              打印人:${session.loginPOJO.user.name}
                         </g:if>
                          
                          
                        </td>
			<td colspan="2" align="left" ></td>
		</tr>
               <tr >
			<td colspan="9">&nbsp;</td>
		</tr>
                <tr >
			<td colspan="9">&nbsp;</td>
		</tr>
                <tr >
			<td colspan="9">&nbsp;</td>
		</tr>
                <tr >
			<td colspan="9">&nbsp;</td>
		</tr>
	</table>
        
        <div id="aside"></div>
        
        
        <link rel="stylesheet" href="${resource(absolute='true', file: 'js/jquery-print-preview-plugin-master/src/css/print-preview.css')}" type="text/css" media="screen">

        

<g:javascript src="jquery-1.8.0.min.js" />


<g:javascript src="jquery-print-preview-plugin-master/src/jquery.tools.min.js" /> 

<g:javascript src="jquery-print-preview-plugin-master/src/jquery.print-preview.js" /> 

<g:javascript src="jquery-barcode.min.js" /> 
  <script>
	  
	  $(document).ready(function(){
              $("#printArea").scrollable({interval: 2000}).autoscroll();
            
            /*
             * Initialise print preview plugin
             */
            // Add link for print preview and intialise
            $('#aside').prepend('<a href="javascript:void(0)" class="print-preview">确定打印</a>');
            $('a.print-preview').printPreview();

            
                  $("#barcodeTarget").barcode("${shoppingOrder.order_sn}", "int25",{barWidth:2, barHeight:30});
//            
//            
            
		  var num = "0";
		  jQuery(".num").each(function(){
			  num = parseInt(num) + parseInt(jQuery(this).html());
		  });
		  jQuery(".total_num").html(num);
		  
		  var amount = "0";
		  jQuery(".amount").each(function(){
			  amount = parseFloat(amount) + parseFloat(jQuery(this).html());
		  });
		  jQuery(".total_amount").html(amount);
	  });
          
          
            
  </script>
  
  

</body>

</html>

