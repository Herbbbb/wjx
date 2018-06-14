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

</HEAD>
<BODY background="front_files/20100526052232863.bmp">
  <jsp:include page="top.jsp?d=7"></jsp:include>
  <form name=f1 style="display: inline;" method="post" action="wenjmb.jsp?d=3&f=f" >
  <%

 String hql = "select a.*,b.tname from wjmb a,wjtype b where a.mbtype=b.id and a.publictype='公开' ";
        String url = "/wenjx/wenjx/wenjmb.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String f = request.getParameter("f");
         if(f==null)
         {
         key = Info.getUTFStr(key);
         }
         
         if(!key.equals(""))
         {
         hql+=" and (a.mbname like'%"+key+"%' )";
         url+="&key="+key;
         }
         hql+=" order by a.id desc";
 %>
   <%
        CommDAO dao = new CommDAO();
      String did = request.getParameter("did");
      if(did!=null)
      {
      dao.commOper("delete from sysuser where id="+did);
      }
    
         
        PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    
	    %>
  
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
                <TD height="25" align=left>请输入相关信息： 
                  <INPUT size=50 name=kw>
                  <INPUT type=submit value=" 搜  索 "></TD>
                </TR>
              
               <TR><TD background=front_files/line.gif bgColor=#eaeaea height=1></TD></TR>
              
              <%
               for(HashMap m:nlist)
               {
               %>
               <TR>
                <TD height="31" align=left><a href="mbxiang.jsp?id=<%=m.get("id") %>"><font color="#F7707C" size="3"><%=m.get("mbname") %></font></a>&nbsp;&nbsp;(类别&nbsp;:&nbsp;<%=m.get("tname") %>)</TD>
                </TR>
                
                <TR>
                <TD height="25" align=left><%=m.get("content") %></TD>
                </TR>
                
                <TR><TD background=front_files/line.gif bgColor=#eaeaea height=1></TD></TR>
                <%} %>      
                      
                      
                      
                      
                      
                      <TR>
                <TD height="30" align=center>${page.info }</TD>
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
