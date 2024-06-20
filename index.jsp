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

		<h1> Home Page </h1>
		
		<table border="4" style="width:50%;">
			<tr>
				<th>Rno</th>
				<th>Name</th>
				<th>Marks</th>
			</tr>		
		
		<%
							try
				{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url = "jdbc:mysql://localhost:3306/sms_20june24";
					Connection con = DriverManager.getConnection(url, "root", "abc123");
					
					String sql = "select * from student";
					PreparedStatement pst = con.prepareStatement(sql);				
					
					ResultSet rs = pst.executeQuery();
					while(rs.next())
					{
						int rno = rs.getInt(1);
						String name = rs.getString(2);
						int marks = rs.getInt(3);
			%>
				<tr style="text-align:center;">
					<td><%=rno %></td>
					<td><%=name %></td>
					<td><%=marks %></td>
				</tr>
			<%

					}
	
					con.close();			
	
				}
				catch(SQLException e)
				{
					out.println("issue "+e);
				}
			
		%>
		</table>
	</center>
	</body>
	

</html>