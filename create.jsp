<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>	Student MS </title>
		<link rel="stylesheet" href="mystyle.css">
	</head>
		
	<body>
		<div class="nav">
			<a href="index.jsp">Home</a>
			<a href="create.jsp">Create</a>
			<a href="delete.jsp">Delete</a>
			<a href="update.jsp">Update</a>

		</div>		
	<center>
		<h1> Create Page </h1>
		
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
			<input type="submit" name="btn" value="save"/>
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


					String sql = "insert into student values(?,?,?)";
					PreparedStatement pst = con.prepareStatement(sql);				
					pst.setInt(1,rno);
					pst.setString(2, name);
					pst.setInt(3, marks);
					pst.executeUpdate();
					out.println("saved");
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