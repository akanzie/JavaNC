<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<% String a;
int j=0;
   Enumeration<String> d= request.getParameterNames();
   while(d.hasMoreElements()){
    String tendk = d.nextElement();
    a = request.getParameter(tendk);
    if(a!="" && tendk.equals("th") != true) {
    	out.print("<span>"+tendk+":"+a+"</span> <hr>");
    }
    
   }
 %>

<form action="t6.jsp" method="post">
   <%for(int i=1;i<10;i++){ %>
   <input type="text" name="tendk<%=i %>">       
   <%} %>
 <input type='submit' name='th' value='tinh'>
</form>

</body>
</html>