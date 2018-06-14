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
HashMap admin = (HashMap)session.getAttribute("admin");
 %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="74" colspan="2" background="/wenjx/admin/images/index1_03.gif">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="2%" rowspan="2">&nbsp;</td>
          <td width="31%" rowspan="2"><span class="STYLE1">问卷系统后台管理</span></td>
          <td width="6%" rowspan="2">&nbsp;</td>
          <td width="61%" height="38" align="right">&nbsp;</td>
        </tr>
        <tr>
          <td align="right">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" class="font2">&nbsp;|&nbsp;登陆用户：<%=admin.get("uname") %>&nbsp;|&nbsp;身份：管理员&nbsp;|&nbsp;<a href="/wenjx/admin/login.jsp" class="font2"><strong>退出</strong></a>&nbsp;</td>
              </tr>
            </table>          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td width="10%" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_23.gif" width="8" height="29" /></td>
                <td width="99%" background="/wenjx/admin/images/index1_24.gif"></td>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_26.gif" width="8" height="29" /></td>
              </tr>
              <tr>
                <td background="/wenjx/admin/images/index1_45.gif"></td>
                <td bgcolor="#FFFFFF" style="padding:0 2px 0 2px; vertical-align:top;height:500px;">
                  <table width="200" border="0" cellpadding="0" cellspacing="5">
                    
                    <tr  onClick="show('3')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/wenjx/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">问卷管理</td>
                    </tr>
                    <tr id="3@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                 
                 <tr onClick="change('问卷管理 > 问卷信息管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/wenjx/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="wjgl.jsp" target="main">问卷信息管理</a></td>
                          </tr>
                 
                        <tr onClick="change('问卷管理 > 问卷模板管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/wenjx/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="wjmb.jsp" target="main">问卷模板管理</a></td>
                          </tr>
                 
                           <tr onClick="change('问卷管理 > 问卷分类管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/wenjx/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="wjtype.jsp" target="main">问卷分类管理</a></td>
                          </tr>
                          
                          
                        </table>
                      </td>
                    </tr>
                    
                    
                    <tr  onClick="show('2')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/wenjx/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">用户管理</td>
                    </tr>
                    <tr id="2@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                 
                           <tr onClick="change('用户管理 > 注册用户管理')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/wenjx/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="sysuser.jsp" target="main">注册用户管理</a></td>
                          </tr>
                          
                          
                        </table>
                      </td>
                    </tr>
                    
                    
                    
                    
                    <tr  onClick="show('1')" style="cursor: hand" >
                      <td width="12%" align="center"><img src="/wenjx/admin/images/index1_54.gif" width="15" height="11" /></td>
                      <td width="88%">系统管理</td>
                    </tr>
                    
                    
                   
                    
                    
                    
                    <tr id="1@1">
                      <td align="center"></td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0">
                        
                           <tr onClick="change('系统管理 > 联系我们')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/wenjx/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="lianxwm.jsp" target="main">联系我们</a></td>
                          </tr>
                     <tr onClick="change('系统管理 > 常见问题')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/wenjx/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="cjwt.jsp" target="main">常见问题</a></td>
                          </tr>
                           <tr onClick="change('系统管理 > 修改登录密码')" style="cursor: hand" >
                            <td width="18%" align="center"><img src="/wenjx/admin/images/index1_68.gif" width="11" height="14" /></td>
                            <td width="82%"><a href="uppass.jsp" target="main">修改登录密码</a></td>
                          </tr>
                        
                        </table>
                      </td>
                    </tr>
                   
                   
                   
                   
                  </table>
                </td>
                <td background="/wenjx/admin/images/index1_47.gif"></td>
              </tr>
              <tr>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_91.gif" width="8" height="8" /></td>
                <td background="/wenjx/admin/images/index1_92.gif"></td>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_93.gif" width="8" height="8" /></td>
              </tr>
            </table>
          </td>
          <td width="70%" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_23.gif" width="8" height="29" /></td>
                <td width="99%" background="/wenjx/admin/images/index1_24.gif"></td>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_26.gif" width="8" height="29" /></td>
              </tr>
              <tr height="200">
                <td height="500" background="/wenjx/admin/images/index1_45.gif"></td>
                <td width="99%" bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
                  <table width="100%" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C4E7FB">
                          <tr>
                            <td>
                              <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
                                <tr>
                                  <td height="20">&nbsp;
                                  
                                  &nbsp;&nbsp;&nbsp;您当前的位置：
                                  <div style="display: inline;" id="c">商品管理</div>
                                  
                                  
                                  </td>
                                </tr>
                              </table>                            </td>
                          </tr>
                        </table>                      </td>
                    </tr>
                    <tr>
                      <td>
                     
                      <iframe width="100%" scrolling="no" frameborder="0" height="340" src="uppass.jsp"  style=background:transparent allowtransparency name="main"></iframe>   
                        
                     </td>
                    </tr>
                </table>                </td>
                <td background="/wenjx/admin/images/index1_47.gif"></td>
              </tr>
              <tr>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_91.gif" width="8" height="8" /></td>
                <td background="/wenjx/admin/images/index1_92.gif"></td>
                <td width="8" height="8"><img src="/wenjx/admin/images/index1_93.gif" width="8" height="8" /></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
