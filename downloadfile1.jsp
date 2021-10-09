 

<%@ page errorPage="index.jsp" %>
<%@ page import=" java.util.*" %>
 
<%@ page import=" java.lang.reflect.*" %>
<%@ page import=" java.io.*" %>
<%@ page import=" javax.servlet.*" %>
<%@ page import=" javax.servlet.http.*" %>
<%@ page import=" java.sql.*" %>
<%@ page import=" OPTIONS.*" %>
<%@ page import=" oracle.sql.BLOB" %>
<%@ page import=" oracle.jdbc.OracleResultSet" %>
 
<%@ include file="securityCheck.jsp" %>

 
	
	 
 				<%
 				String file_name="";
 				String file_type="";
 				String document_id="";
 				 OutputStream os=null;

				byte buffer[] = new byte[10 * 1024];
 				if ( request.getParameter("document_id") != null ) document_id= request.getParameter("document_id");
 				
 				 conn = (java.sql.Connection)OPTIONSUtil.getDBConnection();
					String  sql="select  FILE_OBJECT,FILE_NAME,file_type from opn_docs  where document_id = '"+document_id+"'  ";
					Statement  stmt = conn.createStatement();
					ResultSet  rs = stmt.executeQuery(sql);
					  
				
					OutputStream outb; 
				       outb=response.getOutputStream(); 
	 
					 
					 
					 
					try
					  {
					 
					  if ( rs.next())
					  {
					  file_name= rs.getString("file_name");
					  file_type= rs.getString("file_type");
					   response.setHeader ("Content-Disposition","attachment; filename="+file_name); 
					 //  response.setHeader("Content-disposition", "filename="+file_name);
					 try{
					 if(file_type.equalsIgnoreCase("pdf"))
						{  %>   <%
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
						
						} catch ( Exception e ) { out.println(e.toString()); }  
					BLOB blob = ((OracleResultSet)rs).getBLOB(1);
					InputStream is = blob.getBinaryStream();
					 //  os  =response.getOutputStream();
					int read = 0;
					 
					try{
					
					  while ((read=is.read(buffer)) != -1) 
					  {
					  	outb.write(buffer,0,read); 
					  }
					  
					  } catch ( Exception e ) { out.println("File Type is Missing"+e.toString()); }  


					is.close();
					 
					 }
					
					rs.close();

                                         

			   
				 } catch ( Exception e ) { out.println(e.toString()); }  
 				
 				%>
 				 

         




