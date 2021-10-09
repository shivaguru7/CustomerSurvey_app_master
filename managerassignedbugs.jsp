<html>
<head>

<script>
function DownLoad(bid)

{

alert(bid);
//window.open("Test.jsp","popup","width=500,height=500");
//f.action="GetFile";
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
<form name="bform" action ="assignbug.jsp">
<%@page  import="java.sql.*,mybean.*"%>
<%@page errorPage="err.jsp"%>
<center>
<img align=right src="bugs.jpg"   style="width=22%"></img>
</center>
<br>
<br>
<br>
<br>
<br>

<center><font size=6pt color=#000077 face=verdana><b><i>Assigned Bugs</i></b></font></center>
<%!  
            Connection con=null;
            ResultSet rs=null,rs1; 
            ResultSetMetaData rsmd=null;
            String bid="";
            

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
                 String que=" select  BID,CID,PID as ProductName,SEVERITY,PRIORITY,SUMMARY,DETAILS,OS_USING,SOFTWARE_LIST,FILENAME1 as FileName,date_format(POST_DATE,'dd-mm-yyyy') as POSTEDDATE,ASSIGNED  from bug_details where pid in (select pid from products  where mid="+mid+" )   and  assigned='Y' order by bid";
                 rs= st1.executeQuery(que);
                 rsmd=rs.getMetaData();
                   }catch(Exception e){out.println(e);}
%>
<br>
&nbsp;&nbsp;&nbsp;<font style="font-size=9pt;font-family:verdana;color:orange"><strong>Manager :<%=session.getValue("muname")%></strong></font>
<table width=98% >
<tr><td align=right><a href="manager_form.jsp">BACK</a><b>&nbsp;|&nbsp;<a href="signout.jsp"><b>LOGOUT</b></a> </td></tr>
</table>
<center>
<table width=98% bgcolor=white cellpadding=3 cellspacing=1>               
 <tr><td  colspan=12 align=center  bgcolor=#b5d1ee height=20  style="font-size:9pt;font-family:verdana;color:#000066"><b>LIST OF BUGS</b></td></tr>
 <tr><td height=10></td></tr>
<tr>
<%
              try{
                  for(int i=1;i<=rsmd.getColumnCount();i++)
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
                              for(int i=1;i<=rsmd.getColumnCount();i++)
                                 {
                                                  if(i%2==0)   
                                                              bcolor="#fof4f9";
                                                   else
                                                              bcolor="#e3f2eb";  

 
%>                              <td  align="center"   height=20 bgcolor=<%=bcolor%>     style="font-weight:bold;font-size:7pt;font-family:verdana;color:#000080">
                                         <b>
                                       
                                       
                                       
                                       <%
                                       
                                       if(i==1)
                                       {
                                       
                                       
                                     bid=rs.getString(i);
                                       
                                       
                                       }
                                       
                                       
                                       if(i==10)
                                       
                                       {
                                       
                                       %>
                                                                             
                                        <a style={cursor:hand} onclick="DownLoad('<%=bid%>')"><%= rs.getString(i)%></a>
                                       <%
                                       }else if(i==1)
                                       {
                                       %>
                                       
                                       <%= bid%>
                                       
                                       <%
                                       }else 
                                       {
                                       %>
                                       <%= rs.getString(i)%>
                                                                              <%
                                       }
                                                                                                            
                                       %>
                                       
                                       
                                       

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
</form>
</body>
</html>