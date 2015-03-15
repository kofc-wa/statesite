<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<% response.Expires = 0 %>

<%

if Session("ShowCal") = true then
	session("ShowCal") = ""
else
	session("ShowCal") = true
end if

Response.Redirect("/Assembly1955/Homepage.asp") 

%>