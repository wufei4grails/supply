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



          <div class="row-fluid">
		<div class="span6">
		    <table class="table table-striped">
		  <tbody>
		      <tr>
		      <td>门店数量</td>
		      <td>28</td>
		    </tr>
		    <tr>
		      <td>账户</td>
		      <td>2000元</td>
		    </tr>

		  </tbody>
		</table>
		</div>
		<div class="span6">
			<div id="container" style="height: 300px"></div>
		</div>
	</div>
		<div class="row-fluid">
			<div class="span6">
				a
			</div>
			<div class="span6">b
			</div>
	      </div>


	    </div><!--/span-->
	  </div><!--/row-->


      <g:render template="/layouts/company_footer"/>

    </div> <!-- /container -->
    <style>
      .goods-title{
        border-bottom: 1px solid rgba(0,0,0,0.2);
      }


      .img-polaroid{
        height: 250px;
      }

    </style>
    <script>
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '企业分类商品统计'
        },
        xAxis: {
            categories: ['水果', '蔬菜', '山货']
        },
        yAxis: {
            title: {
                text: '数量'
            }
        },
        series: [{
            name: '分类',
            data: [1, { y: 3, color: '#BF0B23'}, 4]
        }
//        , {
//            name: 'John',
//            data: [5, 7, 3]
//        }
      ],
    });
    
    
    jQuery("tspan").each(function(){
        
        if(jQuery(this).text()=='Highcharts.com'){
          jQuery(this).remove();
        }
      
    });
    
});
	
	</script>

</body>

</html>

