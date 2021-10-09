<html>
<body bgcolor=navyblue>
 <%@page   import="java.sql.*,mybean.*,org.apache.commons.fileupload.*,java.util.*,java.io.*, java.util.Date,java.text.*"%>


<%! 
           Connection con=null;
  %>
<% 

              int bid = Integer.parseInt(request.getParameter("bid"));
              int pid = Integer.parseInt(request.getParameter("pid"));
              String severity= request.getParameter("severity");
              String priority = request.getParameter("priority");
              String  summary = request.getParameter("summary");
              String details = request.getParameter("details");
              String os = request.getParameter("os");
              String softies = request.getParameter("softies");
              String file = "c:\\"+request.getParameter("file");
            
            
              
               try
         {  
              
                 
	    
	    
	                
            File file2 = new File (file);  
            
            String FileName=file2.getName();
			System.out.println("filename"+file);
            
            InputStream is = new FileInputStream (file);
                 
              
                
             con=DB.getConnection(); 
             con.setAutoCommit(false);   
             PreparedStatement ps=con.prepareStatement("insert into bug_details values(?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
             ps.setInt(1,bid);
             Statement st=con.createStatement(); 
             ResultSet rs=st.executeQuery("select  cid from customers where cuname='" +session.getValue("cuname")+"'");
             if(!rs.next())
             out.println("Ur Session Expired<br>");
             ps.setInt(2,rs.getInt(1));
             ps.setInt(3,pid);
             ps.setString(4,severity); 
             ps.setString(5,priority);
             ps.setString(6,summary);
             ps.setString(7,details);             
             ps.setString(8,os);
             ps.setString(9,softies);
             
             ps.setAsciiStream (10, is, (int)file2.length());
                
             
          // java.sql.Date date = getCurrentJavaSqlDate();
             ps.setDate(11,new java.sql.Date(System.currentTimeMillis()));
             ps.setString(12,"N" ); 
             ps.setString(13,FileName ); 
             
             ps.executeUpdate(); 
             
             
             con.commit();
          response.sendRedirect("cust_form.jsp");  
          
        }
        catch(Exception e)
         {
           out.println(e);
          }	
    %>
</body>
</html>