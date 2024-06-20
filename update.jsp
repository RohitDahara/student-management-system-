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

		<h1> Update Page </h1>
		
		<form method="POST">
			<label for="rno">Rno</label>
			<input type="number" name="rno" placeholder="enter rno" required id="rno" min=1 />
			<br><br>
			<label for="name">Name</label>
			<input type="text" name="name" placeholder="enter name" required id="name" pattern="[A-Za-z ]+" />
			<br><br>
			<label for="marks">Marks</label>
			<input type="number" name="marks" placeholder="enter marks" reuired id="marks" min=0 />
			<br><br>
			<input type="submit" name="btn" value="Update"/>
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
					String name = request.getParameter("name");
					int marks = Integer.parseInt(request.getParameter("marks"));


					String sql = "update student set name=?,marks=? where rno=?";
					PreparedStatement pst = con.prepareStatement(sql);				
					pst.setInt(3,rno);
					pst.setString(1, name);
					pst.setInt(2, marks);
					pst.executeUpdate();
					out.println("updated");
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