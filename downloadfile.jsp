<%@ page import=" java.util.*" %>
<%@ page import=" java.lang.reflect.*" %>
<%@ page import=" java.io.*" %>
<%@ page import=" javax.servlet.*" %>
<%@ page import=" javax.servlet.http.*" %>
<%@ page import=" java.sql.*" %>
<%
 			//	OutputStream os=null;
				byte buffer[] = new byte[10 * 1024];
	                  Connection conn=null;
			  Statement stmt=null;
			  String file_name="";
		          String bid=request.getParameter("bid");
		          	System.out.println("OK Error******"+bid);
	   		  OutputStream outb; 
			  
			 outb=response.getOutputStream();
			 String file_type="pdf";
	                  
			
			System.out.println("OK Error");
			
			
					 try
					 {
					 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn =DriverManager.getConnection("jdbc:oracle:@localhost:1521:XE","bts","bts");
					 
					  stmt  = conn.createStatement ();
					  // Create the example table
					  // stmt.execute ("drop table streamexample");
					  		 
			System.out.println("OK Error#######");
					 
					   ResultSet rs =    stmt.executeQuery ("select filename1,filename from bug_details where bid='3'");

					 
			System.out.println("OK Error#######");
					  if ( rs.next())
					  {
					  file_name= rs.getString("filename1");
					  
					  
					  
					  
					   response.setHeader ("Content-Disposition","attachment; filename="+file_name); 
					   
					 //  response.setHeader("Content-disposition", "filename="+file_name);
					
					try
					{
					 if(file_type.equalsIgnoreCase("pdf"))
						{
						%>  
						
						<%
						 	response.setContentType("application/pdf");
						}
					else if(file_type.equalsIgnoreCase("doc"))
						{
						 	response.setContentType("application/msword");
						}
					else if(file_type.equalsIgnoreCase("csv"))
						{
						 	response.setContentType("application/vnd.csv");
						}	
					else if(file_type.equalsIgnoreCase("txt"))
						{
						 	response.setContentType("text/plain; charset=ISO-8859-1");
						}	
					else if(file_type.equalsIgnoreCase("htm") || file_type.equalsIgnoreCase("html")  )
						{
						 	response.setContentType("text/html");
						}								
					else if(file_type.equalsIgnoreCase("xls"))
						{
						 	response.setContentType("application/vnd.ms-excel");
						}	
					else
						{
						 	response.setContentType("text/plain; charset=ISO-8859-1");
						}
						
						} catch ( Exception e ) 
						
						{ 
						
						out.println(e.toString());
						
						
						}  
						
						
					 InputStream is = rs.getAsciiStream("filename");
					 
					
					
					
					
					 
					int read = 0;
					 
					try{
					
										  while ((read=is.read(buffer)) != -1) 
										  {
										  	outb.write(buffer,0,read); 
					  }
					
					  } catch ( Exception e ) 
					  { 
					    out.println("File Type is Missing"+e.toString()); 
					  }  


					is.close();
					 
					 }
					
					rs.close();

                                         

			   
				 } catch ( Exception e )
				 
				 {
				 
				 out.println(e.toString()); 
				 
				 }  
 				
 				%>
 				 

         




