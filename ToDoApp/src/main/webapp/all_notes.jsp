<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.sk.helper.FactoryProvider"%>
<%@page import="com.sk.entities.Note"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<!-- added javascript and css file -->

 <%@include file="all_js_css.jsp"  %>
 
 
<title>All Notes</title>
</head>
<body>

<div class="container"> 
 <%@include file="navbar.jsp"  %>
 <br>
 <h1>All Notes:</h1>
 
  <div class="row">
  
 <div class="col-12">
  <%
 
 	Session s=FactoryProvider.getFactory().openSession();
 
 	Query q=s.createQuery("from Note");
 	List<Note> list=q.list();
 	
 	for(Note note:list)
 	{
 		
 		%>
 		
 		
 		
 		<div class="card mt-3">
  <img class="card-img-top m-4 mx-auto"style="max-width:100px;" src="img/notepad.png" alt="Card image cap">
  <div class="card-body px-5"> 
    <h5 class="card-title"><%= note.getTitle() %></h5>
    <p class="card-text"><%=note.getContent() %></p>
    
    
    <div class="container text-center mt-2">
    
      <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary mr-6">Edit</a>  
      
      <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>  
  
    
    </div>
   
  </div>
</div>
 		
 		
 		
 		<%
 		
 		
 		
 	}
 	
 	s.close();
 
 %>
 
 
 
 </div>
 
 
  </div>
 


</div>


</body>
</html>