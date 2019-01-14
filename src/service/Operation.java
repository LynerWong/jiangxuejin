package service;
import beans.*;

import java.util.*;

import db.*;

import java.sql.*;

public class Operation {
	  private DB db;
	  private ArrayList al;
	  private int everycount;
	  private DBOperation db1;
	  public Operation(){
		  al=new ArrayList();
		  db=new DB();
		  db1=new DBOperation();
		  everycount=10;
	  }
   public int search(String id,StudentBean stu[],int size){
	   for(int i=0;i<size;i++){
		   if(id.equals(stu[i].getSid())){
			   return i;
		   }
	   }
	   return -1;
   }
   public int search2(String id,TeacherBean tec[],int size){
	   for(int i=0;i<size;i++){
		   if(id.equals(tec[i].getTid())){
			   
			   return i;
		   }
	   }
	   return -1;
   }
   public int search3(String id,ManagerBean stu[],int size){
	   for(int i=0;i<size;i++){
		   if(id.equals(stu[i].getMid())){
			   return i;
		   }
	   }
	   return -1;
   }
   public int search4(String id,HmangerBean stu[],int size){
	   for(int i=0;i<size;i++){
		   if(id.equals(stu[i].getHid())){
			   return i;
		   }
	   }
	   return -1;
   }
   public int pageCount(String cond1,String cond2){
		  String sql="select count(distinct(sid)) from ziyuscore where cid='"+cond1+"' and cidd='"+cond2+"'";
		  System.out.println(sql);
		  int i=0;
		  try{
		  ResultSet rs=db.exeQuery(sql);
		  rs.next();
		  i=rs.getInt(1);
		  }catch(Exception e){System.out.println("计算总页数异常："+e);}
		  finally{
			 
		  }
		  return (i-1)/everycount+1; 
	  }
  
   public int update(String cond1,String cond2,String cond3,float f1,float f2,String cond4){
	   int flag=-1;
	   db.getConnection();String sql;
	   try{
	   if(!cond4.equals("")){
	   sql="update ziyuscore set pscore="+f1+",score="+f2+",xuenian='"+cond4+"' where cid='"+cond1+"' and cidd='"+cond2+"' and sid='"+cond3+"'";}
	   else sql="update ziyuscore set pscore="+f1+",score="+f2+" where cid='"+cond1+"' and cidd='"+cond2+"' and sid='"+cond3+"'";
	   System.out.println(sql);
	   if(db.update(sql)) flag=1;
	   }catch(Exception e){}
	   return flag;
   }
   public int find(String tab,String cond1,String var){
	   int flag=-1;
	   try{
	   String sql="select * from "+tab+" where "+cond1+"='"+var+"'";
	   ResultSet rs=db.exeQuery(sql);
	   if(rs.next()) {System.out.println(rs.getString(2));flag=1;}
	   }catch(Exception e){System.out.println(e);}
	   return flag;
   }
   public ArrayList sc(String cond1,String cond2,int page){
	     String sql="";
	     sql="select * from student where sid in(select sid from ziyuscore where cid='"+cond1+"' and cidd='"+cond2+"')";
	     try{
	     ResultSet rs=null;
	     System.out.println(sql);
		  rs=db.exeQuery(sql);
	     StudentBean  stu;
	     int index=0;
	     int begin=(page-1)*everycount;
	     int end=page*everycount;
		  while(rs.next()){
			  index++;
			  if(index<begin) continue;
			  if(index>end) break;
			  //System.out.println(id + " "+name+rs.getString("xuenian")); 
			  stu=new StudentBean();
			  stu.setSid(rs.getString("sid"));
			  stu.setSdid(rs.getString("sdid"));
			  stu.setSname(rs.getString("sname"));
			  stu.setSno(rs.getString("classy"));
			  stu.setSpassword(rs.getString("password"));
			  al.add(stu);
		  }
	     }catch(Exception e){System.out.println("教师录入学生成绩1异常："+e);}
	      finally{
	    	
	     }
		  return al;
   }
   public ArrayList showCredit(String cond1,String cond2,int page){
	   String sql="select student.sid,student.sname,cid,cidd,pscore,score from ziyuscore,student where student.sid=ziyuscore.sid and cid='"+cond1+"' and cidd='"+cond2+"'";
	   try{
		   ResultSet rs=null;
		   System.out.println(sql);
		   rs=db.exeQuery(sql);
		     StudentCourseBean  stu;
		     int index=0;
		     int begin=(page-1)*everycount;
		     int end=page*everycount;
			  while(rs.next()){
				  index++;
				  if(index<begin) continue;
				  if(index>end) break;
				  //System.out.println(id + " "+name+rs.getString("xuenian")); 
				  stu=new StudentCourseBean();
				  stu.setSid(rs.getString("sid"));
				  stu.setCid(rs.getString("cid"));
				  stu.setSname(rs.getString("sname"));
				  stu.setCidd(rs.getString("cidd"));
				  stu.setPscore(rs.getFloat("pscore"));
				  stu.setScore(rs.getFloat("score"));
				  al.add(stu);
			  }
	   }catch(Exception e){System.out.println("教师修改成绩异常："+e);}
	   return al;
   }
   public int insert2(String sid,float f){
	   String sql="update student set zyscore="+f+" where sid='"+sid+"'";
	   System.out.println(sql);
	   db.update(sql); return 1;
	   
   }
   
   public int insert(String tab,String cond1,String var1,String var2,String var3,String var4,String var5,String type){
	   String sql="insert into "+tab;
	   int flag=-1;
	   if(type.equals("3")&&find(tab,cond1,var1)==-1){//student
		   sql=sql+"(sid,sdid,password,classy,sname) values('"+var1+"','"+var2+"','"+var3+"','"+var4+"','"+var5+"')";
		   db.update(sql);
		   flag=1;
	   }
       if(type.equals("1")&&find(tab,cond1,var1)==-1){//manager
		   sql=sql+" values(null,'"+var1+"','"+var2+"','"+var3+"','"+var4+"')";
		   db.update(sql);flag=1;
	   }
       if(type.equals("2")&&find(tab,cond1,var1)==-1){//sdept
    	   sql=sql+"(sdid,sdname,xueyuanid,classcount) values('"+var1+"','"+var2+"','"+var3+"',"+Integer.parseInt(var4)+")";
    	   db.update(sql);
    	   flag=1;
       }
       if(type.equals("4")&&find(tab,cond1,var1)==-1){//teacher
    	   sql=sql+" values(null,'"+var1+"','"+var2+"','"+var3+"')";
    	   db.update(sql);
    	   flag=1;
       }
      if(type.equals("5")&&find(tab,cond1,var1)==-1){//xueyuan
    	  sql=sql+" values(null,'"+var1+"','"+var2+"')";
    	  db.update(sql);
    	  flag=1;
       }
       System.out.println("插入记录："+sql);
	   return flag;
   }
   public int updateScholarCount(int first,int second,int third,String sdid){
	   int flag=-1;
	   db.getConnection();
	   try{
	   String sql="update sdept set firstcount="+first+",secondcount="+second+",thirdcount="+third+" where sdid='"+sdid+"'";
	   System.out.println(sql);
	   if(db.update(sql)) flag=1;
	   }catch(Exception e){}
	   return flag;
   }
   public int updateFeiziyu(float f1,float f11,float f2,float f22,float f3,float f33,String sid,String xuenian){
	   int flag=-1;
	   db.getConnection();
	   try{
	   String sql="update student set sixiangbase="+f1+",sixiangjiafen="+f11+",shenxinbase="+f2+",shenxinjiafen="+f22+",kejibase="+f3+",kejijiafen="+f33+" where sid='"+sid+"' and xuenian='"+xuenian+"'";
	   System.out.println(sql);
	   if(db.update(sql)) flag=1;
	   sql="update student set nozyscore=(sixiangbase+sixiangjiafen)*0.5+(shenxinbase+shenxinjiafen)*1/3+(kejibase+kejijiafen)*1/6 where sid='"+sid+"' and xuenian='"+xuenian+"'";
	   System.out.println(sql);
	   db.update(sql);
	   }catch(Exception e){}
	   return flag;
   }
   public void updateCalucredit(String sid){
	   String sql="update student set caluscore=nozyscore*0.3+zyscore*0.7 where sid='"+sid+"'";
	    db.update(sql);
   }
   public float calu(ArrayList<StudentCourseBean> al){
	   ArrayList al2;
	   ResultSet rs;
	   float f1=0,f2=0,f=0,f3=0,credit=0;String sql="";
	   try{
	   for(StudentCourseBean ac:al){
		   f1=ac.getPscore();f2=ac.getScore();
		   f3=0.2f*f1+0.8f*f2;
		   sql="select credit from course where cid='"+ac.getCid()+"' and cidd='"+ac.getCidd()+"'";
		   System.out.println(sql);
		   rs=db.exeQuery(sql);
		   rs.next();
		   f1=rs.getFloat(1);f3=f3*f1;
		   f=f+f3;
		   credit=credit+f1;
	   }
	   
	   }catch(Exception e){}
	   return f/credit;
   }
   public void aa(int i,String s,int a,int b,int c){
	   try{
		   String ss="";
		   if(i<=a) ss="优秀一等奖助学金";
		   if((i-a)<=b&&(i-a)>0) ss="优秀二等奖助学金";
		   if((i-a-b)<=c&&(i-a-b)>0) ss="优秀三等奖助学金";
		   String sql="update student set sdeptsore="+i+",scholar='"+ss+"' where sid='"+s+"'";
		   System.out.println(sql);
		   db.update(sql);
	   }catch(Exception e){System.out.println(e);}
   }
   public void sore(String sdid){
	   ArrayList al;
	   ResultSet rs;
	   String sql="select firstcount,secondcount,thirdcount from sdept where sdid='"+sdid+"'";
	   System.out.println(sql);
	   try{
		   rs=db.exeQuery(sql);
		   int a,b,c;rs.next();
		   a=rs.getInt(1);
		   b=rs.getInt(2);
		   c=rs.getInt(3); 
		   al=db1.query(sdid, "", "", "", "aa");
		   StudentBean ss[]=new StudentBean[al.size()];al.toArray(ss);
		   for(int i=0;i<al.size();i++){
			   aa(i+1,ss[i].getSid(),a,b,c); 
		   }
		   
	   }catch(Exception e){}
   }
   
}
