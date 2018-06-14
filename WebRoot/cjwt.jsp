<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>

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
                    
                    <%
 
  CommDAO dao = new CommDAO();
  HashMap m = dao.select("select * from zinfo where id=2").get(0);
   
 %>
                    
                      <TD><%=m.get("content") %></TD>
                    </TR>
                    <TR>
                      <TD background=front_files/line.gif bgColor=#eaeaea 
                      height=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
            </TD>
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

