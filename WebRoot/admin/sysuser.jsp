<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%@page import="util.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>
<!-- 调用CSS，JS -->
<link href="/wenjx/admin/images/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: ;
}
.STYLE1 {
	color: #333333;
	font-size: x-large;
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>
<script language="javascript">
function window.onload() { 

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+320; return;}}} 
} 
</script>
<script language=javascript>
function show(no)
{
for(var i=1;i<20;i++)
{
var a = document.getElementById(no+"@"+i);
if(a==null)
{
continue;
}
if(a.style.display=="")
{
a.style.display="none";
}else{
a.style.display="";
}
}

}
</script>
<script type="text/javascript">
function showzhi(inn)
{
var a = document.getElementById("loca");
a.innerHTML=inn;
}
function change(no)
{
var c = document.getElementById("c");
c.innerHTML=no;
}
</script>

</head>
<body>


   <%

 String hql = "select * from sysuser where bei='1' ";
        String url = "/wenjx/wenjx/sysuser.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String f = request.getParameter("f");
         if(f==null)
         {
         key = Info.getUTFStr(key);
         }
         
         if(!key.equals(""))
         {
         hql+=" and (uname like'%"+key+"%' or sex like'%"+key+"%' or age like'%"+key+"%' )";
         url+="&key="+key;
         }
         hql+=" order by id desc";
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


<form id="form1" name="form1" method="post" action="sysuser.jsp?f=f">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF">请输入相关信息</td>
                            <td height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                                &nbsp;<input name="key" type="text" value="<%=key %>" id="textfield" size="40" />&nbsp;
                                <input type="submit" name="button" id="button" value="查询" />
                              </label>                                                    </td>
                          </tr>
</table>

<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">用户名</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">
                              <label>密码</label></td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">性别</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">年龄</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">职业</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">地址</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">email</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">状态</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">修改</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">删除</td>
    </tr>
                         
                         
                         <%
                             for(HashMap m :nlist)
	                        {
                          %>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("uname") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("upass") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("sex") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("age") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("uposition") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("addrs") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("email") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("state") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><span style="cursor: hand" onclick="update('<%=m.get("id") %>');">修改</span></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><a href="sysuser.jsp?did=<%=m.get("id")%>">删除</a></td>
                          </tr>
                          <%} %>
                          <tr>
                            <td height="26" colspan="10" align="center" bgcolor="#FFFFFF">${page.info }</td>
                            <script language="javascript" src="/wenjx/js/popup.js"></script>
                            <script language="javascript">
                            function update(no)
                            {
                            pop("upsysuser.jsp?id="+no,"修改用户信息",360,250);
                            }
                            </script>
                            
                          </tr>
</table>      
</form>                 
</body>
</html>
<%dao.close();%>