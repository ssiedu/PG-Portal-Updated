import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveProfileChanges extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email=(String)request.getSession().getAttribute("userid");
        String password=request.getParameter("password");
        String name=request.getParameter("name");
        String hno=request.getParameter("hno");
        String street=request.getParameter("street");
        String city=request.getParameter("city");
        String state=request.getParameter("state");
        String mobile=request.getParameter("mobile");
        
        String sql="update users set password=?, name=?, hno=?, street=?, city=?, state=?, mobile=? where email=?";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pgdata","root","root");
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,password);
            ps.setString(2,name);
            ps.setString(3,hno);
            ps.setString(4,street);
            ps.setString(5,city);
            ps.setString(6,state);
            ps.setString(7,mobile);
            ps.setString(8,email);
            ps.executeUpdate();
            con.close();
            response.sendRedirect("customerdashboard.jsp");
        }catch(Exception e){
            out.println(e);
        }
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
