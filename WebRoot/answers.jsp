<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0028)http://www.nipic.com/design/ -->
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="front_files/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" href="../Contents/Style.css" type="text/css" />
<link rel="stylesheet" href="/wenjx/FusionChartsFree/Contents/Style.css" type="text/css" />
<script language="JavaScript" src="/wenjx/FusionChartsFree/JSClass/FusionCharts.js"></script>
<%
String zx = request.getParameter("zx");
if(zx!=null)
{
session.removeAttribute("user");
}
 %>
<%
CommDAO dao = new CommDAO();
String id = request.getParameter("id");
HashMap m = dao.select("select a.*,b.tname from wjmb a,wjtype b where a.mbtype=b.id and a.id="+id).get(0);

 %>
</HEAD>
<BODY background="front_files/20100526052232863.bmp">
  <jsp:include page="top.jsp?d=1"></jsp:include>
  <form name=f1 style="display: inline;" method="post" action="answers.jsp?f=f" >
  <%
  String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
  String age = request.getParameter("age")==null?"":request.getParameter("age");
  String addrs = request.getParameter("addrs")==null?"":request.getParameter("addrs");
  String uposition = request.getParameter("uposition")==null?"":request.getParameter("uposition");
  String wjid = request.getParameter("wjid");
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
              
              
              <TR>
                <TD height="30" align=center>性别：
                  <input name="sex" type="radio" id="radio" value="男"  >
男
<input type="radio" name="sex" id="radio2" value="女" >
女
                      &nbsp;&nbsp;年龄：
                      <input name="age" type="text" id="textfield" size="10">
&nbsp;&nbsp;居住地：
<input name="addrs" type="text" id="textfield2"  size="30">
&nbsp;&nbsp;职业：
<input name="uposition" type="text" id="textfield3"  size="30">
<label>
&nbsp;&nbsp;&nbsp;<input type="submit" name="button" id="button" value="过滤答卷">
</label></TD>
                </TR>
              
               <TR><TD height=1 background=front_files/line.gif bgColor=#eaeaea></TD></TR>
               
               <TR>
                <TD height="84" align=center><font color="#F7707C" size="3"><%=m.get("mbname") %></font><br />
                <br/>
                类别 : <%=m.get("tname") %>                </TD>
                </TR>
              
               <TR><TD height=1 background=front_files/line.gif bgColor=#eaeaea></TD></TR>
              
           
               <TR>
                <TD height="31" align=left><%=m.get("content") %></TD>
                </TR>
                
                 <TR><TD height=1 background=front_files/line.gif bgColor=#eaeaea></TD></TR>
                 
                 <%
                   List<HashMap> tslist = dao.select("select * from wjmbts where wjid='"+m.get("id")+"' order by id");
                int i=0;
                   for(HashMap h:tslist)
                   {
                  i++;
                  %>
                <TR>
                <TD height="25" align=left>题目 : <%=h.get("title") %> 单选多选 : <%=h.get("danduo") %></TD>
                </TR>
                <TR>
                <TD height="12" align=left>
                
                
                选项 : 
                
                <%
                String xmlcode="<graph    baseFontSize='12'  yAxisName='' decimalPrecision='1' formatNumberScale='1'>";
                String[] colors = {"AFD8F8","F6BD0F","8BBA00","FF8E46","008E8E","D64646","8E468E","588526","B3AA00","008ED6","9D080D","A186BE"};
                String[] xs = h.get("xuanxiang").toString().split("-");
                for(int j=0;j<xs.length;j++)
                {
                String csql = "select count(*) sum from answers where sex like'%"+sex+"%' and  uposition like'%"+uposition+"%' and  addrs like'%"+addrs+"%' and  age like'%"+age+"%' and wjid='"+wjid+"' and tsid='"+h.get("id")+"' and tanswer like'%"+xs[j]+"%'";
                String sum = dao.select(csql).get(0).get("sum").toString();
                
                  xmlcode+="<set name='"+xs[j]+"' value='"+sum+"' color='"+colors[j]+"' /> ";
                
                String type="radio";
                if(h.get("danduo").equals("多"))type="checkbox";
                 %>
                 <input type=<%=type %> name="ti<%=h.get("id") %>" value="<%=xs[j] %>" />
                 <%=xs[j] %>&nbsp;&nbsp;(选择数 : <%=sum %>)
                 
                
                 
                 
                 <%} 
                 xmlcode+="</graph>";
                 %>                </TD>
                </TR>
                <TR>
                  <TD height="13" align=center>
                  
                  
                  
                  <div id="chartdiv<%=i %>" align="center" name="chartdiv<%=i %>">         </div>
           <script type="text/javascript">
		   var chart = new FusionCharts("/wenjx/FusionChartsFree/Charts/FCF_Column3D.swf", "ChartId", "400", "240");
		     chart.setDataXML("<%=xmlcode%>");
		  // chart.setDataURL("/qjbzw/FusionChartsFree/Gallery/Data/Pie3D.xml");		   
		   chart.render("chartdiv<%=i%>");
		</script> 
                
                  
                  
                  </TD>
                </TR>
                
                <TR><TD height=1 background=front_files/line.gif bgColor=#eaeaea></TD></TR>
          <%} %>
                      
                      
                      <TR><TD  height=30 align="center"><label>
                      <%
                      HashMap user = (HashMap)session.getAttribute("user");
                      if(user!=null)
                      {
                       %>
                        &nbsp;&nbsp;&nbsp;
                        
                      <%} %>
                      </label></TD>
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

