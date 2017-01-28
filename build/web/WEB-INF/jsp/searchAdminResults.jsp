<%-- 
    Document   : searchResults
    Created on : 17-Nov-2016, 5:23:18 PM
    
--%>

<%@page import="model.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Results</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
        
        <style>
    
        .panel-table .panel-body{
          padding:0;
        }

        .panel-table .panel-body .table-bordered{
          border-style: none;
          margin:0;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
            text-align:center;
            width: 100px;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
        .panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
          border-right: 0px;
        }

        .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
        .panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
          border-left: 0px;
        }

        .panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
          border-bottom: 0px;
        }

        .panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
          border-top: 0px;
        }

        .panel-table .panel-footer .pagination{
          margin:0; 
        }

        .panel-table .panel-footer .col{
         line-height: 34px;
         height: 34px;
        }

        .panel-table .panel-heading .col h3{
         line-height: 30px;
         height: 30px;
        }

        .panel-table .panel-body .table-bordered > tbody > tr > td{
          line-height: 34px;
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
        <div class="container">
    <div class="row">
    
    <p></p>
    <h1>Reservations</h1>
    
        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Search Results for Reservation ID</h3>
                  </div>
                </div>
              </div>
              <div class="panel-body table-responsive">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th><em class="fa fa-cog"></em></th>
                        <th class="hidden-xs">Reservation ID</th>
                        <th>Guest ID</th>
                        <th>Hotel ID</th>
                        <th>Adults</th>
                        <th>Children</th>
                        <th>Rooms</th>
                        <th>Promotion</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Rood Id</th>
                        <th>Room Type </th>
                        <th>Price Per Night</th>
                        <th>Total</th>
                        <th>Dinner Reservations</th>
                        <th>Special Requests</th>
                    </tr> 
                  </thead>
                  <tbody>
                      <c:forEach var="booking" items= "${result}">
                                          <tr>
                            <td align="center">
                             
                              <a class="btn btn-danger" href="${pageContext.request.contextPath}/${booking.getReservationId()}.htm"><em class="fa fa-trash"></em></a>
                            </td>
                            <td class="hidden-xs">${booking.getReservationId()}</td>
                            <td>${booking.getGuestId()}</td>
                            <td>${booking.getHotelId()}</td>
                            <td>${booking.getNoAdults()}</td>
                            <td>${booking.getNoChildren()}</td>
                            <td>${booking.getNoRooms()}</td>
                            <td>${booking.getPromotion()}</td>
                            <td>${booking.getCheckin()}</td>
                            <td>${booking.getCheckout()}</td>
                            <td>${booking.getRoomId()}</td>
                            <td>${booking.getRoomType()}</td>
                            <td>${booking.getPricePerNight()}</td>
                            <td>${booking.getPricetotal()}</td>
                            <td>${booking.getDinnerReservations()}</td>
                            <td>${booking.getSpecialRequests()}</td>
                          </tr>
                      </c:forEach>
          
                        </tbody>
                </table>
            
</div></div></div>
    
    </body>
</html>

