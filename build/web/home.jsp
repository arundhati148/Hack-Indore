<%@page  import="java.sql.ResultSet,java.sql.Connection" %>
<%@page  import="java.sql.PreparedStatement,java.sql.DriverManager" %>

<%
    
    String id=request.getParameter("userId");
            String pass=request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        PreparedStatement st=con.prepareStatement("select * from admin where adminid=? and password=?");
        st.setString(1, id);
        st.setString(2,pass);
        ResultSet rs = st.executeQuery();
        
        if(rs.next())
        {
        out.println("welcome");
            response.sendRedirect("menu.html");
        }
        else
        {
            out.println("invalid id/password");
        }
%>