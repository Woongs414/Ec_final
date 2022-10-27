<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- fullCalendar -->
<link rel="stylesheet" href="${contextPath}/seller/plugins/fullcalendar/main.css">
<script src="${contextPath}/seller/plugins/moment/moment.min.js"></script>
<script src="${contextPath}/seller/plugins/fullcalendar/main.js"></script>
<script src='${contextPath}/seller/plugins/fullcalendar/locales-all.js'></script>
<style type="text/css">
	.content-wrapper>.content{
		padding: 0.5em;
	}
	.bookingStatus_calendar{
		flex: 100%;
		max-width: 100%;
	}
</style>
<script>
  $(function () {

    function ini_events(ele) {
      ele.each(function () {

        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)

    var Calendar = FullCalendar.Calendar;

    var calendarEl = document.getElementById('calendar');
	
    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',     
      height: 850,
      locale: 'ko',
      dayMaxEventRows: true, // for all non-TimeGrid views
      views: {
        timeGrid: {
          dayMaxEventRows: 4 // adjust to 6 only for timeGridWeek/timeGridDay
        }
      },
    });
    
    <c:forEach items="${bookList}" var="item">
    <fmt:parseDate var="startDate" value="${item.reserv_date}"  pattern="yyyy-MM-dd"/>
    <fmt:parseDate var="startTime" value="${item.reserv_time}"  pattern="HH:mm"/>
    
    var y = '<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd HH:mm:ss" />';
   	var m = '<fmt:formatDate value="${startTime}" pattern="HH:mm" />';
	  calendar.addEvent(
		  {
			  title: '${item.user_name}    외 ${item.count_pp-1}명',
			  start: '<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" /> <fmt:formatDate value="${startTime}" pattern="HH:mm" />',
			  allDay: false,
			  backgroundColor: '#0073b7', //Blue
	          borderColor    : '#0073b7',
		  }		  
	  )
	</c:forEach>
    calendar.render();
    // $('#calendar').fullCalendar()
      // Create events
       var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.text(val)
      $('#external-events').prepend(event)
  })

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        <div class="col-sm-6">
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">메인</a></li>
              <li class="breadcrumb-item active">예약 관리</li>
              <li class="breadcrumb-item active">예약 현황</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-9 bookingStatus_calendar">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</body>
</html>