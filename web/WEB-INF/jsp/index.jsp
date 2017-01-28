<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en" xmlns:p="http://primefaces.org/ui"  >
<head>
    <meta charset="UTF-8">
    <title>WarningHouse Reservation</title>
    <link rel="stylesheet" href="<c:url value="mainStyle.css" />">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <style>
        BODY {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

A {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

TD {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

UL {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

OL {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

INPUT {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

SELECT {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

.BodyBackgroundOld {
    BACKGROUND-COLOR: #ffffff;
    MARGIN-LEFT: 0px;
    MARGIN-TOP: 1px;
    PADDING-BOTTOM: 20px;
    PADDING-LEFT: 3px;
    PADDING-RIGHT: 3px;
    PADDING-TOP: 0px;
    POSITION: static;
    WIDTH: 995px;
}

.BodyBackground {
    BACKGROUND-COLOR: #FFFFFF;
    MARGIN-LEFT: 0px;
    MARGIN-TOP: 1px;
    PADDING-BOTTOM: 20px;
    PADDING-LEFT: 3px;
    PADDING-RIGHT: 3px;
    PADDING-TOP: 0px;
    POSITION: static;
}

.HeaderText1 {
    COLOR: #1A0000;
    FONT-SIZE: 15px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-LEFT: 5px;
    PADDING-TOP: 3px;
    PADDING-BOTTOM: 3px;
}

.HeaderText2 {
    BACKGROUND-COLOR: #dfddcc;
    FONT-SIZE: 12px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-LEFT: 5px;
    PADDING-TOP: 2px;
    PADDING-BOTTOM: 2px;
}

.BodyText {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
}

.StayInformationHeader {
    BACKGROUND-COLOR: #dfddcc;
    COLOR: #000000;
    FONT-SIZE: 11px;
    FONT-WEIGHT: bold;
    HEIGHT: 26px;
    PADDING-BOTTOM: 0px;
    PADDING-LEFT: 8px;
    PADDING-RIGHT: 0px;
    PADDING-TOP: 0px;
}

.StayInformationDetails {
    background-color: #f2f2e2;
    COLOR: #000000;
    FONT-SIZE: 8pt;
    PADDING-BOTTOM: 0px;
    PADDING-LEFT: 5px;
    PADDING-RIGHT: 0px;
    PADDING-TOP: 0px;
}

.StayInformationThumbNail {
    background-color: #f2f2e2;
    COLOR: #000000;
    FONT-SIZE: 8pt;
    PADDING-BOTTOM: 0px;
    PADDING-LEFT: 5px;
    PADDING-RIGHT: 0px;
    PADDING-TOP: 0px;
}

.EnhanceYourStay {
    COLOR: #000000;
    FONT-SIZE: 11px;
    FONT-WEIGHT: bold;
    HEIGHT: 26px;
}

.SignInSectionHeader {
    COLOR: #000000;
    FONT-SIZE: 11px;
    FONT-WEIGHT: bold;
    HEIGHT: 26px;
    PADDING-BOTTOM: 0px;
    PADDING-LEFT: 8px;
    PADDING-RIGHT: 0px;
    PADDING-TOP: 0px;
}

.SignInSectionDetails {
    COLOR: #000000;
    FONT-SIZE: 11px;
    FONT-WEIGHT: normal;
    HEIGHT: 26px;
    PADDING-BOTTOM: 0px;
    PADDING-LEFT: 8px;
    PADDING-RIGHT: 0px;
    PADDING-TOP: 0px;
}

.DetailsText {
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.AvgRateText {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 11px;
    FONT-WEIGHT: bold;
}

.ErrorText {
    COLOR: #d5813b;
    FONT-SIZE: 15px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.RoomTypeText {
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.PopupHeader1 {
    COLOR: #d5813b;
    FONT-SIZE: 15px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.PopupHeader2 {
    COLOR: #d5813b;
    FONT-SIZE: 15px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.PopupText1 {
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.PopupText2 {
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.CorpInfo {
    FONT-SIZE: 12px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.GroupInfo {
    FONT-SIZE: 12px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.InstructionText {
    COLOR: black;
    FONT-SIZE: 13px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.DateLabelText {
    FONT-FAMILY: Arial, Verdana, sans-serif;
    FONT-SIZE: 9px;
}

.SurveyText1 {
    FONT-SIZE: 15px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 15px;
}

.SurveyText2 {
    FONT-SIZE: 15px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 10px;
}

.SurveyText3 {
    FONT-SIZE: 14px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.SurveyQuestions {
    FONT-SIZE: 14px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.SurveyRankings {
    FONT-SIZE: 12px;
    FONT-WEIGHT: bold;
    LINE-HEIGHT: 10px;
    PADDING-BOTTOM: 3px;
    TEXT-ALIGN: center;
}

.ThumbNailRoomTypeHeader {
    FONT-SIZE: 20px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 25px;
    PADDING-BOTTOM: 3px;
}

.ThumbNailRoomTypeDescription {
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.ThumbNailRateTypeSelectTitle {
    background-color: #dfddcc;
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 12px;
    PADDING-BOTTOM: 0px;
}

.ThumbNailRateTypeSelect {
    background-color: #dfddcc;
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 12px;
    PADDING-BOTTOM: 0px;
}

.ThumbNailRateTypeTitle {
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 12px;
    PADDING-BOTTOM: 0px;
}

.ThumbNailRateTypeHeader {
    FONT-SIZE: 15px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.ThumbNailRateTypeDescription {
    FONT-SIZE: 12px;
    FONT-WEIGHT: normal;
    LINE-HEIGHT: 20px;
    PADDING-BOTTOM: 3px;
}

.ThumbNailAverageRate {
    FONT-SIZE: 16px;
    FONT-WEIGHT: bold;
    line-height: 20px;
}
.ThumbNailBeforeDiscountRate {
    FONT-SIZE: 16px;
    FONT-WEIGHT: normal;
    line-height: 20px;
    text-decoration: line-through;
}
.SelectButton
{
    FONT-SIZE: 12px;
    FONT-WEIGHT: bold;
    background-color: #4C864C;
    border: solid 5px #4C864C;
    display: inline-block;
    color: #FFFFFF;
}
.SelectButton:hover
{
    background-color: #00E600;
    border: solid 5px #00E600;
}
.banner{
   height: 150px;
   background-color: black;
   color: white;
   text-align: center;
     
}
#title{
     padding-top: 50px;
     font-size: 25px;
}
.nav{
    background-color: #aeb4bf;
    border: 1px solid grey;
}
        </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12" >
               
                <img src="https://waringhousereservations.com/user_images/5%20Star%20Banner.jpg" width="100%" alt="banner">
            </div>
        </div>
<div class="row">      
    <div class="col-sm-6">
         
        <button class="btn" onclick="location.href='first.htm'">Reservations</button>
        <button class="btn" onclick="location.href='editBooking.htm'">Change Reservation</button>
        <button class="btn" onclick="location.href='deleteBooking.htm'">Cancel Reservation</button>
    </div>
         </div>
        <div class="row">
            <div class="col-sm-6">
 <form:form action="submitCheck.htm" method="post" modelAttribute="booking">
    
            <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
                <tr>
                    <td width="15%">
                    </td>
                    <td width="15%">
                    </td>
                    <td width="13%">
                    </td>
                    <td width="13%">
                    </td>
                    <td width="13%">
                    </td>
                    <td width="22%">
                    </td>
                    <td width="5%">
                    </td>
                    <td width="4%">
                    </td>
                </tr>

                <tr>
                    <td colspan="8" class="HeaderText1">Select Your Reservation Details</td>
                </tr>
                <tr>
                    ${errorMsg}
                    <td colspan="8"><form:errors class="error" path="checkin"></form:errors></td>
                </tr>
                <tr>
                    <td colspan="8"><form:errors class="error" path="checkout"></form:errors></td>
                </tr>
                <tr>
                    <td colspan="8"> <form:errors class="error" path="noAdults"></form:errors> </td>
                </tr>
                <tr>
                    <td colspan="7" class="HeaderText2">Stay Information:</td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td colspan="1" class="DateLabelText"></td>
                    <td colspan="1" class="DateLabelText"></td>
                    <td colspan="1" class="DateLabelText"></td>
                </tr>
                <tr>
                 
                    <td colspan="2" align="right">Check-In:
                    </td>
                    <td colspan="2"> <form:input path="checkin" type="text" class="datepicker" name="startDate" size="10" maxlength="10" readonly="readonly"></form:input></td>
                </tr>
                <tr>
              
                    <td  colspan="2" align="right">Check-Out:
                    </td>
                    <td colspan="2"><form:input path="checkout" type="text" class="datepicker" name="endDate" size="10" maxlength="10" readonly="readonly"></form:input></td>
                </tr>

                <script>
                    $(document).ready( function() {
                    $( ".datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'}
                            );
                    $( ".datepicker" ).attr('readonly', 'readonly');});
                </script>
                <tr>
                    
                    <td colspan="2" align="right">Rooms:
                    </td>
                    <td colspan="2">
                        <form:select path="NoRooms"> 
                       <form:option value="1" label="1" selected="true"/>
                       <form:option value="2" label="2" />
                       <form:option value="3" label="3" />
                       <form:option value="4" label="4" />
                       </form:select></td>
              
                </tr>
                <tr>
                 
                    <td colspan="2" align="right">Adults:
                    </td>
                    <td colspan="2">
                        <form:select path="NoAdults"> 
                       <form:option value="1" label="1"/>
                       <form:option value="2" label="2" selected="true"/>
                       <form:option value="3" label="3" />
                       <form:option value="4" label="4" />
                       </form:select></td>
                </tr>
                <tr>
                        
                    <td colspan="2" align="right">Children:
                    </td>
                    <td colspan="2">
                        <form:select path="NoChildren"> 
                            <form:option value="0" label="0" selected="true"/>
                       <form:option value="1" label="1"/>
                       <form:option value="2" label="2" />
                       <form:option value="3" label="3" />
                       <form:option value="4" label="4" />
                       </form:select>
                        
                        
                     </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">Promotional Code:
                    </td>
                    <td colspan="2"><input type="text" path="promotionalcode" name="PromotionalCode" size="6" maxlength="6"></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1">
                <tr>
                    <td width="24%">
                    </td>
                    <td width="24%">
                    </td>
                    <td width="24%">
                    </td>
                    <td width="24%">
                    </td>
                    <td width="4%">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="HeaderText2">Preferences</td>
                </tr>
                <tr>
                    <td align="right">Type Of Rate:
                    </td>
                    <td align="left"><input type="Radio" name="RateTypePreference" value="Standard" style="vertical-align: middle; margin: 3px;">Standard</td>
                    <td align="left"><input type="Radio" name="RateTypePreference" value="Package" style="vertical-align: middle; margin: 3px;">Package</td>
                    <td align="left"><input type="Radio" name="RateTypePreference" value="Both" style="vertical-align: middle; margin: 3px;" checked="yes">Both</td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1">
                <tr>
                    <td width="30%">
                    </td>
                    <td width="20%">
                    </td>
                    <td width="26%">
                    </td>
                    <td width="20%">
                    </td>
                    <td width="4%">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="HeaderText2">Special Accounts</td>
                </tr>
                <tr>
                    <td align="right">Corporate Code:
                    </td>
                    <td><input type="text" name="CorporateCode" size="6" maxlength="6" value=""></td>
                    <td align="right">Online Password:
                    </td>
                    <td align="left"><input type="text" name="CorporateCodePIN" size="6" maxlength="6" value=""></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <hr color="#6699FF" size="0">
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1">
                <tr>
                    <td width="100%" align="center"><input align="right" type="SUBMIT" value="Check Availability &amp; Rates"></td>
                </tr>
            </table>
          
        </tr>
        

          <form:errors class="error" path="noAdults"></form:errors>
        

    </form:form>
</div>
    
       
            <div class="col-sm-6">
                <div class="row">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td class="StayInformationHeader">Hotel Information</td>
</tr>
<tr>
<td class="StayInformationDetails">Waring House Restaurant Inn &amp; Cookery<br>395 Sandy Hook Road<br>RR #8<br>Picton, ON<br>K0K 2T0<br>613-476-7492<br><br></td>
</tr>
<tr>
<td rowspan="1" class="" align="center">
</td>
                </table>
    </div>
                <div class="row">
                    <div class="col-sm-6">
                        <img src="http://waringhouse.com/wp-content/uploads/retail-2.jpg" width="550" height="300">
                    </div>
                </div>
            </div>
        </div>
</body>
</html>