<%-- 
    Document   : navbar
    Created on : Jan 20, 2014, 4:30:34 AM
    Author     : adelahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Student Academic Petition Management System</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <form class="navbar-form navbar-right" role="search">
            <button id="btn_Logout" type="button" class="btn btn-default" >Log out</button>
            <script>
            	$("#btn_Logout").click(function(){
            		$("#div_login").show();
            		$("#div_student").hide();
            		$("#div_faculty").hide();
            		$("#div_nav").hide();
            	});
            </script>
        </form>
    </div>
</nav>
