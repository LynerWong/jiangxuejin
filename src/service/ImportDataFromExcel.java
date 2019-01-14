package service;
import jxl.*;
import jxl.read.biff.File;

import java.awt.Label;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.*;
import beans.*;
public class ImportDataFromExcel {
	public  ImportDataFromExcel()
    {
        
    }
   
    public static ArrayList<StudentBean> readExcel(String filePath)
    {
    	ArrayList<StudentBean> al=new ArrayList<StudentBean>();
        try
        {   
        	
            InputStream is=new FileInputStream(filePath);
            //声名一个工作薄
            Workbook rwb = Workbook.getWorkbook(is);
            
            //获得工作薄的个数
            rwb.getNumberOfSheets();
                
            //在Excel文档中，第一张工作表的缺省索引是0
            Sheet st = rwb.getSheet("Sheet1");
            
            //通用的获取cell值的方式,getCell(int column, int row) 行和列
            int Rows=st.getRows();
            int Cols=st.getColumns();
            System.out.println("当前工作表的名字:"+st.getName());
            System.out.println("总行数:"+Rows);
            System.out.println("总列数:"+Cols);
            Cell c;StudentBean ss;
               for(int i=2;i<Rows;i++)
            {       ss=new StudentBean();
                    //getCell(Col,Row)获得单元格的值
                    System.out.print((st.getCell(0,i)).getContents()+"\t");
                    ss.setSid((st.getCell(0,i)).getContents());
                    ss.setSname((st.getCell(1,i)).getContents());
                    ss.setSixiangbase(Float.parseFloat((st.getCell(2,i)).getContents().toString()));
                    ss.setSixiangjiafen(Float.parseFloat((st.getCell(3,i)).getContents().toString()));
                    ss.setShenxinbase(Float.parseFloat((st.getCell(4,i)).getContents().toString()));
                    ss.setShenxinjiafen(Float.parseFloat((st.getCell(5,i)).getContents().toString()));
                    ss.setKejibase(Float.parseFloat((st.getCell(6,i)).getContents().toString()));
                    ss.setKejijiafen(Float.parseFloat((st.getCell(7,i)).getContents().toString()));
                    al.add(ss);
                }
           
            //操作完成时，关闭对象，释放占用的内存空间
            rwb.close();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return al;
    }

}
