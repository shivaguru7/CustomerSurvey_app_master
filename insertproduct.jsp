<html>
<body bgcolor=navyblue>
<%@page   import="java.sql.*,mybean.*"%>
<%@page   errorPage="err.jsp"%>
<%! 
           Connection con=null;
          %>
<% 
              
              int pid = Integer.parseInt(request.getParameter("pid"));
              String pname= request.getParameter("pname");  pname=pname.toUpperCase();
              String version = request.getParameter("ver");       version =version.toUpperCase();  
              String vendor = request.getParameter("vendor");
              int mid =Integer.parseInt( request.getParameter("mid"));
         try
         {          
            
            
            con=DB.getConnection(); 
            con.setAutoCommit(false);   
            PreparedStatement pst=con.prepareStatement("select pid from products where pname=? and version=?");
            pst.setString(1,pname);
            pst.setString(2,version);
            ResultSet rs=pst.executeQuery();
            if(!rs.next())
            {  
             PreparedStatement st=con.prepareStatement("insert into products values(?,?,?,?,?)"); 
             st.setInt(1,pid);
             st.setString(2,pname);
             st.setString(3,version);
             st.setString(4,vendor); 
             st.setInt(5,mid);
             st.executeUpdate(); 
             con.commit();
             response.sendRedirect("admin_form.jsp");  
              }
             else
                  out.println("<h1>  This Product Was Already Inserted</h1>");
                  %>
                  
                  <a href="productinfo.jsp">Back</a>
                  <%
                  
                
        }
        catch(Exception e)
          {
               out.println(e);
           }	
    %>

  <br>
  <br>
</center>
</body>
</html>