<html>
<head>
<style>
a
{
       text-decoration:none;
       color:red;
        font-size:9pt;
       font-family:verdana;
       font-weight:bold;

}
a:hover
{

  color:blue;
  text-decoration: underline;
}
</style>
</head>
<body>
<form action="writecomments.jsp">
<%@page  import="java.sql.*,mybean.*"%>
<%@page errorPage="err.jsp"%>
<center><font size=6pt color=#000077 face=verdana><b><i>MY SOLUTIONS</i></b></font></center>
<table border=0   width=98%>
<tr><td align="right"  style="font-size:7pt;font-family:verdana;color:red">Click on <b><i><font color=blue>BID</font></i></b>  to Write Comments....</td></tr>
</table>  
&nbsp;&nbsp;<font style="font-size=9pt;font-family:verdana;color:orange"><strong>Customer:<%=session.getValue("cuname")%></strong></font>
<br>
<br>
<%!  
             Connection con=null;
             ResultSetMetaData rsmd=null;
             ResultSet rs=null;
             int cid;
 %>
<%

                con=DB.getConnection();
 	 //1st query
                 Statement st=con.createStatement();
                 rs=st.executeQuery("select cid from customers where cuname='"+session.getValue("cuname")+"'"); 
                 if(!rs.next())
                     out.println("<h2>Session Expired</h2><br>");
                 cid= rs.getInt(1);
                 //2nd query
                 Statement st1=con.createStatement();
                 rs= st1.executeQuery("select bug_details.bid,summary,solution_desc from bug_details,solutions,customers where bug_details.cid=customers.cid and bug_details.bid=solutions.bid and customers.cid=" +cid+ " order by bid");
                 rsmd=rs.getMetaData();
%>
<table width=98% >
<tr><td align=right><a href="cust_form.jsp">BACK</a><b>&nbsp;|&nbsp;<a href="signout.jsp"><b>LOGOUT</b></a> </td></tr>
</table>
<center>
<table width=98% bgcolor=white cellpadding=3 cellspacing=1>               
 <tr><td  colspan=13 align=center  bgcolor=#b5d1ee height=20  style="font-size:9pt;font-family:verdana;color:#000066"><b>SOLUTION LIST</b></td></tr>
 <tr><td height=10></td></tr>
<tr>
<%
              try
              {
                    for(int i=1;i<=rsmd.getColumnCount();i++)
                     {
%>
                        <td  align="center"   height=20 bgcolor=#000077   
                                       style="font-weight:bold;font-size:7pt;font-family:verdana;color:white"><b><%=    rsmd.getColumnName(i) %>
	         </b></td>
<%
                      }//eof of for
                 }//end of try
                catch(Exception e)
                 {
                            out.println(e); 
                  }
                 try
                  {             
                         String bcolor;
                          while(rs.next()) 
                          {
 %>  
	            <tr>
                             <%
                                         for(int  i=1;i<=rsmd.getColumnCount();i++)
                                         {
                                                 if(i%2==0)   
                                                              bcolor="#fof4f9";
                                                   else
                                                              bcolor="#e3f2eb";  
                               %>                       
                                       <td  align="center"   height=20 bgcolor= <%=bcolor%>     
                                         style="font-weight:bold;font-size:7pt;font-family:verdana;color:#000080">
                            <% 
                                           if(i==1) 
                                             {
                              %>
                                     <input type="submit"   name="submit"  value= <%= rs.getString(i) %>     style="font-weight:bold;font-size:7pt;font-family:verdana;color:red;border-top-style:none;border-bottom-style:none;border-left-style:none;border-right-style:none;background-color='#deefff';width=30pt" >
                                        </td>
                               <%
                                            }
                                          else{
                                 %>
                                                 <%= rs.getString(i) %>
                                   <%               }  
                                             }  //eof for
                                %>
                                      </tr>
                        <%
                               } //eof while
                        }//end of try
                       catch(Exception e)
                       {
                                      out.println(e);
                        }
                            %>
</table>
</form>               
</body>
</html>