<%-- 
    Document   : adminSearch
    Created on : 17-Nov-2016, 5:24:06 PM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Search</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        
        <style>
            #imaginary_container{
                margin-top:20%; 
            }
            .stylish-input-group .input-group-addon{
                background: white !important; 
            }
            .stylish-input-group .form-control{
                    border-right:0; 
                    box-shadow:0 0 0; 
                    border-color:#ccc;
            }
            .stylish-input-group button{
                border:0;
                background:transparent;
            }
        </style>
    </head>
    <body>
  <nav class="navbar navbar-inverse navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="/">Welcome, ${sessionScope.login}</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a id="Logout" href="adminLogout.htm">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
        <h1>Admin Search</h1>
        <form:form name="LoginForm" method="POST" action="searchResult.htm" modelAttribute="booking">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div id="imaginary_container"> 
                        <div class="input-group stylish-input-group">
                            <form:label path="reservationId">Please enter a reservation ID: </form:label>
                            <form:input type="number" min="0" class="form-control"  placeholder="Search" path="reservationId" />
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>  
                            </span>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        </form:form>
        
        <form:form name="SearchPhone" method="POST" action="searchPhone.htm" modelAttribute="user">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div id="imaginary_container"> 
                        <div class="input-group stylish-input-group">
                            <form:label path="phoneNumber">Please enter a Phone number: </form:label>
                            <form:input type="text" class="form-control"  placeholder="Search" path="phoneNumber" />
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>  
                            </span>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        </form:form>
        
        <br />
    <div class="form-group">
    <label class="col-md-4 control-label" for="singlebutton"></label>
    <div class="col-md-4">
        <button id="singlebutton" name="singlebutton" class="btn btn-primary center-block"
                onClick="location.href='/ReservationProject/first.htm'">
            Add Booking
        </button>
    </div>
    </div>
    </body>
</html>
