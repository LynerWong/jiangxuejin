package db;
import java.sql.*;
import com.mysql.cj.jdbc.Driver;


public class DB {
  private Connection con=null;
  private Statement stmt=null;
  private ResultSet rs=null;
  public DB(){}


public Connection getConnection(){
//	  String url="jdbc:mysql://www.sechandbooks.000webhostapp.com:3306/id7375504_jiangxujin";
//	  String dbuser="localhost";
//	  String dbpass="Derrick12@";
//	  String name="com.mysql.jdbc.Driver";
	
	  String url="jdbc:mysql://127.0.0.1:3306/myDb";
	  String dbuser="root";
	  String dbpass="testing";
	  String name="com.mysql.cj.jdbc.Driver";
	 
	  if(con==null){
		  try{
		  Class.forName(name).newInstance();
		  System.out.print("ok");
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  try{
		  con=DriverManager.getConnection(url,dbuser,dbpass);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
	  }
	  return con;
  }
  public ResultSet exeQuery(String sql){
	  try{
	  con=getConnection();
	  if(con==null){
		  throw new Exception("û�п����Ӷ���");
	  }
	  stmt=con.createStatement();
	  rs=stmt.executeQuery(sql);
	  }catch(Exception e){}
	  return rs;
  }
  public boolean update(String sql){
	  boolean flag=true;
	  try{
		  con=getConnection();
		  if(con==null) throw new Exception("û�п����Ӷ���");
		  stmt=con.createStatement();
		  stmt.executeUpdate(sql);
	  }catch(Exception e){
		  flag=false;
		  System.out.println("�����쳣:"+e);
		  
	  }
	 
	  return flag;
  }
public void sc()throws Exception{
	rs=exeQuery("select * from student");
	rs.next();
	String s=rs.getString("sid");System.out.println(s);String d=rs.getString("sname");System.out.println(d);
	rs.next();s=rs.getString("sid");
	System.out.println(s);
	rs.close();stmt.close();
	con.close();
	
}

public void close(){
	try{
		if(rs!=null)try{rs.close();}catch(Exception e){System.out.println("rs"+e);}
		try{stmt.close();}catch(Exception e){System.out.println("stmt"+e);}
		try{con.close();}catch(Exception e){System.out.println("con"+e);}
	}catch(Exception e){}
}
public static void main(String[] ages){
	
	new DB().getConnection();
}
}