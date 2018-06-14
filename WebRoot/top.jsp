<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
HashMap user = (HashMap)session.getAttribute("user");
 %>
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="front_files/style.css" type=text/css rel=stylesheet>
<SCRIPT src="front_files/m.js" type=text/javascript></SCRIPT>

<META content="MSHTML 6.00.6000.21283" name=GENERATOR>
<style type="text/css">
<!--
.STYLE3 {font-size: x-large}
-->
</style>
</HEAD>
<BODY background="front_files/20100526052232863.bmp">
<CENTER>
  <FORM name=soform action="index.jsp?f=f" method=post style="display:inline">
<TABLE height=60 cellSpacing=0 cellPadding=0 width=900 border=0>

  <TBODY>
  <TR vAlign=top>
    <TD width=181 align="center" style="cursor: hand" onClick="window.location.replace('/wenjx/index.jsp')" valign="middle"><span class="STYLE3" style="color:#E6007C">huch问卷</span></TD>
    <TD width="719">
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR align=right>
          <TD height="36">
          
          <%
          if(user==null)
          {
           %>
          |&nbsp;<span class=hui >&nbsp;欢迎光临本站 : &nbsp;</span>
          <IMG height=6 src="front_files/hot.gif" width=8 align=textTop>
          &nbsp;|&nbsp;&nbsp;<A class=hui href="/wenjx/login.jsp">用户登录</A>&nbsp; 
           &nbsp;|&nbsp;&nbsp;<A class=hui href="/wenjx/admin/login.jsp">管理员登录</A>&nbsp;
          |&nbsp;<A class=hui href="/wenjx/reg.jsp">&nbsp;注册</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%}else{ %>
           |&nbsp;<span class=hui >&nbsp;欢迎光临本站&nbsp;<%=user.get("uname") %></span>
          <IMG height=6 src="front_files/hot.gif" width=8 align=textTop>
          &nbsp;|&nbsp;&nbsp;<A class=hui href="/wenjx/upreg.jsp">修改个人信息</A>&nbsp; 
          |&nbsp;<A class=hui href="/wenjx/index.jsp?zx=zx">&nbsp;注销</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%} %>
          
          </TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
         <%
    String d = request.getParameter("d")==null?"1":request.getParameter("d");
    String back1 = "front_files/hg_2.gif";if(d.equals("1"))back1 = "front_files/hg_1.gif";
    String back2 = "front_files/hg_2.gif";if(d.equals("2"))back2 = "front_files/hg_1.gif";
    String back3 = "front_files/hg_2.gif";if(d.equals("3"))back3 = "front_files/hg_1.gif";
    String back4 = "front_files/hg_2.gif";if(d.equals("4"))back4 = "front_files/hg_1.gif";
    String back5 = "front_files/hg_2.gif";if(d.equals("5"))back5 = "front_files/hg_1.gif";
    String back6 = "front_files/hg_2.gif";if(d.equals("6"))back6 = "front_files/hg_1.gif";
    String back7 = "front_files/hg_2.gif";if(d.equals("7"))back7 = "front_files/hg_1.gif";
    String back8 = "front_files/hg_2.gif";if(d.equals("8"))back8 = "front_files/hg_1.gif";
    String back9 = "front_files/hg_2.gif";if(d.equals("9"))back9 = "front_files/hg_1.gif";
    String back10 = "front_files/hg_2.gif";if(d.equals("10"))back10 = "front_files/hg_1.gif";
     %>
<TABLE height=25 cellSpacing=0 cellPadding=0 width=900 border=0>
  <TBODY>
  <TR class=tahoma align=middle>
  
    <TD>&nbsp;</TD>
    
   
    
    <TD width=75 background=<%=back1 %>><A 
      href="index.jsp?d=1">公开问卷</A></TD>
    <TD width=3></TD>
    <TD width=75 background=<%=back2 %>><A 
      href="remen.jsp?d=2">热门测评</A></TD>
    <TD width=3></TD>
    <%-- <TD width=75 background=<%=back3 %>><A  
      href="wenjmb.jsp?d=3">问卷模板</A></TD> --%>
    <TD width=3></TD>
    <TD width=75 background=<%=back4 %>><A 
      href="sejmb.jsp?d=4">设计模板</A></TD>
    <TD width=3></TD>
    <TD width=75 background=<%=back5 %>><A 
      href="tongjfx.jsp?d=5">统计分析</A></TD>
    <TD width=3></TD>
    <TD width=75 background=<%=back6 %>><A 
      href="wodmb.jsp?d=6">我的模板</A></TD>
    <TD width=3></TD>
    <TD width=75 background=<%=back7 %>><A 
      href="downmb.jsp?d=7">查看&下载</A></TD>
    <TD width=3></TD>
    <TD width=75 background=<%=back8 %>><A 
      href="cjwt.jsp?d=8">常见问题</A></TD>
    <TD width=3></TD>
    
    <TD width=75 background=<%=back10 %>><A 
      href="lxwm.jsp?d=10">联系我们</A></TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE>
    
<TABLE cellSpacing=0 cellPadding=0 width=900 border=0>

  <TBODY>
  <TR class="tahoma white" bgColor=#5e8cdf>
    <TD width=1><IMG height=32 src="front_files/hg_3.gif" width=1></TD>
    <!-- <TD class=white align=right width=95><IMG height=18 
      src="front_files/search.gif" width=22 align=absMiddle>问卷搜索：</TD>
   
    <TD width=280><INPUT size=80 name=key></TD>
    <TD width="83"><INPUT type=submit value=" 搜  索 "></TD>
    
    <TD width="350" align=middle>关键词可以不输</TD> -->
    <TD width=1><IMG height=32 src="front_files/hg_3.gif" width=1></TD></TR>
  <tr><td valign="top"></td>
  </tr><TR>
    <TD colSpan=3 height=3></TD></TR></TBODY></TABLE>
  </FORM>
</CENTER></BODY></HTML>

