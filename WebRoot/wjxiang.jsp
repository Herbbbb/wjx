<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0028)http://www.nipic.com/design/ -->
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="front_files/style.css" type=text/css rel=stylesheet>
<%
String zx = request.getParameter("zx");
if(zx!=null)
{
session.removeAttribute("user");
}
 %>
<%
CommDAO dao = new CommDAO();
String mbid = request.getParameter("mbid");
String wjid = request.getParameter("wjid");
String hql = "select a.*,b.*,b.id as mbid,a.id as wjid,c.tname,d.uname from wenj a,wjmb b,wjtype c,sysuser d"+ 
" where b.id="+mbid+" and a.id="+wjid+" and a.fquser=d.id and b.mbtype=c.id and a.mbid=b.id ";
HashMap m = dao.select(hql).get(0);
 %>
<style type="text/css">
<!--
.STYLE1 {color: #CC0000}
-->
</style>
</HEAD>
<BODY background="front_files/20100526052232863.bmp">
  <jsp:include page="top.jsp?d=1"></jsp:include>
  <form name=f1 style="display: inline;" method="post" action="wenjmb.jsp?d=3&f=f" >
  
  
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=900 border=0>
  <TBODY>
  <TR>
    <TD 
    style="BORDER-RIGHT: #e5eaea 1px solid; BORDER-TOP: #e5eaea 1px solid; BORDER-LEFT: #e5eaea 1px solid; BORDER-BOTTOM: #e5eaea 1px solid" 
    vAlign=top>
      <TABLE style="PADDING-LEFT: 8px" cellSpacing=0 cellPadding=0 width="100%" 
      border=0>
        <TBODY>
        <TR>
          <TD class=tahoma bgColor=#f4f7f7 height=25><IMG height=16 
            src="front_files/arrow_04.gif" width=16 align=absMiddle> <B><FONT 
            class=zise>问卷模板</FONT></B></TD>
          <TD class=tahoma style="PADDING-RIGHT: 8px" align=right 
          bgColor=#f4f7f7>&nbsp;</TD>
        </TR>
        <TR>
          <TD background=front_files/line.gif colSpan=2 height=1></TD></TR>
        <TR>
          <TD 
          style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px" 
          align=middle colSpan=2>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              
               <TR>
                <TD height="25" align=center><font color="#F7707C" size="3"><%=m.get("mbname") %></font><br />
                <br/>
                类别 : <%=m.get("tname") %>   &nbsp;&nbsp;
              发布人 : <%=m.get("uname") %>   &nbsp;&nbsp;
              发布时间 : <%=m.get("savetime") %>&nbsp;&nbsp;                             </TD>
                </TR>
              
               <TR><TD background=front_files/line.gif bgColor=#eaeaea height=1></TD></TR>
              
           
               <TR>
                <TD height="31" align=left><%=m.get("content") %></TD>
                </TR>
                
                 <TR><TD background=front_files/line.gif bgColor=#eaeaea height=1></TD></TR>
                 
                 <%
                   List<HashMap> tslist = dao.select("select * from wjmbts where wjid='"+m.get("id")+"' order by id");
                   int i=0;
                   for(HashMap h:tslist)
                   {
                   i++;
                  %>
                <TR>
                <TD height="25" align=left><span class="STYLE1">题目<%=i %> : <%=h.get("title") %></span></TD>
                </TR>
                <TR>
                <TD height="25" align=left>选项 : 
                
                <%
                String[] xs = h.get("xuanxiang").toString().split("-");
                for(int j=0;j<xs.length;j++)
                {
               
                String type="radio";
                if(h.get("danduo").equals("多"))type="checkbox";
                 %>
                 <input type=<%=type %> name="ti<%=h.get("id") %>" value="<%=xs[j] %>" />
                 <%=xs[j] %>
                 <%} %>                </TD>
                </TR>
                
                <TR>
                <TD height="5" align=left></TD>
                </TR>
                
                <TR><TD background=front_files/line.gif bgColor=#eaeaea height=1></TD></TR>
                
                 <TR>
                <TD height="5" align=left></TD>
                </TR>
          <%} %>
                      
                      
                      <TR><TD  height=15 align="center"><label>
                      
                      <%
                      HashMap user = (HashMap)(session.getAttribute("user")==null?new HashMap():session.getAttribute("user"));
                      if(user.get("sex")==null)user.put("sex","男");
                       if(user.get("age")==null)user.put("age","");
                        if(user.get("addrs")==null)user.put("addrs","");
                         if(user.get("uposition")==null)user.put("uposition","");
                    %>
                      
                      &nbsp;&nbsp;您的性别：
                            <input name="sex" type="radio" id="radio" value="男"  <% if(user.get("sex").equals("男"))out.print("checked=checked"); %> >
                      男
                      <input type="radio" name="sex" id="radio2" value="女" <% if(user.get("sex").equals("女"))out.print("checked=checked"); %> >
                      女
                      &nbsp;&nbsp;您的年龄：
                      <input name="age" type="text" id="textfield"   value="<%=user.get("age") %>" size="10">
                      &nbsp;&nbsp;您的居住地：
                      <input name="addrs" type="text" id="textfield2"  value="<%=user.get("addrs") %>"  size="30">
                      &nbsp;&nbsp;您的职业：
                      <input name="uposition" type="text" id="textfield3"  value="<%=user.get("uposition") %>"  size="30">
                      </label></TD>
                      </TR>
                      <TR>
                        <TD  height=15 align="center">&nbsp;</TD>
                      </TR>
                      <TR>
                        <TD  height=30 align="center">
                          <input type="button" name="button" id="button" onClick="f1.action='/wenjx/wenjx?ac=answer&mbid=<%=mbid %>&wjid=<%=wjid %>';f1.submit();" value="提交问卷"></TD>
                      </TR>
                </TBODY></TABLE></TD></TR>
        <TR>
        </TBODY></TABLE></TD>
    
    </TR></TBODY></TABLE>
     </CENTER>
     
     </form>
     
     <jsp:include page="foot.jsp"></jsp:include>
     
     
     </BODY></HTML>
<script language="javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
%>
alert("注册成功");
<%}%>
<%
String lerror = (String)request.getAttribute("lerror");
if(lerror!=null)
{
%>
alert("用户名或密码错误");
<%}%>
</script>
