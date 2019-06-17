<%@ page import="java.sql.*"%>
<%
	String name = request.getParameter("val");
	if (name == null || name.trim().equals("")) 
	{
		System.out.print("<p>Please enter name!</p>");
	} 
	else 
	{
		System.out.print(name);
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdatabase","root","root");
			PreparedStatement ps = con.prepareStatement("SELECT * from restaurant WHERE name LIKE '%" + name + "%'");
			ResultSet rs = ps.executeQuery();

			if (!rs.isBeforeFirst()) 
			{
				out.println("<p>No Record Found!</p>");
			} 
			else 
			{
				out.print("<table border='1' cellpadding='2' width='100%'>");

				while (rs.next()) 
				{
					out.print("<tr><td>");
%>
<!-- <a href="FoodTreatsFilter?flag=<%=rs.getString("id")%>"> -->
<a href="showRestaurant.jsp?id=<%=rs.getString("id")%>">
	<%
		out.print(rs.getString("name"));
	%>
</a>
<br />
<%
					out.print("</tr></td>");
				}
				out.print("</table>");
			} 
			con.close();
		} 
		catch (Exception e) 
		{
			out.print(e);
		}
	}
%>
