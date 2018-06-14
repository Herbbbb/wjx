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

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight; return;}}} 
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

 String hql = "select a.*,b.*,b.id as mbid,a.id as wjid,c.tname,d.uname from wenj a,wjmb b,wjtype c,sysuser d where a.fquser=d.id and b.mbtype=c.id and a.mbid=b.id ";
        String url = "/wenjx/admin/wjgl.jsp?1=1";
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
	    
	    %>
<%
        CommDAO dao = new CommDAO();
      String did = request.getParameter("did");
      if(did!=null)
      {
      dao.commOper("update  wenj set state='1' where id="+did);
      }
    
         
        PageManager pageManager = PageManager.getPage(url,6, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    
	    %>
  

<form id="form1" name="form1" method="post" action="/wenjx/admin/wjgl.jsp?f=f">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF">请输入相关信息</td>
                            <td height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                                &nbsp;<input name="key" type="text" value="<%=key %>" id="textfield" size="40" />&nbsp;
                                <input type="submit" name="button" id="button" value="查询" />&nbsp;
                                
                                <script language="javascript">
                                function add()
                                {
                                window.location.replace("addwjmb.jsp");
                                }
                                </script>
                              </label>                                                    </td>
                          </tr>
</table>

<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">问卷名称</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">发布人</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">发布时间</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">
                            <label>问卷分类</label></td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">问卷说明</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">答卷数</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">状态</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">查看结果</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">回收问卷</td>
    </tr>
                         
                         
                         <%
                             for(HashMap m :nlist)
	                        {
	                         String sql = "select count(distinct(savetime)) sum from answers where wjid='"+m.get("wjid")+"'";
               String sum = dao.select(sql).get(0).get("sum").toString();
                          %>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=Info.subStr(m.get("mbname").toString(),10) %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("uname") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("savetime") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("tname") %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=Info.subStr(m.get("content").toString(),10)  %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=sum %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><%=m.get("state").equals("0")?"调查中":"已回收" %></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><a href="/wenjx/answers.jsp?wjid=<%=m.get("wjid") %>&id=<%=m.get("mbid") %>" target="_blank">查看结果</a></td>
                            <td height="26" align="center" bgcolor="#FFFFFF"><a href="/wenjx/admin/wjgl.jsp?did=<%=m.get("wjid")%>">回收问卷</a></td>
                          </tr>
                          <%} %>
                          <tr>
                            <td height="26" colspan="9" align="center" bgcolor="#FFFFFF">${page.info }</td>
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