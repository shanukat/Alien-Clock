<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alien.aspx.cs" Inherits="AlienClock.Alien" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

   

    <title>Alien Clock</title>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
   <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
   <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />

     <link href="css/Alien.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

     

        $("[id*=btnSetDateTime]").live("click", function () {
            DisableFields();
            $("#dialog").dialog({
                title: "Set Alien Date and Time",
                buttons: {
                    Close: function () {
                        $(this).dialog('close');

                        DisableFields();
                    }
                },
                modal: true,
                open: function (type, data) {
                    $(this).parent().appendTo("form");
                }
            });
            return false;
        });
               

        function DisableFields()
          {
            document.getElementById('<%= txtYear.ClientID%>').value = "";
            document.getElementById('<%= txtMonth.ClientID%>').value = "";
            document.getElementById('<%= txtDay.ClientID%>').value = "";
            document.getElementById('<%= txtHour.ClientID%>').value = "";
            document.getElementById('<%= txtMinute.ClientID%>').value = "";
            document.getElementById('<%= txtSecond.ClientID%>').value = "";
           
            document.getElementById('<%= cvMonth.ClientID%>').innerHTML = "";
            document.getElementById('<%= cvDay.ClientID%>').innerHTML = "";
            document.getElementById('<%= cvhr.ClientID%>').innerHTML = "";
            document.getElementById('<%= cvMin.ClientID%>').innerHTML = "";
            document.getElementById('<%= CvSec.ClientID%>').innerHTML = "";

        }

        function checkMonth(oSrc, args) {
              args.IsValid = false;
              var month = args.Value.trim();
             
              if (month == '') {
                  oSrc.innerHTML = "Please enter Month";
              }
              else if (month>18) {
                  oSrc.innerHTML = "Invalid Month";
              }
              else {
                  args.IsValid = true;
              }
             
        };

        function checkDays(oSrc, args) {
            args.IsValid = false;
            var day = args.Value.trim();

            if (day == '') {
                oSrc.innerHTML = "Please enter Day";
            }
            else if (day > 48) {
                oSrc.innerHTML = "Invalid Day";
            }
            else {
                args.IsValid = true;
            }

        };
        function checkHours(oSrc, args) {
            args.IsValid = false;
            var hr = args.Value.trim();

            if (hr == '') {
                oSrc.innerHTML = "Please enter Hour";
            }
            else if (hr > 36) {
                oSrc.innerHTML = "Invalid Hour";
            }
            else {
                args.IsValid = true;
            }

        };
        function checkMinute(oSrc, args) {
            args.IsValid = false;
            var min = args.Value.trim();

            if (min == '') {
                oSrc.innerHTML = "Please enter Minute";
            }
            else if (min > 90) {
                oSrc.innerHTML = "Invalid Minute";
            }
            else {
                args.IsValid = true;
            }

        };
        function checkSecond(oSrc, args) {
            args.IsValid = false;
            var sec = args.Value.trim();

            if (sec == '') {
                oSrc.innerHTML = "Please enter Second";
            }
            else if (sec > 90) {
                oSrc.innerHTML = "Invalid Second";
            }
            else {
                args.IsValid = true;
            }

        };
       
        function isNumber(e) {

               var code = ('charCode' in e) ? e.charCode : e.keyCode;
               if (code > 31 && (code < 48 || code > 57)) {
                   e.preventDefault();
                }
        }

    </script>
</head>
<body>
    <center>

    
    <div class="main">
        <div class="container">
            <form id="form1" runat="server">
        <div>
            <h1>Alien Clock</h1>
            <div class="clock">
                <div id="alienClock" style="color:lawngreen" runat="server"></div>
            </div>
            
            <br />
            <asp:Button ID="btnSetDateTime" CssClass="fuction_btn" runat="server" Text="Set Date and Time" />
            <asp:Button ID="btnRefresh" CssClass="fuction_btn"  runat="server" Text="Refresh to current time" OnClientClick="DisableFields();" />

            <br />
            <br />
           
       

            <h1>Earth Clock</h1>
            <div id="dvEarthClock" style="color:lawngreen" runat="server"></div>
            <br />

           <div id="dialog" style="display: none">
                
                <asp:Label ForeColor="Red" runat="server">*</asp:Label>
                <label>Year: </label>
                <asp:TextBox ID="txtYear" MaxLength="4" Width="100%" runat="server" onkeypress="return isNumber(event)"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfyear" runat="server" ValidationGroup="AL"
                ErrorMessage="Please enter Year" ControlToValidate="txtYear"
                Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />

                <asp:Label ForeColor="Red" runat="server">*</asp:Label>
                <label>Month: </label>
                <asp:TextBox ID="txtMonth" MaxLength="2" Width="100%" runat="server" onkeypress="return isNumber(event)"></asp:TextBox>

                 <asp:CustomValidator ID="cvMonth" runat="server" ControlToValidate="txtMonth" Display="Dynamic"
                ValidateEmptyText="true" SetFocusOnError="true" ForeColor="Red" Font-Size="17px"
                ValidationGroup="AL" ClientValidationFunction="checkMonth" />

                <br />

                <asp:Label ForeColor="Red" runat="server">*</asp:Label>
                <label>Day: </label>
                <asp:TextBox ID="txtDay" MaxLength="2" Width="100%" runat="server" onkeypress="return isNumber(event)"></asp:TextBox>
                
                 <asp:CustomValidator ID="cvDay" runat="server" ControlToValidate="txtDay" Display="Dynamic"
                ValidateEmptyText="true" SetFocusOnError="true" ForeColor="Red" Font-Size="17px"
                ValidationGroup="AL" ClientValidationFunction="checkDays" />
                <br />

                <asp:Label ForeColor="Red" runat="server">*</asp:Label>
                <label>Hour: </label>
                <asp:TextBox ID="txtHour" MaxLength="2" Width="100%" runat="server" onkeypress="return isNumber(event)"></asp:TextBox>
                 <asp:CustomValidator ID="cvhr" runat="server" ControlToValidate="txtHour" Display="Dynamic"
                ValidateEmptyText="true" SetFocusOnError="true" ForeColor="Red" Font-Size="17px"
                ValidationGroup="AL" ClientValidationFunction="checkHours" />

                <br />

                <asp:Label ForeColor="Red" runat="server">*</asp:Label>
                <label>Minute: </label>
                <asp:TextBox ID="txtMinute" MaxLength="2"  Width="100%" runat="server" onkeypress="return isNumber(event)"></asp:TextBox>
                 <asp:CustomValidator ID="cvMin" runat="server" ControlToValidate="txtMinute" Display="Dynamic"
                ValidateEmptyText="true" SetFocusOnError="true" ForeColor="Red" Font-Size="17px"
                ValidationGroup="AL" ClientValidationFunction="checkMinute" />
                <br />

                <asp:Label ForeColor="Red" runat="server">*</asp:Label>
                <label>Second: </label>
                <asp:TextBox ID="txtSecond" MaxLength="2" Width="100%" runat="server" onkeypress="return isNumber(event)"></asp:TextBox>
            
                <asp:CustomValidator ID="CvSec" runat="server" ControlToValidate="txtSecond" Display="Dynamic"
                ValidateEmptyText="true" SetFocusOnError="true" ForeColor="Red" Font-Size="17px"
                ValidationGroup="AL" ClientValidationFunction="checkSecond" />
                <br />
                 <br />

                 <asp:Button ID="btnSaveDateTime" BackColor="#ffcc66" runat="server" Text="Save" ValidationGroup="AL" OnClientClick="return ValidInputs(); return savedata(); return false;"/>
                <asp:Button ID="btnReset" BackColor="#ffcc66" runat="server" Text="Reset" OnClientClick="DisableFields(); return false;"   />
                  
            </div>



        </div>
    </form>
      <script type="text/javascript">

         function ValidInputs() {
            
             var year, month, days, hours, min, sec;    
             year = document.getElementById("txtYear").value;   
             month = document.getElementById("txtMonth").value;   
             days = document.getElementById("txtDay").value;
             hours = document.getElementById("txtHour").value;
             min = document.getElementById("txtMinute").value;
             sec = document.getElementById("txtSecond").value;

             if (year == '' && month == '' && days == '' && hours == '' && min == '' && sec == '') {    
                 alert("Enter All Fields");    
                 return false;    
             }    
             if (year == '') {
                 alert("Please Enter year");    
                 return false;    
             }
             if (month == '') {
                 alert("Please Enter month");
                 return false;
             }
             if (days == '') {
                 alert("Please Enter days");
                 return false;
             }
             if (hours == '') {
                 alert("Please Enter hours");
                 return false;
             }
             if (min == '') {
                 alert("Please Enter minute");
                 return false;
             }
             if (sec == '') {
                 alert("Please Enter seconds");
                 return false;
             }
             
             return true;

         }


         function CloseDialog() {
             $("#dialog").dialog('close');
         }

         function savedata() {

            var year = document.getElementById('<%= txtYear.ClientID%>').value == "" ? 0 : document.getElementById('<%= txtYear.ClientID%>').value;
            var month = document.getElementById('<%= txtMonth.ClientID%>').value == "" ? 0 : document.getElementById('<%= txtMonth.ClientID%>').value;
            var day = document.getElementById('<%= txtDay.ClientID%>').value == "" ? 0 : document.getElementById('<%= txtDay.ClientID%>').value;
            var hr = document.getElementById('<%= txtHour.ClientID%>').value == "" ? 0 : document.getElementById('<%= txtHour.ClientID%>').value;
            var min = document.getElementById('<%= txtMinute.ClientID%>').value == "" ? 0 : document.getElementById('<%= txtMinute.ClientID%>').value;
            var sec = document.getElementById('<%= txtSecond.ClientID%>').value == "" ? 0 : document.getElementById('<%= txtSecond.ClientID%>').value;

             $.ajax({
                 type: "POST",
                 url: "Alien.aspx/UpdateAlienTime",
                 data: "{'year': '" + year + "', 'month': '" + month + "', 'day': '" + day + "', 'hr': '" + hr + "', 'min': '" + min + "', 'sec': '" + sec + "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 async: true,
                 cache: false,
                 success: function (result) {

                     var alientime = result.d;
                     document.getElementById("alienClock").innerHTML = alientime;

                 }
             });
         }
         setInterval(savedata, 1000);

    </script>
        </div><!-- end of container class-->
    
    </div><!-- end of main class-->
        </center>
</body>
</html>
