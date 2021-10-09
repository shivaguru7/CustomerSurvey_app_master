<html>
<script>
function DownLoad(bid)
{
alert(bid);

var bid=bid;
//alert(bid);
//window.open("Test.jsp","popup","width=500,height=500");
//f.action="downloadfile.jsp";
//f.submit();


        var bid=bid;
	
        var oXMLHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );
 	var sURL = "./GetFile?bid="+ bid
 	
 	oXMLHTTP.open( "POST", sURL, false );
	oXMLHTTP.send();
	var  status=oXMLHTTP.responseText;
	var s=status;
	var str="I";
	alert(status);
	








}

</script>

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


<form name=f >


<%@page  import="java.sql.*,mybean.*"   %>
<%@page errorPage="err.jsp"%>
<center><font size=6pt color=#000077 face=verdana><b><i>My Bugs</i></b></font></center>
<br>
<%!  
             Connection con=null;
             ResultSetMetaData rsmd=null;
             ResultSet rs=null,rs1; 
             String bid="";
             
 %>
<%
                try{
               Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "root");
                Statement st=con.createStatement();
                rs1=st.executeQuery("select cid from customers where cuname='"+session.getValue("cuname")+"'"); 

                if(!rs1.next())
                out.println("<h2>Session Expired</h2><br>");
                int cid= rs1.getInt(1);
                Statement st1=con.createStatement();
                 
                 
                  
 
 
                 rs= st1.executeQuery("select  BID,CID,PID as ProductName,SEVERITY,PRIORITY,SUMMARY,DETAILS,OS_USING,SOFTWARE_LIST,FILENAME1 as FileName,date_format(POST_DATE,'dd-mm-yyyy') as POSTEDDATE,ASSIGNED from bug_details  where cid="+cid+" order by bid");
                 rsmd=rs.getMetaData();
                }
               catch(Exception e)
                 {
                     out.println(e);
                 }
%>
<font style="font-size=9pt;font-family:verdana;color:orange"><strong>Customer:<%=session.getValue("cuname")%></strong></font>
<table width=98% >
<tr><td align=right><a href="cust_form.jsp">BACK</a><b>&nbsp;|&nbsp;<a href="signout.jsp"><b>LOGOUT</b></a> </td></tr>
</table>
<center>
<table width=98% bgcolor=white cellpadding=3 cellspacing=1>               
<tr><td  colspan=12 align=center  bgcolor=#b5d1ee height=20  style="font-size:9pt;font-family:verdana;color:#000066"><b>LIST OF BUGS</b></td></tr>
<tr><td height=10></td></tr>
<tr>
<%
              try{
                   if(false)
                     out.println("There are No Bugs Posted by You");
                   else
                     {
                  for(int i=1;i<rsmd.getColumnCount();i++)
                  {
       
%>
                             <td  align="center"   height=20 bgcolor=#000077   style="font-weight:bold;font-size:7pt;font-family:verdana;color:white"><b><%=    rsmd.getColumnName(i) %>
	          </td></b>
<%
                    }
                String bcolor;
                boolean flag=false,flag1=true; 
                   while(rs.next())
                      {
                           if(!flag)
                              {
                                bcolor="#f0f4f9";
                                 flag=true;
                                }
                          else
                                {
                                bcolor="#e3f2eb";
                                 flag=false;
                                }
         
 %>
	<tr>
<%
                              for(int i=1;i<rsmd.getColumnCount();i++)
                                 {
                               //instead of printong the pid from bug_details table we are going to print the product name  from the products table
                                      if(i==3)
                                       {
                                                              int pid=rs.getInt(i);
                                                              Statement stt=con.createStatement();
     		                          ResultSet rss=stt.executeQuery("select pname from products where pid="+pid);		                               
 			        rss.next();
                                                              String pname=rss.getString(1);
                                                              
                      %>

 <td  align="center"   height=20 bgcolor=<%=bcolor%>     style="font-weight:bold;font-size:7pt;font-family:verdana;color:#000080"><b><%=pname%></b></td>

                          <%                     
                     }
                   else
                                     {
                                     
                                     
                                     
                                     if(i==1)
				                                          {
				                                          
				                                          bid=rs.getString(i);
				                                          
				                                          %>
				                                          
				                                          <td  align="center"   height=20 bgcolor=<%=bcolor%>     style="font-weight:bold;font-size:7pt;font-family:verdana;color:#000080"> <%=bid%></td>
				                                          
				                                          <%
				                                          
                                     }else if(i==10)
                                     {
                                     %>
                                     
                                     <td  align="center"   height=20 bgcolor=<%=bcolor%>     style="font-weight:bold;font-size:7pt;font-family:verdana;color:#000080"><u> <a style={cursor:hand} onclick="DownLoad('<%=bid%>')"> <%= rs.getString(i)%><a></u></td>
                                     
                                     <%
                                     
                                     }else
                                     {
                                     
                                     %>
                                     
                                     <td  align="center"   height=20 bgcolor=<%=bcolor%>     style="font-weight:bold;font-size:7pt;font-family:verdana;color:#000080"> <%= rs.getString(i)%></td>
                                     
                                     
                                     <%
                                                                      
                                     
                                     }
                                     
                                            }  //end of outer else         
                                   }// end of  for
		%>
		                   </tr>                     
			<%
		                       }//end of while
                }//end of else
             }//end of try
            catch(Exception e)
             {
                 out.println(e);
              }
%>
</tr></table>
</form>

</body>
</html>