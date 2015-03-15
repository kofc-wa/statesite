<%@ LANGUAGE=VBSCRIPT %>
<%Option Explicit%>
<% response.Expires = 0 %>

<%
Dim MyName
Dim DB_CONNECTIONSTRING
Dim objRecordset
Dim sSQL
%>

	<!--#include virtual="/includes/adovbs.inc"-->

<%

DB_CONNECTIONSTRING = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.Mappath("/calendar/users.mdb") & ";"

sSQL = "Select * From calendar order by Year,Month,Day"
Set objRecordset = Server.CreateObject("ADODB.Recordset")
objRecordset.Open sSQL, DB_CONNECTIONSTRING, adOpenStatic, adLockPessimistic,  adCmdText

'response.Write(cstr(objRecordset.recordcount))


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body background="/images/kcbackgrey.gif">

<h1 align="center">Washington State Council</h1>
<h1 align="center">Calendar </h1>
<table width="100%" border="1">
	<tr>
    <td width="10%" bgcolor="#008080"><font color="#FFFF00"><strong>Date</strong></font></td>
	<td width="20%" bgcolor="#008080"><font color="#FFFF00"><strong>Event</strong></font></td>
	<td width="70%" bgcolor="#008080"><font color="#FFFF00"><strong>Details</strong></font></td>
	</tr>
<% do While not (objRecordset.bof or objRecordset.eof) %>

	<tr>
		<td width="10%"><%=ObjRecordset("Month")&"/"&objRecordset("Day")&"/"&objRecordset("Year")%></td>
		<td width="20%"><%=objRecordset("Subject")%></td>
		<td width="70%"><%=objRecordset("Message")%></td>
	</tr>
<%	objRecordset.movenext
loop %>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
