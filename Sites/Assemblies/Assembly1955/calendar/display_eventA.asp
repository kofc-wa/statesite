<%@ LANGUAGE=VBSCRIPT %>
<%Option Explicit%>

<%
Dim MyName
Dim DB_CONNECTIONSTRING
Dim objRecordset
Dim EventToShow
%>

	<!--#include virtual="/includes/adovbs.inc"-->

<%
MyName = Session("Firstname") & " " & Session("LastName")

DB_CONNECTIONSTRING = "driver=SQL Server;server=sql-a1;uid=kofcwsc;pwd=S1995KC;database=kofcwsc"
'DB_CONNECTIONSTRING = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.Mappath("/calendar/users.mdb") & ";"

Set objRecordset = Server.CreateObject("ADODB.Recordset")
objRecordset.Open "Assy1955_Calendar", DB_CONNECTIONSTRING, adOpenStatic, adLockPessimistic, adCmdTable

EventToShow = CInt(Request.QueryString("ID"))

		If Not objRecordset.EOF Then

			objRecordset.MoveFirst
			Do Until objRecordset.Fields("ID") = EventToShow
				objRecordset.MoveNext
			Loop
		End If

Session("EventToEdit") = EventToShow
%>

<html>


Date:</b> <%= objRecordset.Fields("Month") & "/" & objRecordset.Fields("Day") & "/" & objRecordset.Fields("Year") %><p>

<b>Subject:</b> <%= objRecordset.Fields("Subject") %><p>

<b>Message:</b> <%= objRecordset.Fields("Message") %>
<p>&nbsp; 
<p>&nbsp;</p>

  

</body>
</html>

<%
objRecordset.Close
Set objRecordset = Nothing
%>