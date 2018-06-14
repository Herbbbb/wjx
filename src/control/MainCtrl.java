package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


import util.Info;
import util.StrUtil;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	this.doPost(request, response);
	}

		public void go(String url,HttpServletRequest request, HttpServletResponse response)
		{
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
		
		public void gor(String url,HttpServletRequest request, HttpServletResponse response)
		{
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		HashMap user = (HashMap)session.getAttribute("admin");
		HashMap muser = (HashMap)session.getAttribute("user");
		String ac = request.getParameter("ac");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0,10);
		String tomonth = date.substring(0,7);
		
		//修改用户信息
		if(ac.equals("upsysuser"))
		{
			String id = request.getParameter("id");
			    String upass = request.getParameter("upass");
			    String sex = request.getParameter("sex");
			    String age = request.getParameter("age");
			    String uposition = request.getParameter("uposition");
			    String addrs = request.getParameter("addrs");
			    String email = request.getParameter("email");
			    String state = request.getParameter("state");
			    String sql = "update sysuser set upass='"+upass+"', sex='"+sex+"', age='"+age+"', uposition='"+uposition+"', addrs='"+addrs+"', email='"+email+"', state='"+state+"' where id= "+id;
				dao.commOper(sql);
			    request.setAttribute("suc", "");
				go("/admin/upsysuser.jsp?id="+id, request, response);
		}
		
		//注册
		if(ac.equals("reg"))
		{
			String uname = request.getParameter("uname");
			    List ulist = dao.select("select * from sysuser where uname='"+uname+"'");
			    if(ulist.size()>0)
			    {
			    	 request.setAttribute("error", "");
					 go("/reg.jsp", request, response);	
			    }else{
			    String upass = request.getParameter("upass");
			    String sex = request.getParameter("sex");
			    String age = request.getParameter("age");
			    String uposition = request.getParameter("uposition");
			    String addrs = request.getParameter("addrs");
			    String email = request.getParameter("email");
			    String state = "正常";
			    String sql = "insert into sysuser values('"+uname+"','"+upass+"','1','"+sex+"','"+age+"','"+uposition+"', '"+addrs+"','"+email+"','"+state+"')";
				dao.commOper(sql);
			    request.setAttribute("suc", "");
			    HashMap m = new HashMap();
			    m.put("uname",uname );
			    m.put("upass",upass );
			    m.put("sex", sex);
			    m.put("age", age);
			    m.put("uposition",uposition );
			    m.put("addrs",addrs );
			    m.put("email",email );
			    m.put("state",state );
			    m.put("bei", "1");
			    session.setAttribute("user", m);
				go("/index.jsp", request, response);
			    }
		}
		
		//修改注册
		if(ac.equals("upreg"))
		{
			System.out.println("sdfsdf");
			String id = request.getParameter("id");
			String uname = request.getParameter("uname");
			    String upass = request.getParameter("upass");
			    String sex = request.getParameter("sex");
			    String age = request.getParameter("age");
			    String uposition = request.getParameter("uposition");
			    String addrs = request.getParameter("addrs");
			    String email = request.getParameter("email");
			    String state = "正常";
			    String sql = "update sysuser set uname='"+uname+"',upass='"+upass+"',bei='1',sex='"+sex+"',age='"+age+"',uposition='"+uposition+"', addrs='"+addrs+"',email='"+email+"',state='"+state+"' where id="+id;
				dao.commOper(sql);
			    request.setAttribute("suc", "");
			    HashMap m = new HashMap();
			    m.put("uname",uname );
			    m.put("upass",upass );
			    m.put("sex", sex);
			    m.put("age", age);
			    m.put("uposition",uposition );
			    m.put("addrs",addrs );
			    m.put("email",email );
			    m.put("state",state );
			    m.put("bei", "1");
			    session.setAttribute("user", m);
				go("/index.jsp", request, response);
		}
		
		
		//检查用户名唯一性
		if(ac.equals("checkuname"))
		{
			    String id = request.getParameter("id");
			    String checkuname = request.getParameter("checkuname");
			    String sql = "select * from sysuser where uname='"+checkuname+"'";
				 List list = dao.select(sql);
				 if(list.size()>0)out.print("N");
				 if(list.size()==0)out.print("Y");
		}
		
		
		 //添加模板
		if(ac.equals("addwjmb"))
		{
			
			    String mbname = request.getParameter("mbname");
			    String mbtype = request.getParameter("mbtype");
			    String content = request.getParameter("content");
			    String sql = "insert into wjmb values('"+mbname+"','"+mbtype+"','"+content+"','"+user.get("id")+"','公开')";
			    dao.commOper(sql);
			    HashMap h = dao.select("select * from wjmb where mbname='"+mbname+"' and mbtype='"+mbtype+"' and content='"+content+"'").get(0);
			    for(int i=0;i<10;i++)
			    {
			    	String title = request.getParameter("title"+i);if(title==null)title="";
			    	String xuanxiang = request.getParameter("xuanxiang"+i);if(xuanxiang==null)xuanxiang="";
			    	if(title.equals("")||xuanxiang.equals(""))continue;
			    	String danduo = request.getParameter("danduo"+i);
			    	String isql = "insert into wjmbts values('"+h.get("id")+"','"+title+"','"+xuanxiang+"','"+danduo+"')";
			    	 dao.commOper(isql);
			    }
			    go("/admin/wjmb.jsp", request, response);
		}
		
		
		 //添加模板
		if(ac.equals("maddwjmb"))
		{
			System.out.println("sdfdsf");
			String mbname = request.getParameter("mbname");
			    String mbtype = request.getParameter("mbtype");
			    String content = request.getParameter("content");
			    String publictype = request.getParameter("publictype");
			    String sql = "insert into wjmb values('"+mbname+"','"+mbtype+"','"+content+"','"+muser.get("id")+"','"+publictype+"')";
			    dao.commOper(sql);
			    HashMap h = dao.select("select * from wjmb where mbname='"+mbname+"' and mbtype='"+mbtype+"' and content='"+content+"' and author='"+muser.get("id")+"'").get(0);
			    for(int i=0;i<10;i++)
			    {
			    	String title = request.getParameter("title"+i);if(title==null)title="";
			    	String xuanxiang = request.getParameter("xuanxiang"+i);if(xuanxiang==null)xuanxiang="";
			    	if(title.equals("")||xuanxiang.equals(""))continue;
			    	String danduo = request.getParameter("danduo"+i);
			    	String isql = "insert into wjmbts values('"+h.get("id")+"','"+title+"','"+xuanxiang+"','"+danduo+"')";
			    	 dao.commOper(isql);
			    }
			    go("/wodmb.jsp", request, response);
		}
		
		 //下载模板
		if(ac.equals("downmb"))
		{
			String id = request.getParameter("id");
			HashMap m = dao.select("select a.*,b.tname from wjmb a,wjtype b where a.mbtype=b.id and a.id="+id).get(0);
		    List<HashMap> tslist = dao.select("select * from wjmbts where wjid='"+m.get("id")+"' order by id");
			
		  //第一步：选择模板文件：
			Workbook wb;
			String fname = "";
			try {
				
				
				
				wb = Workbook.getWorkbook(new File(request.getRealPath("/upfile/")+"/temp.xls"));
			
	        //第二步：通过模板得到一个可写的Workbook：
			WritableWorkbook wwb;
			 fname = StrUtil.generalFileName("temp.xls");
			
			request.setAttribute("fname", fname);
			
				wwb = Workbook.createWorkbook(new File(request.getRealPath("/upfile/")+"/"+fname), wb);
			
			//第一个参数是一个输出流对象，比如可以
			ByteArrayOutputStream targetFile = new ByteArrayOutputStream();
			//这样定义这个输出流对象。第二个参数代表了要读取的模板。


			//第三步：选择模板中名称为StateResult的Sheet：
			WritableSheet wws = wwb.getSheet("Sheet1");


			//第四步：选择单元格，写入动态值，根据单元格的不同类型转换成相应类型的单元格：
			
			for(int i=0;i<2;i++)
			{
			Label C2 = new Label(0,i, "" );
			if(i==0)C2.setString(m.get("mbname").toString()+"(类别:"+m.get("tname")+")");
			if(i==1)C2.setString("说明 : "+m.get("content")+"");
			Label C3 = new Label(1,i, "" );
			Label C4 = new Label(2,i, "" );
			Label C5 = new Label(3,i, "" );
			Label C6 = new Label(4,i, "" );
			Label C7 = new Label(5,i, "" );
			Label C8 = new Label(6,i, "" );
			Label C9 = new Label(7,i, "" );
			Label C10 = new Label(8,i, "" );
			
			WritableFont font1= new WritableFont(WritableFont.createFont("宋体"),12,WritableFont.NO_BOLD);   
			WritableCellFormat cellFormat21 = new WritableCellFormat(font1);    
			cellFormat21.setAlignment(Alignment.CENTRE); 
			C2.setCellFormat(cellFormat21); 
			C3.setCellFormat(cellFormat21); 
			C4.setCellFormat(cellFormat21); 
			C5.setCellFormat(cellFormat21); 
			C6.setCellFormat(cellFormat21); 
			C7.setCellFormat(cellFormat21); 
			C8.setCellFormat(cellFormat21); 
			C9.setCellFormat(cellFormat21); 
			C10.setCellFormat(cellFormat21); 
			wws.addCell(C2);
			wws.addCell(C3);
			wws.addCell(C4);
			wws.addCell(C5);
			wws.addCell(C6);
			wws.addCell(C7);
			wws.addCell(C8);
			wws.addCell(C9);
			wws.addCell(C10);
			wws.mergeCells(0,i,8,i); 
			}
			
			
			
			int i=2;
			for(HashMap map:tslist)
			{
			Label C2 = new Label(0,i, "" );
			C2.setString(map.get("title").toString()+"(选项:"+map.get("xuanxiang")+" 单选多选:"+map.get("danduo")+")");
		    Label C3 = new Label(1,i, "" );
			Label C4 = new Label(2,i, "" );
			Label C5 = new Label(3,i, "" );
			Label C6 = new Label(4,i, "" );
			Label C7 = new Label(5,i, "" );
			Label C8 = new Label(6,i, "" );
			Label C9 = new Label(7,i, "" );
			Label C10 = new Label(8,i, "" );
			
			WritableFont font1= new WritableFont(WritableFont.createFont("宋体"),12,WritableFont.NO_BOLD);   
			WritableCellFormat cellFormat21 = new WritableCellFormat(font1);    
			cellFormat21.setAlignment(Alignment.CENTRE); 
			C2.setCellFormat(cellFormat21); 
			C3.setCellFormat(cellFormat21); 
			C4.setCellFormat(cellFormat21); 
			C5.setCellFormat(cellFormat21); 
			C6.setCellFormat(cellFormat21); 
			C7.setCellFormat(cellFormat21); 
			C8.setCellFormat(cellFormat21); 
			C9.setCellFormat(cellFormat21); 
			C10.setCellFormat(cellFormat21); 
			wws.addCell(C2);
			wws.addCell(C3);
			wws.addCell(C4);
			wws.addCell(C5);
			wws.addCell(C6);
			wws.addCell(C7);
			wws.addCell(C8);
			wws.addCell(C9);
			wws.addCell(C10);
			wws.mergeCells(0,i,8,i); 
			i++;
			}
			//还有不要忘记关闭WritableWorkbook和Workbook以释放资源：
		    wwb.write();
			wwb.close();
			wb.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		    
		    
		    gor("/wenjx/upload?filename="+fname, request, response);
		}
		
		
		 //修改模板
		if(ac.equals("upwjmb"))
		{
			 String id = request.getParameter("id");
			    String mbname = request.getParameter("mbname");
			    String mbtype = request.getParameter("mbtype");
			    String content = request.getParameter("content");
			    String sql = "update wjmb set mbname='"+mbname+"',mbtype='"+mbtype+"',content='"+content+"' where id="+id;
			    dao.commOper(sql);
			    dao.commOper("delete from wjmbts where wjid="+id);
			    for(int i=0;i<10;i++)
			    {
			    	String title = request.getParameter("title"+i);if(title==null)title="";
			    	String xuanxiang = request.getParameter("xuanxiang"+i);if(xuanxiang==null)xuanxiang="";
			    	if(title.equals("")||xuanxiang.equals(""))continue;
			    	String danduo = request.getParameter("danduo"+i);
			    	String isql = "insert into wjmbts values('"+id+"','"+title+"','"+xuanxiang+"','"+danduo+"')";
			    	 dao.commOper(isql);
			    }
			    go("/admin/wjmb.jsp", request, response);
		}
		
		
		//添加用户
		if(ac.equals("adduser"))
		{

		    String uname = request.getParameter("uname");
		    String upass = request.getParameter("upass");
			    String truename = request.getParameter("truename");
			    String sex = request.getParameter("sex");
			    String linkphone = request.getParameter("linkphone");
			    String sql = "insert into sysuser values('"+uname+"','"+upass+"','"+truename+"','"+sex+"','"+linkphone+"','"+Info.getDateStr()+"') ";
				dao.commOper(sql);
			    request.setAttribute("suc", "");
				go("/admin/adduser.jsp", request, response);
		}
		
		//添加问卷分类
		if(ac.equals("addwjtype"))
		{

		    String tname = request.getParameter("tname");
		    String tbei = request.getParameter("tbei");
		    String hotmen = request.getParameter("hotmen");
			    String tcontent = request.getParameter("tcontent");
			    String sql = "insert into wjtype values('"+tname+"','"+tbei+"','"+tcontent+"','"+hotmen+"') ";
				dao.commOper(sql);
			    request.setAttribute("suc", "");
				go("/admin/addwjtype.jsp", request, response);
		}
		
		//添加问卷分类
		if(ac.equals("upwjtype"))
		{
			String id = request.getParameter("id");
		    String tname = request.getParameter("tname");
		    String tbei = request.getParameter("tbei");
		    String hotmen = request.getParameter("hotmen");
			    String tcontent = request.getParameter("tcontent");
			    String sql = "update wjtype set tname='"+tname+"',tbei='"+tbei+"',tcontent='"+tcontent+"',hotmen='"+hotmen+"' where id= "+id;
				dao.commOper(sql);
			    request.setAttribute("suc", "");
				go("/admin/addwjtype.jsp", request, response);
		}
		
		//提交问卷
		if(ac.equals("answer"))
		{
			String mbid = request.getParameter("mbid");
		    String wjid = request.getParameter("wjid");
		    
		    String sex = request.getParameter("sex");
		    String age = request.getParameter("age");
		    String uposition = request.getParameter("uposition");
		    String addrs = request.getParameter("addrs");
		    
		    List<HashMap> tslist = dao.select("select * from wjmbts where wjid='"+mbid+"' order by id");
		    for(HashMap h:tslist)
		    {
		    	String[] answers = request.getParameterValues("ti"+h.get("id"));
		    	if(answers==null)continue;
		    	String answer = "";
		    	for(String s:answers)
		    	{
		    		answer+=s+"-";
		    	}
		    	if(answer.length()>0)answer=answer.substring(0,answer.length()-1);
		    	String sql = "insert into answers values('"+wjid+"','"+h.get("id")+"','"+answer+"','"+sex+"','"+age+"','"+uposition+"','"+addrs+"','"+date+"')";
		    	dao.commOper(sql);
		    }
		    
			request.setAttribute("asuc", "");
		    go("/index.jsp", request, response);
		}
		
		
		//发起调查
		if(ac.equals("faqiwj"))
		{
			String id = request.getParameter("id");
		    String mid = muser.get("id").toString();
		    String sql = "insert into wenj values('"+mid+"','"+id+"','"+date+"','0')";
		    dao.commOper(sql);
		    gor("/wenjx/index.jsp", request, response);
		}
		
		
		//登录
		if(ac.equals("login"))
		{
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			String utype = request.getParameter("utype");
			
			
				String sql0 = " select * from sysuser where uname='"+username+"' and upass='"+password+"'";
				String sql1 = "select * from sysuser where uname='"+username+"' and upass='"+password+"'";
			
				if(utype.equals("0"))
				{
			List<HashMap> userlist = dao.select(sql0);
			if(userlist.size()!=1)
			{
				request.setAttribute("error", "");
				go("/admin/login.jsp", request, response);
			}else{
				request.getSession(). setAttribute("admin", userlist.get(0));
				gor("/wenjx/admin/index.jsp", request, response);
			}
				}
				
				if(utype.equals("1"))
				{
			List<HashMap> userlist = dao.select(sql1);
			if(userlist.size()!=1)
			{
				request.setAttribute("lerror", "");
				go("/login.jsp", request, response);
			}else{
				request.getSession(). setAttribute("user", userlist.get(0));
				gor("/wenjx/index.jsp", request, response);
			}
			}
			}
		
		//联系我们
		if(ac.equals("uplxwm"))
		{
			 String content = request.getParameter("content");  
			 System.out.println(content);
			 dao.commOper("update zinfo set content='"+content+"' where id=1");
			 go("/admin/lianxwm.jsp", request, response);
		}
		
		//常见问题
		if(ac.equals("upcjwt"))
		{
			 String content = request.getParameter("content");  
			 dao.commOper("update zinfo set content='"+content+"' where id=2");
			 go("/admin/cjwt.jsp", request, response);
		}
		
		
		//修改密码
		if(ac.equals("uppass"))
		{
			 String oldpass = request.getParameter("oldpass");  
			    String upass = request.getParameter("upass");
			    if(!user.get("upass").equals(oldpass))
			    {
			    	request.setAttribute("error", "");
			    	go("/admin/uppass.jsp", request, response);
			    }else{
			    	String sql = "update sysuser set upass='"+upass+"' where id="+user.get("id");
			    	System.out.println(sql);
			    	dao.commOper(sql);
			    	request.setAttribute("suc", "");
			    	go("/admin/uppass.jsp", request, response);
			    }
		}
		
		//修改密码
		if(ac.equals("upmpass"))
		{
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass"); 
			String id = user.get("id").toString();
			
			String sql="update members set uname='"+uname+"',upass='"+upass+"' where id="+id;
			System.out.println(sql);
			dao.commOper(sql);
			gor("/wenjx/admin/upmpass.jsp", request, response);
		}
		
		//添加会员
		if(ac.equals("addmember"))
		{
			String uname = request.getParameter("uname");
			
			String checksql = "select * from members where uname='"+uname+"'";
			if(dao.select(checksql).size()>0)
			{
				request.setAttribute("error", "");
				go("/admin/addmember.jsp", request, response);
			}else{
			
			String upass = request.getParameter("upass"); 
			String sex = request.getParameter("sex"); 
			String linkphone = request.getParameter("linkphone"); 
			String sfid = request.getParameter("sfid"); 
			String addrs = request.getParameter("addrs"); 
			String sql="insert into members values(null,'"+uname+"','"+upass+"','"+sex+"','"+linkphone+"','"+sfid+"','"+addrs+"')";
	         request.setAttribute("suc", "");
			dao.commOper(sql);
			go("/admin/addmember.jsp", request, response);
		}}

		
		//修改会员
		if(ac.equals("updatemember"))
		{
			String id = request.getParameter("id"); 
			String upass = request.getParameter("upass"); 
			String sex = request.getParameter("sex"); 
			String linkphone = request.getParameter("linkphone"); 
			String sfid = request.getParameter("sfid"); 
			String addrs = request.getParameter("addrs"); 
			String sql="update members set  upass='"+upass+"',sex='"+sex+"',linkphone='"+linkphone+"',sfid='"+sfid+"',addrs='"+addrs+"'";
	         request.setAttribute("suc", "");
			dao.commOper(sql);
			go("/admin/addmember.jsp", request, response);
		}
		
		//修改会员
		if(ac.equals("updatemmember"))
		{
			String id = request.getParameter("id"); 
			String upass = request.getParameter("upass"); 
			String sex = request.getParameter("sex"); 
			String linkphone = request.getParameter("linkphone"); 
			String sfid = request.getParameter("sfid"); 
			String addrs = request.getParameter("addrs"); 
			String sql="update members set  upass='"+upass+"',sex='"+sex+"',linkphone='"+linkphone+"',sfid='"+sfid+"',addrs='"+addrs+"'";
	         request.setAttribute("suc", "");
			dao.commOper(sql);
			go("/admin/updatemmember.jsp", request, response);
		}
		
		
		
		dao.close();
		out.flush();
		out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}
	
	

}
