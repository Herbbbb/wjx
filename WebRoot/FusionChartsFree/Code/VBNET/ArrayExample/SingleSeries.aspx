﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SingleSeries.aspx.vb" Inherits="ArrayExample_SingleSeries" %>

<HTML>
<HEAD>
	<TITLE>	FusionCharts Free - Array Example using Single Series Column 3D Chart	</TITLE>
	<%
	'You need to include the following JS file, if you intend to embed the chart using JavaScript.
	'Embedding using JavaScripts avoids the "Click to Activate..." issue in Internet Explorer
	'When you make your own charts, make sure that the path to this JS file is correct. Else, you would get JavaScript errors.
	%>	
	<SCRIPT LANGUAGE="Javascript" SRC="../FusionCharts/FusionCharts.js"></SCRIPT>
	<style type="text/css">
	<!--
	body {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
	}
	-->
	</style>
</HEAD>
	
<BODY>

<CENTER>
<h2><a href="http://www.fusioncharts.com" target="_blank" >FusionCharts Free</a> Examples</h2>
<h4>Plotting single series chart from data contained in Array.</h4>
<%=CreateChart()
	
%>
<BR><BR>
<a href='../NoChart.html' target="_blank">Unable to see the chart above?</a>
<BR><H5 ><a href='../default.aspx'>&laquo; Back to list of examples</a></h5>
</CENTER>
</BODY>
</HTML>