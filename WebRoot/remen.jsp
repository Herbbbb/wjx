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

<style type="text/css">
<!--
.STYLE2 {color: #006600}
-->
</style>
</HEAD>
<BODY background="front_files/20100526052232863.bmp">
  <jsp:include page="top.jsp?d=2"></jsp:include>
  <form name=f1 style="display: inline;" method="post" action="remen.jsp?d=3&f=f" >
  <%

 String hql = "select a.*,b.*,b.id as mbid,a.id as wjid,c.tname,d.uname from wenj a,wjmb b,wjtype c,sysuser d where c.hotmen='热门' and a.state='0' and a.fquser=d.id and b.mbtype=c.id and a.mbid=b.id ";
        String url = "/wenjx/wenjx/index.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String f = request.getParameter("f");
         if(f==null)
         {
         key = Info.getUTFStr(key);
         }
         
         if(!key.equals(""))
         {
         hql+=" and (b.mbname like'%"+key+"%' )";
         url+="&key="+key;
         }
         hql+=" order by a.id desc";
         
         System.out.println(hql);
 %>
   <%
        CommDAO dao = new CommDAO();
      String did = request.getParameter("did");
      if(did!=null)
      {
      dao.commOper("delete from sysuser where id="+did);
      }
    
         
        PageManager pageManager = PageManager.getPage(url,6, request);
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
          <TD background=front_files/line.gif colSpan=2 height=1></TD></TR>
        <TR>
          <TD 
          style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px" 
          align=middle colSpan=2>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              
             
              
              <%
               for(HashMap m:nlist)
               {
               String sql = "select count(distinct(savetime)) sum from answers where wjid='"+m.get("wjid")+"'";
               String sum = dao.select(sql).get(0).get("sum").toString();
               %>
               <TR>
                <TD height="31" align=left><a href="wjxiang.jsp?mbid=<%=m.get("mbid") %>&wjid=<%=m.get("wjid") %>"><font color="#F7707C" size="3"><%=m.get("mbname") %></font></a>&nbsp;&nbsp;(类别&nbsp;:&nbsp;<%=m.get("tname") %>)</TD>
                </TR>
                
                <TR>
                <TD height="25" align=left><%=m.get("content") %></TD>
                </TR>
                
                <TR>
                <TD height="25" align=left>发布人 : <%=m.get("uname") %>&nbsp;&nbsp;&nbsp;
                发布时间 : <%=m.get("savetime") %>&nbsp;&nbsp;&nbsp;
                答卷数 : <%=sum %>&nbsp;&nbsp;&nbsp;
                <span class="STYLE2"><a href="answers.jsp?wjid=<%=m.get("wjid") %>&id=<%=m.get("mbid") %>"><font color="#006600">查看答卷</font></a></span>                </TD>
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
String asuc = (String)request.getAttribute("asuc");
if(suc!=null)
{
%>
alert("提交成功");
<%}%>
<%
String lerror = (String)request.getAttribute("lerror");
if(lerror!=null)
{
%>
alert("用户名或密码错误");
<%}%>
</script>
