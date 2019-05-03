<%@page  import="java.sql.*" %>
<%
    String pcode=request.getParameter("code");
    String sql="select ftype,fdesc,rent from property where pcode=?";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pgdata", "root", "root");
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setInt(1,Integer.parseInt(pcode));
    ResultSet rs=ps.executeQuery();
    rs.next();
    String ftype=rs.getString("ftype");
    String fdesc=rs.getString("fdesc");
    String rent=rs.getString("rent");
%>

<html>
    <body>
        <h3>Paying-Guest-Portal</h3>
        <h4>Property-Update-Form</h4>
        <hr>
        <form action="SavePropertyChanges">
            <pre>
            Food-Type   <input type="text" name="ftype" value="<%=ftype%>"/>
            Facilities  <input type="text" name="fdesc" value="<%=fdesc%>"/>            
            Rent        <input type="text" name="rent" value="<%=rent%>"/>
                        <input type="hidden" name="pcode" value="<%=pcode%>"/>
                        <input type="submit" value="Save-Changes"/>
            </pre>
        </form>    
        <hr>
        <a href="ownerdashboard.jsp">Owner-Home</a>
    </body>
</html>
