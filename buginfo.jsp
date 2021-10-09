<html>
<head>
<script language="javascript">

<!-- following 2 functions is for wave property for heading use span<>   -->
	var wavePhase=0;
	function start()
	{
		window.setInterval("wave()",10);
	}
	
	   function wave()
	   {
	     wavePhase++;
	     mahi.filters("wave").phase=wavePhase;
	  }

<!--COLORS ON  BUTTONS   CHANGING  -->

	function changeColor(obj)
	{
	   obj.style.color="red";
	   obj.style.fontSize="8.5pt";
	   obj.style.fontFamily="verdana";
	   obj.style.fontWeight="bold";
	   
	}

	function originalColor(obj)
	{

	   obj.style.fontSize="7pt";
	   obj.style.fontWeight="bold";
                     obj.style.fontFamily="verdana";
	   obj.style.color="rgb(0,0,100)";
	
	}

  var i;
function printSpaces(n)
{
	 for(i=0;i<n;i++)
	{
                            document.write("&nbsp;");
	}
}



function checkInput()
{
              if(binfo.severity.value=="")
              {
                    alert("**Please Input Data**");
                    binfo.severity.focus(); 
                    return false;
               }
             if(binfo.summary.value=="")
              {
                    alert("**Please Enter Summary**");
                    binfo.summary.focus(); 
                    return false;
               }
              if(binfo.details.value=="")
              {
                    alert("**Please Enter Details**");
                    binfo.details.focus(); 
                    return false;
               }
              if(binfo.os.value=="")
              {
                    alert("**Please Enter the currently using Operating Systems in your System**");
                    binfo.os.focus(); 
                    return false;
               }
            if(binfo.softies.value=="")
              {
                    alert("**Please Enter the Softwares you are using currently in your System**");
                    binfo.softies.focus(); 
                    return false;
               }
  
  return true;         
}
function Go()
{
	binfo.action="cust_form.jsp";
	binfo.submit();
}
</script>
<STYLE>
a
{
   text-decoration:none;
   color:0066cc;
   font-size="12px";
   font-family:verdana;
   font-weight=bold
}
a:hover
{
   text-decoration:underline;
   color:red;
}
</STYLE>
</head>
<body  bgproperties="fixed"   ONLOAD="">
<form name="binfo"  action="insertbug.jsp" method="POST" >
<%@   page    import="java.sql.*,mybean.*"%>
<%@   page  errorPage="err.jsp"%>
<%! 
          Connection con=null ;
          int next_id;
          ResultSet rs,rs1;   
          Statement st,st1;
        
 %>
<%
           try
          { 
            con=DB.getConnection();
            st=con.createStatement(); 
            rs=st.executeQuery("select max(bid) from bug_details");
            if(rs.next())
              next_id=rs.getInt(1)+1;
          else 
            next_id=1;
            }
          catch(Exception e)
         {
               out.println(e);
          }
%>  
<table width=100%>
 <tr><td   style="color:white;background-image:url(file://D:\Tomcat 4.1\webapps\ROOT\space3.jpg)"  height=100 width=100%>   &nbsp;&nbsp;&nbsp;&nbsp;
               <font size="5" color="white" style="font-weight:bold;font-famlily:verdana;"> Online Technical Support  
<script language="JavaScript">
                 printSpaces(38);
</script>
 </table>

  <table align=center width=97%  bgcolor=white border=0 cellpadding=3 cellspacing=1 >
   <tr><td  colspan=3><b><i><font face=verdana size=5px color=navyblue> <span id="mahi" style="color:rgb(200,0,10);align:center;position:absolute;left:30;padding:15;       filter:wave(freq=1 ,phase=0,strength=5"> <font face="blueprint" >
                    Post New Bug    </b></i>   </font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <font size=1px color=#006388 > <b><a href="help.html"> HELP</a> </b> </font></td></tr>
   <tr><td colspan=3   align=center bgcolor=#b5d1ee height=25 style="font-size:14;font-family:verdana;color=#000066"><b>POST NEW BUG....... </b>  </td></tr>
   <tr><td height=15></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Bug-ID</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 ><input   type=text  name=bid value= <%= next_id  %>        onfocus="document.binfo.pid.focus()"  style="font-size:'10';font-family:verdana;background-color:#e3e4e9"> </td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Product&nbsp;Name</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 >
	<select name="pid"  style="font-size:12;font-weight:bold;font-family:verdana;color=#000066" >
 	<%
	           st1=con.createStatement();
	           rs1=st.executeQuery("select pid,pname,version  from products");   
	           while(rs1.next())
	           {
	 %>
                              <option value=<%= rs1.getInt(1)%>  >  <%= rs1.getString(2)%>&nbsp; <%= rs1.getString(3)%>  </option>
                  <%
	            }
	  %>
	</select>
   </td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Severity</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 >   <textarea  name="severity"   rows=2  cols=15  style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"></textarea><font color=red>*</font></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Priority</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 ><select name="priority" style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"><option  value="Low">Low</option><option value="Medium">Medium</option><option  value="High">High</option> </select></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Summary</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 ><textarea  name="summary"  rows=2   cols=15  style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"></textarea><font color=red>*</font></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Details</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 ><textarea  name="details"  rows=2   cols=15    style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"></textarea><font color=red>*</font></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> OS-USing</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 ><input name="os"  size=30 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066" maxlength=30><font color=red>*</font></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Softwares in Use</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 >   <textarea  name="softies"  rows=2   cols=15  style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"></textarea><font color=red>*</font></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066">Filename</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 ><input type="file" name="file" size=30 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"></td></tr>
   <tr><td height=15></td></tr>
   <tr>
    <td colspan=3 align=center>
<input type="submit" name="submit"  value="POST"  onclick="return checkInput()"  >
 <input type="submit" value="BACK" onclick="Go()" > 
    </td>
  </tr>  
   <tr><td height=15></td></tr>
   <tr><td height=10></td></tr>
</table>
</body>
</html>

