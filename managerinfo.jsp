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
  if(minfo.muname.value=="")
  {
           alert("**Enter Username **");
            minfo.muname.focus();
           return false;       
   }else if(minfo.mpwd.value=="")
  {
           alert("**Enter Password **");
           minfo.mpwd.focus();
           return false;       
  }else if(minfo.mpwd.value.length<4)
  {
           alert("**sorry password length must be 4 chars minimum**"); 
           minfo.mpwd.value="";
	   minfo.mpwd.focus();
           return false;
  }else if(minfo.mname.value=="")
  {
           alert("**Enter Manager Name **");
           minfo.mname.focus();
           return false;       
  }else if ((minfo.mmail.value=="") || (minfo.mmail.value==" "))
     	    {
         	alert("Please Enter E-mail ID");
		minfo.mmail.value=""
         	minfo.mmail.focus();
         	return false;
     	   }else if (echeck(minfo.mmail.value)==false)
 	   {
		minfo.mmail.value="";
		minfo.mmail.focus();
		return false
	 }
   return true;
}
function echeck(str)
{

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr)
		{
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr)
		{
		    alert("Invalid E-mail ID")
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

 		 return true
}
function Go()
{
	minfo.action="admin_form.html";
	minfo.submit();
}
function setfocus()
{
	minfo.muname.focus();
	return false;
}
function Check(obj)
{
len=obj.value;
var colors=new Array("`","~","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|",",","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
for(j=0;j<=len.length-1;j++)
{
var char=len.substring(j,j+1);
for(i=0;i<=colors.length-1;i++)
{
 var sNumber=colors[i];
 if(sNumber==char)
 {
  obj.value="";
  obj.focus();
  
  return false;
 }
}
}
if(obj.value.length<7)
{
   alert("**Phone Number must be 7 Chars minimun**");
   minfo.mphone.value="";
   return false;
}
string_value=obj.value;
var whitespace = " \n\r\t\."
var existed="No";
var Valid="No";
for (var counter = 0; counter < string_value.length; counter++) 
 {
      // Get the current character
      current_char = string_value.charAt(counter)
      // If it's not in the whitespace characters string,
      // return false because we found a non-whitespace character
      if(whitespace.indexOf(current_char) =="") 
      {
  	    var existed="Yes";
      }else if(whitespace.indexOf(current_char) ==-1) 
      {
  	     existed="No";
  	     Valid="Yes";
  	     break;
      }
    }
    if(existed=="No" && Valid=="Yes")
    {
        existed="Yes";
   	  Valid="No";
   	  return false;
    }else
    {
  		 obj.value="";
  		  existed="Yes";
  		  Valid="No";
  		  obj.focus();
  		  return false;
  	
    }

}


function NoCheck(obj)
{
n=event.keyCode;
len=obj.value;
if((n<=57 && n>=48) ||  n==8 || (n<=105 && n>=96) || n==46 ||(n>=33 && n<=36) || (n==37) || (n==18) ||(n==92) ||(n==93) ||(n==17) ||(n==145) ||(n==19) ||(n==144) ||(n==35)|| (n==46)||(n==45)||(n==40)|| (n==38) || (n==39) || (n==9))
{

}else
{
 obj.value="";

}

}
function validateuserid(obj)
{
	
	var string_value=obj.value;
	var user=obj.value;
	
	its_whitespace1(obj);
	
	var oXMLHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );
	var sURL = "./CheckUser?user=" + user
	oXMLHTTP.open( "POST", sURL, false );
	oXMLHTTP.send();
	var  status=oXMLHTTP.responseText;
	var s=status;
	
	var str="a";
	
	
	if(s.charAt(0)==str)
        {
        alert(s);
        
         f1.txtlogin.value="";
         
	 f1.txtlogin.focus();
        }
        
        	
}
function NoCheck1(obj)
{
n=event.keyCode;
len=obj.value;


if(n==32)
{
 obj.value="";

}

}
function its_whitespace1(obj)
{
len=obj.value;
var colors=new Array("`","~","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|",",");
for(j=0;j<=len.length-1;j++)
{
var char=len.substring(j,j+1);
for(i=0;i<=colors.length-1;i++)
{
  var sNumber=colors[i];
  if(sNumber==char)
  {
  
   obj.value="";
   obj.focus();
   return false;
  }
}

}
	 
if(obj.value.length==0)
{
	
return false;

}
	string_value=obj.value;

  // These are the whitespace characters
  var whitespace = " \n\r\t\."
  var existed="No";
  var Valid="No";
   
  // Run through each character in the string
    for (var counter = 0; counter < string_value.length; counter++) 
    {
      // Get the current character
      current_char = string_value.charAt(counter)
      // If it's not in the whitespace characters string,
      // return false because we found a non-whitespace character
      if(whitespace.indexOf(current_char) =="") 
      {
  	    var existed="Yes";
      }else if(whitespace.indexOf(current_char) ==-1) 
      {
  	     existed="No";
  	     Valid="Yes";
  	     break;
      }
    }
    if(existed=="No" && Valid=="Yes")
    {
        existed="Yes";
   	  Valid="No";
   	  return false;
    }else
    {
  		 obj.value="";
  		  existed="Yes";
  		  Valid="No";
  		  obj.focus();
  		  return false;
  	
    }
}
function its_whitespace2(obj)
 {
	 
if(obj.value.length==0)
{
	
return false;

	}
// These are the whitespace characters


  var whitespace = " \n\r\t"
  var existed="No";
  var Valid="No";
len=obj.value;

var string_value=obj.value;


var char=len.substring(len.length,len.length-1);
 // Run through each character in the string
  for (var counter = 0; counter < string_value.length; counter++) 
  {
    // Get the current character
    current_char = string_value.charAt(counter)
    // If it's not in the whitespace characters string,
    // return false because we found a non-whitespace character
    if(whitespace.indexOf(current_char) =="") 
    {
	    var existed="Yes";
    }else if(whitespace.indexOf(current_char) ==-1) 
    {
	     existed="No";
	     Valid="Yes";
	     break;
    }
  }
  if(existed=="No" && Valid=="Yes")
  {
      existed="Yes";
 	  Valid="No";
 	  return false;
  }else
  {
		  obj.value="";
		  existed="Yes";
		  Valid="No";
		  obj.focus();
		  
		  return false;
	}
  // Otherwise, the string has nothing but
  // whitespace characters, so return true
  
  
}
function CharCheck(obj)
{
len=obj.value;


len=obj.value;

if(len.charAt(0)==" " || len.charAt(0)=="."  )
{
  var oldvalue=len.substring(1,len.length);
  obj.value=oldvalue;
}

n = event.keyCode;



len=obj.value;


if((n>=65 && n<=90)|| (n>=33 && n<=36) || (n==37) || (n==18) ||(n==92) ||(n==93) ||(n==17) ||(n==145) ||(n==19) ||(n==144) ||(n==35)|| (n==46)||(n==45)||(n==40)|| (n==38) || (n==39)||(n==32) || (n==8) || (n==110) || (n==190) || (n==20) || (n==9) || (n==16) || n==36)
{
	
	
}else
{
  obj.value="";
  return false;
}
}

function its_whitespace(obj)
{
len=obj.value;
var colors=new Array("~","`","!","@","#","$","%","^","&","*","(",")","_","+","<",">","/","?","}","{","[","]","'",";","=","-","|",",","1","2","3","4","5","6","7","8","9","0");
for(j=0;j<=len.length-1;j++)
{
var char=len.substring(j,j+1);
for(i=0;i<=colors.length-1;i++)
{
  var sNumber=colors[i];
  if(sNumber==char)
  {
  
   obj.value="";
   obj.focus();
   return false;
  }
}

}


	 
if(obj.value.length==0)
{
	
return false;

}

string_value=obj.value;
	
  // These are the whitespace characters
  var whitespace = " \n\r\t\."
  var existed="No";
  var Valid="No";
  
  // Run through each character in the string
    for (var counter = 0; counter < string_value.length; counter++) 
    {
      // Get the current character
      current_char = string_value.charAt(counter)
      // If it's not in the whitespace characters string,
      // return false because we found a non-whitespace character
      if(whitespace.indexOf(current_char) =="") 
      {
  	    var existed="Yes";
      }else if(whitespace.indexOf(current_char) ==-1) 
      {
  	     existed="No";
  	     Valid="Yes";
  	     break;
      }
    }
    if(existed=="No" && Valid=="Yes")
    {
        existed="Yes";
   	  Valid="No";
   	  return false;
    }else
    {
  		 obj.value="";
  		  existed="Yes";
  		  Valid="No";
  		  obj.focus();
  		  return false;
  	
    }

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
<body  bgproperties="fixed"   ONLOAD="return setfocus()"><form name="minfo"  action="insertmanager.jsp" method="POST" > 
<%@   page    import="java.sql.*,mybean.*"%> <%@   page  errorPage="err.jsp"%> 
<%! 
          Connection con=null ;
          int next_id;
          ResultSet rs;   
          Statement st;
 %> <%
           try
          { 
            con=DB.getConnection();
            st=con.createStatement(); 
           rs=st.executeQuery("select max(mid) from managers");
            if(rs.next())
              next_id=rs.getInt(1)+1;
          else 
            next_id=1;
            }
          catch(Exception e)
         {
                      out.println(e);
          }
%> <table width=100%> <tr><td   style="color:white;background-image:url(file://D:\Tomcat 4.1\webapps\ROOT\space3.jpg)"  height=100 width=100%> 
&nbsp;&nbsp;&nbsp;&nbsp; <font size="5" color="white" style="font-weight:bold;font-famlily:verdana;"> 
Online Technical Support <script language="JavaScript">
                 printSpaces(38);
</script> </table><table align=center width=97%  bgcolor=white border=0 cellpadding=3 cellspacing=1 > 
<tr><td  colspan=3><b><i><font face=verdana size=5px color=navyblue> <span id="mahi" style="color:rgb(200,0,10);align:center;position:absolute;left:30;padding:15;       filter:wave(freq=1 ,phase=0,strength=5"> 
<font face="blueprint" > Manager Registration Form </b></i> </font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=1px color=#006388 > <b> <a href="help.html">HELP</a> </b> </font></td></tr>  
<tr><td colspan=3   align=center bgcolor=#b5d1ee height=25 style="font-size:14;font-family:verdana;color=#000066"><b>ENTER 
NEW MANAGER DETAILS....... </b> </td></tr> <tr><td height=15></td></tr> <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
Manager&nbsp;ID</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td><td  bgcolor=#fof4f9 ><input   type=text  name=mid  value="<%=next_id%>"     onfocus="document.minfo.muname.focus()"    style="font-size:'10';font-family:verdana;background-color:#e3e4e9"> 
</td></tr> <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
User&nbsp;Name</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td><td  bgcolor=#fof4f9 ><input type=text  name="muname"   STYLE="font-size:'10';font-family:verdana;width=35%" maxlength="20" onblur="validateuserid(this);" onkeyup="NoCheck1(this)"><font color=red>*</font></td></tr> 
<tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
Password</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td><td  bgcolor=#fof4f9 > 
<input type="password"   name="mpwd"   STYLE="font-size:'10';font-family:verdana;width=35%" maxlength="8" onblur="its_whitespace2(this)"><font color=red>*</font></td></tr> 
<script language="javascript">
           function checkpwd(obj)
          {
                  var str=obj.value;
                   if(str.length<4)
                    {
                               alert("**sorry password length must be 4 chars minimum**"); 
			minfo.mpwd.value="";
	              minfo.mpwd.focus();
                                return false;
                  }
                 return true;
           }
  </script> <tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
Manager&nbsp;Name</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td><td  bgcolor=#fof4f9 ><input type=text    name="mname"  STYLE="font-size:'10';font-family:verdana;width=35%" maxlength="30" onkeyup="CharCheck(this)" onblur="its_whitespace(this)"><font color=red>*</font></td></tr> 
<tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
Address</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td><td  bgcolor=#fof4f9 ><textarea  name="maddr"  rows=3 cols=15  STYLE="font-size:'10';font-family:verdana;width=80%"></textarea></td></tr> 
<tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
&nbsp;Phone</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td><td  bgcolor=#fof4f9 ><INPUT TYPE=text     NAME="mphone"   STYLE="font-size:'10';font-family:verdana;width=35%" MAXLENGTH="13" onkeyup="NoCheck(this)"  onblur="Check(this)"></td></tr> 
<tr><td width=39%  bgcolor=#fof4f9 style="font-size:12;font-weight:bold;font-family:verdana;color=#000066"> 
&nbsp;E-mail</td><td width=10% align=center  bgcolor=#fof4f9 style="font-size:10;font-weight:bold;font-family:verdana;color=#000066 " ><b>:</b></td><td  bgcolor=#fof4f9 ><input type=text name="mmail"  STYLE="font-size:'10';font-family:verdana;width=80%" maxlength="35"><font color=red>*</font> 
</td></tr> <tr><td height=15></td></tr> <tr><td colspan=3 align=center><input type="submit" name="submit"  value="SUBMIT"  onclick="return checkInput()"  > 
<input type="submit"  value="BACK"  onclick="Go()"   > </td></tr> <tr><td height=15></td></tr> 
<tr><td height=10></td></tr> </table>
</body>
</html>

