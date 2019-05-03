<%@page  import="java.sql.*" %>
<%
    String userid=(String) session.getAttribute("userid");
    //fetch the data from database
    
    String sql="select password,name,hno,street,city,state,mobile from users where email=?";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pgdata", "root", "root");
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setString(1,userid);
    ResultSet rs=ps.executeQuery();
    rs.next();//moving from beforeFirst to First
    String password=rs.getString("password");
    String name=rs.getString("name");
    String hno=rs.getString("hno");
    String street=rs.getString("street");
    String city=rs.getString("city");
    String state=rs.getString("state");
    String mobile=rs.getString("mobile");
    con.close();
%>    
<html>
    <body>
        <h3>Paying-Guest-Portal</h3>
        <h4>Profile-Updation-Form For <%=userid%></h4>
        <hr>
        <form action="SaveProfileChanges">
            <pre>
            Password    <input type="text" name="password" value="<%=password%>"/>
            Username    <input type="text" name="name" value="<%=name%>"/>
            HouseNo     <input type="text" name="hno" value="<%=hno%>"/>
            Street      <input type="text" name="street" value="<%=street%>"/>
            City        <input type="text" name="city" value="<%=city%>"/>
            State       <input type="text" name="state" value="<%=state%>"/>
            Mobile      <input type="text" name="mobile" value="<%=mobile%>"/>            
                        <input type="submit" value="Update"/>
            </pre>
        </form>    
        <hr>
        <a href="index.jsp">Home</a>
    </body>
</html>
