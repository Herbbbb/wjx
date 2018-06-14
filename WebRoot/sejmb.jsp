<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0028)http://www.nipic.com/design/ -->
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="front_files/style.css" type=text/css rel=stylesheet>
<%
HashMap user = (HashMap)session.getAttribute("user");
if(user==null)
{%>
<script type="text/javascript">
alert("请先登录");
window.location.replace("/wenjx/index.jsp");
</script>

<%
}
 %>

</HEAD>
<BODY background="front_files/20100526052232863.bmp">
  <jsp:include page="top.jsp"></jsp:include>
  
  
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
            class=zise>设计模板</FONT></B></TD>
          <TD class=tahoma style="PADDING-RIGHT: 8px" align=right 
          bgColor=#f4f7f7>&nbsp;</TD>
        </TR>
        <TR>
          <TD background=front_files/line.gif colSpan=2 height=1></TD></TR>
        <TR>
          <TD 
          style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px" 
          align=middle colSpan=2>
            
            
            
            
            
            
<%
CommDAO dao = new CommDAO();
List<HashMap> typelist = dao.select("select * from wjtype");
 %>


<form id="form1" name="form1" method="post" action="/wenjx/wenjx?ac=maddwjmb">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td width="15%" height="26" align="center" bgcolor="#FFFFFF">模板名称</td>
                            <td width="35%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                                &nbsp;<input name="mbname" type="text"  id="textfield" size="45" />&nbsp;&nbsp;
                                <script language="javascript">
                                function add()
                                {
                                window.location.replace("wjmb.jsp");
                                }
                                </script>
                              </label></td>
                            <td width="15%" align="center" bgcolor="#FFFFFF">模板分类</td>
                            <td width="35%" align="left" bgcolor="#FFFFFF"><label>
                              &nbsp;
                              <select name="mbtype" id="select">
                              <%
                              for(HashMap map:typelist)
                              {
                               %>
                               <option value="<%=map.get("id") %>"><%=map.get("tname") %></option>
                               <%
                               }
                                %>
                              </select>
                              
                            </label></td>
                          </tr>
                          
                          
                          <tr>
                            <td width="15%" height="26" align="center" bgcolor="#FFFFFF">问卷说明</td>
                            <td height="26" colspan="2" align="left" bgcolor="#FFFFFF"><label>
                              
                              &nbsp;<textarea name="content" cols="70" id="textfield2"></textarea>
                            </label></td>
                            <td height="26" align="left" bgcolor="#FFFFFF"><label>
                              <input name="publictype" type="radio" id="radio3" value="自用" checked>
                            自用
                            <input type="radio" name="publictype" id="radio4" value="公开">
公开</label></td>
                      </tr>
</table>

<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">题目</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">
                              <label>选项(格式:很好-不咋地-还行...)</label></td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">单选多选</td>
    </tr>
                         
                         
                        <%
                        for(int i=0;i<10;i++)
                        {
                         %>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><textarea name="title<%=i %>" cols="35" id="textfield3"></textarea></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><textarea name="xuanxiang<%=i %>" cols="25" id="textfield4"></textarea></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><label>
                              <input name="danduo<%=i %>" type="radio" id="radio" value="单" checked="checked" />
                              单
                            <input type="radio" name="danduo<%=i %>" id="radio2" value="多" />
                            多</label></td>
    </tr>
                         <%} %> 
                          
                          <tr>
                            <td height="44" colspan="3" align="center" bgcolor="#FFFFFF">
                            <input type="submit"    name="button2" id="button2" value="提交信息" />&nbsp;&nbsp;&nbsp;
                            <input type="button"   onclick="add();" name="button" id="button" value="返回上页" />
                              <script language="javascript">
                                function add()
                                {
                                window.location.replace("wjmb.jsp");
                                }
                                </script></td>
                            <script language="javascript" src="/wenjx/js/popup.js"></script>
                            <script language="javascript">
                            function update(no)
                            {
                            pop("upwjmb.jsp?id="+no,"修改分类信息",400,156);
                            }
                            </script>
                          </tr>
</table>      
</form>  
            
            
            
            
            
            
            
            
            </TD></TR>
        <TR>
        </TBODY></TABLE></TD>
    
    </TR></TBODY></TABLE>
     </CENTER>
     
     
     
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
