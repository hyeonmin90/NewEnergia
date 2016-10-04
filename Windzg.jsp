<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Generation(altitude)</title>
<%

String v2=request.getParameter("t");
String v3=request.getParameter("u");
String v4=request.getParameter("a");


double t=Double.parseDouble(v2);
double u=Double.parseDouble(v3);
double a=Double.parseDouble(v4);
double l=-0.034/t;
double ee=Math.pow(2.187, l);
%>
<script type="text/javascript">
window.onload = function () {

    var chart = new CanvasJS.Chart("chartContainer",
    {
      zoomEnabled: true,
      title:{
        text: "Generation Graph(velocity)"
      },
      axisY:{
        includeZero: false
      },
      data: data,  // random generator below

   });

    chart.render();
  }

   var limit = 7000;    //increase number of dataPoints by increasing this

    var y = 0;
    var data = []; var dataSeries = { type: "line" };
    var dataPoints = [];
    for (var i = 0; i < limit; i += 1) {
    	u=<%=u %>;
    	t=<%=t %>;
    	a=<%=a %>;
    	ee=<%=ee %>
    	y=(1/2)*(353049/t)*Math.pow(ee, i)*Math.pow(u, 3)*a;
         dataPoints.push({
          x: i,
          y: y
           });
        }
     dataSeries.dataPoints = dataPoints;
     data.push(dataSeries);

	</script>
<script type="text/javascript" src="canvasjs-1.9.0/jquery.canvasjs.min.js"></script> 
<title>Insert title here</title>

</head>

<body>
<div id="chartContainer" style="height: 400px; width: 100%;">
	</div>
	width-axis: altitude[m]<br/>
	column-axis: Power(kW/year)<br/>
	velocity:<%= u %>m/s<br/>
	temperature:<%= t %>K<br/>
	area:<%= a %>m²<br/>
</body>
</html>