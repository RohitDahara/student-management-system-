<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>	Student MS </title>
		<link rel="stylesheet" href="mystyle.css">
	</head>
		
	<body>
	<center>
		<div class="nav">
			<a href="index.jsp">Home</a>
			<a href="create.jsp">Create</a>
			<a href="delete.jsp">Delete</a>
			<a href="update.jsp">Update</a>

		</div>		

		<h1> Delete Page </h1>
		
		<form method="POST">
			<label for="rno">Rno</label>
			<input type="number" name="rno" placeholder="enter rno" required id="rno" min=1 />
			<br><br>
			<input type="submit" name="btn" value="delete"/>
		</form>
		
		<%
			if(request.getParameter("btn") != null)
			{
				try
				{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url = "jdbc:mysql://localhost:3306/sms_20june24";
					Connection con = DriverManager.getConnection(url, "root", "abc123");
					
					int rno = Integer.parseInt(request.getParameter("rno"));

					String sql = "delete from student where rno=?";
					PreparedStatement pst = con.prepareStatement(sql);				
					pst.setInt(1,rno);
					pst.executeUpdate();
					out.println("deleted");
					con.close();			
	
				}
			
				catch(SQLException e)
				{
					out.println("issue "+e);
				}
			}
		%>
	</center>
	</body>
	

</html>