<%@ LANGUAGE=VBSCRIPT %>
<% Response.Expires = -1000 %>
<% Server.ScriptTimeout = 100 %>

	<!--#include virtual="/sites/Assemblies/Assembly1955/Includes/adovbs.inc"-->

<%
on error resume next


If Request.Form("AddEvent") = "Add Event" Then
	Response.Redirect("add_event.asp")
End If

If Request.Form("EditEvent") = "Edit Event" Then
	Response.Redirect("edit_event.asp")
End If



Dim DB_CONNECTIONSTRING
Dim objRecordset

DB_CONNECTIONSTRING = "driver=SQL Server;server=m-tphilome;uid=kofcwsc;pwd=S1995KC;database=kofcwsc"
'DB_CONNECTIONSTRING = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.Mappath("calendar\users.mdb") & ";"
'DB_CONNECTIONSTRING = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("database\dbname.mdb") & ";"
'DB_CONNECTIONSTRING = "Provider=Microsoft.Jet.OLEDB.3.51; Data Source=" & Server.MapPath("calendar\users.mdb") &";" 'This one is if you use Access 97
'DB_CONNECTIONSTRING = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("calendar\user.mdb")&";" 'This one is for Access 2000/2002


Set objRecordset = Server.CreateObject("ADODB.Recordset")
objRecordset.Open "Assy1955_Calendar", DB_CONNECTIONSTRING, adOpenStatic, adLockPessimistic, adCmdTable

%>

<%
Function GetDaysInMonth(iMonth, iYear)
	Select Case iMonth
		Case 1, 3, 5, 7, 8, 10, 12
			GetDaysInMonth = 31
		Case 4, 6, 9, 11
			GetDaysInMonth = 30
		Case 2
			If IsDate("February 29, " & iYear) Then
				GetDaysInMonth = 29
			Else
				GetDaysInMonth = 28
			End If
	End Select
End Function

Function GetWeekdayMonthStartsOn(iMonth, iYear)
	GetWeekdayMonthStartsOn = WeekDay(CDate(iMonth & "/1/" & iYear))
End Function

Function SubtractOneMonth(dDate)
Dim iDay, iMonth, iYear	
	iDay = Day(dDate)
	iMonth = Month(dDate)
	iYear = Year(dDate)

	If iMonth = 1 Then
		iMonth = 12
		iYear = iYear - 1
	Else
		iMonth = iMonth - 1
	End If
	
	If iDay > GetDaysInMonth(iMonth, iYear) Then iDay = GetDaysInMonth(iMonth, iYear)

	SubtractOneMonth = CDate(iMonth & "-" & iDay & "-" & iYear)
End Function

Function AddOneMonth(dDate)
Dim iDay, iMonth, iYear	
	iDay = Day(dDate)
	iMonth = Month(dDate)
	iYear = Year(dDate)

	If iMonth = 12 Then
		iMonth = 1
		iYear = iYear + 1
	Else
		iMonth = iMonth + 1
	End If
	
	If iDay > GetDaysInMonth(iMonth, iYear) Then iDay = GetDaysInMonth(iMonth, iYear)

	AddOneMonth = CDate(iMonth & "-" & iDay & "-" & iYear)
End Function


Dim dDate     ' Date we're displaying calendar for
Dim iDIM      ' Days In Month
Dim iDOW      ' Day Of Week that month starts on
Dim iCurrent  ' Variable we use to hold current day of month as we write table
Dim iPosition ' Variable we use to hold current position in table

If IsDate(Request.QueryString("date")) Then
	dDate = CDate(Request.QueryString("date"))
Else
	If IsDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year")) Then
		dDate = CDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year"))
	Else
		dDate = Date()

		If Request.QueryString.Count <> 0 Then
			Response.Write "The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>"
		End If
	End If
End If

iDIM = GetDaysInMonth(Month(dDate), Year(dDate))
iDOW = GetWeekdayMonthStartsOn(Month(dDate), Year(dDate))
%>
<html>



<head>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<meta http-equiv="Content-Language" content="en-us">


<title>Knights of Columbus - Bishop Thomas E. Gill Assembly #1955</title>

<!-- base target="_self" href="http://www.kofc-wa.org" -->

<link rel="stylesheet" type="text/css" href="bulletin.css">


<script language="JavaScript" src="/js/browser.js"></script>
<script language="JavaScript" src="/js/util.js"></script>

<base target="_self">

</head>


<body   bgcolor="#FFFFFF" background="/Assembly1955/Images/4thdegreeLite.gif">



<p>

<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr> 
    <td colspan="2" align="center" bordercolor="#0000FF"><div align="left"><font color="#FF0000" size="1"><a href="/Assembly1955/calendar/ToggleCal.asp"><img src="/images/Calendar.gif" alt="Toggle Calendar" width="16" height="16" border="0" onClick="ToggleShowCal()"></a><a href="/Assembly1955/calendar/ToggleCal.asp"> 
        Toggle Calendar</a></font></div></td>
  </tr>
  <tr> 
    <td colspan="2" align="center" bordercolor="#0000FF"><img src="Images/KofCHead4th.gif" width="550" height="100"></td>
  </tr>
  <tr> 
    <td height="29"  align="center"> 
    <td  align="center"><font size="5"><strong>Welcome to Bishop Thomas E. Gill 
      Assembly #1955</strong></font></tr>
  <tr> 
    <td colspan="4" align="center"><h4>Faithful Navigator Dave Caton </h4></td>
  </tr>
  <tr> 
    <td colspan="4" align="center"> <table width="100%" border="0">
        <tr> 
          <td height="21" valign="middle">&nbsp;</td>
          <td colspan="3" valign="middle"><div align="center"></div></td>
          <td valign="middle"><div align="right"></div></td>
        </tr>
        <tr> 
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
          <td valign="middle"><div align="center"></div></td>
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
        </tr>
        <tr> 
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
          <td valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
              <td align="center">
              <a href="http://www.kofc-wa.org/sites/assemblies/assembly1955/Bulletins/2006/survey.pdf">Fraternal Survey Worksheet</a>
              </td>
              </tr>
              <tr>
              <td>&nbsp;
              </td>
              </tr>
              <tr> 
                <td><div align="center">Councils in Assembly 1955</div></td>
              </tr>
              
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>3598 &shy; Auburn Council, Auburn</td>
              </tr>
              <tr> 
                <td>7528 &shy; St. Joseph Council, Federal Way</td>
              </tr>
              <tr> 
                <td>7908 - St. Theresa, Federal Way</td>
              </tr>
              <tr> 
                <td>8079 &shy; Centennial Council, Des Moines</td>
              </tr>
            </table></td>
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
        </tr>
        <tr> 
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
          <td valign="middle">&nbsp;</td>
        </tr>
        <tr> 
          <td width="24%" valign="middle"><br>
            <br>
            <br>
            <br>
            <br>
          </td>
          <td width="3%" valign="middle">&nbsp;</td>
          <td width="51%" valign="middle"><div align="center"><a href="http://www.armedforcestribute.com/">A 
              Tribute to our Armed Forces</a></div></td>
          <td width="6%" valign="middle"> <div align="left"><font size="2"></font></div></td>
          <td width="16%" valign="middle"><div align="right"><a href="/Downloads/default.htm"></a></div></td>
        </tr>
      </table>
      <% if Session("ShowCal") <> "" then
'	 if 1=2 then %> <table border="1" cellspacing="0" cellpadding="1">
        <tr> 
          <td bgcolor="blue" align="center" colspan="7"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right"><b><A HREF="/homepage.asp?date=<%= SubtractOneMonth(dDate) %>" style="color: #FFFFFF">&lt;--</A></b></TD>
                <td align="center"><font color="#FFFFFF"><B><%= MonthName(Month(dDate)) & "  " & Year(dDate) %></B></font></TD>
                <td align="left"><b><A HREF="/homepage.asp?date=<%= AddOneMonth(dDate) %>" style="color: #FFFFFF">--&gt;</A></b></TD>
              </tr>
            </TABLE></td>
        </tr>
        <tr bgcolor="blue"> 
          <td ALIGN="center" width="60"><B><font color="#FFFFFF">Sun</font></B></TD>
          <td ALIGN="center" width="60"><B><font color="#FFFFFF">Mon</font></B></TD>
          <td ALIGN="center" width="60"><B><font color="#FFFFFF">Tue</font></B></TD>
          <td ALIGN="center" width="60"><B><font color="#FFFFFF">Wed</font></B></TD>
          <td ALIGN="center" width="60"><B><font color="#FFFFFF">Thu</font></B></TD>
          <td ALIGN="center" width="60"><B><font color="#FFFFFF">Fri</font></B></TD>
          <td ALIGN="center" width="60"><B><font color="#FFFFFF">Sat</font></B></TD>
        </tr>
        <%
If iDOW <> 1 Then
	Response.Write(vbTab & "<tr>" & vbCrLf)
	iPosition = 1
	Do While iPosition < iDOW
		Response.Write(vbTab & vbTab & "<td>&nbsp;</td>" & vbCrLf)
		iPosition = iPosition + 1
	Loop
End If

	'-- Write days of month in proper day slots --

iCurrent = 1
iPosition = iDOW

Do While iCurrent <= iDIM


	'-- open the table row --

	If iPosition = 1 Then
		Response.Write(vbTab & "<tr>" & vbCrLf)
	End If


	'-- Write the date and subject --
	if day(date()) = iCurrent then
		Response.Write(vbTab & vbTab & "<td align=left valign=top height=60 bordercolor=#FF0000><b><font color=#FF0000>" & iCurrent & "</font></b>")
	else
		Response.Write(vbTab & vbTab & "<td align=left valign=top height=60><b>" & iCurrent & "</b>")
	end if



	If Not objRecordset.BOF Then
		objRecordset.MoveFirst
		Do Until objRecordset.EOF

	If objRecordset.Fields("Year") = Year(dDate) Then
	    If objRecordset.Fields("Month") = Month(dDate) Then
			If objRecordset.Fields("Day") = iCurrent Then

		'		Response.Write("<br><font size=2><a href=" & Chr(34) & "/calendar/display_event.asp?ID=" & objRecordset.Fields("ID") & Chr(34) & ">" & objRecordset.Fields("Subject") & "</a></font><br>")
		'			<a href="javascript: PopUp('/calendar/display_event.asp?ID="&"objRecordset.Fields('ID')');"
				Response.Write("<br><font size=2><a href="& Chr(34) & "javascript: PopUpWin('/Assembly1955/calendar/display_eventA.asp?ID=" & objRecordset.Fields("ID") & "');" & Chr(34) & ">" &  objRecordset.Fields("Subject") & "</a></font>")
			End If
	    End If
	End If

			objRecordset.MoveNext

		Loop

	End If



		Response.Write("</td>" & vbCrLf)


	'-- Close the table row --

	If iPosition = 7 Then
		Response.Write vbTab & "</tr>" & vbCrLf
		iPosition = 0
	End If

	
	'-- Increment variables --

	iCurrent = iCurrent + 1
	iPosition = iPosition + 1
Loop

If iPosition <> 1 Then
	Do While iPosition <= 7
		Response.Write(vbTab & vbTab & "<td>&nbsp;</td>" & vbCrLf)
		iPosition = iPosition + 1
	Loop
	Response.Write vbTab & "</TR>" & vbCrLf
End If
%>
      </table>
      <%
objRecordset.Close
Set objRecordset = Nothing
%> </p></td>
  </tr>
</table>
<!-- End Calendar Code -->
<% End If %>
<br>
<br>


<br>


<br>

<br>

<table border="0" width="100%">

	<tr valign="top">

		

    <td width="100%" height="40"> 

      <p align="center"><img src="/images/goldbar.gif" alt="<HR>" width="521" height="9"><br>

			<br>

			</p>

		</td>

	</tr>

	<tr>

		

    <td> 

      <table width="100%" border="0" align="center"  cellspacing="0">

        <tr>					

          <td  align="center">&nbsp; </td>

				</tr>

			</table>

		</td>

	</tr>

	<tr>

		<td ><p align="center"><br><img src="goldbar.gif" alt="<HR>" width="521" height="9"><br></p></td>

	</tr>

</table>

<div align="center">

  <h4 > <a

    href="mailto:Webmaster@kofc-wa.org">Webmaster:</a> Tim Philomeno, FC #1955</h4>

</div>



<p align="center">Last Updated on 12/6/2004</p>


<script language="VBScript">

sub ToggleShowCal()

	
	
	document.location= "/Assembly1955/Calendar/ToggleCal.asp"
	
	
	
end sub

</script>	
</body>

</html>