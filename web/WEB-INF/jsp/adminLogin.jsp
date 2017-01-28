<%-- 
    Document   : adminLogin
    Created on : Dec 2, 2016, 10:11:56 AM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Pulling Awesome Font -->
        
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <title>Admin Login</title>
        
    </head>
    <body>
    <form:form name="AdminLogin" method="POST" action="adminLogin.htm" modelAttribute="admin">
<div class="container">
    <div class="row">
		<div class="span12">
			
			  <fieldset>
			    <div id="legend">
			      <legend class="">Admin Login</legend>
			    </div>
                            <form:form name="LoginForm" method="POST" action="adminLogin.htm" modelAttribute="admin">
			    <div class="control-group">
			      <!-- Username -->
                              <label>${error}</label> <br/>
			      <form:label class="control-label"  for="username" path="login">Username</form:label>
			      <div class="controls">
			        <form:input type="text" id="username" name="username" path="login" class="input-xlarge"/>
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Password-->
			      <form:label class="control-label" for="password" path="password">Password</form:label>
			      <div class="controls">
			        <form:input type="password" path="password" name="password" placeholder="password" class="input-xlarge"/>
			      </div>
			    </div>
			    <div class="control-group">
			      <!-- Button -->
			      <div class="controls">
			        <button type="submit" class="btn btn-success">Login</button>
			      </div>
                              
                              </form:form>
			    </div>
			  </fieldset>
		</div>
	</div>
</div>

        </form:form>
    </body>
</html>
