<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0029)http://user.nipic.com/reg.asp -->
<HTML><HEAD><TITLE></TITLE>
<LINK 
href="front_files/style.css" type=text/css rel=stylesheet>
</HEAD>
<BODY >
<jsp:include page="top.jsp"></jsp:include>
 <FORM name=regform  style="display: inline;" action="/wenjx/wenjx?ac=reg" method=post>
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=900 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width=7 height=7><IMG height=7 src="front_files/kuang_1_1.gif" 
            width=7></TD>
          <TD background=front_files/kuang_2_1.gif></TD>
          <TD width=7 height=7><IMG height=7 src="front_files/kuang_1_2.gif" 
            width=7></TD></TR>
        <TR>
          <TD background=front_files/kuang_2_2.gif></TD>
          <TD>
            <TABLE cellSpacing=0 cellPadding=8 width="100%" border=0>
              <TBODY>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD><IMG height=31 src="front_files/arrow_reg.gif" 
                        width=43 align=absMiddle><B class=big>问卷网会员注册</B></TD>
                    </TR>
                    <TR>
                      <TD background=front_files/line.gif bgColor=#eaeaea 
                      height=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=8 width="100%" border=0>
              <TBODY>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                   <!--
                <tr>
                  <td height="27" colspan="2" class="zise">“人人为我 我为人人”，昵图理解您的需要，注册先送100下载分。<span class="green">抽空也来分享点好东东给大家吧！</span></td>
                </tr>-->
                    <TBODY>
                 
                    <TR>
                      <TD class="huiz tahoma" align=right width="18%">用户名：</TD>
                      <TD width="50%" colSpan=2 class="huiz tahoma"><INPUT id=username 
                         maxLength=20 name=uname> <SPAN 
                        class=reds>*</SPAN></TD></TR>
                        
                        <TR>
                      <TD class="huiz tahoma" align=right width="18%"><label wd3_selection_help="selection">密码</label>
                        ：</TD>
                      <TD width="50%" colSpan=2 class="huiz tahoma"><INPUT id=username 
                         maxLength=20 name=upass> <SPAN 
                        class=reds>*</SPAN></TD></TR>
                        
                        <TR>
                      <TD class="huiz tahoma" align=right width="18%">性别                        ：</TD>
                      <TD width="50%" colSpan=2 class="huiz tahoma">
                      
                      
                      
                       <input name="sex" type="radio"  id="radio" value="男" checked />
男
                       <input type="radio" name="sex" id="radio2" value="女" /> 
女
                      
                      
                      
                      </TD>
                        </TR>
                        
                        <TR>
                      <TD class="huiz tahoma" align=right width="18%">年龄                        ：</TD>
                      <TD width="50%" colSpan=2 class="huiz tahoma"><INPUT id=username 
                         maxLength=20 name=age></TD>
                        </TR>
                        
                        <TR>
                      <TD class="huiz tahoma" align=right width="18%">职业                        ：</TD>
                      <TD width="50%" colSpan=2 class="huiz tahoma"><INPUT name=uposition  size="45"></TD>
                        </TR>
                        
                        <TR>
                      <TD class="huiz tahoma" align=right width="18%">地址                        ：</TD>
                      <TD width="50%" colSpan=2 class="huiz tahoma"><INPUT name=addrs  size="45"></TD>
                        </TR>
                        
                        <TR>
                      <TD class="huiz tahoma" align=right width="18%">email                        ：</TD>
                      <TD width="50%" colSpan=2 class="huiz tahoma"><INPUT name=email  
                         size="45"></TD>
                        </TR>
                    <TR>
                      <TD height=35></TD>
                      <TD colSpan=2><INPUT type=submit value=注册 name=submit />
                        &nbsp;&nbsp;<INPUT type=reset value=重写 name=submit2 /></TD></TR>
                    </TABLE></TD></TR></TABLE></TD>
          <TD background=front_files/kuang_2_3.gif></TD></TR>
        <TR>
          <TD width=7 height=7><IMG height=7 src="front_files/kuang_1_3.gif" 
            width=7></TD>
          <TD background=front_files/kuang_2_4.gif></TD>
          <TD width=7 height=7><IMG height=7 src="front_files/kuang_1_4.gif" 
            width=7></TD></TR></TABLE></TD>
    </TR></TBODY></TABLE>

</CENTER></FORM>

 <jsp:include page="foot.jsp"></jsp:include>
</BODY></HTML>

<script language="javascript">
<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
%>
alert("用户名已存在");
<%}%>
</script>

