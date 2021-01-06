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
  <title>Jquery Fullcalandar Integration with PHP and Mysql</title>
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
  <h2 align="center"><a href="#">Jquery Fullcalandar Integration with PHP and Mysql</a></h2>
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



<%--<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="redaktor_kalendar.aspx.cs" Inherits="Informacni_system.redaktor_kalendar" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
Clanek po odeslani musi zkontrolovat redaktor az po te se clanek zobrazi na uvodni strane.<br />    
Nazev clanku <asp:TextBox ID="clanek" runat="server"></asp:TextBox><br />
Jmeno a prijmeni<asp:TextBox ID="autor" runat="server"></asp:TextBox><br />
    <div><FTB:FreeTextBox ID="texteditor" runat="server" DisableIEBackButton="False">
    </FTB:FreeTextBox>

        </div>

    <asp:Button ID="odeslat" runat="server" Text="Odeslat clanke ke kontrole" OnClick="odeslat_Click" />
</asp:Content>--%>





<%--**************************************FUNKCNI KALENDAR--%>
<%--    <meta charset="utf-8">
		<title>jsCalendar Demo</title>
		<meta name="description" content="jsCalendar demo - date events">
		<meta name="author" content="GramThanos">

		<!-- jsCalendar -->
		<link rel="stylesheet" type="text/css" href="../source/jsCalendar.css">
		<link rel="stylesheet" type="text/css" href="../themes/jsCalendar.clean.css">
		<script type="text/javascript" src="../source/jsCalendar.js"></script>

		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
		<![endif]-->
		
		<!-- Demo Style -->
		<style>
			html, body {
				font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;
			}
			.description {
				text-align: center;
				padding-bottom: 40px;
			}
			.jsCalendar.clean-theme tbody td.jsCalendar-previous, .jsCalendar.clean-theme tbody td.jsCalendar-next {
				color: #000;
				opacity: 0.2;
			}
			#wrapper {
				margin: 0 auto;
				width: 800px;
				box-shadow: 0px 0px 2px rgba(0, 0, 0, 0.4);
			}
			#wrapper .jsCalendar table {
				box-shadow: none;
			}
			.clear {
				clear: both;
			}
			#events-calendar {
				float: left;
			}
			#events {
				float: left;
				width: 435px;
				margin: 10px 20px 10px 5px;
			}
			#events .title {
				padding: 5px 0px;
				text-align: center;
				font-weight: bold;
				border-bottom: 1px solid rgba(0, 0, 0, 0.4);
			}
			#events .subtitle {
				padding: 5px 0px;
				font-size: 14px;
				text-align: center;
				color: #888;
			}
			#events .list {
				height: 250px;
				overflow-y: auto;
				border-bottom: 1px solid rgba(0, 0, 0, 0.2);
			}
			#events .list .event-item {
				line-height: 24px;
				min-height: 24px;
				padding: 2px 5px;
				border-top: 1px solid rgba(0, 0, 0, 0.2);
			}
			#events .list .event-item .close {
				font-family: Tahoma, Geneva, sans-serif;
				font-weight: bold;
				font-size: 12px;
				color: #000;
				border-radius: 8px;
				height: 14px;
				width: 14px;
				line-height: 12px;
				text-align: center;
				float: right;
				border: 1px solid rgba(0, 0, 0, 0.5);
				padding: 0px;
				margin: 5px;
				display: block;
				overflow: hidden;
				background: #F44336;
				cursor: pointer;
			}
			#events .action {
				text-align: right;
			}
			#events .action input {
				padding: 0px 5px;
				font-size: 12px;
				margin: 10px 5px;
				border: 1px solid #999999;
				height: 28px;
				line-height: 28px;
				width: 120px;
				background: #f8f8f8;
				color: black;
				cursor: pointer;
				transition: all 0.2s;
			}
			#events .action input:hover {
				background: #eee;
				border: 1px solid #000;
				box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.2);
			}
			.version {
				font-size: 12px;
				width: 800px;
				margin: 0 auto;
				text-align: right;
			}
		</style>
    <%-----------------------------%>
<%--<%--<head runat="server">
    <title>View HTML</title>
    <script type="text/javascript" language="javascript">
        function getHtml(txtbox) {
            var src = document.documentElement.innerHTML;
            document.forms[0]['txtHtmlSrc'].value = src;
        }
    </script>
 
</head>
<body>
	<%---------------%>
	<%--<div class="description">
			<div style="font-size: 1.4em;">Date Events</div>
			<div>Demo calendar date events using jsCalendar</div>
		</div>

		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Calendar element -->
			<div id="events-calendar"></div>
			<!-- Events -->
			<div id="events"></div>
			<!-- Clear -->
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		
		<!-- Create the calendar -->
		<script type="text/javascript">
            // Get elements
            var elements = {
                // Calendar element
                calendar: document.getElementById("events-calendar"),
                // Input element
                events: document.getElementById("events")
            }

            // Create the calendar
            elements.calendar.className = "clean-theme";
            var calendar = jsCalendar.new(elements.calendar);

            // Create events elements
            elements.title = document.createElement("div");
            elements.title.className = "title";
            elements.events.appendChild(elements.title);
            elements.subtitle = document.createElement("div");
            elements.subtitle.className = "subtitle";
            elements.events.appendChild(elements.subtitle);
            elements.list = document.createElement("div");
            elements.list.className = "list";
            elements.events.appendChild(elements.list);
            elements.actions = document.createElement("div");
            elements.actions.className = "action";
            elements.events.appendChild(elements.actions);
            elements.addButton = document.createElement("input");
            elements.addButton.type = "button";
            elements.addButton.value = "Add";
            elements.actions.appendChild(elements.addButton);

            var events = {};
            var date_format = "DD/MM/YYYY";
            var current = null;

            var showEvents = function (date) {
                // Date string
                var id = jsCalendar.tools.dateToString(date, date_format, "en");
                // Set date
                current = new Date(date.getTime());
                // Set title
                elements.title.textContent = id;
                // Clear old events
                elements.list.innerHTML = "";
                // Add events on list
                if (events.hasOwnProperty(id) && events[id].length) {
                    // Number of events
                    elements.subtitle.textContent = events[id].length + " " + ((events[id].length > 1) ? "events" : "event");

                    var div;
                    var close;
                    // For each event
                    for (var i = 0; i < events[id].length; i++) {
                        div = document.createElement("div");
                        div.className = "event-item";
                        div.textContent = (i + 1) + ". " + events[id][i].name;
                        elements.list.appendChild(div);
                        close = document.createElement("div");
                        close.className = "close";
                        close.textContent = "×";
                        div.appendChild(close);
                        close.addEventListener("click", (function (date, index) {
                            return function () {
                                removeEvent(date, index);
                            }
                        })(date, i), false);
                    }
                } else {
                    elements.subtitle.textContent = "No events";
                }
            };

            var removeEvent = function (date, index) {
                // Date string
                var id = jsCalendar.tools.dateToString(date, date_format, "en");

                // If no events return
                if (!events.hasOwnProperty(id)) {
                    return;
                }
                // If not found
                if (events[id].length <= index) {
                    return;
                }

                // Remove event
                events[id].splice(index, 1);

                // Refresh events
                showEvents(current);

                // If no events uncheck date
                if (events[id].length === 0) {
                    calendar.unselect(date);
                }
            }

            // Show current date events
            showEvents(new Date());

            // Add events
            calendar.onDateClick(function (event, date) {
                // Update calendar date
                calendar.set(date);
                // Show events
                showEvents(date);
            });

            elements.addButton.addEventListener("click", function () {
                // Get event name
                var names = ["John", "Bob", "Anna", "George", "Harry", "Jack", "Alexander"];
                var name = prompt(
                    "Event info",
                    names[Math.floor(Math.random() * names.length)] + "'s birthday."
                );

                //Return on cancel
                if (name === null || name === "") {
                    return;
                }

                // Date string
                var id = jsCalendar.tools.dateToString(current, date_format, "en");

                // If no events, create list
                if (!events.hasOwnProperty(id)) {
                    // Create list
                    events[id] = [];
                }

                // If where were no events
                if (events[id].length === 0) {
                    // Select date
                    calendar.select(current);
                }

                // Add event
                events[id].push({ name: name });

                // Refresh events
                showEvents(current);
            }, false);
        </script>
		
		<br>
		<div class="version">
			You are using jsCalendar <script type="text/javascript">document.writeln(jsCalendar.version);</script>
		</div>--%>

<%--**************************************FUNKCNI KALENDAR--%>