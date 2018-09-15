<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import= "java.sql.*"  %>
<% Class.forName("com.mysql.jdbc.Driver");  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Talk To Us</title>

<style><%@include file="Main.css"%></style>
</head>
<body onLoad= "displayResults()">
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}
</style>

</head>
<body>

<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="#Connect with a Counselor">Connect with a Counselor</a></li>
  <li><a href="#contact">Journal Entry</a></li>
</ul>

</body>
<h1>Tell Us Your Story</h1>

<%! 
 public class Discussion
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement insertAuthors = null ; 
		ResultSet resultSet = null ; 

		
		public Discussion(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					
					insertAuthors = connection.prepareStatement(
							"INSERT INTO author VALUES (?, ?, ?)") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
			public int setAuthors (int number, String first, String last){
			
				int result = 0 ; 
				
				try{
				
				insertAuthors.setInt(1, number) ; 
				insertAuthors.setString(2, last) ; 
				insertAuthors.setString(3, first) ; 
				result = insertAuthors.executeUpdate() ; 
				
				}
				catch(SQLException e){
				
				e.printStackTrace(); 
				
				}
				return result ; 
			}
 
 }
 
%>

	<%
		int result = 0 ; 
	
		String firstName = new String() ; 
		String lastName = new String() ;
		int numId = 0 ;  

		if(request.getParameter("submit") != null) {
			
		
		if(request.getParameter("number") != null) {
			numId = Integer.parseInt(request.getParameter("number")) ; 
		}
		
		if(request.getParameter("last") != null){
			
			lastName = request.getParameter("last") ; 
		}
	
		if(request.getParameter("first") != null){
			
			firstName = request.getParameter("first") ; 
		}
		
		
		
		Discussion author1 = new Discussion() ; 
		
		result = author1.setAuthors(numId, lastName, firstName) ; 
		
		}
	 %>



<form name="myForm" action= "discussion.jsp" method= "POST">
			<tbody> 
		
		<tr>
			<p><strong>Title:</strong><br>
			<td><input type= "text" name= "discussion_title" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<p><strong>Tell Us your Story:</strong><br>
			<textarea name="post_text" rows=8 cols=40 wrap=virtual></textarea>
			<br> </br>
			<button class="button">Submit</button>

		</tr>
	<br> </br>
	
    <textarea type="text" name="field1" rows = 5 cols = 20 placeholder="Reply" ></textarea>
		<br></br>
		<button class="button">Submit</button>
		
		</tbody>
		</table>

	</form>
	
	<SCRIPT LANGUAGE= "JavaScript">
	<!--
		function displayResults()
		{
			if(document.myForm.hidden.value == 1){
				alert("Data Has Been Inserted!") ; 
			}
		
		
		}
	// -->
	</SCRIPT>
	
</body>
</html>