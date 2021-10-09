<html>
<body  bgcolor="navyblue">
<center>
<%@page  import="java.sql.*,mybean.*,javax.servlet.http.*"%>
<%@page  errorPage="err.jsp"%>
<%!
       Connection con=null;
       HttpSession session=null;
%>

<%

      String uid=request.getParameter("uid").trim();
	  System.out.println(uid);
      String pwd=request.getParameter("pwd").trim();
	  System.out.println(pwd);
	 
      //if(con==null)
    // {

	 System.out.println("hi");
		
	Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "root");
      // }	  
	 System.out.println("hi");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select password  from  customers   where cuname='"+uid+"'");
	 
       while(rs.next())
         {
			 System.out.println("if");
              if(pwd.equals(rs.getString(1)))
               {System.out.println("if1");
                 session=request.getSession(true);
                 
                 session.putValue ("cuname",uid);
                 
                 response.sendRedirect("cust_form.jsp");
                }
             else
               {System.out.println("else");
                      response.sendRedirect("customerlogin.html");
                 }
           }
        
                
					//{   System.out.println("else2");
                      //response.sendRedirect("customerlogin.html");
                 //}                     
		 
%>
</body>
</html>





