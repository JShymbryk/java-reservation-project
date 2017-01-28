<%-- 
    Document   : searchResults
    Created on : 17-Nov-2016, 5:23:18 PM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!doctype html>
<html>
<head>
    <title>
        WarningHouse Reservation
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
<style>
    .rateDetails{
       padding-top: 10%;
    }
    hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #6699FF;
    margin: 1em 0;
    padding: 0;
}
.top{
    background-color: #d9d9d9;
}
</style>
<body> 
            
 
<div class="container">
    <div class='top'>
    <div class="row">
   <div class="col-sm-12" >
               
                <img src="https://waringhousereservations.com/user_images/5%20Star%20Banner.jpg" width="100%" alt="banner">
            </div>
    </div>
    <div class="row">
        <div class="col-sm-5">
            Waring House Restaurant Inn & Cookery
        </div>
        <div class="col-sm-5">
           <%-- <fmt:parseDate value="${bookingInfo.getCheckin()}" var="theDate" 
     pattern="EEE MMM dd hh:mm:ss Z yyyy" />
       <fmt:formatDate value="${theDate}" pattern="dd/MM/yyyy" /> --%>
            Check-In: ${bookingInfo.getCheckin()}
        </div>
        <div class="col-sm-2">
            Rooms: ${bookingInfo.getNoRooms()} <a href='first.htm'>Edit</a>
        </div>
    </div>
        <div class="row">
        <div class="col-sm-5">
           395 Sandy Hook Road,  RR #8,  Picton, ON,  K0K 2T0,  613-476-7492
        </div>
        <div class="col-sm-5">
            Check-Out: ${bookingInfo.getCheckout()}
        </div>
        <div class="col-sm-2">
            Adults: ${bookingInfo.getNoAdults()} 
        </div>
    </div>
    </div>
    <div class="row">      
    <div class="col-sm-6">
        <br>
        <button class="btn" onclick="location.href='first.htm'">Reservations</button>
        <button class="btn" onclick="location.href='editBooking.htm'">Change Reservation</button>
        <button class="btn" onclick="location.href='deleteBooking.htm'">Cancel Reservation</button>
    </div>
         </div>
    <div class="row">
        <div class='col-sm-12'>
        <b>Select your room and rate</b>
        <hr>
        </div>
    </div><c:forEach var="listVar" items="${availableRoom}">
        <form:form action="searchResults.htm" method="post" modelAttribute="room">
      
    <div class="col-lg-12 well">
    <div class="row">
        <div class="col-sm-12">
             ${listVar.getRoomName()} 
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
                  ${listVar.getDescription()}
             
        
            </div>
    </div>
        <div class="row" >

            <div class="col-sm-4">
                
                <img src=" <c:out value="${listVar.getImage()}"/>" width="150" height="150" >

            </div>
            <div class="rateDetails">
            <div class="col-sm-8">

                <div class="row">

            <div class="col-sm-6">
                Type of rate
                
            </div>
            <div class="col-sm-6">
                Avg. Nightly Rate plus Taxes
            </div>
        </div> <hr>
                <div class="row">
                    <div class="col-sm-6">
                       ROOM RATE
                    </div>
                    <div class="col-sm-3">
                       
                          ${listVar.getPrice()} 
                    </div>
                    <div class="col-sm-3">
                    <form:hidden path='roomName' value="${listVar.getRoomName()}"></form:hidden>
                    <form:hidden path='id' value="${listVar.getId()}"></form:hidden>
                    <form:hidden path='roomType' value="${listVar.getRoomType()}"></form:hidden>
                    <form:hidden path='description' value="${listVar.getDescription()}"></form:hidden>
                    <form:hidden path='hotelId' value="${listVar.getHotelId()}"></form:hidden>
                    <form:hidden path='price' value="${listVar.getPrice()}"></form:hidden>
                        <input type="submit" value="Select">
                    </div>
                </div>
             <hr></div>
        </div>
        </div>
    </div> 
        
        </form:form> </c:forEach>
        ${errorMessage}
    </div>
</body>
</html>
