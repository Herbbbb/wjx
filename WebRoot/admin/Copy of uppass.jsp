<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	background-color: #2286C2;
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

                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">&nbsp;</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">
                              <label>
                              <input type="checkbox" name="checkbox4" value="checkbox" />
                              </label>                            </td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">信息标题</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">接收公司名称</td>
                            <td height="27" align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">接收用户</td>
                            <td align="center" background="/wenjx/admin/images/index1_72.gif" bgcolor="#FFFFFF">发送时间</td>
                          </tr>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><img src="/wenjx/admin/images/index1_75.gif" width="16" height="15" /></td>
                            <td height="26" align="center" bgcolor="#FFFFFF">
                              <label>
                              <input type="checkbox" name="checkbox" value="checkbox" />
                              </label>                            </td>
                            <td height="26" align="center" bgcolor="#FFFFFF">委托人</td>
                            <td height="26" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                            <td height="26" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                            <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="26" align="center" bgcolor="#FFFFFF"><img src="/wenjx/admin/images/index1_75.gif" width="16" height="15" /></td>
                            <td height="26" align="center" bgcolor="#FFFFFF">
                              <label>
                              <input type="checkbox" name="checkbox3" value="checkbox" />
                              </label>                            </td>
                            <td height="26" align="center" bgcolor="#FFFFFF">沃尔</td>
                            <td height="26" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                            <td height="26" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                            <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
                          </tr>
</table>                    
</body>
</html>
