 <html>
<head>
<script language="javascript">
function Go()
{


pinfo.action="admin_form.html";
pinfo.submit();



}


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

    if(pinfo.pname.value=="")
    {
        alert("**Enter Product Name**");
        pinfo.pname.focus();
        return false;  
     }else if(pinfo.ver.value=="")
    {
        alert("**Enter Version Name**");
        pinfo.ver.focus();
        return false;  
     }else if(pinfo.vendor.value=="")
    {
        alert("**Enter Vendor Name**");
        pinfo.vendor.focus();
        return false;  
     }else if(pinfo.mid.selectedIndex==0)
     {
     	alert("**Select Manager ID**");
	pinfo.mid.focus();
	return false;
     }

   return true;
}
function setfocus()
{
	pinfo.pname.focus();
	return false;
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
<body  bgproperties="fixed"   ONLOAD="return setfocus()">


<form name="pinfo"    action="insertproduct.jsp" method="POST"  >


<%@page import="java.sql.*,mybean.*"%>

<%@page errorPage="err.jsp"%>


<%! 
          Connection con=null ;
          int next_id;
          ResultSet rs;   
          Statement st;
 %>
<%
           try
          { 
            con=DB.getConnection();
            st=con.createStatement(); 
            rs=st.executeQuery("select max(pid) from products");
            
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
                    Add New Product  </b></i>   </font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=1px color=#006388 > <b><a href="help.html">HELP</a> </b> </font></td></tr>
   <tr><td colspan=3   align=center bgcolor=#b5d1ee height=25 style="font-size:14;font-family:verdana;color=#000066"><b>ENTER NEW PRODUCT DETAILS....... </b>  </td></tr>
   <tr><td height=15></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Product&nbsp;ID</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 > <input name=pid size=10 value= <%= next_id  %>  onfocus="document.pinfo.pname.focus()"  style="font-size:'10';font-family:verdana;background-color:#e3e4e9"    onfocus="document.cinfo.cuname.focus()"> </td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Product&nbsp;Name</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 > <input name=pname  STYLE="font-size:'10';font-family:verdana;width=35%"><font color=red>*</font>  </td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Version</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 > <input type="text"   name="ver"   STYLE="font-size:'10';font-family:verdana;width=35%"><font color=red>*</font></td></tr>
   <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> Vendor&nbsp;Name</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 ><input type=text    name="vendor"  STYLE="font-size:'10';font-family:verdana;width=35%"><font color=red>*</font> </td></tr>
<%
          Statement st1=con.createStatement();  
         rs=st1.executeQuery("select mid,muname from managers ");
 %>
<tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066">Manager-ID</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>  <td  bgcolor=#fof4f9 >
          <select name=mid >
		  <option><---Select Manager Id---></option>
<%  String name;
          int id;
          
          
        
        while( rs.next())
           {
              id=rs.getInt(1);
              name=rs.getString(2);
      %>   
             <option value=  <%= id %>   >       <%= name %>           </option>
     <%
            }
       %>


    </select></TR>
  <tr><td height=15></td></tr>
   <tr>
    <td colspan=3 align=center> 
      <input type="submit" name="submit"  value="ADD"  onClick="return checkInput()"  >
      <input type="submit"  value="BACK"  onclick="Go()"   > </td></tr>  
   <tr><td height=15></td></tr>
   <tr><td height=10></td></tr>
</table>
</body>
</html>

