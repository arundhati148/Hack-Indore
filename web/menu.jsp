<%@page  import="java.sql.ResultSet,java.sql.Connection" %>
<%@page  import="java.sql.PreparedStatement,java.sql.DriverManager" %>

<%
    
    String bf=request.getParameter("Breakfast");
    String lu=request.getParameter("Lunch");
    String di=request.getParameter("Dinner");
            //String pass=request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        PreparedStatement st=con.prepareStatement("select * from menu where Breakfast=? and Lunch=? and Dinner=?");
        st.setString(1, bf);
        st.setString(2,lu);
        st.setString(3,di);
        ResultSet rs = st.executeQuery();
        
        if(rs.next())
        {
        out.println("welcome");
            response.sendRedirect("menu.html");
        }
        else
        {
            out.println("entered sucessfully");
        }
%>