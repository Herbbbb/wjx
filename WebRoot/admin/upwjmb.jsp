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
CommDAO dao = new CommDAO();
String id = request.getParameter("id");
List<HashMap> typelist = dao.select("select * from wjtype");
HashMap wjmb = dao.select("select * from wjmb where id="+id).get(0);
 %>


<form id="form1" name="form1" method="post" action="/wenjx/wenjx?ac=upwjmb&id=<%=id %>">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td width="15%" height="26" align="center" bgcolor="#FFFFFF">模板名称</td>
                            <td width="35%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                                &nbsp;<input name="mbname" value="<%=wjmb.get("mbname") %>" type="text"  id="textfield" size="45" />&nbsp;&nbsp;
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
                               <option value="<%=map.get("id") %>"  <% if(wjmb.get("mbtype").equals(map.get("id")))out.print("selected=selected"); %> ><%=map.get("tname") %></option>
                               <%
                               }
                                %>
                              </select>
                              
                            </label></td>
                          </tr>
                          
                          
                          <tr>
                            <td width="15%" height="26" align="center" bgcolor="#FFFFFF">问卷说明</td>
                            <td height="26" colspan="3" align="left" bgcolor="#FFFFFF"><label>
                              
                              &nbsp;<textarea name="content" cols="70" id="textfield2"><%=wjmb.get("content") %></textarea>
                            </label></td>
    </tr>
</table>

<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">题目</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">
                              <label>选项(格式:A-很好-B-不咋地-C-还行...)</label></td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">单选多选</td>
    </tr>
                         
                         
                        <%
                        List<HashMap> tslist = dao.select("select * from wjmbts where wjid='"+id+"' order by id");
                        for(int i=0;i<5;i++)
                        {
                        HashMap map = new HashMap();
                        String title = "";
                        String xuanxiang = "";
                        String danduo = "单";
                       if(tslist.size()>i)
                       { 
                        map = tslist.get(i);
                         title = (String)(map.get("title").toString()==null?"":map.get("title"));
                         xuanxiang = (String)(map.get("xuanxiang").toString()==null?"":map.get("xuanxiang"));
                         danduo = (String)(map.get("danduo").toString()==null?"":map.get("danduo"));
                        }
                        
                         %>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><textarea name="title<%=i %>" cols="35" id="textfield3"><%=title %></textarea></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><textarea name="xuanxiang<%=i %>" cols="25" id="textfield4"><%=xuanxiang %></textarea></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><label>
                              <input name="danduo<%=i %>" type="radio" id="radio" value="单" <% if(danduo.equals("单"))out.print("checked=checked"); %>/>
                              单
                            <input type="radio" name="danduo<%=i %>" id="radio2" value="多" <% if(danduo.equals("多"))out.print("checked=checked"); %> />
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
</body>
</html>
<%dao.close();%>