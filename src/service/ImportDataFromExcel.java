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
            //����һ��������
            Workbook rwb = Workbook.getWorkbook(is);
            
            //��ù������ĸ���
            rwb.getNumberOfSheets();
                
            //��Excel�ĵ��У���һ�Ź������ȱʡ������0
            Sheet st = rwb.getSheet("Sheet1");
            
            //ͨ�õĻ�ȡcellֵ�ķ�ʽ,getCell(int column, int row) �к���
            int Rows=st.getRows();
            int Cols=st.getColumns();
            System.out.println("��ǰ�����������:"+st.getName());
            System.out.println("������:"+Rows);
            System.out.println("������:"+Cols);
            Cell c;StudentBean ss;
               for(int i=2;i<Rows;i++)
            {       ss=new StudentBean();
                    //getCell(Col,Row)��õ�Ԫ���ֵ
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
           
            //�������ʱ���رն����ͷ�ռ�õ��ڴ�ռ�
            rwb.close();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return al;
    }

}
