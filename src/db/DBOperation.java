package db;
import beans.*;
import java.sql.*;
import java.util.ArrayList;
public class DBOperation {
  private DB db;
  private ArrayList al;
  public DBOperation(){
	  db=new DB();
  }
  public int insert(StudentBean s){
	  String ee="insert into student values(null,'"+s.getSid()+"','"+s.getSpassword()+"','"+s.getClass()
	             +"','"+s.getSname()+"','"+s.getSdid()+"')";
	  boolean flag=db.update(ee);
	  if(flag) 
	  return 1;
	  return -1;
  }
  public int update(String table,String mod,String value,String cond,String var){
	  String sql="update "+table+" set "+mod+"='"+value+"' where "+cond+"='"+var+"'";
	  boolean flag=db.update(sql);
	  if(flag) return 1;
	  return -1;
  }
  public String cond(String var1,String var2,String var3,String var4){
	  //1表示学院2表示专业3表示班级4表示学年
	  String sql="select * from student ";
	  if(var1.equals("")&&var2.equals("")&&var3.equals("")&&!var4.equals("")){
		   sql=sql+"where xuenian='"+var4+"'";
	  }
	  if(!var1.equals("")&&var2.equals("")&&var3.equals("")&&!var4.equals("")){
		   sql=sql+"where xuenian='"+var4+"' and sdid in(select sdid from sdept where xueyuanid='"+var1+"')";
	  }
	  if(!var1.equals("")&&var2.equals("")&&var3.equals("")&&var4.equals("")){
		   sql=sql+"where sdid in(select sdid from sdept where xueyuanid='"+var1+"')";
	  }
	  if(!var2.equals("")&&var3.equals("")&&!var4.equals("")){
		  sql=sql+"where sdid='"+var2+"' and xuenian='"+var4+"'";
	  }
	  if(!var2.equals("")&&var3.equals("")&&var4.equals("")){
		  sql=sql+"where sdid='"+var2+"'";
	  }
	  if(!var2.equals("")&&!var3.equals("")&&!var4.equals("")){
		  sql=sql+"where sdid='"+var2+"' and xuenian='"+var4+"' and classy='"+var3+"'";
	  }
	  if(!var2.equals("")&&!var3.equals("")&&var4.equals("")){
		  sql=sql+"where sdid='"+var2+"' and classy='"+var3+"'";
	  }
	  
	  return sql;
  }
  
  public ArrayList query(String tab,String cond,String var,String cond2,String cond3) {
	  try {
		  al=new ArrayList();
	  String sql;ResultSet rs = null;
	  String name,id,classy,password,sdid;
	  if(cond.equals("")||var.equals(""))
		  sql="select * from "+tab;
	  else{
		  sql="select * from "+tab+" where "+cond+"='"+var+"'";
		  //sql="select *from student where sid=20094417";
	  }
	  if(cond3.equals("x")){
		  sql=cond(tab,cond,var,cond2);
		  
	  }
	  if(cond3.equals("aa")){
		  sql="select * from student where sdid='"+tab+"' order by caluscore desc" ;
	  }
	  if(cond3.equals("y")){
		  sql="select * from student where sid='"+tab+"' and xuenian='"+cond+"'";
	  }
	  if(cond3.equals("z")){
		  sql="select * from ziyuscore where sid='"+tab+"' and xuenian='"+cond+"'";
	  }
	  if(cond3.equals("a")){
		  sql="select distinct(cid),tid,cidd from tc where tid='"+tab+"'";
	  }
	  if(cond3.equals("b")){
		  sql="select cid,cname,credit,cidd from course where cid in(select distinct(cid) from tc where tid='"+tab+"')";
	  }
	  if(cond3.equals("r")){
		  sql="select * from student where sdid in(select sdid from xueyuan where xueyuanid='"+tab+"')";
	  }
	  System.out.println(sql);
	   rs=db.exeQuery(sql);
	  if(rs==null) System.out.println("没有找到");
	  if(tab.equals("student")||cond3.equals("x")||cond3.equals("y")||cond3.equals("r")||cond3.equals("aa")){
		  StudentBean stu=null;
		  while(rs.next()){
			  id=rs.getString("sid");
			  name=rs.getString("sname");
			  classy=rs.getString("classy");
			  password=rs.getString("password");
			  sdid=rs.getString("sdid");
			  
			  System.out.println(id + " "+name+rs.getString("xuenian"));
			  
			  stu=new StudentBean();
			  stu.setSid(id);stu.setSdid(sdid);stu.setSname(name);stu.setSno(classy);stu.setSpassword(password);
			  stu.setSixiangbase(rs.getFloat("sixiangbase"));
			  stu.setSixiangjiafen(rs.getFloat("sixiangjiafen"));
			  stu.setShenxinbase(rs.getFloat("shenxinbase"));
			  stu.setShenxinjiafen(rs.getFloat("shenxinjiafen"));
			  stu.setKejibase(rs.getFloat("kejibase"));
			  stu.setKejijiafen(rs.getFloat("kejijiafen"));
			  stu.setNozyscore(rs.getFloat("nozyscore"));
			  stu.setZyscore(rs.getFloat("zyscore"));
			  stu.setCaluscore(rs.getFloat("caluscore"));
			  stu.setClassore(rs.getInt("classore"));
			  stu.setXueyuansore(rs.getInt("xueyuansore"));
			  stu.setSdeptsore(rs.getInt("sdeptsore"));
			  stu.setScholar(rs.getString("scholar"));
			  stu.setXuenian(rs.getString("xuenian"));
			  al.add(stu);
		  }
	  }
	  if(tab.equals("course")||cond3.equals("b")){
		  CourseBean cb;
		  while(rs.next()){
			  cb=new CourseBean();
			  cb.setCid(rs.getString("cid"));
			  cb.setCname(rs.getString("cname"));
			  cb.setCredit(rs.getFloat("credit"));
			  cb.setCidd(rs.getString("cidd"));
			  al.add(cb);
		  }
	  }
	  if(tab.equals("teacher")){
		  TeacherBean t;
		  while(rs.next()){
			  t=new TeacherBean();
			  t.setTid(rs.getString("tid"));
			  t.setTname(rs.getString("tname"));
			  t.setTpassword(rs.getString("password"));
			  al.add(t);
		  }
	  }
	  if(tab.equals("manager")){
		  ManagerBean mb;
		  while(rs.next()){
			  mb=new ManagerBean();
			  mb.setMid(rs.getString("mid"));
			  mb.setMname(rs.getString("mname"));
			  mb.setMpassword(rs.getString("password"));
			  mb.setXueyuanid(rs.getString("xueyuanid"));
			  al.add(mb);
		  }
	  }
	  if(tab.equals("hmanager")){
		  HmangerBean mb;
		  while(rs.next()){
			  mb=new HmangerBean();
			  mb.setHid(rs.getString("hid"));
			  mb.setHname(rs.getString("hname"));
			  mb.setHpassword(rs.getString("password"));
			  al.add(mb);
		  }
	  }
	  if(tab.equals("sdept")){
		  SdeptBean mb;
		  while(rs.next()){
			  mb=new SdeptBean();
			  mb.setSdid(rs.getString("sdid"));
			  mb.setSdname(rs.getString("sdname"));
			  mb.setClasscount(rs.getInt("classcount"));
			  mb.setXueyuanid(rs.getString("xueyuanid"));
			  mb.setFirstcount(rs.getInt("firstcount"));
			  mb.setSecondcount(rs.getInt("secondcount"));
			  mb.setThirdcount(rs.getInt("thirdcount"));
			  al.add(mb);
		  }
	  }
      if(tab.equals("xueyuan")){
    	  XueyuanBean mb;
		  while(rs.next()){
			  mb=new XueyuanBean();
			  mb.setXueyuanid(rs.getString("xueyuanid"));
			  mb.setXueyuanname(rs.getString("xueyuanname"));
			  al.add(mb);
		  }
	  }
      if(tab.equals("nozhiyuscore")){
    	  FeizhiyuBean mb;
		  while(rs.next()){
			  mb=new FeizhiyuBean();
			  mb.setSid("sid");
			  mb.setSname("sname");
			  mb.setSixiangbase(rs.getFloat("sixiangbase"));
			  mb.setSixiangjiafen(rs.getFloat("sixiangjiafen"));
			  mb.setShenxinbase(rs.getFloat("shenxinbase"));
			  mb.setShenxinjiafen(rs.getFloat("shenxinjiafen"));
			  mb.setKejibase(rs.getFloat("kejibase"));
			  mb.setKejijiafen(rs.getFloat("kejijiafen"));
			  al.add(mb);
		  }
	  }
      if(tab.equals("ziyuscore")||cond3.equals("z")){
    	  StudentCourseBean  mb;
		  while(rs.next()){
			  mb=new StudentCourseBean();
			  mb.setSid(rs.getString("sid"));
			  mb.setCid(rs.getString("cid"));
			  mb.setCidd(rs.getString("cidd"));
			  mb.setScore(rs.getFloat("score"));
			  mb.setXuenian(rs.getString("xuenian"));
			  mb.setPscore(rs.getFloat("pscore"));
			  al.add(mb);
		  }
	  }
      if(tab.equals("scholarship")){
    	  ScholarshipBean mb;
		  while(rs.next()){
			  mb=new ScholarshipBean();
			  mb.setSid(rs.getString("sid"));
			  mb.setSname(rs.getString("sname"));
			  mb.setNozyscore(rs.getFloat("nozyscore"));
			  mb.setZyscore(rs.getFloat("zyscore"));
			  mb.setCaluscore(rs.getFloat("caluscore"));
			  mb.setClassore(rs.getInt("classore"));
			  mb.setXueyuansore(rs.getInt("xuanyuansore"));
			  mb.setSdeptsore(rs.getInt("sdeptsore"));
			  mb.setScholar(rs.getString("scholar"));
			  al.add(mb);
		  }
	  }
      if(tab.equals("tc")||cond3.equals("a")){
    	  TeacherCourseBean mb;
		  while(rs.next()){
			  
			  mb=new TeacherCourseBean();
			  mb.setTid(rs.getString("tid"));
			  mb.setCid(rs.getString("cid"));
			  mb.setCidd(rs.getString("cidd"));
			  al.add(mb);
		  }
	  }
	  rs.close();
	  } catch (Exception e) {
			
			e.printStackTrace();
		  }
	  
	  return al;
  }
  public ArrayList query2(String xueyuanid){
	   al=new ArrayList();
	   String sql="select * from scholarship";
	   if(!xueyuanid.equals("")){
		   sql=sql+" ";
	   }
	  return al;
  }
  public int delete(String tab,String cond,String var){
	  String sql="delete  from "+tab;
	  if(cond.equals("")==false||var.equals("")==false){
		  sql=sql+" where "+cond+"='"+var+"'";
	  }
	  boolean flag=db.update(sql);
	  if(flag)
	  return 1;
	  return -1;
  }
  public int pageCount(){
	  String sql="select count(distinct(sid)) from student";int i=0;
	  try{
	  ResultSet rs=db.exeQuery(sql);
	  rs.next();
	  i=rs.getInt(1);
	  }catch(Exception e){}
	  return (i-1)/10+1;
	  
  }

}
 