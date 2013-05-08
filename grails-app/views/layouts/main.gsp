<!DOCTYPE html>
<html lang="en">
   <head>
      <g:layoutTitle/>
      
      <r:require modules="bootstrap"/>
      <r:layoutResources/>
      <r:require modules="parsley"/>
      <r:require modules="chart"/>
      <r:layoutResources/>
      <style>
    .pagination-right {
      text-align: right;
    }
    .pagination {
      margin: 20px 0;
    }

    .new-pagination{
      display: inline-block;
      margin-bottom: 10;
      margin-left: 0;
      -webkit-border-radius: 4px;
      -moz-border-radius: 4px;
      border-radius: 4px;
      -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
      -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
      float: right;
      
    }

    .pagination  > a, .pagination  > span {
      float: left;
      padding: 4px 12px;
      line-height: 20px;
      text-decoration: none;
      background-color: #ffffff;
      border: 1px solid #dddddd;
      border-left-width: 1;
    }
    
    

  </style>
   </head>
   <body>
	   
      <g:layoutBody/>
      
   </body>
</html>