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
		      <td>2000</td>
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
            type: 'bar'
        },
        title: {
            text: 'Fruit Consumption'
        },
        xAxis: {
            categories: ['Apples', 'Bananas', 'Oranges']
        },
        yAxis: {
            title: {
                text: 'Fruit eaten'
            }
        },
        series: [{
            name: 'Jane',
            data: [1, 0, 4]
        }, {
            name: 'John',
            data: [5, 7, 3]
        }],
    });
});
	
	</script>

</body>

</html>

