<%--<%@ Page Language="C#"MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="redaktor_kalendar.aspx.cs" Inherits="Informacni_system.redaktor_kalendar" %>

<!DOCTYPE html>--%>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="redaktor_kalendar.aspx.cs" Inherits="Informacni_system.redaktor_kalendar" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" >

    <%------------------------------%>

     <head>
  <title>Deadline Kalendář</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
  <script>

      $(document).ready(function () {
          var calendar = $('#calendar').fullCalendar({
              editable: true,
              header: {
                  left: 'prev,next today',
                  center: 'title',
                  right: 'month,agendaWeek,agendaDay'
              },
              events: 'load.php',
              selectable: true,
              selectHelper: true,
              select: function (start, end, allDay) {
                  var title = prompt("Enter Event Title");
                  if (title) {
                      var start = $.fullCalendar.formatDate(start, "Y-MM-DD HH:mm:ss");
                      var end = $.fullCalendar.formatDate(end, "Y-MM-DD HH:mm:ss");
                      $.ajax({
                          url: "insert.php",
                          type: "POST",
                          data: { title: title, start: start, end: end },
                          success: function () {
                              calendar.fullCalendar('refetchEvents');
                              alert("Added Successfully");
                          }
                      })
                  }
              },
              editable: true,
              eventResize: function (event) {
                  var start = $.fullCalendar.formatDate(event.start, "Y-MM-DD HH:mm:ss");
                  var end = $.fullCalendar.formatDate(event.end, "Y-MM-DD HH:mm:ss");
                  var title = event.title;
                  var id = event.id;
                  $.ajax({
                      url: "update.php",
                      type: "POST",
                      data: { title: title, start: start, end: end, id: id },
                      success: function () {
                          calendar.fullCalendar('refetchEvents');
                          alert('Event Update');
                      }
                  })
              },

              eventDrop: function (event) {
                  var start = $.fullCalendar.formatDate(event.start, "Y-MM-DD HH:mm:ss");
                  var end = $.fullCalendar.formatDate(event.end, "Y-MM-DD HH:mm:ss");
                  var title = event.title;
                  var id = event.id;
                  $.ajax({
                      url: "update.php",
                      type: "POST",
                      data: { title: title, start: start, end: end, id: id },
                      success: function () {
                          calendar.fullCalendar('refetchEvents');
                          alert("Event Updated");
                      }
                  });
              },

              eventClick: function (event) {
                  if (confirm("Are you sure you want to remove it?")) {
                      var id = event.id;
                      $.ajax({
                          url: "delete.php",
                          type: "POST",
                          data: { id: id },
                          success: function () {
                              calendar.fullCalendar('refetchEvents');
                              alert("Event Removed");
                          }
                      })
                  }
              },

          });
      });

  </script>
 </head>
 <body>
  <br />
  <h2 align="center"><a href="#">Deadline Kalendář</a></h2>
  <br />
  <div class="container">
   <div id="calendar"></div>
  </div>


	<%-------------%>
<%--    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btnViewHtml" runat="server" Text="View Html" OnClick="btnViewHtml_Click" OnClientClick="javascript:getHtml()" />
        <br />
        <br />
        <asp:TextBox ID="txtHtmlSrc" runat="server" Height="235px" TextMode="MultiLine" Width="542px"></asp:TextBox></div>
    </form>--%>
</body>
</html>



