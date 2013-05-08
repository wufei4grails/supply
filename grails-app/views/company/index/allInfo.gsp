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
			<canvas id="canvas" height="" width=""></canvas>
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

		var barChartData = {
			labels : ["上架商品","下架商品"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					data : [65,1]
				},
				{
					strokeColor : "rgba(151,187,205,1)",
					data : [28,2]
				}
			]
			
		}

	var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Bar(barChartData);
	
	</script>

</body>

</html>

