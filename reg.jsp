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
            if(cinfo.cuname.value=="")
            {
                     alert("**Enter UserName**");
                     cinfo.cuname.focus();
                     return false;
            }
            if(cinfo.cpwd.value=="")
            {
                     alert("**Enter Password**");
                     cinfo.cpwd.focus();
                     return false;
            }
            if(cinfo.cname.value=="")
            {
                     alert("**Enter Customer Name**");
                     cinfo.cname.focus();
                     return false;
            }
          if(cinfo.cmail.value=="")
            {
                     alert("**Enter E-mail ID**");
                     cinfo.cmail.focus();
                     return false;
            }
 return true;
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
<form name="cinfo"   action="insertcustomer.jsp"  ONSUBMIT="return checkInput()"  method="POST">
<%@   page    import="java.sql.*,mybean.*"%>
<%@   page  errorPage="err.jsp"%>
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
            rs=st.executeQuery("select max(cid) from customers");
            if(rs.next())
              next_id=rs.getInt(1)+1;
          else 
            next_id=1;
            }
          catch(Exception e){}
%>  
<table width=100%>
 <tr><td   style="color:white;background-image:url(file://D:\javaexamples\online tech support\space3.jpg)"  height=100 width=100%>   &nbsp;&nbsp;&nbsp;&nbsp;
               <font size="5" color="white" style="font-weight:bold;font-famlily:verdana;"> Online Technical Support  
<script language="JavaScript">
                 printSpaces(38);
</script>
 </table>

  
<table align=center width=97%  bgcolor=white border=0 cellpadding=3 cellspacing=1 >
  <tr> 
    <td  colspan=3><b><i><font face=verdana size=5px color=navyblue> <span id="mahi" style="color:rgb(200,0,10);align:center;position:absolute;left:30;padding:15;       filter:wave(freq=1 ,phase=0,strength=5"> 
      <font face="blueprint" > Adminstrator Registration Form </b></i> </font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=1px color=#006388 > <b> 
      <input type="button" name="helpbutton" STYLE="background-image:url(file://d:\qmark.gif); height:46px;width:45px;background-color:white; border-top-STYLE:none;border-bottom-STYLE:none;border-left-STYLE:none;border-right-STYLE:none">
      <a href="help.html"> HELP</a> </b> </font></td>
  </tr>
  <tr> 
    <td colspan=3   align=center bgcolor=#b5d1ee height=25 style="font-size:14;font-family:verdana;color=#000066">&nbsp; 
    </td>
  </tr>
  <tr>
    <td height=15></td>
  </tr>
  <tr> 
    <td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
      Admin &nbsp;Id</td>
    <td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>
    <td  bgcolor=#fof4f9 ><input type=text  name="cuname"   STYLE="font-size:'10';font-family:verdana;width=35%">
      <font color=red>*</font> </td>
  </tr>
  <tr>
    <td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
      &nbsp;Password</td>
    <td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>
    <td  bgcolor=#fof4f9 ><input type="password"   name="cpwd"   STYLE="font-size:'10';font-family:verdana;width=35%"   onblur="return checkpwd(cpwd)">
      <font color=red>*</font> </td>
  </tr>
  <script language="javascript">
           function checkpwd(obj)
          {
                  var str=obj.value;
                   if(str.length>8)
                    {
                               alert("**sorry password  length greater than 8 chars**"); 
	              cinfo.cpwd.focus();
                                return false;
                  }
                 return true;
           }
  </script>
  <tr> 
    <td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
      Admin&nbsp;Name</td>
    <td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>
    <td  bgcolor=#fof4f9 ><input type=text    name="cname"  STYLE="font-size:'10';font-family:verdana;width=35%">
      <font color=red>*</font> </td>
  </tr>
  <tr>
    <td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
      &nbsp;Address</td>
    <td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>
    <td  bgcolor=#fof4f9 ><textarea  name="caddr"  rows=3 cols=15  STYLE="font-size:'10';font-family:verdana;width=80%"></textarea></td>
  </tr>
  <tr>
    <td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
      &nbsp;Phone</td>
    <td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>
    <td  bgcolor=#fof4f9 ><input type=text     name="cphone"   STYLE="font-size:'10';font-family:verdana;width=35%"> 
    </td>
  </tr>
  <tr>
    <td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
      &nbsp;E-mail</td>
    <td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td>
    <td  bgcolor=#fof4f9 ><input type=text name="cmail"  STYLE="font-size:'10';font-family:verdana;width=80%">
      <font color=red>*</font></td>
  </tr>
  <tr>
    <td height=15></td>
  </tr>
  <tr>
    <td colspan=3 align=center><input type="submit" name="submit"  value="SUBMIT"    > <input type="submit" name="submit"  value="Back"    > 
    </td>
  </tr>
  <tr>
    <td height=15></td>
  </tr>
  <tr>
    <td height=10></td>
  </tr>
</table>
<center>
  </font>
</center>
</body>
</html>

