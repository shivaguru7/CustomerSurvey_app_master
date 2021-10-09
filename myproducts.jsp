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
<%@page  import="java.sql.*,mybean.*"%>
<%@page errorPage="err.jsp"%>
<center><font size=6pt color=#000077 face=verdana><b><i>My Products</i></b></font></center>
<br>
<img src="p1.gif" width="57" height="88" style="width=9%"></img> <img src="p4.GIF" width="163" height="98" style="width=16%"></img> </img> </img> 
<img src="p2.GIF" width="150" height="47" style="width=16%"></img> <img src="oracle.gif" width="75" height="15" style="width=15%"></img> 
<br>

<%!  
            Connection con=null;
             ResultSetMetaData rsmd=null;
             ResultSet rs=null,rs1; 
 %>
<%
                try{
                con=DB.getConnection();
                Statement st=con.createStatement();
                rs1=st.executeQuery("select mid from managers where muname='"+session.getValue("muname")+"'"); 

                if(!rs1.next())
                    out.println("<h2>Session Expired</h2><br>");

                int mid= rs1.getInt(1);
                 Statement st1=con.createStatement();
                 rs= st1.executeQuery("select * from products  where mid="+mid+" order by pid");
                 rsmd=rs.getMetaData();
                 }
               catch(Exception e)
                 {
                     out.println(e);
                 }
%>
<br>
<font style="font-size=9pt;font-family:verdana;color:orange"><strong>Manager :<%=session.getValue("muname")%></strong></font>
<table width=98% >
<tr><td align=right><a href="manager_form.jsp">BACK</a><b>&nbsp;|&nbsp;</b><a href="signout.jsp"><b>LOGOUT</b></a> </td></tr>
</table>
<center>
<table width=98% bgcolor=white cellpadding=3 cellspacing=1>               
 <tr><td  colspan=12 align=center  bgcolor=#b5d1ee height=20  style="font-size:9pt;font-family:verdana;color:#000066"><b>LIST OF BUGS</b></td></tr>
 <tr><td height=10></td></tr>
<tr>
<%
              try{
                  for(int i=1;i<rsmd.getColumnCount();i++)
                  {
%>
                             <td  align="center"   height=20 bgcolor=#000077   style="font-weight:bold;font-size:7pt;font-family:verdana;color:white"><b><%=    rsmd.getColumnName(i) %>
	          </td></b>
<%
                    }
                String bcolor;
                   while(rs.next())
                      {
 %>
	<tr>
<%
                              for(int i=1;i<rsmd.getColumnCount();i++)
                                 {
                                                  if(i%2==0)   
                                                              bcolor="#fof4f9";
                                                   else
                                                              bcolor="#e3f2eb";   
%>                              <td  align="center"   height=20 bgcolor=<%=bcolor%>     style="font-weight:bold;font-size:7pt;font-family:verdana;color:#000080">
                                         <b> 
                                                           <%= rs.getString(i)%>
                                         </b>
                                     </td>
<%                           }// end of  for
%>
                   </tr>                     
<%
                       }//end of while
             }//end of try
            catch(Exception e)
             {
                 out.println(e);
              }
%>
</tr></table>

</body>
</html>